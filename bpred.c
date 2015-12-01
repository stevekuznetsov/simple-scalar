/* bpred.c - branch predictor routines */

/* SimpleScalar(TM) Tool Suite
 * Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
 * All Rights Reserved. 
 * 
 * THIS IS A LEGAL DOCUMENT, BY USING SIMPLESCALAR,
 * YOU ARE AGREEING TO THESE TERMS AND CONDITIONS.
 * 
 * No portion of this work may be used by any commercial entity, or for any
 * commercial purpose, without the prior, written permission of SimpleScalar,
 * LLC (info@simplescalar.com). Nonprofit and noncommercial use is permitted
 * as described below.
 * 
 * 1. SimpleScalar is provided AS IS, with no warranty of any kind, express
 * or implied. The user of the program accepts full responsibility for the
 * application of the program and the use of any results.
 * 
 * 2. Nonprofit and noncommercial use is encouraged. SimpleScalar may be
 * downloaded, compiled, executed, copied, and modified solely for nonprofit,
 * educational, noncommercial research, and noncommercial scholarship
 * purposes provided that this notice in its entirety accompanies all copies.
 * Copies of the modified software can be delivered to persons who use it
 * solely for nonprofit, educational, noncommercial research, and
 * noncommercial scholarship purposes provided that this notice in its
 * entirety accompanies all copies.
 * 
 * 3. ALL COMMERCIAL USE, AND ALL USE BY FOR PROFIT ENTITIES, IS EXPRESSLY
 * PROHIBITED WITHOUT A LICENSE FROM SIMPLESCALAR, LLC (info@simplescalar.com).
 * 
 * 4. No nonprofit user may place any restrictions on the use of this software,
 * including as modified by the user, by any other authorized user.
 * 
 * 5. Noncommercial and nonprofit users may distribute copies of SimpleScalar
 * in compiled or executable form as set forth in Section 2, provided that
 * either: (A) it is accompanied by the corresponding machine-readable source
 * code, or (B) it is accompanied by a written offer, with no time limit, to
 * give anyone a machine-readable copy of the corresponding source code in
 * return for reimbursement of the cost of distribution. This written offer
 * must permit verbatim duplication by anyone, or (C) it is distributed by
 * someone who received only the executable form, and is accompanied by a
 * copy of the written offer of source code.
 * 
 * 6. SimpleScalar was developed by Todd M. Austin, Ph.D. The tool suite is
 * currently maintained by SimpleScalar LLC (info@simplescalar.com). US Mail:
 * 2395 Timbercrest Court, Ann Arbor, MI 48105.
 * 
 * Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
 */


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#include "host.h"
#include "misc.h"
#include "machine.h"
#include "bpred.h"

/* turn this on to enable the SimpleScalar 2.0 RAS bug */
/* #define RAS_BUG_COMPATIBLE */

/* create a branch predictor */
struct bpred_t *                        /* branch predictory instance */
bpred_create(enum bpred_class class,    /* type of predictor to create */
             unsigned int bimod_size,   /* bimod table size */
             unsigned int l1size,       /* 2lev l1 table size */
             unsigned int l2size,       /* 2lev l2 table size */
             unsigned int meta_size,    /* meta table size */
             unsigned int shift_width,  /* history register width */
             unsigned int xor,          /* history xor address flag */
             unsigned int btb_sets,     /* number of sets in BTB */ 
             unsigned int btb_assoc,    /* BTB associativity */
             unsigned int retstack_size) /* num entries in ret-addr stack */
{
  struct bpred_t *pred;

  if (!(pred = calloc(1, sizeof(struct bpred_t))))
    fatal("out of virtual memory");

  pred->class = class;

  switch (class) {
  case BPredComb:
    /* bimodal component */
    pred->dirpred.bimod = 
      bpred_dir_create(BPred2bit, bimod_size, 0, 0, 0);

    /* 2-level component */
    pred->dirpred.twolev = 
      bpred_dir_create(BPred2Level, l1size, l2size, shift_width, xor);

    /* metapredictor component */
    pred->dirpred.meta = 
      bpred_dir_create(BPred2bit, meta_size, 0, 0, 0);

    break;

  case BPred2Level:
    pred->dirpred.twolev = 
      bpred_dir_create(class, l1size, l2size, shift_width, xor);

    break;

  case BPredPercept:
    pred->dirpred.percept = bpred_dir_create(class, l1size, l2size, shift_width, xor); /* (class, bhtsize, percepttablesize, hist_width, xor) */
    // pred->dirpred.percept->config.percept.weight_width = pred->dirpred.percept->config.percept.hist_width + 1;

    break;

  case BPred6bit:
  case BPred5bit:
  case BPred4bit:
  case BPred3bit:
  case BPred2bit:
  case BPred1bit:
    pred->dirpred.bimod = 
      bpred_dir_create(class, bimod_size, 0, 0, 0);

      break;

  case BPredTaken:
  case BPredNotTaken:
    /* no other state */
    break;

  default:
    panic("bogus predictor class");
  }

  /* allocate ret-addr stack */
  switch (class) {
  case BPredPercept:
  case BPredComb:
  case BPred2Level:
  case BPred6bit:
  case BPred5bit:
  case BPred4bit:
  case BPred3bit:
  case BPred2bit:
  case BPred1bit:
    {
      int i;

      /* allocate BTB */
      if (!btb_sets || (btb_sets & (btb_sets-1)) != 0)
        fatal("number of BTB sets must be non-zero and a power of two");
      if (!btb_assoc || (btb_assoc & (btb_assoc-1)) != 0)
        fatal("BTB associativity must be non-zero and a power of two");

      if (!(pred->btb.btb_data = calloc(btb_sets * btb_assoc,
                                        sizeof(struct bpred_btb_ent_t))))
        fatal("cannot allocate BTB");

      pred->btb.sets = btb_sets;
      pred->btb.assoc = btb_assoc;

      if (pred->btb.assoc > 1)
        for (i=0; i < (pred->btb.assoc*pred->btb.sets); i++)
          {
            if (i % pred->btb.assoc != pred->btb.assoc - 1)
              pred->btb.btb_data[i].next = &pred->btb.btb_data[i+1];
            else
              pred->btb.btb_data[i].next = NULL;
            
            if (i % pred->btb.assoc != pred->btb.assoc - 1)
              pred->btb.btb_data[i+1].prev = &pred->btb.btb_data[i];
          }

      /* allocate retstack */
      if ((retstack_size & (retstack_size-1)) != 0)
        fatal("Return-address-stack size must be zero or a power of two");
      
      pred->retstack.size = retstack_size;
      if (retstack_size)
        if (!(pred->retstack.stack = calloc(retstack_size, 
                                            sizeof(struct bpred_btb_ent_t))))
          fatal("cannot allocate return-address-stack");
      pred->retstack.tos = retstack_size - 1;
      
      break;
    }

  case BPredTaken:
  case BPredNotTaken:
    /* no other state */
    break;

  default:
    panic("bogus predictor class");
  }

  return pred;
}

/* create a branch direction predictor */
struct bpred_dir_t *            /* branch direction predictor instance */
bpred_dir_create (
  enum bpred_class class,       /* type of predictor to create */
  unsigned int l1size,          /* level-1 table size */
  unsigned int l2size,          /* level-2 table size (if relevant) */
  unsigned int shift_width,     /* history register width */
  unsigned int xor)             /* history xor address flag */
{
  struct bpred_dir_t *pred_dir;
  unsigned int cnt;
  int flipflop;

  if (!(pred_dir = calloc(1, sizeof(struct bpred_dir_t))))
    fatal("out of virtual memory");

  pred_dir->class = class;

  cnt = -1;
  switch (class) {
  case BPred2Level:
    {
      if (!l1size || (l1size & (l1size-1)) != 0)
        fatal("level-1 size, `%d', must be non-zero and a power of two", 
              l1size);
      pred_dir->config.two.l1size = l1size;
      
      if (!l2size || (l2size & (l2size-1)) != 0)
        fatal("level-2 size, `%d', must be non-zero and a power of two", 
              l2size);
      pred_dir->config.two.l2size = l2size;
      
      if (!shift_width || shift_width > 30)
        fatal("shift register width, `%d', must be non-zero and positive",
              shift_width);
      pred_dir->config.two.shift_width = shift_width;
      
      pred_dir->config.two.xor = xor;
      pred_dir->config.two.shiftregs = calloc(l1size, sizeof(int));
      if (!pred_dir->config.two.shiftregs)
        fatal("cannot allocate shift register table");
      
      pred_dir->config.two.l2table = calloc(l2size, sizeof(unsigned char));
      if (!pred_dir->config.two.l2table)
        fatal("cannot allocate second level table");

      /* initialize counters to weakly this-or-that */
      flipflop = 1;
      for (cnt = 0; cnt < l2size; cnt++)
        {
          pred_dir->config.two.l2table[cnt] = flipflop;
          flipflop = 3 - flipflop;
        }

      break;
    }

  case BPredPercept:
    {
      if (!l1size || (l1size & (l1size-1)) != 0)
        fatal("level-1 history table size, `%d', must be non-zero and a power of two", l1size);
      pred_dir->config.percept.bhtsize = l1size;

      if (!l2size || (l2size & (l2size-1)) != 0)
        fatal("level-2 perceptron table size, `%d', must be non-zero and a power of two", l2size);
      pred_dir->config.percept.percepttablesize = l2size;

      if (!shift_width || shift_width > 200)
        fatal("shift history register width, `%d', must be non-zero and positive", shift_width);
      pred_dir->config.percept.hist_width = shift_width;
      pred_dir->config.percept.weight_width = shift_width + 1;

      pred_dir->config.percept.xor = xor;

      pred_dir->config.percept.histregs = calloc(l1size, sizeof(int));
      if (!pred_dir->config.two.shiftregs)
        fatal("cannot allocate shift register history table");

      int rows = l2size;
      int cols = shift_width + 1;
      int i, j, count;
      pred_dir->config.percept.percepttable = (signed char **)calloc(rows * sizeof(signed char *));
      if (!pred_dir->config.percept.percepttable)
        fatal("cannot allocate second level perceptron table");
      for (i=0; i<rows; i++) {
        pred_dir->config.percept.percepttable[i] = (signed char *)calloc(cols * sizeof(signed char));
        if (!pred_dir->config.percept.percepttable[i])
          fatal("cannot allocate second level perceptron table entry");
      }

      /* initialize perceptron weights to 0 */
      for (i = 0; i < rows; i++)
        for (j = 0; j < cols; j++) {
          pred_dir->config.percept.percepttable[i][j] = 0;
        }

      break;
    }

  case BPred2bit:

    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("2bit table size, `%d', must be non-zero and a power of two", l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table = calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 2bit storage");
    /* initialize counters to weakly this-or-that */
    flipflop = 1;
    for (cnt = 0; cnt < l1size; cnt++) {
      pred_dir->config.bimod.table[cnt] = flipflop;
      flipflop = 3 - flipflop;
    }

    break;

  case BPred1bit:
    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("1bit table size, `%d', must be non-zero and a power of two", l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table = calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 1bit storage");
    /* initialize counters to this-or-that */
    flipflop = 1;
    for (cnt = 0; cnt < l1size; cnt++) {
      pred_dir->config.bimod.table[cnt] = flipflop;
      flipflop = 1 - flipflop;
    }

    break;

  case BPred3bit:
    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("3bit table size, `%d', must be non-zero and a power of two", l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table = calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 3bit storage");
    /* initialize counters to weakly this-or-that */
    flipflop = 3;
    for (cnt = 0; cnt < l1size; cnt++) {
      pred_dir->config.bimod.table[cnt] = flipflop;
      flipflop = 7 - flipflop;
    }

    break;

  case BPred4bit:
    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("4bit table size, `%d', must be non-zero and a power of two", l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table = calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 4bit storage");
    /* initialize counters to weakly this-or-that */
    flipflop = 7;
    for (cnt = 0; cnt < l1size; cnt++) {
      pred_dir->config.bimod.table[cnt] = flipflop;
      flipflop = 15 - flipflop;
    }

    break;

  case BPred5bit:
    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("5bit table size, `%d', must be non-zero and a power of two", l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table = calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 5bit storage");
    /* initialize counters to weakly this-or-that */
    flipflop = 15;
    for (cnt = 0; cnt < l1size; cnt++) {
      pred_dir->config.bimod.table[cnt] = flipflop;
      flipflop = 31 - flipflop;
    }

    break;

  case BPred6bit:
    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("6bit table size, `%d', must be non-zero and a power of two", l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table = calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 6bit storage");
    /* initialize counters to weakly this-or-that */
    flipflop = 31;
    for (cnt = 0; cnt < l1size; cnt++) {
      pred_dir->config.bimod.table[cnt] = flipflop;
      flipflop = 63 - flipflop;
    }

    break;

  case BPredTaken:
  case BPredNotTaken:
    /* no other state */
    break;

  default:
    panic("bogus branch direction predictor class");
  }

  return pred_dir;
}

/* print branch direction predictor configuration */
void
bpred_dir_config(
  struct bpred_dir_t *pred_dir, /* branch direction predictor instance */
  char name[],                  /* predictor name */
  FILE *stream)                 /* output stream */
{
  switch (pred_dir->class) {
  case BPred2Level:
    fprintf(stream,
      "pred_dir: %s: 2-lvl: %d l1-sz, %d bits/ent, %s xor, %d l2-sz, direct-mapped\n",
      name, pred_dir->config.two.l1size, pred_dir->config.two.shift_width,
      pred_dir->config.two.xor ? "" : "no", pred_dir->config.two.l2size);
    break;

  case BPredPercept:
    fprintf(stream,
      "pred_dir: %s: perceptron: %d bht-sz, %d hist-bits/ent, %s xor, %d percept-table-sz, direct-mapped\n",
      name, pred_dir->config.percept.bhtsize, pred_dir->config.percept.hist_width,
      pred_dir->config.percept.xor ? "" : "no", pred_dir->config.percept.percepttablesize);
    break;

  case BPred6bit:
    fprintf(stream, "pred_dir: %s: 6-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPred5bit:
    fprintf(stream, "pred_dir: %s: 5-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPred4bit:
    fprintf(stream, "pred_dir: %s: 4-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPred3bit:
    fprintf(stream, "pred_dir: %s: 3-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPred2bit:
    fprintf(stream, "pred_dir: %s: 2-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPred1bit:
    fprintf(stream, "pred_dir: %s: 1-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPredTaken:
    fprintf(stream, "pred_dir: %s: predict taken\n", name);
    break;

  case BPredNotTaken:
    fprintf(stream, "pred_dir: %s: predict not taken\n", name);
    break;

  default:
    panic("bogus branch direction predictor class");
  }
}

/* print branch predictor configuration */
void
bpred_config(struct bpred_t *pred,      /* branch predictor instance */
             FILE *stream)              /* output stream */
{
  switch (pred->class) {
  case BPredComb:
    bpred_dir_config (pred->dirpred.bimod, "bimod", stream);
    bpred_dir_config (pred->dirpred.twolev, "2lev", stream);
    bpred_dir_config (pred->dirpred.meta, "meta", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPredPercept:
    bpred_dir_config (pred->dirpred.percept, "percept", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred2Level:
    bpred_dir_config (pred->dirpred.twolev, "2lev", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred6bit:
    bpred_dir_config (pred->dirpred.bimod, "6bit", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred5bit:
    bpred_dir_config (pred->dirpred.bimod, "5bit", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred4bit:
    bpred_dir_config (pred->dirpred.bimod, "4bit", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred3bit:
    bpred_dir_config (pred->dirpred.bimod, "3bit", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred2bit:
    bpred_dir_config (pred->dirpred.bimod, "bimod", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred1bit:
    bpred_dir_config (pred->dirpred.bimod, "1bit", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
            pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPredTaken:
    bpred_dir_config (pred->dirpred.bimod, "taken", stream);
    break;
  case BPredNotTaken:
    bpred_dir_config (pred->dirpred.bimod, "nottaken", stream);
    break;

  default:
    panic("bogus branch predictor class");
  }
}

/* print predictor stats */
void
bpred_stats(struct bpred_t *pred,       /* branch predictor instance */
            FILE *stream)               /* output stream */
{
  fprintf(stream, "pred: addr-prediction rate = %f\n",
          (double)pred->addr_hits/(double)(pred->addr_hits+pred->misses));
  fprintf(stream, "pred: dir-prediction rate = %f\n",
          (double)pred->dir_hits/(double)(pred->dir_hits+pred->misses));
}

/* register branch predictor stats */
void
bpred_reg_stats(struct bpred_t *pred,   /* branch predictor instance */
                struct stat_sdb_t *sdb) /* stats database */
{
  char buf[512], buf1[512], *name;

  /* get a name for this predictor */
  switch (pred->class)
    {
    case BPredComb:
      name = "bpred_comb";
      break;
    case BPredPercept:
      name = "bpred_percept";
      break;
    case BPred2Level:
      name = "bpred_2lev";
      break;
    case BPred6bit:
      name = "bpred_6bit";
      break;
    case BPred5bit:
      name = "bpred_5bit";
      break;
    case BPred4bit:
      name = "bpred_4bit";
      break;
    case BPred3bit:
      name = "bpred_3bit";
      break;
    case BPred2bit:
      name = "bpred_bimod";
      break;
    case BPred1bit:
      name = "bpred_1bit";
      break;
    case BPredTaken:
      name = "bpred_taken";
      break;
    case BPredNotTaken:
      name = "bpred_nottaken";
      break;
    default:
      panic("bogus branch predictor class");
    }

  sprintf(buf, "%s.lookups", name);
  stat_reg_counter(sdb, buf, "total number of bpred lookups",
                   &pred->lookups, 0, NULL);
  sprintf(buf, "%s.updates", name);
  sprintf(buf1, "%s.dir_hits + %s.misses", name, name);
  stat_reg_formula(sdb, buf, "total number of updates", buf1, "%12.0f");
  sprintf(buf, "%s.addr_hits", name);
  stat_reg_counter(sdb, buf, "total number of address-predicted hits", 
                   &pred->addr_hits, 0, NULL);
  sprintf(buf, "%s.dir_hits", name);
  stat_reg_counter(sdb, buf, 
                   "total number of direction-predicted hits "
                   "(includes addr-hits)", 
                   &pred->dir_hits, 0, NULL);
  if (pred->class == BPredComb)
    {
      sprintf(buf, "%s.used_bimod", name);
      stat_reg_counter(sdb, buf, 
                       "total number of bimodal predictions used", 
                       &pred->used_bimod, 0, NULL);
      sprintf(buf, "%s.used_2lev", name);
      stat_reg_counter(sdb, buf, 
                       "total number of 2-level predictions used", 
                       &pred->used_2lev, 0, NULL);
    }
  sprintf(buf, "%s.misses", name);
  stat_reg_counter(sdb, buf, "total number of misses", &pred->misses, 0, NULL);
  sprintf(buf, "%s.jr_hits", name);
  stat_reg_counter(sdb, buf,
                   "total number of address-predicted hits for JR's",
                   &pred->jr_hits, 0, NULL);
  sprintf(buf, "%s.jr_seen", name);
  stat_reg_counter(sdb, buf,
                   "total number of JR's seen",
                   &pred->jr_seen, 0, NULL);
  sprintf(buf, "%s.jr_non_ras_hits.PP", name);
  stat_reg_counter(sdb, buf,
                   "total number of address-predicted hits for non-RAS JR's",
                   &pred->jr_non_ras_hits, 0, NULL);
  sprintf(buf, "%s.jr_non_ras_seen.PP", name);
  stat_reg_counter(sdb, buf,
                   "total number of non-RAS JR's seen",
                   &pred->jr_non_ras_seen, 0, NULL);
  sprintf(buf, "%s.bpred_addr_rate", name);
  sprintf(buf1, "%s.addr_hits / %s.updates", name, name);
  stat_reg_formula(sdb, buf,
                   "branch address-prediction rate (i.e., addr-hits/updates)",
                   buf1, "%9.4f");
  sprintf(buf, "%s.bpred_dir_rate", name);
  sprintf(buf1, "%s.dir_hits / %s.updates", name, name);
  stat_reg_formula(sdb, buf,
                  "branch direction-prediction rate (i.e., all-hits/updates)",
                  buf1, "%9.4f");
  sprintf(buf, "%s.bpred_jr_rate", name);
  sprintf(buf1, "%s.jr_hits / %s.jr_seen", name, name);
  stat_reg_formula(sdb, buf,
                  "JR address-prediction rate (i.e., JR addr-hits/JRs seen)",
                  buf1, "%9.4f");
  sprintf(buf, "%s.bpred_jr_non_ras_rate.PP", name);
  sprintf(buf1, "%s.jr_non_ras_hits.PP / %s.jr_non_ras_seen.PP", name, name);
  stat_reg_formula(sdb, buf,
                   "non-RAS JR addr-pred rate (ie, non-RAS JR hits/JRs seen)",
                   buf1, "%9.4f");
  sprintf(buf, "%s.retstack_pushes", name);
  stat_reg_counter(sdb, buf,
                   "total number of address pushed onto ret-addr stack",
                   &pred->retstack_pushes, 0, NULL);
  sprintf(buf, "%s.retstack_pops", name);
  stat_reg_counter(sdb, buf,
                   "total number of address popped off of ret-addr stack",
                   &pred->retstack_pops, 0, NULL);
  sprintf(buf, "%s.used_ras.PP", name);
  stat_reg_counter(sdb, buf,
                   "total number of RAS predictions used",
                   &pred->used_ras, 0, NULL);
  sprintf(buf, "%s.ras_hits.PP", name);
  stat_reg_counter(sdb, buf,
                   "total number of RAS hits",
                   &pred->ras_hits, 0, NULL);
  sprintf(buf, "%s.ras_rate.PP", name);
  sprintf(buf1, "%s.ras_hits.PP / %s.used_ras.PP", name, name);
  stat_reg_formula(sdb, buf,
                   "RAS prediction rate (i.e., RAS hits/used RAS)",
                   buf1, "%9.4f");
}

void
bpred_after_priming(struct bpred_t *bpred)
{
  if (bpred == NULL)
    return;

  bpred->lookups = 0;
  bpred->addr_hits = 0;
  bpred->dir_hits = 0;
  bpred->used_ras = 0;
  bpred->used_bimod = 0;
  bpred->used_2lev = 0;
  bpred->jr_hits = 0;
  bpred->jr_seen = 0;
  bpred->misses = 0;
  bpred->retstack_pops = 0;
  bpred->retstack_pushes = 0;
  bpred->ras_hits = 0;
}

#define BIMOD_HASH(PRED, ADDR)                                          \
  ((((ADDR) >> 19) ^ ((ADDR) >> MD_BR_SHIFT)) & ((PRED)->config.bimod.size-1))
    /* was: ((baddr >> 16) ^ baddr) & (pred->dirpred.bimod.size-1) */

#define PERCEPT_HASH(PRED, ADDR)                                          \
  ((((ADDR) >> 19) ^ ((ADDR) >> MD_BR_SHIFT)) & ((PRED)->config.percept.percepttablesize-1))

/* predicts a branch direction */
char *                                          /* pointer to counter */
bpred_dir_lookup(struct bpred_dir_t *pred_dir,  /* branch dir predictor inst */
                 md_addr_t baddr)               /* branch address */
{
  unsigned char *p = NULL;
  signed char *p2 = NULL;

  /* Except for jumps, get a pointer to direction-prediction bits */
  switch (pred_dir->class) {
    case BPred2Level:
      {
        int l1index, l2index;

        /* traverse 2-level tables */
        l1index = (baddr >> MD_BR_SHIFT) & (pred_dir->config.two.l1size - 1);
        l2index = pred_dir->config.two.shiftregs[l1index];
        if (pred_dir->config.two.xor) {
#if 1
            /* this L2 index computation is more "compatible" to McFarling's
               verison of it, i.e., if the PC xor address component is only
               part of the index, take the lower order address bits for the
               other part of the index, rather than the higher order ones */
            l2index = (((l2index ^ (baddr >> MD_BR_SHIFT)) & ((1 << pred_dir->config.two.shift_width) - 1)) | ((baddr >> MD_BR_SHIFT) << pred_dir->config.two.shift_width));
#else
            l2index = l2index ^ (baddr >> MD_BR_SHIFT);
#endif
        }
        else {
            l2index = l2index | ((baddr >> MD_BR_SHIFT) << pred_dir->config.two.shift_width);
        }
        l2index = l2index & (pred_dir->config.two.l2size - 1);

        /* get a pointer to prediction state information */
        p = &pred_dir->config.two.l2table[l2index];
      }
      break;
    case BPredPercept:
      p2 = pred_dir->config.percept.percepttable[PERCEPT_HASH(pred_dir, baddr)];
      return (char *)p2;
      break;
    case BPred6bit:
    case BPred5bit:
    case BPred4bit:
    case BPred3bit:
    case BPred2bit:
    case BPred1bit:
      p = pred_dir->config.bimod.table[BIMOD_HASH(pred_dir, baddr)];
      break;
    case BPredTaken:
    case BPredNotTaken:
      break;
    default:
      panic("bogus branch direction predictor class");
    }

  return (char *)p;
}

/* probe a predictor for a next fetch address, the predictor is probed
   with branch address BADDR, the branch target is BTARGET (used for
   static predictors), and OP is the instruction opcode (used to simulate
   predecode bits; a pointer to the predictor state entry (or null for jumps)
   is returned in *DIR_UPDATE_PTR (used for updating predictor state),
   and the non-speculative top-of-stack is returned in stack_recover_idx 
   (used for recovering ret-addr stack after mis-predict).  */
md_addr_t                               /* predicted branch target addr */
bpred_lookup(struct bpred_t *pred,      /* branch predictor instance */
             md_addr_t baddr,           /* branch address */
             md_addr_t btarget,         /* branch target if taken */
             enum md_opcode op,         /* opcode of instruction */
             int is_call,               /* non-zero if inst is fn call */
             int is_return,             /* non-zero if inst is fn return */
             struct bpred_update_t *dir_update_ptr, /* pred state pointer */
             int *stack_recover_idx)    /* Non-speculative top-of-stack;
                                         * used on mispredict recovery */
{
  struct bpred_btb_ent_t *pbtb = NULL;
  int index, i;

  if (!dir_update_ptr)
    panic("no bpred update record");

  /* if this is not a branch, return not-taken */
  if (!(MD_OP_FLAGS(op) & F_CTRL))
    return 0;

  pred->lookups++;

  dir_update_ptr->dir.ras = FALSE;
  dir_update_ptr->pdir1 = NULL;
  dir_update_ptr->pdir2 = NULL;
  dir_update_ptr->pmeta = NULL;
  /* Except for jumps, get a pointer to direction-prediction bits */
  switch (pred->class) {
    case BPredComb:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
        {
          char *bimod, *twolev, *meta;
          bimod = bpred_dir_lookup (pred->dirpred.bimod, baddr);
          twolev = bpred_dir_lookup (pred->dirpred.twolev, baddr);
          meta = bpred_dir_lookup (pred->dirpred.meta, baddr);
          dir_update_ptr->pmeta = meta;
          dir_update_ptr->dir.meta  = (*meta >= 2);
          dir_update_ptr->dir.bimod = (*bimod >= 2);
          dir_update_ptr->dir.twolev  = (*twolev >= 2);
          if (*meta >= 2)
            {
              dir_update_ptr->pdir1 = twolev;
              dir_update_ptr->pdir2 = bimod;
            }
          else
            {
              dir_update_ptr->pdir1 = bimod;
              dir_update_ptr->pdir2 = twolev;
            }
        }
      break;
    case BPred2Level:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
        {
          dir_update_ptr->pdir1 = bpred_dir_lookup (pred->dirpred.twolev, baddr);
        }
      break;
    case BPredPercept:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
        {
          dir_update_ptr->pdir1 = bpred_dir_lookup (pred->dirpred.percept, baddr);
        }
      break;
    case BPred6bit:
    case BPred5bit:
    case BPred4bit:
    case BPred3bit:
    case BPred2bit:
    case BPred1bit:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
        {
          dir_update_ptr->pdir1 = bpred_dir_lookup (pred->dirpred.bimod, baddr);
        }
      break;
    case BPredTaken:
      return btarget;
    case BPredNotTaken:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
        {
          return baddr + sizeof(md_inst_t);
        }
      else
        {
          return btarget;
        }
    default:
      panic("bogus predictor class");
  }

  /*
   * We have a stateful predictor, and have gotten a pointer into the
   * direction predictor (except for jumps, for which the ptr is null)
   */

  /* record pre-pop TOS; if this branch is executed speculatively
   * and is squashed, we'll restore the TOS and hope the data
   * wasn't corrupted in the meantime. */
  if (pred->retstack.size)
    *stack_recover_idx = pred->retstack.tos;
  else
    *stack_recover_idx = 0;

  /* if this is a return, pop return-address stack */
  if (is_return && pred->retstack.size)
    {
      md_addr_t target = pred->retstack.stack[pred->retstack.tos].target;
      pred->retstack.tos = (pred->retstack.tos + pred->retstack.size - 1)
                           % pred->retstack.size;
      pred->retstack_pops++;
      dir_update_ptr->dir.ras = TRUE; /* using RAS here */
      return target;
    }

#ifndef RAS_BUG_COMPATIBLE
  /* if function call, push return-address onto return-address stack */
  if (is_call && pred->retstack.size)
    {
      pred->retstack.tos = (pred->retstack.tos + 1)% pred->retstack.size;
      pred->retstack.stack[pred->retstack.tos].target = 
        baddr + sizeof(md_inst_t);
      pred->retstack_pushes++;
    }
#endif /* !RAS_BUG_COMPATIBLE */
  
  /* not a return. Get a pointer into the BTB */
  index = (baddr >> MD_BR_SHIFT) & (pred->btb.sets - 1);

  if (pred->btb.assoc > 1)
    {
      index *= pred->btb.assoc;

      /* Now we know the set; look for a PC match */
      for (i = index; i < (index+pred->btb.assoc) ; i++)
        if (pred->btb.btb_data[i].addr == baddr)
          {
            /* match */
            pbtb = &pred->btb.btb_data[i];
            break;
          }
    }   
  else
    {
      pbtb = &pred->btb.btb_data[index];
      if (pbtb->addr != baddr)
        pbtb = NULL;
    }

  /*
   * We now also have a pointer into the BTB for a hit, or NULL otherwise
   */

  /* if this is a jump, ignore predicted direction; we know it's taken. */
  if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) == (F_CTRL|F_UNCOND))
    {
      return (pbtb ? pbtb->target : 1);
    }

  unsigned int threshold;
  switch (pred->class) {
    case BPredPercept: /* theta = (1.93h +14) */
      threshold = 30; // temporary
      break;
    case BPred6bit:
      threshold = 32;
      break;
    case BPred5bit:
      threshold = 16;
      break;
    case BPred4bit:
      threshold = 8;
      break;
    case BPred3bit:
      threshold = 4;
      break;
    case BPredComb:
    case BPred2Level:
    case BPred2bit:
      threshold = 2;
      break;
    case BPred1bit:
      threshold = 1;
      break;
  }

  /* otherwise we have a conditional branch */
  if (pbtb == NULL)
    {
      if (pred->class == BPredPercept) {
        signed char *pweights = (signed char *)(dir_update_ptr->pdir1);
        int weight_width = pred->dirpred.percept->config.percept.weight_width;
        int *input;
        int sum = 0;
        int i;

      }
      else {
        /* BTB miss -- just return a predicted direction */
        return ((*(dir_update_ptr->pdir1) >= threshold)
                ? /* taken */ 1
                : /* not taken */ 0);
      }
    }
  else
    {
      if (pred->class == BPredPercept) {

      }
      else {
        /* BTB hit, so return target if it's a predicted-taken branch */
        return ((*(dir_update_ptr->pdir1) >= threshold)
                ? /* taken */ pbtb->target
                : /* not taken */ 0);
      }
    }
}

/* Speculative execution can corrupt the ret-addr stack.  So for each
 * lookup we return the top-of-stack (TOS) at that point; a mispredicted
 * branch, as part of its recovery, restores the TOS using this value --
 * hopefully this uncorrupts the stack. */
void
bpred_recover(struct bpred_t *pred,     /* branch predictor instance */
              md_addr_t baddr,          /* branch address */
              int stack_recover_idx)    /* Non-speculative top-of-stack;
                                         * used on mispredict recovery */
{
  if (pred == NULL)
    return;

  pred->retstack.tos = stack_recover_idx;
}

/* update the branch predictor, only useful for stateful predictors; updates
   entry for instruction type OP at address BADDR.  BTB only gets updated
   for branches which are taken.  Inst was determined to jump to
   address BTARGET and was taken if TAKEN is non-zero.  Predictor 
   statistics are updated with result of prediction, indicated by CORRECT and 
   PRED_TAKEN, predictor state to be updated is indicated by *DIR_UPDATE_PTR 
   (may be NULL for jumps, which shouldn't modify state bits).  Note if
   bpred_update is done speculatively, branch-prediction may get polluted. */
void
bpred_update(struct bpred_t *pred,      /* branch predictor instance */
             md_addr_t baddr,           /* branch address */
             md_addr_t btarget,         /* resolved branch target */
             int taken,                 /* non-zero if branch was taken */
             int pred_taken,            /* non-zero if branch was pred taken */
             int correct,               /* was earlier addr prediction ok? */
             enum md_opcode op,         /* opcode of instruction */
             struct bpred_update_t *dir_update_ptr)/* pred state pointer */
{
  struct bpred_btb_ent_t *pbtb = NULL;
  struct bpred_btb_ent_t *lruhead = NULL, *lruitem = NULL;
  int index, i;

  /* don't change bpred state for non-branch instructions or if this
   * is a stateless predictor*/
  if (!(MD_OP_FLAGS(op) & F_CTRL))
    return;

  /* Have a branch here */

  if (correct)
    pred->addr_hits++;

  if (!!pred_taken == !!taken)
    pred->dir_hits++;
  else
    pred->misses++;

  if (dir_update_ptr->dir.ras)
    {
      pred->used_ras++;
      if (correct)
        pred->ras_hits++;
    }
  else if ((MD_OP_FLAGS(op) & (F_CTRL|F_COND)) == (F_CTRL|F_COND))
    {
      if (dir_update_ptr->dir.meta)
        pred->used_2lev++;
      else
        pred->used_bimod++;
    }

  /* keep stats about JR's; also, but don't change any bpred state for JR's
   * which are returns unless there's no retstack */
  if (MD_IS_INDIR(op))
    {
      pred->jr_seen++;
      if (correct)
        pred->jr_hits++;
      
      if (!dir_update_ptr->dir.ras)
        {
          pred->jr_non_ras_seen++;
          if (correct)
            pred->jr_non_ras_hits++;
        }
      else
        {
          /* return that used the ret-addr stack; no further work to do */
          return;
        }
    }

  /* Can exit now if this is a stateless predictor */
  if (pred->class == BPredNotTaken || pred->class == BPredTaken)
    return;

  /* 
   * Now we know the branch didn't use the ret-addr stack, and that this
   * is a stateful predictor 
   */

#ifdef RAS_BUG_COMPATIBLE
  /* if function call, push return-address onto return-address stack */
  if (MD_IS_CALL(op) && pred->retstack.size)
    {
      pred->retstack.tos = (pred->retstack.tos + 1)% pred->retstack.size;
      pred->retstack.stack[pred->retstack.tos].target = 
        baddr + sizeof(md_inst_t);
      pred->retstack_pushes++;
    }
#endif /* RAS_BUG_COMPATIBLE */

  /* update L1 table if appropriate */
  /* L1 table is updated unconditionally for combining predictor too */
  if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND) &&
      (pred->class == BPred2Level || pred->class == BPredComb))
    {
      int l1index, shift_reg;
      
      /* also update appropriate L1 history register */
      l1index = (baddr >> MD_BR_SHIFT) & (pred->dirpred.twolev->config.two.l1size - 1);
      shift_reg = (pred->dirpred.twolev->config.two.shiftregs[l1index] << 1) | (!!taken);
      pred->dirpred.twolev->config.two.shiftregs[l1index] = shift_reg & ((1 << pred->dirpred.twolev->config.two.shift_width) - 1);
    }

  /* find BTB entry if it's a taken branch (don't allocate for non-taken) */
  if (taken)
    {
      index = (baddr >> MD_BR_SHIFT) & (pred->btb.sets - 1);
      
      if (pred->btb.assoc > 1)
        {
          index *= pred->btb.assoc;
          
          /* Now we know the set; look for a PC match; also identify
           * MRU and LRU items */
          for (i = index; i < (index+pred->btb.assoc) ; i++)
            {
              if (pred->btb.btb_data[i].addr == baddr)
                {
                  /* match */
                  assert(!pbtb);
                  pbtb = &pred->btb.btb_data[i];
                }
              
              dassert(pred->btb.btb_data[i].prev 
                      != pred->btb.btb_data[i].next);
              if (pred->btb.btb_data[i].prev == NULL)
                {
                  /* this is the head of the lru list, ie current MRU item */
                  dassert(lruhead == NULL);
                  lruhead = &pred->btb.btb_data[i];
                }
              if (pred->btb.btb_data[i].next == NULL)
                {
                  /* this is the tail of the lru list, ie the LRU item */
                  dassert(lruitem == NULL);
                  lruitem = &pred->btb.btb_data[i];
                }
            }
          dassert(lruhead && lruitem);
          
          if (!pbtb)
            /* missed in BTB; choose the LRU item in this set as the victim */
            pbtb = lruitem;     
          /* else hit, and pbtb points to matching BTB entry */
          
          /* Update LRU state: selected item, whether selected because it
           * matched or because it was LRU and selected as a victim, becomes 
           * MRU */
          if (pbtb != lruhead)
            {
              /* this splices out the matched entry... */
              if (pbtb->prev)
                pbtb->prev->next = pbtb->next;
              if (pbtb->next)
                pbtb->next->prev = pbtb->prev;
              /* ...and this puts the matched entry at the head of the list */
              pbtb->next = lruhead;
              pbtb->prev = NULL;
              lruhead->prev = pbtb;
              dassert(pbtb->prev || pbtb->next);
              dassert(pbtb->prev != pbtb->next);
            }
          /* else pbtb is already MRU item; do nothing */
        }
      else
        pbtb = &pred->btb.btb_data[index];
    }
      
  /* 
   * Now 'p' is a possibly null pointer into the direction prediction table, 
   * and 'pbtb' is a possibly null pointer into the BTB (either to a 
   * matched-on entry or a victim which was LRU in its set)
   */

  unsigned int saturation;
  switch (pred->class) {
    case BPred6bit:
      saturation = 63;
      break;
    case BPred5bit:
      saturation = 31;
      break;
    case BPred4bit:
      saturation = 15;
      break;
    case BPred3bit:
      saturation = 7;
      break;
    case BPredComb:
    case BPred2Level:
    case BPred2bit:
      saturation = 3;
      break;
    case BPred1bit:
      saturation = 1;
      break;
  }

  /* update state (but not for jumps) */
  if (dir_update_ptr->pdir1)
    {
      if (taken)
        {
          if (*dir_update_ptr->pdir1 < saturation)
            ++*dir_update_ptr->pdir1;
        }
      else
        { /* not taken */
          if (*dir_update_ptr->pdir1 > 0)
            --*dir_update_ptr->pdir1;
        }
    }

  /* combining predictor also updates second predictor and meta predictor */
  /* second direction predictor */
  if (dir_update_ptr->pdir2)
    {
      if (taken)
        {
          if (*dir_update_ptr->pdir2 < saturation)
            ++*dir_update_ptr->pdir2;
        }
      else
        { /* not taken */
          if (*dir_update_ptr->pdir2 > 0)
            --*dir_update_ptr->pdir2;
        }
    }

  /* meta predictor */
  if (dir_update_ptr->pmeta)
    {
      if (dir_update_ptr->dir.bimod != dir_update_ptr->dir.twolev)
        {
          /* we only update meta predictor if directions were different */
          if (dir_update_ptr->dir.twolev == (unsigned int)taken)
            {
              /* 2-level predictor was correct */
              if (*dir_update_ptr->pmeta < saturation)
                ++*dir_update_ptr->pmeta;
            }
          else
            {
              /* bimodal predictor was correct */
              if (*dir_update_ptr->pmeta > 0)
                --*dir_update_ptr->pmeta;
            }
        }
    }

  /* update BTB (but only for taken branches) */
  if (pbtb)
    {
      /* update current information */
      dassert(taken);

      if (pbtb->addr == baddr)
        {
          if (!correct)
            pbtb->target = btarget;
        }
      else
        {
          /* enter a new branch in the table */
          pbtb->addr = baddr;
          pbtb->op = op;
          pbtb->target = btarget;
        }
    }
}
