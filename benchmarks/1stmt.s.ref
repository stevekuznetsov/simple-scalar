gcc2_compiled.:
___gnu_compiled_c:
.text
	.align 4
	.proc	0110
_label_rtx:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ldub [%i0+12],%o0
	cmp %o0,40
	be,a L2
	ld [%i0+64],%o0
	call _abort,0
	nop
L2:
	cmp %o0,0
	bne,a L4
	ld [%i0+64],%i0
	call _gen_label_rtx,0
	nop
	st %o0,[%i0+64]
	mov %o0,%i0
L4:
	ret
	restore
	.align 4
	.global _emit_jump
	.proc	020
_emit_jump:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	nop
	call _gen_jump,0
	mov %i0,%o0
	call _emit_jump_insn,0
	nop
	call _emit_barrier,0
	nop
	ret
	restore
	.align 4
	.global _expand_label
	.proc	020
_expand_label:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	sethi %hi(_stack_block_stack),%l0
	call _label_rtx,0
	mov %i0,%o0
	call _emit_label,0
	nop
	ld [%l0+%lo(_stack_block_stack)],%o0
	cmp %o0,0
	be L7
	nop
	call _oballoc,0
	mov 8,%o0
	ld [%l0+%lo(_stack_block_stack)],%o2
	ld [%o2+36],%o1
	st %o1,[%o0]
	st %o0,[%o2+36]
	st %i0,[%o0+4]
L7:
	ret
	restore
	.align 4
	.global _expand_goto
	.proc	020
_expand_goto:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _label_rtx,0
	mov %i0,%o0
	mov %o0,%o1
	mov %i0,%o0
	call _expand_goto_internal,0
	mov 0,%o2
	ret
	restore
	.align 8
LC0:
	.ascii "jump to `%s' invalidly jumps into binding contour\0"
	.align 4
	.proc	020
_expand_goto_internal:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i2,%o2
	lduh [%i1],%o0
	cmp %o0,17
	be L10
	mov 0,%l0
	call _abort,0
	nop
L10:
	ld [%i1+8],%o0
	cmp %o0,0
	be L11
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%i2
	cmp %i2,0
	be L24
	cmp %l0,0
	ld [%i2+20],%o0
L26:
	ld [%o0+4],%o1
	ld [%i1+4],%o0
	cmp %o1,%o0
	bl L24
	cmp %l0,0
	ld [%i2+16],%o0
	cmp %o0,0
	bne,a L16
	mov %o0,%l0
L16:
	ld [%i2+28],%o0
	cmp %o0,0
	be,a L25
	ld [%i2+4],%i2
	call _expand_cleanups,0
	mov 0,%o1
	ld [%i2+4],%i2
L25:
	cmp %i2,0
	bne,a L26
	ld [%i2+20],%o0
	cmp %l0,0
L24:
	be L19
	sethi %hi(_stack_pointer_rtx),%o0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_move_insn,0
	mov %l0,%o1
L19:
	cmp %i0,0
	be L21
	sethi %hi(524288),%o0
	ld [%i0+12],%o1
	andcc %o1,%o0,%g0
	be L21
	sethi %hi(LC0),%o0
	ld [%i0+36],%o1
	or %o0,%lo(LC0),%o0
	call _error,0
	ld [%o1+20],%o1
	b,a L21
L11:
	mov %i0,%o0
	call _expand_fixup,0
	mov %i1,%o1
	cmp %o0,0
	bne L21
	cmp %i0,0
	be L21
	sethi %hi(16384),%o1
	ld [%i0+12],%o0
	or %o0,%o1,%o0
	st %o0,[%i0+12]
L21:
	call _emit_jump,0
	mov %i1,%o0
	ret
	restore
	.align 4
	.proc	04
_expand_fixup:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_cond_stack),%o0
	ld [%o0+%lo(_cond_stack)],%o1
	cmp %o1,0
	be L28
	mov %i0,%l1
	ld [%o1+16],%o0
	cmp %i1,%o0
	be L58
	sethi %hi(_cond_stack),%o0
	ld [%o1+20],%o0
	cmp %i1,%o0
	bne L59
	sethi %hi(_loop_stack),%o0
	sethi %hi(_cond_stack),%o0
L58:
	b L30
	ld [%o0+%lo(_cond_stack)],%o2
L28:
	sethi %hi(_loop_stack),%o0
L59:
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be L30
	mov 0,%o2
	ld [%o1+16],%o0
	cmp %i1,%o0
	be L60
	sethi %hi(_loop_stack),%o0
	ld [%o1+20],%o0
	cmp %i1,%o0
	be L60
	sethi %hi(_loop_stack),%o0
	ld [%o1+24],%o0
	cmp %i1,%o0
	bne L61
	cmp %o2,0
	sethi %hi(_loop_stack),%o0
L60:
	ld [%o0+%lo(_loop_stack)],%o2
L30:
	cmp %o2,0
L61:
	be L34
	sethi %hi(_block_stack),%o0
	ld [%o2],%o1
	ld [%o0+%lo(_block_stack)],%i0
L37:
	cmp %o1,0
	be L36
	cmp %o1,%i0
	bne,a L37
	ld [%o1],%o1
L36:
	cmp %o1,0
	be L38
	sethi %hi(_block_stack),%o0
	b L56
	mov 0,%i0
L38:
	ld [%o0+%lo(_block_stack)],%o0
	mov %o0,%i0
	cmp %i0,%o2
	be L40
	ld [%o0+4],%o1
	cmp %i0,%o1
L62:
	be,a L41
	ld [%i0+4],%o1
L41:
	ld [%i0],%i0
	cmp %i0,%o2
	bne L62
	cmp %i0,%o1
L40:
	mov %o1,%o2
L34:
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%i0
	cmp %i0,%o2
	be L65
	subcc %g0,%i0,%g0
	ld [%i0+16],%o0
L64:
	cmp %o0,0
	bne L63
	cmp %i0,%o2
	ld [%i0+28],%o0
	cmp %o0,0
	bne L63
	cmp %i0,%o2
	ld [%i0+4],%i0
	cmp %i0,%o2
	bne,a L64
	ld [%i0+16],%o0
	cmp %i0,%o2
L63:
	be L65
	subcc %g0,%i0,%g0
	call _oballoc,0
	mov 24,%o0
	call _do_pending_stack_adjust,0
	mov %o0,%l0
	cmp %i2,0
	be L51
	nop
	b L52
	st %i2,[%l0+4]
L51:
	call _get_last_insn,0
	nop
	st %o0,[%l0+4]
L52:
	st %l1,[%l0+8]
	st %i1,[%l0+12]
	st %g0,[%l0+16]
	ld [%i0+32],%o0
	cmp %o0,0
	bne L66
	mov 0,%o0
	ld [%i0+28],%o0
	cmp %o0,0
	be L53
	mov 0,%o0
L66:
	ld [%i0+28],%o1
	call _tree_cons,0
	ld [%i0+32],%o2
	b L67
	st %o0,[%l0+20]
L53:
	st %o0,[%l0+20]
L67:
	sethi %hi(_goto_fixup_chain),%o1
	ld [%o1+%lo(_goto_fixup_chain)],%o0
	st %o0,[%l0]
	st %l0,[%o1+%lo(_goto_fixup_chain)]
	subcc %g0,%i0,%g0
L65:
	addx %g0,0,%i0
L56:
	ret
	restore
	.align 8
LC1:
	.ascii "label `%s' used before containing binding contour\0"
	.align 4
	.proc	020
_fixup_gotos:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_goto_fixup_chain),%o0
	ld [%o0+%lo(_goto_fixup_chain)],%l1
	cmp %l1,0
	be L70
	mov 0,%o1
	sethi %hi(16384),%l2
	ld [%l1+4],%o0
L103:
	cmp %o0,0
	bne,a L72
	ld [%l1+12],%o0
	cmp %o1,0
	be,a L94
	mov %l1,%o1
	ld [%l1],%o0
	b L71
	st %o0,[%o1]
L72:
	ld [%o0+8],%o0
	cmp %o0,0
	be L75
	cmp %i0,0
	ld [%l1+8],%o0
	cmp %o0,0
	be L76
	cmp %i4,0
	bne,a L95
	ld [%l1+4],%o0
	cmp %i1,0
	bne,a L95
	ld [%l1+4],%o0
	cmp %i2,0
	be,a L96
	ld [%l1+20],%o0
	ld [%l1+4],%o0
L95:
	ld [%i3+4],%o1
	ld [%o0+4],%o0
	cmp %o1,%o0
	ble,a L96
	ld [%l1+20],%o0
	ld [%l1+8],%o1
	ld [%o1+12],%o0
	andcc %o0,%l2,%g0
	bne,a L96
	ld [%l1+20],%o0
	mov %o1,%o0
	sethi %hi(LC1),%o1
	call _error_with_decl,0
	or %o1,%lo(LC1),%o1
	ld [%l1+8],%o1
	ld [%o1+12],%o0
	or %o0,%l2,%o0
	st %o0,[%o1+12]
L76:
	ld [%l1+20],%o0
L96:
	cmp %o0,0
	be,a L97
	ld [%l1+16],%o1
	mov %o0,%l0
	ld [%l0+12],%o0
L99:
	andcc %o0,%l2,%g0
	be,a L98
	ld [%l0+4],%l0
	ld [%l0+20],%o0
	cmp %o0,0
	be,a L98
	ld [%l0+4],%l0
	call _fixup_cleanups,0
	add %l1,4,%o1
	ld [%l0+4],%l0
L98:
	cmp %l0,0
	bne,a L99
	ld [%l0+12],%o0
	ld [%l1+16],%o1
L97:
	cmp %o1,0
	be L84
	sethi %hi(_stack_pointer_rtx),%o0
	call _gen_move_insn,0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_insn_after,0
	ld [%l1+4],%o1
L84:
	b L71
	st %g0,[%l1+4]
L75:
	be L94
	mov %l1,%o1
	ld [%l1+20],%o2
	cmp %o2,0
	be L100
	cmp %i1,0
	ld [%o2+4],%o1
L102:
	ld [%i0+32],%o0
	cmp %o1,%o0
	bne,a L101
	ld [%o2+4],%o2
	ld [%o2+12],%o0
	or %o0,%l2,%o0
	st %o0,[%o2+12]
	ld [%o2+4],%o2
L101:
	cmp %o2,0
	bne,a L102
	ld [%o2+4],%o1
	cmp %i1,0
L100:
	bne,a L71
	st %i1,[%l1+16]
L71:
	mov %l1,%o1
L94:
	ld [%l1],%l1
	cmp %l1,0
	bne,a L103
	ld [%l1+4],%o0
L70:
	ret
	restore
	.align 4
	.global _expand_asm
	.proc	020
_expand_asm:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov 21,%o0
	mov 0,%o1
	call _gen_rtx,0
	ld [%i0+24],%o2
	call _emit_insn,0
	nop
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 8
LC2:
	.ascii "input operand constraint contains `+'\0"
	.align 8
LC3:
	.ascii "output operand constraint lacks `='\0"
	.align 8
LC4:
	.ascii "more than %d operands in `asm'\0"
	.align 8
LC5:
	.ascii "\0"
	.align 8
LC6:
	.ascii "hard register `%s' listed as input operand to `asm'\0"
	.align 8
LC7:
	.ascii "input operand constraint contains `%c'\0"
	.align 8
LC8:
	.ascii "unknown register name `%s' in `asm'\0"
	.align 4
	.global _expand_asm_operands
	.proc	020
_expand_asm_operands:
	!#PROLOGUE# 0
	save %sp,-168,%sp
	!#PROLOGUE# 1
	st %i0,[%fp-20]
	st %i1,[%fp-28]
	st %i2,[%fp-36]
	st %i3,[%fp-44]
	st %i4,[%fp-52]
	ld [%fp+92],%i4
	call _list_length,0
	ld [%fp-36],%o0
	mov %o0,%l7
	call _list_length,0
	ld [%fp-28],%o0
	mov %o0,%l5
	call _list_length,0
	ld [%fp-44],%o0
	mov %o0,%i2
	sll %l5,2,%o0
	add %o0,122,%o0
	and %o0,-8,%o0
	sub %sp,%o0,%sp
	add %sp,112,%l6
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ld [%fp-28],%l2
	cmp %l2,0
	be L107
	mov 0,%l3
	sethi %hi(_error_mark_node),%i1
	sethi %hi(_save_expr_regs),%i0
L118:
	ld [%l2+20],%l4
	ld [%l4+8],%o1
	ld [%i1+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	be L105
	mov 0,%o3
	ld [%l2+16],%o0
	mov %o0,%o1
	ld [%o0+20],%o0
	cmp %o3,%o0
	bge L111
	mov 0,%o2
	ld [%o1+24],%o0
L164:
	ldsb [%o0+%o2],%o0
	cmp %o0,43
	be L160
	sethi %hi(LC2),%o0
	ld [%l2+16],%o0
	ld [%o0+24],%o0
	ldsb [%o0+%o2],%o0
	cmp %o0,61
	be,a L112
	mov 1,%o3
L112:
	add %o2,1,%o2
	ld [%l2+16],%o1
	ld [%o1+20],%o0
	cmp %o2,%o0
	bl,a L164
	ld [%o1+24],%o0
L111:
	cmp %o3,0
	be L161
	sethi %hi(LC3),%o0
	ldub [%l4+12],%o1
	add %o1,-43,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bleu L117
	cmp %o1,49
	be,a L165
	ld [%l2+20],%o0
	ld [%l4+8],%o0
	call _gen_reg_rtx,0
	ldub [%o0+28],%o0
	mov %o0,%l0
	mov 112,%o0
	mov %l4,%o1
	call _build_nt,0
	mov %l0,%o2
	mov %o0,%l1
	mov 2,%o0
	mov 0,%o1
	mov %l0,%o2
	call _gen_rtx,0
	ld [%i0+%lo(_save_expr_regs)],%o3
	st %o0,[%i0+%lo(_save_expr_regs)]
	st %l1,[%l2+20]
	ld [%l4+8],%o0
	st %o0,[%l1+8]
L117:
	ld [%l2+20],%o0
L165:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	sll %l3,2,%o1
	st %o0,[%l6+%o1]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L118
	add %l3,1,%l3
L107:
	add %l7,%l5,%o0
	cmp %o0,5
	ble L119
	nop
	sethi %hi(LC4),%o0
	or %o0,%lo(LC4),%o0
	call _error,0
	mov 5,%o1
	b,a L105
L119:
	call _rtvec_alloc,0
	mov %l7,%o0
	mov %o0,%i1
	call _rtvec_alloc,0
	mov %l7,%o0
	mov %o0,%i0
	st %i0,[%sp+92]
	st %i5,[%sp+96]
	st %i4,[%sp+100]
	mov 22,%o0
	mov 0,%o1
	ld [%fp-20],%g2
	ld [%g2+24],%o2
	sethi %hi(LC5),%o3
	or %o3,%lo(LC5),%o3
	mov 0,%o4
	call _gen_rtx,0
	mov %i1,%o5
	mov %o0,%l4
	ld [%fp-52],%g2
	and %g2,1,%o1
	sll %o1,4,%o1
	ld [%l4],%o0
	and %o0,-17,%o0
	or %o0,%o1,%o0
	st %o0,[%l4]
	ld [%fp-36],%l2
	cmp %l2,0
	be L121
	mov 0,%l3
	sethi %hi(_error_mark_node),%i3
	sethi %hi(LC7),%l1
L131:
	ld [%l2+20],%o2
	ld [%o2+8],%o1
	ld [%i3+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	be L105
	nop
	ld [%l2+16],%o0
	cmp %o0,0
	be L162
	mov %o0,%o1
	mov 0,%o2
	ld [%o0+20],%o0
	cmp %o2,%o0
	bge,a L166
	ld [%l2+20],%o0
	ld [%o1+24],%o0
L167:
	ldsb [%o0+%o2],%o0
	cmp %o0,61
	be L129
	cmp %o0,43
	bne,a L127
	add %o2,1,%o2
L129:
	ld [%l2+16],%o0
	ld [%o0+24],%o1
	or %l1,%lo(LC7),%o0
	call _error,0
	ldsb [%o1+%o2],%o1
	b,a L105
L127:
	ld [%l2+16],%o1
	ld [%o1+20],%o0
	cmp %o2,%o0
	bl,a L167
	ld [%o1+24],%o0
	ld [%l2+20],%o0
L166:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	ld [%l4+16],%o1
	sll %l3,2,%l0
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	ld [%l2+20],%o0
	ld [%o0+8],%o1
	ld [%l2+16],%o2
	mov 21,%o0
	ldub [%o1+28],%o1
	call _gen_rtx,0
	ld [%o2+24],%o2
	ld [%l4+20],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L131
	add %l3,1,%l3
L121:
	mov 0,%l3
	cmp %l3,%l7
	bge L168
	cmp %l3,%l5
L135:
	ld [%l4+16],%o0
	sll %l3,2,%l0
	add %o0,%l0,%o0
	ld [%o0+4],%o0
	call _protect_from_queue,0
	mov 0,%o1
	ld [%l4+16],%o1
	add %o1,%l0,%o1
	add %l3,1,%l3
	cmp %l3,%l7
	bl L135
	st %o0,[%o1+4]
	mov 0,%l3
	cmp %l3,%l5
L168:
	bge L169
	cmp %l5,1
L139:
	sll %l3,2,%l0
	ld [%l6+%l0],%o0
	call _protect_from_queue,0
	mov 1,%o1
	add %l3,1,%l3
	cmp %l3,%l5
	bl L139
	st %o0,[%l6+%l0]
	cmp %l5,1
L169:
	bne L170
	cmp %l5,0
	cmp %i2,0
	bne L170
	cmp %l5,0
	ld [%fp-28],%g2
	ld [%g2+16],%o0
	ld [%o0+24],%o0
	st %o0,[%l4+8]
	mov 25,%o0
	mov 0,%o1
	ld [%l6],%o2
	call _gen_rtx,0
	mov %l4,%o3
	call _emit_insn,0
	nop
	b L171
	sethi %hi(_last_expr_type),%o0
L170:
	bne L172
	mov %l5,%o0
	cmp %i2,0
	bne L173
	cmp %o0,0
	b,a L151
L160:
	call _error,0
	or %o0,%lo(LC2),%o0
	b,a L105
L161:
	call _error,0
	or %o0,%lo(LC3),%o0
	b,a L105
L162:
	sethi %hi(LC6),%o0
	or %o0,%lo(LC6),%o0
	call _error,0
	ld [%o2+24],%o1
	b,a L105
L163:
	sethi %hi(LC8),%o0
	or %o0,%lo(LC8),%o0
	call _error,0
	mov %l1,%o1
	b,a L105
L172:
	cmp %o0,0
L173:
	bne L144
	mov %l4,%l7
	mov 1,%o0
L144:
	call _rtvec_alloc,0
	add %o0,%i2,%o0
	mov %o0,%o2
	mov 20,%o0
	call _gen_rtx,0
	mov 0,%o1
	mov %o0,%l4
	ld [%fp-28],%l2
	cmp %l2,0
	be L146
	mov 0,%l3
	ld [%fp-52],%g2
	and %g2,1,%o0
	sll %o0,4,%l1
L148:
	sll %l3,2,%l0
	ld [%l2+16],%o3
	st %i0,[%sp+92]
	st %i5,[%sp+96]
	st %i4,[%sp+100]
	mov 22,%o0
	mov 0,%o1
	ld [%fp-20],%g2
	ld [%g2+24],%o2
	ld [%o3+24],%o3
	mov %l3,%o4
	call _gen_rtx,0
	mov %i1,%o5
	mov %o0,%o3
	mov 25,%o0
	mov 0,%o1
	call _gen_rtx,0
	ld [%l6+%l0],%o2
	ld [%l4+4],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	ld [%l4+4],%o0
	add %o0,%l0,%o0
	ld [%o0+4],%o0
	ld [%o0+8],%o1
	ld [%o1],%o0
	and %o0,-17,%o0
	or %o0,%l1,%o0
	st %o0,[%o1]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L148
	add %l3,1,%l3
L146:
	cmp %l3,0
	bne L174
	ld [%fp-44],%l2
	ld [%l4+4],%o0
	st %l7,[%o0+4]
	mov 1,%l3
	ld [%fp-44],%l2
L174:
	cmp %l2,0
	be L151
	sethi %hi(_reg_names),%o0
	or %o0,%lo(_reg_names),%l5
L159:
	ld [%l2+20],%o0
	ld [%o0+24],%l1
	mov 0,%l0
	sll %l0,2,%o1
L176:
	mov %l1,%o0
	call _strcmp,0
	ld [%o1+%l5],%o1
	cmp %o0,0
	be L175
	cmp %l0,56
	add %l0,1,%l0
	cmp %l0,55
	ble,a L176
	sll %l0,2,%o1
	cmp %l0,56
L175:
	be L163
	mov 34,%o0
	mov 1,%o1
	call _gen_rtx,0
	mov %l0,%o2
	mov %o0,%o2
	mov 27,%o0
	call _gen_rtx,0
	mov 0,%o1
	ld [%l4+4],%o1
	sll %l3,2,%o2
	add %o1,%o2,%o1
	st %o0,[%o1+4]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L159
	add %l3,1,%l3
L151:
	call _emit_insn,0
	mov %l4,%o0
	sethi %hi(_last_expr_type),%o0
L171:
	st %g0,[%o0+%lo(_last_expr_type)]
L105:
	ret
	restore
	.align 8
LC9:
	.ascii "statement with no effect\0"
	.align 4
	.global _expand_expr_stmt
	.proc	020
_expand_expr_stmt:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_extra_warnings),%o0
	ld [%o0+%lo(_extra_warnings)],%o0
	cmp %o0,0
	be L178
	sethi %hi(_expr_stmts_for_value),%o0
	ld [%o0+%lo(_expr_stmts_for_value)],%o0
	cmp %o0,0
	bne,a L182
	ld [%i0+8],%o0
	ld [%i0+12],%o1
	sethi %hi(1048576),%o0
	andcc %o1,%o0,%g0
	bne,a L182
	ld [%i0+8],%o0
	sethi %hi(_error_mark_node),%o0
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %i0,%o0
	be L178
	sethi %hi(_emit_filename),%o0
	sethi %hi(_emit_lineno),%o1
	ld [%o0+%lo(_emit_filename)],%o0
	ld [%o1+%lo(_emit_lineno)],%o1
	sethi %hi(LC9),%o2
	call _warning_with_file_and_line,0
	or %o2,%lo(LC9),%o2
L178:
	ld [%i0+8],%o0
L182:
	sethi %hi(_last_expr_type),%o1
	st %o0,[%o1+%lo(_last_expr_type)]
	sethi %hi(_flag_syntax_only),%o0
	ld [%o0+%lo(_flag_syntax_only)],%o0
	cmp %o0,0
	bne L179
	sethi %hi(_expr_stmts_for_value),%o0
	ld [%o0+%lo(_expr_stmts_for_value)],%o0
	cmp %o0,0
	bne L181
	mov 0,%o1
	sethi %hi(_const0_rtx),%o0
	ld [%o0+%lo(_const0_rtx)],%o1
L181:
	mov %i0,%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	sethi %hi(_last_expr_value),%o1
	st %o0,[%o1+%lo(_last_expr_value)]
L179:
	call _emit_queue,0
	nop
	ret
	restore
	.align 4
	.global _clear_last_expr
	.proc	020
_clear_last_expr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%g2
	st %g0,[%g2+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_start_stmt_expr
	.proc	0111
_expand_start_stmt_expr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _start_sequence,0
	nop
	call _suspend_momentary,0
	mov %o0,%l1
	mov %o0,%l0
	call _make_node,0
	mov 113,%o0
	mov %o0,%i0
	call _resume_momentary,0
	mov %l0,%o0
	st %l1,[%i0+24]
	sethi %hi(_expr_stmts_for_value),%o1
	ld [%o1+%lo(_expr_stmts_for_value)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_expr_stmts_for_value)]
	ret
	restore
	.align 4
	.global _expand_end_stmt_expr
	.proc	0111
_expand_end_stmt_expr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	ld [%i0+24],%l3
	sethi %hi(_last_expr_type),%o1
	ld [%o1+%lo(_last_expr_type)],%o0
	cmp %o0,0
	bne L186
	sethi %hi(_last_expr_type),%l2
	sethi %hi(_void_type_node),%o0
	ld [%o0+%lo(_void_type_node)],%o0
	st %o0,[%o1+%lo(_last_expr_type)]
	sethi %hi(_const0_rtx),%o0
	ld [%o0+%lo(_const0_rtx)],%o0
	sethi %hi(_last_expr_value),%o1
	st %o0,[%o1+%lo(_last_expr_value)]
L186:
	ld [%l2+%lo(_last_expr_type)],%o0
	st %o0,[%i0+8]
	sethi %hi(_last_expr_value),%l1
	ld [%l1+%lo(_last_expr_value)],%o0
	call _get_insns,0
	st %o0,[%i0+24]
	st %o0,[%i0+20]
	sethi %hi(_rtl_expr_chain),%l0
	mov 0,%o0
	mov %i0,%o1
	call _tree_cons,0
	ld [%l0+%lo(_rtl_expr_chain)],%o2
	st %o0,[%l0+%lo(_rtl_expr_chain)]
	call _end_sequence,0
	mov %l3,%o0
	ld [%i0+12],%o0
	sethi %hi(1048576),%o1
	or %o0,%o1,%o0
	st %o0,[%i0+12]
	call _volatile_refs_p,0
	ld [%l1+%lo(_last_expr_value)],%o0
	and %o0,1,%o0
	sll %o0,12,%o0
	ld [%i0+12],%o2
	sethi %hi(4096),%o1
	andn %o2,%o1,%o1
	or %o1,%o0,%o1
	st %o1,[%i0+12]
	st %g0,[%l2+%lo(_last_expr_type)]
	sethi %hi(_expr_stmts_for_value),%o1
	ld [%o1+%lo(_expr_stmts_for_value)],%o0
	add %o0,-1,%o0
	st %o0,[%o1+%lo(_expr_stmts_for_value)]
	ret
	restore
	.align 4
	.global _expand_start_cond
	.proc	020
_expand_start_cond:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	sethi %hi(_cond_stack),%o0
	ld [%o0+%lo(_cond_stack)],%o0
	st %o0,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	st %o0,[%l0+8]
	call _gen_label_rtx,0
	st %g0,[%l0+20]
	cmp %i1,0
	be L188
	st %o0,[%l0+16]
	b L189
	st %o0,[%l0+12]
L188:
	st %g0,[%l0+12]
L189:
	sethi %hi(_cond_stack),%o0
	st %l0,[%o0+%lo(_cond_stack)]
	sethi %hi(_nesting_stack),%o0
	st %l0,[%o0+%lo(_nesting_stack)]
	mov %i0,%o0
	ld [%l0+16],%o1
	call _do_jump,0
	mov 0,%o2
	ret
	restore
	.align 4
	.global _expand_end_cond
	.proc	020
_expand_end_cond:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_cond_stack),%o0
	call _do_pending_stack_adjust,0
	ld [%o0+%lo(_cond_stack)],%l0
	call _emit_label,0
	ld [%l0+16],%o0
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_cond_stack),%l1
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_cond_stack)],%o0
L197:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_cond_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L197
	ld [%l1+%lo(_cond_stack)],%o0
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_start_else
	.proc	020
_expand_start_else:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _gen_label_rtx,0
	nop
	mov %o0,%o2
	sethi %hi(_cond_stack),%o0
	ld [%o0+%lo(_cond_stack)],%o1
	st %o2,[%o1+20]
	ld [%o1+12],%o0
	cmp %o0,0
	bne,a L199
	st %o2,[%o1+12]
L199:
	sethi %hi(_cond_stack),%l0
	ld [%l0+%lo(_cond_stack)],%o0
	call _emit_jump,0
	ld [%o0+20],%o0
	ld [%l0+%lo(_cond_stack)],%o0
	ld [%o0+16],%o0
	cmp %o0,0
	be L200
	nop
	call _emit_label,0
	nop
L200:
	ret
	restore
	.align 4
	.global _expand_end_else
	.proc	020
_expand_end_else:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_cond_stack),%o0
	call _do_pending_stack_adjust,0
	ld [%o0+%lo(_cond_stack)],%l0
	ld [%l0+20],%o0
	cmp %o0,0
	be L202
	sethi %hi(_cond_stack),%l1
	call _emit_label,0
	nop
L202:
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_cond_stack)],%o0
L209:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_cond_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L209
	ld [%l1+%lo(_cond_stack)],%o0
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_start_loop
	.proc	020
_expand_start_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	st %o0,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	call _gen_label_rtx,0
	st %o0,[%l0+8]
	call _gen_label_rtx,0
	st %o0,[%l0+16]
	st %o0,[%l0+20]
	ld [%l0+16],%o0
	cmp %i0,0
	be L211
	st %o0,[%l0+24]
	ld [%l0+20],%o0
	b L212
	st %o0,[%l0+12]
L211:
	st %g0,[%l0+12]
L212:
	sethi %hi(_loop_stack),%o0
	st %l0,[%o0+%lo(_loop_stack)]
	sethi %hi(_nesting_stack),%o0
	call _do_pending_stack_adjust,0
	st %l0,[%o0+%lo(_nesting_stack)]
	call _emit_queue,0
	nop
	mov 0,%o0
	call _emit_note,0
	mov -4,%o1
	call _emit_label,0
	ld [%l0+16],%o0
	ret
	restore
	.align 4
	.global _expand_start_loop_continue_elsewhere
	.proc	020
_expand_start_loop_continue_elsewhere:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _expand_start_loop,0
	mov %i0,%o0
	call _gen_label_rtx,0
	nop
	sethi %hi(_loop_stack),%o1
	ld [%o1+%lo(_loop_stack)],%o1
	st %o0,[%o1+24]
	ret
	restore
	.align 4
	.global _expand_loop_continue_here
	.proc	020
_expand_loop_continue_here:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	nop
	mov 0,%o0
	call _emit_note,0
	mov -8,%o1
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	call _emit_label,0
	ld [%o0+24],%o0
	ret
	restore
	.align 4
	.global _expand_end_loop
	.proc	020
_expand_end_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _get_last_insn,0
	nop
	mov %o0,%l1
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	call _do_pending_stack_adjust,0
	ld [%o0+16],%l2
	sethi %hi(_optimize),%o0
	ld [%o0+%lo(_optimize)],%o0
	cmp %o0,0
	be L216
	nop
	lduh [%l1],%o0
	cmp %o0,14
	bne L232
	sethi %hi(_loop_stack),%o0
	ld [%l1+16],%o2
	lduh [%o2],%o0
	cmp %o0,25
	bne L232
	sethi %hi(_loop_stack),%o0
	sethi %hi(_pc_rtx),%o0
	ld [%o2+4],%o1
	ld [%o0+%lo(_pc_rtx)],%o0
	cmp %o1,%o0
	bne L232
	sethi %hi(_loop_stack),%o0
	ld [%o2+8],%o0
	lduh [%o0],%o0
	cmp %o0,42
	be L216
	nop
	sethi %hi(_loop_stack),%o0
L232:
	ld [%o0+%lo(_loop_stack)],%o0
	ld [%o0+16],%l1
	cmp %l1,0
	be L235
	sethi %hi(_pc_rtx),%o0
	ld [%o0+%lo(_pc_rtx)],%o3
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o2
	lduh [%l1],%o0
L236:
	cmp %o0,14
	bne,a L233
	ld [%l1+12],%l1
	ld [%l1+16],%o1
	lduh [%o1],%o0
	cmp %o0,25
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+4],%o0
	cmp %o0,%o3
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+8],%o1
	lduh [%o1],%o0
	cmp %o0,42
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+8],%o1
	lduh [%o1],%o0
	cmp %o0,38
	bne,a L234
	ld [%l1+16],%o0
	ld [%o1+4],%o1
	ld [%o2+20],%o0
	cmp %o1,%o0
	be L235
	cmp %l1,0
	ld [%l1+16],%o0
L234:
	ld [%o0+8],%o0
	ld [%o0+12],%o1
	lduh [%o1],%o0
	cmp %o0,38
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+4],%o1
	ld [%o2+20],%o0
	cmp %o1,%o0
	be L235
	cmp %l1,0
	ld [%l1+12],%l1
L233:
	cmp %l1,0
	bne,a L236
	lduh [%l1],%o0
	cmp %l1,0
L235:
	be L216
	nop
	call _gen_label_rtx,0
	nop
	mov %o0,%l0
	call _emit_label_after,0
	ld [%l2+8],%o1
	call _get_last_insn,0
	nop
	mov %o0,%o2
	mov %l2,%o0
	call _reorder_insns,0
	mov %l1,%o1
	call _gen_jump,0
	mov %l2,%o0
	call _emit_jump_insn_after,0
	ld [%l0+8],%o1
	call _emit_barrier_after,0
	ld [%l0+8],%o0
	mov %l0,%l2
L216:
	call _emit_jump,0
	mov %l2,%o0
	mov 0,%o0
	call _emit_note,0
	mov -5,%o1
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	call _emit_label,0
	ld [%o0+20],%o0
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_loop_stack),%l1
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_loop_stack)],%o0
L237:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_loop_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L237
	ld [%l1+%lo(_loop_stack)],%o0
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_continue_loop
	.proc	04
_expand_continue_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be L240
	mov 0,%i0
	mov 0,%o0
	ld [%o1+24],%o1
	call _expand_goto_internal,0
	mov 0,%o2
	mov 1,%i0
L240:
	ret
	restore
	.align 4
	.global _expand_exit_loop
	.proc	04
_expand_exit_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be L243
	mov 0,%i0
	mov 0,%o0
	ld [%o1+20],%o1
	call _expand_goto_internal,0
	mov 0,%o2
	mov 1,%i0
L243:
	ret
	restore
	.align 4
	.global _expand_exit_loop_if_false
	.proc	04
_expand_exit_loop_if_false:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be,a L246
	mov 0,%i0
	mov %i0,%o0
	ld [%o1+20],%o1
	call _do_jump,0
	mov 0,%o2
	mov 1,%i0
L246:
	ret
	restore
	.align 4
	.global _expand_exit_something
	.proc	04
_expand_exit_something:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	cmp %o0,0
	be L253
	mov 0,%i0
	ld [%o0+12],%o1
L254:
	cmp %o1,0
	be,a L250
	ld [%o0],%o0
	mov 0,%o0
	call _expand_goto_internal,0
	mov 0,%o2
	b L253
	mov 1,%i0
L250:
	cmp %o0,0
	bne,a L254
	ld [%o0+12],%o1
	mov 0,%i0
L253:
	ret
	restore
	.align 4
	.global _expand_null_return
	.proc	020
_expand_null_return:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _expand_null_return_1,0
	mov 0,%o0
	ret
	restore
	.align 4
	.proc	020
_expand_null_return_1:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _clear_pending_stack_adjust,0
	nop
	call _do_pending_stack_adjust,0
	nop
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_return_label),%o1
	mov 0,%o0
	ld [%o1+%lo(_return_label)],%o1
	call _expand_goto_internal,0
	mov %i0,%o2
	ret
	restore
	.align 4
	.global _expand_return
	.proc	020
_expand_return:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%o1
	cmp %o1,0
	be L261
	mov 0,%l1
	ld [%o1+28],%o0
L294:
	cmp %o0,0
	bne,a L261
	mov 1,%l1
	ld [%o1+4],%o1
	cmp %o1,0
	bne,a L294
	ld [%o1+28],%o0
L261:
	ldub [%i0+12],%o0
	cmp %o0,45
	bne,a L265
	ldub [%i0+12],%o0
	b L266
	mov %i0,%l0
L265:
	add %o0,-55,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu L295
	sethi %hi(_void_type_node),%o0
	ld [%i0+20],%o0
	ldub [%o0+12],%o0
	cmp %o0,45
	bne L295
	sethi %hi(_void_type_node),%o0
	b L266
	ld [%i0+24],%l0
L295:
	ld [%i0+8],%o1
	ld [%o0+%lo(_void_type_node)],%o0
	xor %o1,%o0,%o1
	subcc %g0,%o1,%g0
	addx %g0,-1,%o1
	and %o1,%i0,%l0
L266:
	sethi %hi(_optimize),%o0
	ld [%o0+%lo(_optimize)],%o0
	cmp %o0,0
	be L273
	cmp %l0,0
	be L273
	sethi %hi(_frame_offset),%o0
	ld [%o0+%lo(_frame_offset)],%o0
	cmp %o0,0
	bne L296
	cmp %l1,0
	ldub [%l0+12],%o0
	cmp %o0,60
	bne L296
	cmp %l1,0
	ld [%l0+20],%o1
	ldub [%o1+12],%o0
	cmp %o0,114
	bne L296
	cmp %l1,0
	sethi %hi(_this_function),%o0
	ld [%o1+20],%o1
	ld [%o0+%lo(_this_function)],%o0
	cmp %o1,%o0
	bne L296
	cmp %l1,0
	ld [%l0+24],%o0
	call _tail_recursion_args,0
	ld [%o1+52],%o1
	cmp %o0,0
	be L296
	cmp %l1,0
	sethi %hi(_tail_recursion_label),%l0
	ld [%l0+%lo(_tail_recursion_label)],%o0
	cmp %o0,0
	bne L272
	nop
	call _gen_label_rtx,0
	nop
	st %o0,[%l0+%lo(_tail_recursion_label)]
	sethi %hi(_tail_recursion_reentry),%o1
	call _emit_label_after,0
	ld [%o1+%lo(_tail_recursion_reentry)],%o1
L272:
	call _get_last_insn,0
	sethi %hi(_tail_recursion_label),%l0
	mov %o0,%o2
	mov 0,%o0
	call _expand_goto_internal,0
	ld [%l0+%lo(_tail_recursion_label)],%o1
	call _emit_barrier,0
	add %o7,(L259-.-4),%o7
L273:
	cmp %l1,0
L296:
	be L289
	cmp %l0,0
	be L289
	sethi %hi(_void_type_node),%o0
	ld [%l0+8],%o1
	ld [%o0+%lo(_void_type_node)],%o0
	cmp %o1,%o0
	be L289
	sethi %hi(_this_function),%l1
	ld [%l1+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%o0
	lduh [%o0],%o0
	cmp %o0,34
	bne L297
	mov %i0,%o0
	mov %l0,%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	mov %o0,%l0
	call _get_last_insn,0
	nop
	mov %o0,%i0
	ld [%l1+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%o0
	call _emit_move_insn,0
	mov %l0,%o1
	ld [%l1+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%l0
	lduh [%l0],%o0
	cmp %o0,34
	bne L290
	mov 26,%o0
	mov 0,%o1
	call _gen_rtx,0
	mov %l0,%o2
	call _emit_insn,0
	nop
L290:
	call _expand_null_return_1,0
	mov %i0,%o0
	b,a L259
L289:
	mov %i0,%o0
L297:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	nop
	sethi %hi(_this_function),%o0
	ld [%o0+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%l0
	lduh [%l0],%o0
	cmp %o0,34
	bne L292
	mov 26,%o0
	mov 0,%o1
	call _gen_rtx,0
	mov %l0,%o2
	call _emit_insn,0
	nop
L292:
	call _expand_null_return,0
	nop
L259:
	ret
	restore
	.align 4
	.global _drop_through_at_end_p
	.proc	04
_drop_through_at_end_p:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _get_last_insn,0
	nop
	mov %o0,%o1
L301:
	cmp %o1,0
	be L304
	mov 0,%i0
	lduh [%o1],%o0
	cmp %o0,18
	be,a L301
	ld [%o1+8],%o1
	cmp %o1,0
L304:
	be L302
	nop
	lduh [%o1],%o0
	xor %o0,16,%o0
	subcc %g0,%o0,%g0
	addx %g0,0,%i0
L302:
	ret
	restore
	.align 4
	.proc	04
_tail_recursion_args:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i0,%l3
	mov %i1,%l0
	b L337
	mov 0,%l2
L312:
	ld [%o0+8],%o1
	ld [%l0+8],%o0
	cmp %o1,%o0
	bne,a L335
	mov 0,%i0
	ld [%l0+64],%o0
	lduh [%o0],%o0
	cmp %o0,34
	bne,a L335
	mov 0,%i0
	ld [%l0+28],%o0
	cmp %o0,26
	be L336
	add %l2,1,%l2
	ld [%l3+4],%l3
	ld [%l0+4],%l0
L337:
	cmp %l3,0
	be L307
	cmp %l0,0
	bne,a L312
	ld [%l3+20],%o0
L307:
	cmp %l3,0
	bne,a L335
	mov 0,%i0
	cmp %l0,0
	be L313
	sll %l2,2,%o0
L336:
	b L335
	mov 0,%i0
L313:
	add %o0,106,%o0
	and %o0,-8,%o0
	sub %sp,%o0,%sp
	add %sp,96,%l6
	orcc %i0,%g0,%l3
	be L340
	mov 0,%l2
L318:
	ld [%l3+20],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	sll %l2,2,%o1
	st %o0,[%l6+%o1]
	ld [%l3+4],%l3
	cmp %l3,0
	bne L318
	add %l2,1,%l2
	orcc %i0,%g0,%l3
L340:
	be L320
	mov 0,%l2
L328:
	mov 0,%l4
	mov %i1,%l0
	cmp %l4,%l2
	bge L323
	mov 0,%l1
	sll %l2,2,%l5
L326:
	ld [%l0+64],%o0
	call _reg_mentioned_p,0
	ld [%l6+%l5],%o1
	cmp %o0,0
	be,a L324
	add %l1,1,%l1
	b L323
	mov 1,%l4
L324:
	cmp %l1,%l2
	bl L326
	ld [%l0+4],%l0
L323:
	cmp %l4,0
	be L321
	sll %l2,2,%l0
	call _copy_to_reg,0
	ld [%l6+%l0],%o0
	st %o0,[%l6+%l0]
L321:
	ld [%l3+4],%l3
	cmp %l3,0
	bne L328
	add %l2,1,%l2
L320:
	mov %i1,%l0
	mov %i0,%l3
	cmp %l0,0
	be L330
	mov 0,%l2
L334:
	sll %l2,2,%o0
	ld [%l6+%o0],%o2
	ldub [%o2+2],%o1
	ld [%l0+28],%o0
	cmp %o0,%o1
	bne L332
	sll %l2,2,%o1
	ld [%l0+64],%o0
	call _emit_move_insn,0
	mov %o2,%o1
	b L338
	ld [%l0+4],%l0
L332:
	ld [%l3+20],%o0
	ld [%o0+8],%o0
	ld [%o0+12],%o2
	srl %o2,11,%o2
	ld [%l0+64],%o0
	ld [%l6+%o1],%o1
	call _convert_move,0
	and %o2,1,%o2
	ld [%l0+4],%l0
L338:
	ld [%l3+4],%l3
	cmp %l0,0
	bne L334
	add %l2,1,%l2
L330:
	mov 1,%i0
L335:
	ret
	restore
	.align 4
	.global _expand_start_bindings
	.proc	020
_expand_start_bindings:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	mov 0,%o0
	call _emit_note,0
	mov -2,%o1
	mov %o0,%l1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%o2
	st %o2,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	st %o0,[%l0+8]
	st %g0,[%l0+16]
	cmp %o2,0
	be L342
	st %g0,[%l0+28]
	mov 0,%o0
	ld [%o2+28],%o1
	call _tree_cons,0
	ld [%o2+32],%o2
	b L346
	st %o0,[%l0+32]
L342:
	mov 0,%o0
	st %o0,[%l0+32]
L346:
	st %g0,[%l0+36]
	sethi %hi(_stack_block_stack),%o0
	ld [%o0+%lo(_stack_block_stack)],%o0
	st %o0,[%l0+24]
	cmp %i0,0
	be L344
	st %l1,[%l0+20]
	call _gen_label_rtx,0
	nop
	b L345
	st %o0,[%l0+12]
L344:
	st %g0,[%l0+12]
L345:
	sethi %hi(_block_stack),%o0
	st %l0,[%o0+%lo(_block_stack)]
	sethi %hi(_nesting_stack),%o0
	st %l0,[%o0+%lo(_nesting_stack)]
	ret
	restore
	.align 4
	.global _use_variable
	.proc	020
_use_variable:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i0,%o2
	lduh [%o2],%o0
	cmp %o0,34
	be L351
	cmp %o0,37
	bne L349
	nop
	ld [%o2+4],%o2
	lduh [%o2],%o0
	cmp %o0,34
	bne L349
	sethi %hi(_frame_pointer_rtx),%o0
	ld [%o0+%lo(_frame_pointer_rtx)],%o0
	cmp %o2,%o0
	be L349
	sethi %hi(_arg_pointer_rtx),%o0
	ld [%o0+%lo(_arg_pointer_rtx)],%o0
	cmp %o2,%o0
	be L349
	nop
L351:
	mov 26,%o0
	call _gen_rtx,0
	mov 0,%o1
	call _emit_insn,0
	nop
L349:
	ret
	restore
	.align 4
	.proc	020
_use_variable_after:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i0,%o2
	lduh [%o2],%o0
	cmp %o0,34
	be L356
	cmp %o0,37
	bne L354
	nop
	ld [%o2+4],%o2
	lduh [%o2],%o0
	cmp %o0,34
	bne L354
	sethi %hi(_frame_pointer_rtx),%o0
	ld [%o0+%lo(_frame_pointer_rtx)],%o0
	cmp %o2,%o0
	be L354
	sethi %hi(_arg_pointer_rtx),%o0
	ld [%o0+%lo(_arg_pointer_rtx)],%o0
	cmp %o2,%o0
	be L354
	nop
L356:
	mov 26,%o0
	call _gen_rtx,0
	mov 0,%o1
	call _emit_insn_after,0
	mov %i1,%o1
L354:
	ret
	restore
	.align 8
LC10:
	.ascii "unused variable `%s'\0"
	.align 4
	.global _expand_end_bindings
	.proc	020
_expand_end_bindings:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%l1
	sethi %hi(_warn_unused),%o0
	ld [%o0+%lo(_warn_unused)],%o0
	cmp %o0,0
	be L358
	cmp %i0,0
	mov %i0,%l0
	be L358
	sethi %hi(-16776960),%o0
	or %o0,%lo(-16776960),%l4
	sethi %hi(721420288),%l3
	sethi %hi(LC10),%l2
	ld [%l0+12],%o0
L390:
	and %o0,%l4,%o0
	cmp %o0,%l3
	bne,a L389
	ld [%l0+4],%l0
	mov %l0,%o0
	call _warning_with_decl,0
	or %l2,%lo(LC10),%o1
	ld [%l0+4],%l0
L389:
	cmp %l0,0
	bne,a L390
	ld [%l0+12],%o0
L358:
	cmp %i1,0
	be L364
	mov 0,%o0
	call _emit_note,0
	mov -3,%o1
	b L391
	ld [%l1+12],%o0
L364:
	ld [%l1+20],%o1
	mov -1,%o0
	st %o0,[%o1+20]
	ld [%l1+12],%o0
L391:
	cmp %o0,0
	be L392
	cmp %i2,0
	call _do_pending_stack_adjust,0
	nop
	call _emit_label,0
	ld [%l1+12],%o0
	cmp %i2,0
L392:
	bne,a L393
	ld [%l1+36],%l0
	ld [%l1+16],%o0
	cmp %o0,0
	bne,a L393
	ld [%l1+36],%l0
	ld [%l1+28],%o0
	cmp %o0,0
	be,a L394
	ld [%l1+16],%o0
	ld [%l1+36],%l0
L393:
	cmp %l0,0
	be,a L394
	ld [%l1+16],%o0
	sethi %hi(524288),%l4
	sethi %hi(16384),%l3
	sethi %hi(LC1),%l2
	ld [%l0+4],%o0
L395:
	ld [%o0+12],%o1
	or %o1,%l4,%o1
	st %o1,[%o0+12]
	ld [%l0+4],%o1
	ld [%o1+12],%o0
	andcc %o0,%l3,%g0
	be L371
	mov %o1,%o0
	call _error_with_decl,0
	or %l2,%lo(LC1),%o1
L371:
	ld [%l0],%l0
	cmp %l0,0
	bne,a L395
	ld [%l0+4],%o0
	ld [%l1+16],%o0
L394:
	cmp %o0,0
	bne,a L396
	ld [%l1+28],%o0
	ld [%l1+28],%o0
	cmp %o0,0
	be,a L397
	sethi %hi(_obey_regdecls),%o0
L396:
	call _expand_cleanups,0
	mov 0,%o1
	ld [%l1+16],%o0
	cmp %o0,0
	be L398
	mov %l1,%o0
	call _do_pending_stack_adjust,0
	nop
	sethi %hi(_stack_pointer_rtx),%o0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_move_insn,0
	ld [%l1+16],%o1
	mov %l1,%o0
L398:
	ld [%l1+16],%o1
	ld [%l1+28],%o2
	ld [%l1+20],%o3
	call _fixup_gotos,0
	mov %i2,%o4
	sethi %hi(_obey_regdecls),%o0
L397:
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L377
	mov %i0,%l0
	cmp %l0,0
	be,a L399
	ld [%l1+24],%o0
	ldub [%l0+12],%o0
L401:
	cmp %o0,43
	bne L380
	ld [%l0+64],%o1
	cmp %o1,0
	be,a L400
	ld [%l0+4],%l0
	call _use_variable,0
	mov %o1,%o0
L380:
	ld [%l0+4],%l0
L400:
	cmp %l0,0
	bne,a L401
	ldub [%l0+12],%o0
L377:
	ld [%l1+24],%o0
L399:
	sethi %hi(_stack_block_stack),%o1
	st %o0,[%o1+%lo(_stack_block_stack)]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%i1
	sethi %hi(_block_stack),%i0
	sethi %hi(_nesting_stack),%l1
	sethi %hi(_nesting_depth),%l0
	ld [%i0+%lo(_block_stack)],%o0
L402:
	ld [%o0+4],%o1
	st %o1,[%i0+%lo(_block_stack)]
	ld [%o0],%o1
	st %o1,[%l1+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%i1
	bg L402
	ld [%i0+%lo(_block_stack)],%o0
	ret
	restore
	.align 4
	.global _expand_decl
	.proc	020
_expand_decl:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	cmp %i1,0
	be L404
	ld [%o0+%lo(_block_stack)],%l0
	mov %i0,%o0
	mov %i1,%o1
	call _temp_tree_cons,0
	ld [%l0+28],%o2
	st %o0,[%l0+28]
	sethi %hi(_stack_block_stack),%o0
	st %l0,[%o0+%lo(_stack_block_stack)]
L404:
	cmp %i0,0
	bne,a L405
	ldub [%i0+12],%o0
	cmp %i1,0
	bne L403
	nop
	call _abort,0
	nop
L405:
	cmp %o0,43
	bne L403
	ld [%i0+8],%i1
	ld [%i0+12],%o1
	sethi %hi(10485760),%o0
	andcc %o1,%o0,%g0
	bne L403
	sethi %hi(_error_mark_node),%o0
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %i1,%o0
	bne,a L409
	ld [%i0+24],%o0
	sethi %hi(_const0_rtx),%o2
	mov 37,%o0
	mov 26,%o1
	call _gen_rtx,0
	ld [%o2+%lo(_const0_rtx)],%o2
	b L410
	st %o0,[%i0+64]
L409:
	cmp %o0,0
	bne,a L411
	ld [%i0+28],%o0
	ld [%i0+60],%o0
	cmp %o0,0
	bne L412
	nop
	ld [%i0+28],%o0
	call _assign_stack_local,0
	mov 0,%o1
	b L410
	st %o0,[%i0+64]
L412:
	call _gen_reg_rtx,0
	mov 4,%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	mov 26,%o1
	b L410
	st %o0,[%i0+64]
L411:
	cmp %o0,26
	be L415
	sethi %hi(_flag_float_store),%o0
	ld [%o0+%lo(_flag_float_store)],%o0
	cmp %o0,0
	be,a L435
	ld [%i0+12],%o1
	ldub [%i1+12],%o0
	cmp %o0,6
	be,a L436
	ld [%i0+24],%o0
	ld [%i0+12],%o1
L435:
	sethi %hi(1064960),%o0
	andcc %o1,%o0,%g0
	bne,a L436
	ld [%i0+24],%o0
	sethi %hi(8192),%o0
	andcc %o1,%o0,%g0
	bne L417
	sethi %hi(_obey_regdecls),%o0
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	bne,a L436
	ld [%i0+24],%o0
L417:
	call _gen_reg_rtx,0
	ld [%i0+28],%o0
	mov %o0,%o1
	st %o1,[%i0+64]
	ldub [%i1+12],%o0
	cmp %o0,11
	bne,a L437
	ld [%i0+64],%o1
	call _mark_reg_pointer,0
	mov %o1,%o0
	ld [%i0+64],%o1
L437:
	ld [%o1],%o0
	or %o0,16,%o0
	b L410
	st %o0,[%o1]
L415:
	ld [%i0+24],%o0
L436:
	ld [%o0+12],%o1
	sethi %hi(131072),%o0
	andcc %o1,%o0,%g0
	be,a L420
	mov 1,%o0
	ld [%i0+64],%o1
	cmp %o1,0
	be L421
	mov 0,%i1
	lduh [%o1],%o0
	cmp %o0,37
	bne L423
	nop
	ld [%o1+4],%o0
	lduh [%o0],%o0
	cmp %o0,34
	be,a L422
	ld [%i0+64],%o0
L423:
	call _abort,0
	nop
L422:
	ld [%o0+4],%i1
L421:
	ld [%i0+24],%o1
	ldub [%i0+32],%o0
	call .umul,0
	ld [%o1+16],%o1
	addcc %o0,7,%o1
	bneg,a L424
	add %o0,14,%o1
L424:
	ld [%i0+28],%o0
	call _assign_stack_local,0
	sra %o1,3,%o1
	cmp %i1,0
	be L425
	st %o0,[%i0+64]
	ld [%o0+4],%o0
	call _force_operand,0
	mov %i1,%o1
	mov %o0,%o1
	call _emit_move_insn,0
	mov %i1,%o0
L425:
	ld [%i0+64],%o2
	ld [%i0+8],%o0
	ldub [%o0+12],%o0
	cmp %o0,16
	be L427
	mov 0,%o1
	add %o0,-19,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu L438
	sll %o1,3,%o1
L427:
	mov 1,%o1
	sll %o1,3,%o1
L438:
	ld [%o2],%o0
	and %o0,-9,%o0
	or %o0,%o1,%o0
	b L410
	st %o0,[%o2]
L420:
	sethi %hi(_frame_pointer_needed),%o1
	st %o0,[%o1+%lo(_frame_pointer_needed)]
	ld [%l0+16],%o0
	cmp %o0,0
	bne,a L439
	ld [%i0+24],%o0
	call _do_pending_stack_adjust,0
	nop
	sethi %hi(_stack_pointer_rtx),%o0
	call _copy_to_reg,0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	st %o0,[%l0+16]
	sethi %hi(_stack_block_stack),%o0
	st %l0,[%o0+%lo(_stack_block_stack)]
	ld [%i0+24],%o0
L439:
	ldub [%i0+32],%o1
	call _convert_units,0
	mov 8,%o2
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	ldub [%i0+32],%o0
	andcc %o0,15,%g0
	be L430
	nop
	call _round_push,0
	mov %o1,%o0
	mov %o0,%o1
L430:
	call _anti_adjust_stack,0
	mov %o1,%o0
	sethi %hi(_stack_pointer_rtx),%o0
	call _copy_to_reg,0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	ld [%i0+28],%o1
	st %o0,[%i0+64]
L410:
	ld [%i0+12],%o1
	sethi %hi(1048576),%o0
	andcc %o1,%o0,%g0
	be L440
	sethi %hi(262144),%o0
	ld [%i0+64],%o1
	ld [%o1],%o0
	or %o0,16,%o0
	st %o0,[%o1]
	ld [%i0+12],%o1
	sethi %hi(262144),%o0
L440:
	andcc %o1,%o0,%g0
	be L441
	sethi %hi(_obey_regdecls),%o0
	ld [%i0+64],%o1
	ld [%o1],%o0
	or %o0,32,%o0
	st %o0,[%o1]
	sethi %hi(_obey_regdecls),%o0
L441:
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L403
	nop
	call _use_variable,0
	ld [%i0+64],%o0
L403:
	ret
	restore
	.align 4
	.global _expand_decl_init
	.proc	020
_expand_decl_init:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+12],%o1
	sethi %hi(2097152),%o0
	andcc %o1,%o0,%g0
	bne L442
	sethi %hi(_error_mark_node),%o0
	ld [%i0+60],%o1
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	bne,a L444
	ld [%i0+60],%o0
	ld [%i0+8],%o0
	ldub [%o0+12],%o1
	add %o1,-5,%o0
	cmp %o0,1
	bleu L446
	cmp %o1,8
	be L446
	cmp %o1,11
	bne L449
	nop
L446:
	sethi %hi(_integer_zero_node),%o1
	ld [%i0+8],%o0
	call _convert,0
	ld [%o1+%lo(_integer_zero_node)],%o1
	mov %o0,%o1
	b L450
	mov %i0,%o0
L444:
	cmp %o0,0
	be L442
	nop
	ldub [%o0+12],%o0
	cmp %o0,3
	be L442
	nop
	ld [%i0+16],%o0
	call _emit_line_note,0
	ld [%i0+20],%o1
	mov %i0,%o0
	ld [%i0+60],%o1
L450:
	mov 0,%o2
	call _expand_assignment,0
	mov 0,%o3
L449:
	call _emit_queue,0
	nop
L442:
	ret
	restore
	.align 4
	.global _expand_anon_union_decl
	.proc	020
_expand_anon_union_decl:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%l2
	mov %i0,%o0
	call _expand_decl,0
	mov %i1,%o1
	cmp %i2,0
	be L453
	ld [%i0+64],%l0
	ld [%i2+20],%i0
L459:
	ldub [%l0+2],%o0
	cmp %o0,26
	be L454
	ld [%i2+16],%l1
	ld [%i0+8],%o1
	mov 35,%o0
	ldub [%o1+28],%o1
	mov %l0,%o2
	call _gen_rtx,0
	mov 0,%o3
	b L458
	cmp %i1,0
L454:
	mov %l0,%o0
	cmp %i1,0
L458:
	be L456
	st %o0,[%i0+64]
	mov %i0,%o0
	mov %l1,%o1
	call _temp_tree_cons,0
	ld [%l2+28],%o2
	st %o0,[%l2+28]
L456:
	ld [%i2+4],%i2
	cmp %i2,0
	bne,a L459
	ld [%i2+20],%i0
L453:
	ret
	restore
	.align 4
	.proc	020
_expand_cleanups:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	cmp %i0,0
	be L462
	sethi %hi(_const0_rtx),%l0
	cmp %i1,0
L471:
	be,a L469
	ld [%i0+20],%o1
	ld [%i0+16],%o0
	cmp %o0,%i1
	be,a L470
	ld [%i0+4],%i0
	ld [%i0+20],%o1
L469:
	ldub [%o1+12],%o0
	cmp %o0,3
	bne,a L466
	ld [%i0+20],%o0
	mov %o1,%o0
	call _expand_cleanups,0
	mov %i1,%o1
	b L470
	ld [%i0+4],%i0
L466:
	ld [%l0+%lo(_const0_rtx)],%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	ld [%i0+4],%i0
L470:
	cmp %i0,0
	bne L471
	cmp %i1,0
L462:
	ret
	restore
	.align 4
	.proc	020
_fixup_cleanups:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _get_last_insn,0
	nop
	mov %o0,%l1
	mov %i0,%o0
	call _expand_cleanups,0
	mov 0,%o1
	call _get_last_insn,0
	nop
	mov %o0,%l0
	ld [%l1+12],%o0
	mov %l0,%o1
	call _reorder_insns,0
	ld [%i1],%o2
	st %l0,[%i1]
	ret
	restore
	.align 4
	.global _move_cleanups_up
	.proc	020
_move_cleanups_up:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%l0
	ld [%l0+4],%l1
	ld [%l0+28],%o0
	call _chainon,0
	ld [%l1+28],%o1
	st %o0,[%l1+28]
	st %g0,[%l0+28]
	ret
	restore
	.align 4
	.global _expand_start_case
	.proc	020
_expand_start_case:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o0
	st %o0,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	cmp %i0,0
	be L475
	st %o0,[%l0+8]
	call _gen_label_rtx,0
	nop
	b L476
	st %o0,[%l0+12]
L475:
	st %g0,[%l0+12]
L476:
	st %g0,[%l0+20]
	st %i1,[%l0+28]
	st %i2,[%l0+32]
	st %g0,[%l0+24]
	sth %g0,[%l0+36]
	sethi %hi(_case_stack),%o0
	st %l0,[%o0+%lo(_case_stack)]
	sethi %hi(_nesting_stack),%o0
	call _do_pending_stack_adjust,0
	st %l0,[%o0+%lo(_nesting_stack)]
	call _get_last_insn,0
	nop
	lduh [%o0],%o0
	cmp %o0,18
	be L477
	mov 0,%o0
	call _emit_note,0
	mov -1,%o1
L477:
	call _get_last_insn,0
	nop
	st %o0,[%l0+16]
	ret
	restore
	.align 4
	.global _expand_start_case_dummy
	.proc	020
_expand_start_case_dummy:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	sethi %hi(_case_stack),%o4
	ld [%o4+%lo(_case_stack)],%o1
	st %o1,[%o0+4]
	sethi %hi(_nesting_stack),%o3
	ld [%o3+%lo(_nesting_stack)],%o1
	st %o1,[%o0]
	sethi %hi(_nesting_depth),%o2
	ld [%o2+%lo(_nesting_depth)],%o1
	add %o1,1,%o1
	st %o1,[%o2+%lo(_nesting_depth)]
	st %o1,[%o0+8]
	st %g0,[%o0+12]
	st %g0,[%o0+20]
	st %g0,[%o0+16]
	st %g0,[%o0+32]
	st %g0,[%o0+24]
	sth %g0,[%o0+36]
	st %o0,[%o4+%lo(_case_stack)]
	st %o0,[%o3+%lo(_nesting_stack)]
	ret
	restore
	.align 4
	.global _expand_end_case_dummy
	.proc	020
_expand_end_case_dummy:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_case_stack),%l1
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_case_stack)],%o0
L486:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_case_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L486
	ld [%l1+%lo(_case_stack)],%o0
	ret
	restore
	.align 4
	.global _pushcase
	.proc	04
_pushcase:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o0
	cmp %o0,0
	be,a L502
	mov 1,%i0
	ld [%o0+16],%o0
	cmp %o0,0
	bne L488
	sethi %hi(_case_stack),%o0
	b L502
	mov 1,%i0
L488:
	ld [%o0+%lo(_case_stack)],%o1
	ld [%o1+28],%o0
	ld [%o0+8],%l0
	sethi %hi(_error_mark_node),%o0
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %l0,%o0
	be L503
	ld [%o1+32],%o1
	cmp %i0,0
	be L508
	mov %o1,%o0
	call _convert,0
	mov %i0,%o1
	orcc %o0,%g0,%i0
L508:
	be L492
	mov %i0,%o0
	call _int_fits_type_p,0
	mov %l0,%o1
	cmp %o0,0
	bne L505
	cmp %i0,0
	b L502
	mov 3,%i0
L492:
	cmp %i0,0
L505:
	bne L493
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o0
	ld [%o0+24],%o0
	cmp %o0,0
	bne L502
	mov 2,%i0
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o0
	b L495
	st %i1,[%o0+24]
L493:
	ld [%o0+%lo(_case_stack)],%o0
	add %o0,20,%l1
	ld [%o0+20],%o0
	cmp %o0,0
	be,a L506
	ld [%l1],%o1
	ld [%l1],%o0
L507:
	ld [%o0+16],%o0
	call _tree_int_cst_lt,0
	mov %i0,%o1
	cmp %o0,0
	be,a L506
	ld [%l1],%o1
	ld [%l1],%o0
	add %o0,4,%l1
	ld [%o0+4],%o0
	cmp %o0,0
	bne,a L507
	ld [%l1],%o0
	ld [%l1],%o1
L506:
	cmp %o1,0
	be L500
	nop
	mov %i0,%o0
	call _tree_int_cst_lt,0
	ld [%o1+12],%o1
	cmp %o0,0
	bne L500
	nop
	b L502
	mov 2,%i0
L500:
	call _oballoc,0
	mov 28,%o0
	mov %o0,%l0
	st %g0,[%l0]
	ld [%l1],%o0
	st %o0,[%l0+4]
	call _copy_node,0
	mov %i0,%o0
	st %o0,[%l0+12]
	st %o0,[%l0+16]
	st %i1,[%l0+24]
	st %g0,[%l0+20]
	st %l0,[%l1]
L495:
	call _expand_label,0
	mov %i1,%o0
L503:
	mov 0,%i0
L502:
	ret
	restore
	.align 4
	.global _pushcase_range
	.proc	04
_pushcase_range:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o0
	cmp %o0,0
	be,a L525
	mov 1,%i0
	ld [%o0+16],%o0
	cmp %o0,0
	bne L510
	sethi %hi(_case_stack),%o0
	b L525
	mov 1,%i0
L510:
	ld [%o0+%lo(_case_stack)],%o1
	ld [%o1+28],%o0
	ld [%o0+8],%l0
	sethi %hi(_error_mark_node),%o0
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %l0,%o0
	be L526
	ld [%o1+32],%l1
	cmp %i0,0
	be L513
	mov %l1,%o0
	call _convert,0
	mov %i0,%o1
	mov %o0,%i0
L513:
	cmp %i1,0
	be L514
	mov %l1,%o0
	call _convert,0
	mov %i1,%o1
	mov %o0,%i1
L514:
	cmp %i0,0
	be L515
	mov %i0,%o0
	call _int_fits_type_p,0
	mov %l0,%o1
	cmp %o0,0
	be,a L525
	mov 3,%i0
L515:
	cmp %i1,0
	be L528
	mov %i1,%o0
	call _int_fits_type_p,0
	mov %l0,%o1
	cmp %o0,0
	bne L528
	mov %i1,%o0
	b L525
	mov 3,%i0
L528:
	call _tree_int_cst_lt,0
	mov %i0,%o1
	cmp %o0,0
	be L517
	mov %i0,%o0
	b L525
	mov 4,%i0
L517:
	call _tree_int_cst_equal,0
	mov %i1,%o1
	cmp %o0,0
	be L518
	sethi %hi(_case_stack),%o0
	mov %i0,%o0
	call _pushcase,0
	mov %i2,%o1
	b L525
	mov %o0,%i0
L518:
	ld [%o0+%lo(_case_stack)],%o0
	add %o0,20,%l1
	ld [%o0+20],%o0
	cmp %o0,0
	be,a L529
	ld [%l1],%o1
	ld [%l1],%o0
L530:
	ld [%o0+16],%o0
	call _tree_int_cst_lt,0
	mov %i0,%o1
	cmp %o0,0
	be,a L529
	ld [%l1],%o1
	ld [%l1],%o0
	add %o0,4,%l1
	ld [%o0+4],%o0
	cmp %o0,0
	bne,a L530
	ld [%l1],%o0
	ld [%l1],%o1
L529:
	cmp %o1,0
	be L523
	nop
	mov %i1,%o0
	call _tree_int_cst_lt,0
	ld [%o1+12],%o1
	cmp %o0,0
	bne L523
	nop
	b L525
	mov 2,%i0
L523:
	call _oballoc,0
	mov 28,%o0
	mov %o0,%l0
	st %g0,[%l0]
	ld [%l1],%o0
	st %o0,[%l0+4]
	call _copy_node,0
	mov %i0,%o0
	st %o0,[%l0+12]
	call _copy_node,0
	mov %i1,%o0
	st %o0,[%l0+16]
	st %i2,[%l0+24]
	st %g0,[%l0+20]
	st %l0,[%l1]
	call _expand_label,0
	mov %i2,%o0
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o1
	lduh [%o1+36],%o0
	add %o0,1,%o0
	sth %o0,[%o1+36]
L526:
	mov 0,%i0
L525:
	ret
	restore
	.align 8
LC11:
	.ascii "enumerated value `%s' not handled in switch\0"
	.align 8
LC12:
	.ascii "case value `%d' not in enumerated type `%s'\0"
	.align 4
	.global _check_for_full_enumeration_handling
	.proc	020
_check_for_full_enumeration_handling:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%o0
	ld [%o0+28],%o1
	ldub [%o1+12],%o0
	cmp %o0,35
	be L531
	nop
	ld [%o1+20],%l2
	ld [%l2+8],%o0
	ld [%o0+16],%l1
	cmp %l1,0
	be L553
	sethi %hi(_case_stack),%o0
	sethi %hi(_case_stack),%l4
	sethi %hi(LC11),%l3
	ld [%l4+%lo(_case_stack)],%o0
L558:
	ld [%o0+20],%l0
	cmp %l0,0
	be,a L556
	ld [%l1+16],%o1
	ld [%l0+16],%o0
L555:
	call _tree_int_cst_lt,0
	ld [%l1+20],%o1
	cmp %o0,0
	be L554
	cmp %l0,0
	ld [%l0+4],%l0
	cmp %l0,0
	bne,a L555
	ld [%l0+16],%o0
	cmp %l0,0
L554:
	be,a L556
	ld [%l1+16],%o1
	ld [%l0+12],%o0
	call _tree_int_cst_equal,0
	ld [%l1+20],%o1
	cmp %o0,0
	bne,a L557
	ld [%l1+4],%l1
	ld [%l1+16],%o1
L556:
	or %l3,%lo(LC11),%o0
	call _warning,0
	ld [%o1+20],%o1
	ld [%l1+4],%l1
L557:
	cmp %l1,0
	bne L558
	ld [%l4+%lo(_case_stack)],%o0
	sethi %hi(_case_stack),%o0
L553:
	ld [%o0+%lo(_case_stack)],%o0
	ld [%o0+20],%l0
	cmp %l0,0
	be L531
	sethi %hi(LC12),%l3
	ld [%l2+8],%o0
L562:
	ld [%o0+16],%l1
	cmp %l1,0
	be L559
	nop
	ld [%l0+12],%o0
L560:
	call _tree_int_cst_equal,0
	ld [%l1+20],%o1
	cmp %o0,0
	bne L559
	cmp %l1,0
	ld [%l1+4],%l1
	cmp %l1,0
	bne,a L560
	ld [%l0+12],%o0
	cmp %l1,0
L559:
	bne,a L561
	ld [%l0+4],%l0
	ld [%l0+12],%o1
	ld [%l2+8],%o0
	ld [%o0+48],%o0
	ld [%o0+36],%o2
	or %l3,%lo(LC12),%o0
	ld [%o1+16],%o1
	call _warning,0
	ld [%o2+20],%o2
	ld [%l0+4],%l0
L561:
	cmp %l0,0
	bne,a L562
	ld [%l2+8],%o0
L531:
	ret
	restore
	.align 4
	.global _expand_end_case
	.proc	020
_expand_end_case:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _gen_label_rtx,0
	nop
	mov %o0,%l7
	sethi %hi(_case_stack),%o0
	ld [%o0+%lo(_case_stack)],%l4
	call _do_pending_stack_adjust,0
	ld [%l4+28],%l1
	sethi %hi(_error_mark_node),%o0
	ld [%l1+8],%o1
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	be,a L621
	ld [%l4+12],%o0
	ld [%l4+24],%o0
	cmp %o0,0
	bne,a L622
	mov 0,%i0
	ld [%i0+8],%o0
	ldub [%o0+12],%o0
	cmp %o0,8
	bne,a L623
	ld [%l4+24],%o0
	sethi %hi(_warn_switch),%o0
	ld [%o0+%lo(_warn_switch)],%o0
	cmp %o0,0
	be,a L623
	ld [%l4+24],%o0
	call _check_for_full_enumeration_handling,0
	nop
	ld [%l4+24],%o0
L623:
	cmp %o0,0
	bne L622
	mov 0,%i0
	mov 40,%o0
	mov 0,%o1
	call _build_decl,0
	mov 0,%o2
	call _expand_label,0
	st %o0,[%l4+24]
L622:
	call _label_rtx,0
	ld [%l4+24],%o0
	call _get_last_insn,0
	mov %o0,%l5
	mov %o0,%i1
	call _group_case_nodes,0
	ld [%l4+20],%o0
	ld [%l4+20],%l0
	cmp %l0,0
	be L624
	cmp %i0,0
	ld [%l0+12],%o0
L628:
	ldub [%o0+12],%o0
	cmp %o0,35
	be,a L570
	ld [%l0+16],%o0
	call _abort,0
	nop
L570:
	ldub [%o0+12],%o0
	cmp %o0,35
	be,a L571
	ld [%l1+8],%o0
	call _abort,0
	nop
L571:
	call _convert,0
	ld [%l0+12],%o1
	st %o0,[%l0+12]
	ld [%l1+8],%o0
	call _convert,0
	ld [%l0+16],%o1
	add %i0,1,%i0
	cmp %i0,1
	bne L572
	st %o0,[%l0+16]
	ld [%l0+12],%l2
	b L573
	mov %o0,%l3
L572:
	ld [%l0+12],%o2
	ld [%o2+20],%o1
	ld [%l2+20],%o0
	cmp %o1,%o0
	bl,a L574
	ld [%l0+12],%l2
	bne,a L625
	ld [%l0+16],%o2
	ld [%o2+16],%o1
	ld [%l2+16],%o0
	cmp %o1,%o0
	bgeu,a L625
	ld [%l0+16],%o2
	ld [%l0+12],%l2
L574:
	ld [%l0+16],%o2
L625:
	ld [%l3+20],%o1
	ld [%o2+20],%o0
	cmp %o1,%o0
	bl,a L573
	ld [%l0+16],%l3
	bne,a L627
	ld [%l0+12],%o0
	ld [%l3+16],%o1
	ld [%o2+16],%o0
	cmp %o1,%o0
	bgeu,a L627
	ld [%l0+12],%o0
	ld [%l0+16],%l3
L573:
	ld [%l0+12],%o0
L627:
	call _tree_int_cst_equal,0
	ld [%l0+16],%o1
	cmp %o0,0
	be,a L569
	add %i0,1,%i0
L569:
	ld [%l0+4],%l0
	cmp %l0,0
	bne,a L628
	ld [%l0+12],%o0
	cmp %i0,0
L624:
	be L580
	mov 64,%o0
	mov %l3,%o1
	call _combine,0
	mov %l2,%o2
	mov %o0,%l6
L580:
	cmp %i0,0
	be L582
	sethi %hi(_const0_rtx),%o1
	ld [%l1+8],%o0
	ldub [%o0+12],%o0
	cmp %o0,0
	bne,a L581
	ld [%l6+20],%o0
L582:
	mov %l1,%o0
	ld [%o1+%lo(_const0_rtx)],%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	add %o7,(L595-.-4),%o7
L581:
	cmp %o0,0
	bne L585
	mov 0,%o2
	cmp %i0,3
	ble L585
	sll %i0,2,%o0
	add %o0,%i0,%o0
	sll %o0,1,%o0
	ld [%l6+16],%o1
	cmp %o1,%o0
	bgu L629
	mov %l1,%o0
	ldub [%l1+12],%o0
	cmp %o0,35
	bne,a L584
	ld [%l1+8],%o1
L585:
	mov %l1,%o0
L629:
	mov 0,%o1
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	mov %o0,%i0
	call _do_pending_stack_adjust,0
	nop
	mov %i0,%o0
	call _protect_from_queue,0
	mov 0,%o1
	mov %o0,%i0
	lduh [%i0],%o0
	cmp %o0,37
	bne L630
	cmp %o0,30
	call _copy_to_reg,0
	mov %i0,%o0
	mov %o0,%i0
	lduh [%i0],%o0
	cmp %o0,30
L630:
	be,a L631
	ldub [%l1+12],%o0
	ldub [%l1+12],%o0
	cmp %o0,35
	bne L587
	add %l4,20,%o0
	ldub [%l1+12],%o0
L631:
	cmp %o0,35
	be,a L632
	ld [%l4+20],%l0
	ld [%i0+4],%o0
	call _build_int_2,0
	mov 0,%o1
	mov %o0,%l1
	ld [%l1+8],%o0
	call _convert,0
	mov %l1,%o1
	mov %o0,%l1
	ld [%l4+20],%l0
L632:
	cmp %l0,0
	be L633
	mov %l1,%o0
L635:
	call _tree_int_cst_lt,0
	ld [%l0+12],%o1
	cmp %o0,0
	bne,a L634
	ld [%l0+4],%l0
	ld [%l0+16],%o0
	call _tree_int_cst_lt,0
	mov %l1,%o1
	cmp %o0,0
	be L633
	cmp %l0,0
	ld [%l0+4],%l0
L634:
	cmp %l0,0
	bne L635
	mov %l1,%o0
	cmp %l0,0
L633:
	be L595
	nop
	call _label_rtx,0
	ld [%l0+24],%o0
	call _emit_jump,0
	add %o7,(L583-.-4),%o7
L595:
	call _emit_jump,0
	mov %l5,%o0
	b,a L583
L587:
	call _balance_case_nodes,0
	mov 0,%o1
	ld [%l1+8],%o0
	ld [%o0+12],%o3
	srl %o3,11,%o3
	mov %i0,%o0
	ld [%l4+20],%o1
	mov %l5,%o2
	call _emit_case_nodes,0
	and %o3,1,%o3
	call _emit_jump_if_reachable,0
	mov %l5,%o0
	b,a L583
L584:
	ldub [%o1+28],%o0
	cmp %o0,6
	bne,a L636
	ld [%l1+8],%o0
	mov 64,%o0
	mov %l1,%o2
	call _build,0
	mov %l2,%o3
	mov %o0,%l1
	sethi %hi(_integer_zero_node),%o0
	ld [%o0+%lo(_integer_zero_node)],%l2
	ld [%l1+8],%o0
L636:
	ldub [%o0+28],%o0
	cmp %o0,4
	be L600
	sethi %hi(_mode_size+16),%o0
	ld [%o0+%lo(_mode_size+16)],%o0
	sll %o0,3,%o0
	call _type_for_size,0
	mov 0,%o1
	call _convert,0
	mov %l1,%o1
	mov %o0,%l1
L600:
	mov %l1,%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	mov %o0,%i0
	mov %i0,%o0
	call _protect_from_queue,0
	mov 0,%o1
	call _do_pending_stack_adjust,0
	mov %o0,%i0
	mov %l2,%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%l0
	mov %l6,%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o2
	mov %i0,%o0
	mov %l0,%o1
	mov %l7,%o3
	call _gen_casesi,0
	mov %l5,%o4
	call _emit_jump_insn,0
	nop
	ld [%l6+16],%o0
	add %o0,1,%l3
	sll %l3,2,%o2
	add %o2,106,%o0
	and %o0,-8,%o0
	sub %sp,%o0,%sp
	add %sp,96,%l1
	mov %l1,%o0
	call _memset,0
	mov 0,%o1
	ld [%l4+20],%l0
	cmp %l0,0
	be,a L637
	mov 0,%l0
	ld [%l0+12],%o0
L638:
	ld [%o0+16],%o1
	ld [%l2+16],%o0
	b L620
	sub %o1,%o0,%i0
L606:
	call _label_rtx,0
	ld [%l0+24],%o0
	mov %o0,%o2
	mov 38,%o0
	call _gen_rtx,0
	mov 4,%o1
	sll %i0,2,%o1
	st %o0,[%l1+%o1]
	add %i0,1,%i0
	ld [%l2+16],%o1
	add %i0,%o1,%o1
L620:
	ld [%l0+16],%o0
	ld [%o0+16],%o0
	cmp %o1,%o0
	ble L606
	nop
	ld [%l0+4],%l0
	cmp %l0,0
	bne,a L638
	ld [%l0+12],%o0
	mov 0,%l0
L637:
	cmp %l0,%l3
	bge L609
	sll %l0,2,%i0
L639:
	ld [%l1+%i0],%o0
	cmp %o0,0
	bne L610
	add %l0,1,%l0
	mov 38,%o0
	mov 4,%o1
	call _gen_rtx,0
	mov %l5,%o2
	st %o0,[%l1+%i0]
L610:
	cmp %l0,%l3
	bl L639
	sll %l0,2,%i0
L609:
	call _emit_label,0
	mov %l7,%o0
	mov 38,%o0
	mov 4,%o1
	call _gen_rtx,0
	mov %l7,%o2
	mov %o0,%l0
	mov %l3,%o0
	call _gen_rtvec_v,0
	mov %l1,%o1
	mov %o0,%o3
	mov 24,%o0
	mov 2,%o1
	call _gen_rtx,0
	mov %l0,%o2
	call _emit_jump_insn,0
	nop
	call _emit_barrier,0
	nop
L583:
	call _get_last_insn,0
	nop
	mov %o0,%o1
	ld [%i1+12],%o0
	call _reorder_insns,0
	ld [%l4+16],%o2
	ld [%l4+12],%o0
L621:
	cmp %o0,0
	be L613
	sethi %hi(_case_stack),%i0
	call _emit_label,0
	nop
L613:
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l1
	sethi %hi(_nesting_stack),%l2
	sethi %hi(_nesting_depth),%l0
	ld [%i0+%lo(_case_stack)],%o0
L640:
	ld [%o0+4],%o1
	st %o1,[%i0+%lo(_case_stack)]
	ld [%o0],%o1
	st %o1,[%l2+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l1
	bg L640
	ld [%i0+%lo(_case_stack)],%o0
	ret
	restore
	.align 4
	.proc	020
_do_jump_if_equal:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	lduh [%i0],%o0
	cmp %o0,30
	bne L642
	mov %i3,%o3
	lduh [%i1],%o0
	cmp %o0,30
	bne L645
	mov %i0,%o0
	ld [%i0+4],%o1
	ld [%i1+4],%o0
	cmp %o1,%o0
	bne L644
	nop
	call _emit_jump,0
	mov %i2,%o0
	b,a L644
L642:
	mov %i0,%o0
L645:
	mov %i1,%o1
	mov 0,%o2
	call _emit_cmp_insn,0
	mov 0,%o4
	call _gen_beq,0
	mov %i2,%o0
	call _emit_jump_insn,0
	nop
L644:
	ret
	restore
	.align 4
	.proc	020
_group_case_nodes:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	cmp %i0,0
	be L648
	nop
L652:
	call _label_rtx,0
	ld [%i0+24],%o0
	call _next_real_insn,0
	nop
	ld [%i0+4],%l0
	cmp %l0,0
	be L650
	mov %o0,%l1
L651:
	call _label_rtx,0
	ld [%l0+24],%o0
	call _next_real_insn,0
	nop
	cmp %o0,%l1
	bne L650
	mov 1,%o0
	call _build_int_2,0
	mov 0,%o1
	mov %o0,%o2
	mov 63,%o0
	call _combine,0
	ld [%i0+16],%o1
	mov %o0,%o1
	call _tree_int_cst_equal,0
	ld [%l0+12],%o0
	cmp %o0,0
	be,a L653
	st %l0,[%i0+4]
	ld [%l0+16],%o0
	st %o0,[%i0+16]
	ld [%l0+4],%l0
	cmp %l0,0
	bne L651
	nop
L650:
	st %l0,[%i0+4]
L653:
	orcc %l0,%g0,%i0
	bne L652
	nop
L648:
	ret
	restore
	.align 4
	.proc	020
_balance_case_nodes:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0],%l0
	cmp %l0,0
	be L655
	mov 0,%l1
	mov 0,%l3
L659:
	ld [%l0+12],%o0
	call _tree_int_cst_equal,0
	ld [%l0+16],%o1
	cmp %o0,0
	be,a L658
	add %l3,1,%l3
L658:
	ld [%l0+4],%l0
	cmp %l0,0
	bne L659
	add %l1,1,%l1
	cmp %l1,2
	ble L660
	mov %i0,%l2
	cmp %l1,3
	bne L661
	ld [%i0],%l4
	b L662
	add %l4,4,%l2
L661:
	add %l1,%l3,%l1
	add %l1,1,%l1
	srl %l1,31,%o0
	add %l1,%o0,%l1
	sra %l1,1,%l1
L663:
	ld [%l2],%o1
	ld [%o1+12],%o0
	call _tree_int_cst_equal,0
	ld [%o1+16],%o1
	cmp %o0,0
	be,a L665
	add %l1,-1,%l1
L665:
	add %l1,-1,%l1
	cmp %l1,0
	ble,a L673
	ld [%l2],%l0
	ld [%l2],%o0
	b L663
	add %o0,4,%l2
L662:
	ld [%l2],%l0
L673:
	st %l0,[%i0]
	st %g0,[%l2]
	st %i1,[%l0+8]
	st %l4,[%l0]
	mov %l0,%o0
	call _balance_case_nodes,0
	mov %l0,%o1
	add %l0,4,%o0
	call _balance_case_nodes,0
	mov %l0,%o1
	b,a L655
L660:
	ld [%i0],%l0
	b L672
	st %i1,[%l0+8]
L671:
	ld [%l0+4],%l0
L672:
	ld [%l0+4],%o0
	cmp %o0,0
	bne,a L671
	st %l0,[%o0+8]
L655:
	ret
	restore
	.align 4
	.proc	04
_node_has_low_bound:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0],%o0
	cmp %o0,0
	be L675
	mov 1,%o0
	call _build_int_2,0
	mov 0,%o1
	mov %o0,%o2
	mov 64,%o0
	call _combine,0
	ld [%i0+12],%o1
	mov %o0,%l1
	call _tree_int_cst_lt,0
	ld [%i0+12],%o1
	cmp %o0,0
	be,a L683
	mov 0,%i0
	ld [%i0+8],%l0
	cmp %l0,0
	be,a L683
	mov 0,%i0
	mov %l1,%o0
L684:
	call _tree_int_cst_equal,0
	ld [%l0+16],%o1
	cmp %o0,0
	be,a L680
	ld [%i0],%o0
	b L683
	mov 1,%i0
L680:
	cmp %o0,0
	bne,a L683
	mov 0,%i0
	ld [%l0+8],%l0
	cmp %l0,0
	bne L684
	mov %l1,%o0
L675:
	mov 0,%i0
L683:
	ret
	restore
	.align 4
	.proc	04
_node_has_high_bound:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+4],%o0
	cmp %o0,0
	bne,a L694
	mov 0,%i0
	mov 1,%o0
	call _build_int_2,0
	mov 0,%o1
	mov %o0,%o2
	mov 63,%o0
	call _combine,0
	ld [%i0+16],%o1
	mov %o0,%l1
	ld [%i0+16],%o0
	call _tree_int_cst_lt,0
	mov %l1,%o1
	cmp %o0,0
	be,a L694
	mov 0,%i0
	ld [%i0+8],%l0
	cmp %l0,0
	be,a L694
	mov 0,%i0
	mov %l1,%o0
L695:
	call _tree_int_cst_equal,0
	ld [%l0+12],%o1
	cmp %o0,0
	be,a L691
	ld [%i0+4],%o0
	b L694
	mov 1,%i0
L691:
	cmp %o0,0
	bne,a L694
	mov 0,%i0
	ld [%l0+8],%l0
	cmp %l0,0
	bne L695
	mov %l1,%o0
	mov 0,%i0
L694:
	ret
	restore
	.align 4
	.proc	04
_node_is_bounded:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0],%o0
	cmp %o0,0
	bne,a L700
	mov 0,%i0
	ld [%i0+4],%o0
	cmp %o0,0
	be L697
	mov 0,%l0
	b L700
	mov 0,%i0
L697:
	call _node_has_low_bound,0
	mov %i0,%o0
	cmp %o0,0
	be,a L700
	mov %l0,%i0
	call _node_has_high_bound,0
	mov %i0,%o0
	subcc %g0,%o0,%g0
	addx %g0,0,%l0
	mov %l0,%i0
L700:
	ret
	restore
	.align 4
	.proc	020
_emit_jump_if_reachable:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _get_last_insn,0
	nop
	lduh [%o0],%o0
	cmp %o0,16
	be L702
	nop
	call _emit_jump,0
	mov %i0,%o0
L702:
	ret
	restore
	.align 4
	.proc	020
_emit_case_nodes:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	cmp %i3,0
	be L704
	sethi %hi(_gen_bgtu),%o0
	b L763
	or %o0,%lo(_gen_bgtu),%l1
L704:
	sethi %hi(_gen_bgt),%o0
	or %o0,%lo(_gen_bgt),%l1
	cmp %i3,0
L763:
	be L706
	sethi %hi(_gen_bgeu),%o0
	b L707
	or %o0,%lo(_gen_bgeu),%l0
L706:
	sethi %hi(_gen_bge),%o0
	or %o0,%lo(_gen_bge),%l0
L707:
	cmp %i3,0
	be L708
	sethi %hi(_gen_bltu),%o0
	b L764
	or %o0,%lo(_gen_bltu),%l2
L708:
	sethi %hi(_gen_blt),%o0
	or %o0,%lo(_gen_blt),%l2
	cmp %i3,0
L764:
	be L710
	sethi %hi(_gen_bleu),%o0
	b L711
	or %o0,%lo(_gen_bleu),%l3
L710:
	sethi %hi(_gen_ble),%o0
	or %o0,%lo(_gen_ble),%l3
L711:
	ld [%i1+20],%o0
	cmp %o0,0
	be,a L755
	ld [%i1+12],%o0
	call _emit_jump_if_reachable,0
	mov %i2,%o0
	call _expand_label,0
	ld [%i1+20],%o0
	ld [%i1+12],%o0
L755:
	call _tree_int_cst_equal,0
	ld [%i1+16],%o1
	cmp %o0,0
	be L713
	mov 0,%o1
	ld [%i1+12],%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%l0
	call _label_rtx,0
	ld [%i1+24],%o0
	mov %o0,%o2
	mov %i0,%o0
	mov %l0,%o1
	call _do_jump_if_equal,0
	mov %i3,%o3
	ld [%i1+4],%o0
	cmp %o0,0
	be,a L714
	ld [%i1],%o0
	ld [%i1],%o0
	cmp %o0,0
	be L715
	mov 0,%o1
	ld [%i1+16],%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call _node_is_bounded,0
	ld [%i1+4],%o0
	cmp %o0,0
	be L716
	nop
	ld [%i1+4],%o0
	call _label_rtx,0
	ld [%o0+24],%o0
	call %l1,0
	nop
	call _emit_jump_insn,0
	nop
	call _node_is_bounded,0
	ld [%i1],%o0
	cmp %o0,0
L759:
	bne,a L756
	ld [%i1],%o0
	b L757
	mov %i0,%o0
L716:
	call _node_is_bounded,0
	ld [%i1],%o0
	cmp %o0,0
	be L720
	mov 40,%o0
	ld [%i1],%o0
	call _label_rtx,0
	ld [%o0+24],%o0
	call %l2,0
	nop
	call _emit_jump_insn,0
	nop
	b L758
	mov %i0,%o0
L720:
	mov 0,%o1
	call _build_decl,0
	mov 0,%o2
	ld [%i1+4],%o1
	st %o0,[%o1+20]
	ld [%i1+4],%o0
	call _label_rtx,0
	ld [%o0+20],%o0
	call %l1,0
	nop
	call _emit_jump_insn,0
	nop
	mov %i0,%o0
	ld [%i1],%o1
	mov %i2,%o2
	call _emit_case_nodes,0
	mov %i3,%o3
	mov %i0,%o0
L758:
	b L751
	ld [%i1+4],%o1
L715:
	ld [%i1+4],%o0
	ld [%o0+4],%o0
	cmp %o0,0
	be L723
	nop
	call _node_has_low_bound,0
	mov %i1,%o0
	cmp %o0,0
	bne L723
	mov 0,%o1
	ld [%i1+16],%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call %l2,0
	mov %i2,%o0
	call _emit_jump_insn,0
	nop
L723:
	call _node_is_bounded,0
	ld [%i1+4],%o0
	cmp %o0,0
	be L724
	mov %i0,%o0
	b L756
	ld [%i1+4],%o0
L724:
	b L751
	ld [%i1+4],%o1
L714:
	cmp %o0,0
	be L730
	nop
	call _node_is_bounded,0
	nop
	b L759
	cmp %o0,0
L713:
	ld [%i1+4],%o0
	cmp %o0,0
	be,a L731
	ld [%i1],%o0
	ld [%i1],%o0
	cmp %o0,0
	be L732
	mov 0,%o1
	ld [%i1+16],%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call _node_is_bounded,0
	ld [%i1+4],%o0
	cmp %o0,0
	be,a L733
	mov 40,%o0
	ld [%i1+4],%o0
	call _label_rtx,0
	ld [%o0+24],%o0
	b,a L753
L733:
	mov 0,%o1
	call _build_decl,0
	mov 0,%o2
	ld [%i1+4],%o1
	st %o0,[%o1+20]
	ld [%i1+4],%o0
	call _label_rtx,0
	ld [%o0+20],%o0
L753:
	call %l1,0
	nop
	call _emit_jump_insn,0
	nop
	ld [%i1+12],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call _label_rtx,0
	ld [%i1+24],%o0
	call %l0,0
	nop
	call _emit_jump_insn,0
	nop
	call _node_is_bounded,0
	ld [%i1],%o0
	cmp %o0,0
	be L735
	mov %i0,%o0
	ld [%i1],%o0
	call _label_rtx,0
	ld [%o0+24],%o0
	call _emit_jump,0
	nop
	b L760
	ld [%i1+4],%o1
L735:
	ld [%i1],%o1
	mov %i2,%o2
	call _emit_case_nodes,0
	mov %i3,%o3
	ld [%i1+4],%o1
L760:
	ld [%o1+20],%o0
	cmp %o0,0
	be L730
	mov %i0,%o0
	b L765
	mov %i2,%o2
L732:
	call _node_has_low_bound,0
	mov %i1,%o0
	cmp %o0,0
	bne,a L761
	ld [%i1+16],%o0
	ld [%i1+12],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call %l2,0
	mov %i2,%o0
	call _emit_jump_insn,0
	nop
	ld [%i1+16],%o0
L761:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call _label_rtx,0
	ld [%i1+24],%o0
	call %l3,0
	nop
	call _emit_jump_insn,0
	nop
	call _node_is_bounded,0
	ld [%i1+4],%o0
	cmp %o0,0
	be L740
	mov %i0,%o0
	b L756
	ld [%i1+4],%o0
L740:
	b L751
	ld [%i1+4],%o1
L731:
	cmp %o0,0
	be L743
	nop
	call _node_has_high_bound,0
	mov %i1,%o0
	cmp %o0,0
	bne,a L762
	ld [%i1+12],%o0
	ld [%i1+16],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call %l1,0
	mov %i2,%o0
	call _emit_jump_insn,0
	nop
	ld [%i1+12],%o0
L762:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call _label_rtx,0
	ld [%i1+24],%o0
	call %l0,0
	nop
	call _emit_jump_insn,0
	nop
	call _node_is_bounded,0
	ld [%i1],%o0
	cmp %o0,0
	be L757
	mov %i0,%o0
	ld [%i1],%o0
L756:
	call _label_rtx,0
	ld [%o0+24],%o0
	call _emit_jump,0
	add %o7,(L730-.-4),%o7
L757:
	ld [%i1],%o1
L751:
	mov %i2,%o2
L765:
	call _emit_case_nodes,0
	mov %i3,%o3
	b,a L730
L743:
	call _node_has_high_bound,0
	mov %i1,%o0
	cmp %o0,0
	bne L748
	mov 0,%o1
	ld [%i1+16],%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call %l1,0
	mov %i2,%o0
	call _emit_jump_insn,0
	nop
L748:
	call _node_has_low_bound,0
	mov %i1,%o0
	cmp %o0,0
	bne L730
	mov 0,%o1
	ld [%i1+12],%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	mov %i0,%o0
	mov 0,%o2
	mov 0,%o3
	call _emit_cmp_insn,0
	mov 0,%o4
	call _label_rtx,0
	ld [%i1+24],%o0
	call %l0,0
	nop
	call _emit_jump_insn,0
	nop
L730:
	ret
	restore
	.align 4
	.global _get_frame_size
	.proc	04
_get_frame_size:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_frame_offset),%g2
	ld [%g2+%lo(_frame_offset)],%i0
	sub %g0,%i0,%i0
	ret
	restore
	.align 4
	.global _assign_stack_local
	.proc	0110
_assign_stack_local:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov 0,%o3
	mov 1,%o0
	sethi %hi(_frame_pointer_needed),%o1
	st %o0,[%o1+%lo(_frame_pointer_needed)]
	add %i1,1,%i1
	srl %i1,31,%o0
	add %i1,%o0,%i1
	cmp %i0,26
	be L768
	and %i1,-2,%i1
	sethi %hi(_mode_size),%o0
	or %o0,%lo(_mode_size),%o0
	sll %i0,2,%o1
	ld [%o1+%o0],%o0
	sub %i1,%o0,%o3
L768:
	sethi %hi(_frame_offset),%o0
	ld [%o0+%lo(_frame_offset)],%o2
	sub %o2,%i1,%o2
	st %o2,[%o0+%lo(_frame_offset)]
	sethi %hi(_frame_pointer_rtx),%l0
	mov 30,%o0
	mov 0,%o1
	call _gen_rtx,0
	add %o3,%o2,%o2
	mov %o0,%o3
	mov 44,%o0
	mov 4,%o1
	call _gen_rtx,0
	ld [%l0+%lo(_frame_pointer_rtx)],%o2
	mov %o0,%l0
	mov %i0,%o0
	call _memory_address_p,0
	mov %l0,%o1
	cmp %o0,0
	bne L770
	mov 37,%o0
	mov 1,%o0
	sethi %hi(_invalid_stack_slot),%o1
	st %o0,[%o1+%lo(_invalid_stack_slot)]
	mov 37,%o0
L770:
	mov %i0,%o1
	call _gen_rtx,0
	mov %l0,%o2
	mov %o0,%i0
	sethi %hi(_stack_slot_list),%l0
	mov 2,%o0
	mov 0,%o1
	mov %i0,%o2
	call _gen_rtx,0
	ld [%l0+%lo(_stack_slot_list)],%o3
	st %o0,[%l0+%lo(_stack_slot_list)]
	ret
	restore
	.align 4
	.global _put_var_into_stack
	.proc	020
_put_var_into_stack:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+64],%l0
	cmp %l0,0
	be L771
	nop
	lduh [%l0],%o0
	cmp %o0,34
	bne L771
	nop
	call _parm_stack_loc,0
	mov %l0,%o0
	cmp %o0,0
	bne,a L777
	ld [%o0+4],%o0
	ldub [%l0+2],%o0
	sethi %hi(_mode_size),%o1
	or %o1,%lo(_mode_size),%o1
	sll %o0,2,%o2
	call _assign_stack_local,0
	ld [%o2+%o1],%o1
	ld [%o0+4],%o0
L777:
	st %o0,[%l0+4]
	ld [%l0],%o0
	and %o0,-17,%o0
	st %o0,[%l0]
	mov 37,%o0
	sth %o0,[%l0]
	ld [%i0+8],%o0
	ldub [%o0+12],%o0
	cmp %o0,16
	be L776
	mov 0,%o1
	add %o0,-19,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu L778
	sll %o1,3,%o1
L776:
	mov 1,%o1
	sll %o1,3,%o1
L778:
	ld [%l0],%o0
	and %o0,-9,%o0
	or %o0,%o1,%o0
	st %o0,[%l0]
	call _fixup_var_refs,0
	mov %l0,%o0
L771:
	ret
	restore
	.align 4
	.proc	020
_fixup_var_refs:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_sequence_stack),%o0
	call _get_insns,0
	ld [%o0+%lo(_sequence_stack)],%l0
	mov %o0,%o1
	mov %i0,%o0
	subcc %g0,%l0,%g0
	call _fixup_var_refs_insns,0
	subx %g0,-1,%o2
	cmp %l0,0
	be L789
	sethi %hi(_rtl_expr_chain),%o0
L783:
	call _push_to_sequence,0
	ld [%l0+4],%o0
	ld [%l0+8],%o0
	ld [%o0+8],%o2
	mov %i0,%o0
	ld [%l0+4],%o1
	subcc %g0,%o2,%g0
	call _fixup_var_refs_insns,0
	subx %g0,-1,%o2
	call _end_sequence,0
	nop
	ld [%l0+8],%o0
	ld [%o0+8],%l0
	cmp %l0,0
	bne L783
	sethi %hi(_rtl_expr_chain),%o0
L789:
	ld [%o0+%lo(_rtl_expr_chain)],%l1
	cmp %l1,0
	be L785
	sethi %hi(_const0_rtx),%l2
	ld [%l1+20],%o0
L791:
	ld [%o0+20],%l0
	ld [%l2+%lo(_const0_rtx)],%o0
	cmp %l0,%o0
	be L786
	cmp %l0,0
	be,a L790
	ld [%l1+4],%l1
	call _push_to_sequence,0
	mov %l0,%o0
	mov %i0,%o0
	mov %l0,%o1
	call _fixup_var_refs_insns,0
	mov 0,%o2
	call _end_sequence,0
	nop
L786:
	ld [%l1+4],%l1
L790:
	cmp %l1,0
	bne,a L791
	ld [%l1+20],%o0
L785:
	ret
	restore
	.align 4
	.proc	020
_fixup_var_refs_insns:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	cmp %i1,0
	be L794
	sethi %hi(65522),%o0
	or %o0,%lo(65522),%l3
	sethi %hi(_last_parm_insn),%l2
	lduh [%i1],%o0
L813:
	cmp %o0,13
	be L796
	ld [%i1+12],%l1
	add %o0,%l3,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu,a L806
	mov %l1,%i1
L796:
	cmp %i2,0
	be L807
	mov %i0,%o0
	ld [%i1+16],%o1
	lduh [%o1],%o0
	cmp %o0,25
	bne L809
	mov %i0,%o0
	ld [%o1+4],%o0
	cmp %o0,%i0
	bne L809
	mov %i0,%o0
	ld [%o1+8],%o0
	call _rtx_equal_p,0
	mov %i0,%o1
	cmp %o0,0
	be L807
	mov %i0,%o0
	call _delete_insn,0
	mov %i1,%o0
	mov %o0,%l1
	ld [%l2+%lo(_last_parm_insn)],%o0
	cmp %i1,%o0
	bne,a L810
	ld [%i1+28],%l0
	ld [%l1+8],%o0
	b L799
	st %o0,[%l2+%lo(_last_parm_insn)]
L807:
	ld [%i1+16],%o1
L809:
	call _fixup_var_refs_1,0
	mov %i1,%o2
L799:
	ld [%i1+28],%l0
L810:
	cmp %l0,0
	be,a L806
	mov %l1,%i1
	lduh [%l0],%o0
L812:
	cmp %o0,3
	be,a L811
	ld [%l0+8],%l0
	ld [%l0+4],%o0
	call _walk_fixup_memory_subreg,0
	mov %i1,%o1
	st %o0,[%l0+4]
	ld [%l0+8],%l0
L811:
	cmp %l0,0
	bne,a L812
	lduh [%l0],%o0
	mov %l1,%i1
L806:
	cmp %i1,0
	bne,a L813
	lduh [%i1],%o0
L794:
	ret
	restore
	.align 4
	.proc	0110
_fixup_var_refs_1:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	lduh [%i1],%l4
	add %l4,-25,%o1
	cmp %o1,65
	bgu L815
	mov %i0,%l6
	sethi %hi(L860),%o0
	or %o0,%lo(L860),%o0
	sll %o1,2,%o1
	ld [%o1+%o0],%o0
	jmp %o0
	nop
L860:
	.word	L835
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L863
	.word	L863
	.word	L863
	.word	L863
	.word	L863
	.word	L828
	.word	L815
	.word	L816
	.word	L863
	.word	L863
	.word	L863
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L815
	.word	L828
	.word	L828
L816:
	cmp %l6,%i1
	bne,a L878
	sethi %hi(_rtx_format),%o0
	mov %i1,%o0
	call _fixup_stack_1,0
	mov %i2,%o1
	mov %o0,%i1
	call _gen_reg_rtx,0
	ldub [%i1+2],%o0
	b L880
	mov %o0,%i0
L828:
	mov %i1,%i0
	b L874
	lduh [%i1],%o1
L879:
	lduh [%i0],%o1
L874:
	cmp %o1,35
	be,a L879
	ld [%i0+4],%i0
	sethi %hi(65447),%o0
	or %o0,%lo(65447),%o0
	add %o1,%o0,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bleu,a L879
	ld [%i0+4],%i0
	cmp %i0,%l6
	bne,a L878
	sethi %hi(_rtx_format),%o0
	mov %i1,%o0
	call _fixup_stack_1,0
	mov %i2,%o1
	mov %o0,%i1
	call _gen_reg_rtx,0
	ldub [%i1+2],%o0
	mov %o0,%i0
	lduh [%i1],%o0
	cmp %o0,35
	bne L880
	mov %i0,%o0
	mov %i1,%o0
	call _fixup_memory_subreg,0
	mov %i2,%o1
	mov %o0,%i1
	mov %i0,%o0
L880:
	call _gen_move_insn,0
	mov %i1,%o1
	call _emit_insn_before,0
	mov %i2,%o1
	b,a L872
L835:
	ld [%i1+4],%o0
	lduh [%o0],%o0
	sethi %hi(65447),%o1
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu L836
	mov %i1,%o0
	mov %i2,%o1
	call _optimize_bit_field,0
	mov 0,%o2
L836:
	ld [%i1+8],%o0
	lduh [%o0],%o0
	sethi %hi(65447),%o1
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu L837
	mov %i1,%o0
	mov %i2,%o1
	call _optimize_bit_field,0
	mov 0,%o2
L837:
	ld [%i1+4],%l0
	ld [%i1+8],%l1
	mov %l0,%l2
	mov %l1,%l3
L875:
	lduh [%l0],%o1
	sethi %hi(65501),%o0
	or %o0,%lo(65501),%o0
	add %o1,%o0,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bleu,a L875
	ld [%l0+4],%l0
	sethi %hi(65447),%o0
	or %o0,%lo(65447),%o0
	add %o1,%o0,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bleu,a L875
	ld [%l0+4],%l0
	b L881
	lduh [%l1],%o1
L882:
	lduh [%l1],%o1
L881:
	cmp %o1,35
	be,a L882
	ld [%l1+4],%l1
	sethi %hi(65447),%o0
	or %o0,%lo(65447),%o0
	add %o1,%o0,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bleu,a L882
	ld [%l1+4],%l1
	cmp %l1,%l6
	be L846
	sethi %hi(65447),%o1
	cmp %l0,%l6
	bne L878
	sethi %hi(_rtx_format),%o0
L846:
	lduh [%l2],%o0
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu,a L883
	lduh [%l3],%o0
	ld [%l2+4],%o1
	lduh [%o1],%o0
	cmp %o0,35
	bne,a L883
	lduh [%l3],%o0
	ld [%o1+4],%o0
	cmp %o0,%l6
	bne,a L883
	lduh [%l3],%o0
	mov %o1,%o0
	call _fixup_memory_subreg,0
	mov %i2,%o1
	st %o0,[%l2+4]
	lduh [%l3],%o0
L883:
	sethi %hi(65447),%o1
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu,a L884
	lduh [%l2],%o0
	ld [%l3+4],%o1
	lduh [%o1],%o0
	cmp %o0,35
	bne,a L884
	lduh [%l2],%o0
	ld [%o1+4],%o0
	cmp %o0,%l6
	bne,a L884
	lduh [%l2],%o0
	mov %o1,%o0
	call _fixup_memory_subreg,0
	mov %i2,%o1
	st %o0,[%l3+4]
	lduh [%l2],%o0
L884:
	sethi %hi(65447),%o1
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu,a L885
	lduh [%l3],%o0
	ld [%l2+4],%o1
	lduh [%o1],%o0
	cmp %o0,37
	bne,a L885
	lduh [%l3],%o0
	ldub [%o1+2],%o0
	cmp %o0,1
	be,a L885
	lduh [%l3],%o0
	call _copy_rtx,0
	mov %o1,%o0
	st %o0,[%l2+4]
	mov 1,%o1
	stb %o1,[%o0+2]
	lduh [%l3],%o0
L885:
	sethi %hi(65447),%o1
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu L886
	cmp %l0,%l6
	ld [%l3+4],%o1
	lduh [%o1],%o0
	cmp %o0,37
	bne L886
	cmp %l0,%l6
	ldub [%o1+2],%o0
	cmp %o0,1
	be L886
	cmp %l0,%l6
	call _copy_rtx,0
	mov %o1,%o0
	st %o0,[%l3+4]
	mov 1,%o1
	stb %o1,[%o0+2]
	cmp %l0,%l6
L886:
	bne,a L887
	ld [%i1+8],%o2
	ld [%i1+4],%o1
	lduh [%o1],%o0
	cmp %o0,36
	bne,a L887
	ld [%i1+8],%o2
	ld [%o1+4],%o0
	st %o0,[%i1+4]
	ld [%i1+8],%o2
L887:
	lduh [%o2],%o1
	cmp %o1,34
	be L888
	cmp %l1,%l6
	ld [%i1+4],%o0
	lduh [%o0],%o0
	cmp %o0,34
	be L853
	cmp %o1,35
	bne,a L889
	ld [%i1+4],%o1
	ld [%o2+4],%o0
	lduh [%o0],%o0
	cmp %o0,34
	be L888
	cmp %l1,%l6
	ld [%i1+4],%o1
L889:
	lduh [%o1],%o0
	cmp %o0,35
	bne L890
	cmp %l0,%l6
	ld [%o1+4],%o0
	lduh [%o0],%o0
	cmp %o0,34
	bne L890
	cmp %l0,%l6
L853:
	cmp %l1,%l6
L888:
	bne L891
	cmp %l0,%l6
	ld [%i1+8],%o1
	lduh [%o1],%o0
	cmp %o0,35
	bne L891
	cmp %l0,%l6
	mov %o1,%o0
	call _fixup_memory_subreg,0
	mov %i2,%o1
	st %o0,[%i1+8]
	cmp %l0,%l6
L891:
	bne L893
	mov %i1,%o0
	ld [%i1+4],%o1
	lduh [%o1],%o0
	cmp %o0,35
	bne L893
	mov %i1,%o0
	mov %o1,%o0
	call _fixup_memory_subreg,0
	mov %i2,%o1
	st %o0,[%i1+4]
	mov %i1,%o0
L893:
	call _fixup_stack_1,0
	mov %i2,%o1
	b L872
	mov %o0,%i0
L890:
	bne L878
	sethi %hi(_rtx_format),%o0
	ld [%i1+4],%i0
	lduh [%i0],%o0
	cmp %o0,36
	be,a L858
	ld [%i0+4],%i0
L858:
	lduh [%i0],%o0
	cmp %o0,35
	bne,a L894
	mov %i0,%o0
	mov %i0,%o0
	call _fixup_memory_subreg,0
	mov %i2,%o1
	mov %o0,%i0
	mov %i0,%o0
L894:
	call _fixup_stack_1,0
	mov %i2,%o1
	mov %o0,%l0
	call _gen_reg_rtx,0
	ldub [%i0+2],%o0
	mov %o0,%l1
	mov %l0,%o0
	call _gen_move_insn,0
	mov %l1,%o1
	call _emit_insn_after,0
	mov %i2,%o1
	st %l1,[%i1+4]
L815:
	sethi %hi(_rtx_format),%o0
L878:
	or %o0,%lo(_rtx_format),%o0
	sll %l4,2,%o1
	ld [%o1+%o0],%l5
	sethi %hi(_rtx_length),%o0
	or %o0,%lo(_rtx_length),%o0
	ld [%o1+%o0],%o0
	addcc %o0,-1,%l4
	bneg,a L872
	mov %i1,%i0
	ldsb [%l5+%l4],%o0
L897:
	cmp %o0,101
	bne L895
	cmp %o0,69
	sll %l4,2,%l0
	add %i1,%l0,%l0
	mov %l6,%o0
	ld [%l0+4],%o1
	call _fixup_var_refs_1,0
	mov %i2,%o2
	st %o0,[%l0+4]
	ldsb [%l5+%l4],%o0
	cmp %o0,69
L895:
	bne,a L896
	addcc %l4,-1,%l4
	mov 0,%l3
	sll %l4,2,%o0
	mov %o0,%l2
	add %i1,%o0,%o0
	b L877
	ld [%o0+4],%o0
L870:
	ld [%l1+4],%o1
	sll %l3,2,%l0
	add %o1,%l0,%o1
	mov %l6,%o0
	ld [%o1+4],%o1
	call _fixup_var_refs_1,0
	mov %i2,%o2
	ld [%l1+4],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	add %l3,1,%l3
	ld [%l1+4],%o0
L877:
	ld [%o0],%o0
	cmp %l3,%o0
	blu L870
	add %i1,%l2,%l1
	addcc %l4,-1,%l4
L896:
	bpos,a L897
	ldsb [%l5+%l4],%o0
L863:
	mov %i1,%i0
L872:
	ret
	restore
	.align 4
	.proc	0110
_fixup_memory_subreg:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+8],%o0
	sll %o0,2,%o3
	ld [%i0+4],%o0
	ld [%o0+4],%l2
	ldub [%o0+2],%o1
	sethi %hi(_mode_size),%o0
	or %o0,%lo(_mode_size),%o0
	sll %o1,2,%o1
	ld [%o1+%o0],%o2
	cmp %o2,4
	ble L899
	ldub [%i0+2],%l1
	mov 4,%o2
L899:
	sethi %hi(_mode_size),%o0
	or %o0,%lo(_mode_size),%o0
	sll %l1,2,%o1
	ld [%o1+%o0],%o0
	cmp %o0,4
	bg,a L900
	mov 4,%o0
L900:
	sub %o2,%o0,%o1
	mov %l2,%o0
	call _plus_constant,0
	add %o3,%o1,%o1
	mov %o0,%l2
	mov %l1,%o0
	call _memory_address_p,0
	mov %l2,%o1
	cmp %o0,0
	bne,a L901
	ld [%i0+4],%o0
	call _start_sequence,0
	nop
	mov %o0,%l0
	ld [%i0+4],%o0
	mov %l1,%o1
	call _change_address,0
	mov %l2,%o2
	call _gen_sequence,0
	mov %o0,%i0
	call _emit_insn_before,0
	mov %i1,%o1
	call _end_sequence,0
	mov %l0,%o0
	b,a L902
L901:
	mov %l1,%o1
	call _change_address,0
	mov %l2,%o2
	mov %o0,%i0
L902:
	ret
	restore
	.align 4
	.proc	0110
_walk_fixup_memory_subreg:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	cmp %i0,0
	bne,a L904
	lduh [%i0],%o1
	b L916
	mov 0,%i0
L904:
	cmp %o1,35
	bne L918
	sethi %hi(_rtx_format),%o0
	ld [%i0+4],%o0
	lduh [%o0],%o0
	cmp %o0,37
	bne L918
	sethi %hi(_rtx_format),%o0
	mov %i0,%o0
	call _fixup_memory_subreg,0
	mov %i1,%o1
	b L916
	mov %o0,%i0
L918:
	or %o0,%lo(_rtx_format),%o0
	sll %o1,2,%o1
	ld [%o1+%o0],%l5
	sethi %hi(_rtx_length),%o0
	or %o0,%lo(_rtx_length),%o0
	ld [%o1+%o0],%o0
	addcc %o0,-1,%l4
	bneg L916
	nop
	ldsb [%l5+%l4],%o0
L921:
	cmp %o0,101
	bne L919
	cmp %o0,69
	sll %l4,2,%l0
	add %i0,%l0,%l0
	ld [%l0+4],%o0
	call _walk_fixup_memory_subreg,0
	mov %i1,%o1
	st %o0,[%l0+4]
	ldsb [%l5+%l4],%o0
	cmp %o0,69
L919:
	bne,a L920
	addcc %l4,-1,%l4
	mov 0,%l3
	sll %l4,2,%o0
	mov %o0,%l2
	add %i0,%o0,%o0
	b L917
	ld [%o0+4],%o0
L914:
	ld [%l1+4],%o0
	sll %l3,2,%l0
	add %o0,%l0,%o0
	ld [%o0+4],%o0
	call _walk_fixup_memory_subreg,0
	mov %i1,%o1
	ld [%l1+4],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	add %l3,1,%l3
	ld [%l1+4],%o0
L917:
	ld [%o0],%o0
	cmp %l3,%o0
	blu L914
	add %i0,%l2,%l1
	addcc %l4,-1,%l4
L920:
	bpos,a L921
	ldsb [%l5+%l4],%o0
L916:
	ret
	restore
	.align 4
	.proc	0110
_fixup_stack_1:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	lduh [%i0],%o1
	cmp %o1,37
	bne L923
	sethi %hi(_rtx_format),%o0
	ld [%i0+4],%l1
	lduh [%l1],%o0
	cmp %o0,44
	bne L936
	sethi %hi(_frame_pointer_rtx),%o0
	ld [%l1+4],%o1
	ld [%o0+%lo(_frame_pointer_rtx)],%o0
	cmp %o1,%o0
	bne L936
	nop
	ld [%l1+8],%o0
	lduh [%o0],%o0
	cmp %o0,30
	bne L936
	nop
	ldub [%i0+2],%o0
	call _memory_address_p,0
	mov %l1,%o1
	cmp %o0,0
	bne L936
	nop
	call _gen_reg_rtx,0
	ldub [%l1+2],%o0
	mov %o0,%l0
	call _gen_move_insn,0
	mov %l1,%o1
	call _emit_insn_before,0
	mov %i1,%o1
	mov %i0,%o0
	mov 0,%o1
	call _change_address,0
	mov %l0,%o2
	b L936
	mov %o0,%i0
L923:
	or %o0,%lo(_rtx_format),%o0
	sll %o1,2,%o1
	ld [%o1+%o0],%l5
	sethi %hi(_rtx_length),%o0
	or %o0,%lo(_rtx_length),%o0
	ld [%o1+%o0],%o0
	addcc %o0,-1,%l4
	bneg L936
	nop
	ldsb [%l5+%l4],%o0
L940:
	cmp %o0,101
	bne L938
	cmp %o0,69
	sll %l4,2,%l0
	add %i0,%l0,%l0
	ld [%l0+4],%o0
	call _fixup_stack_1,0
	mov %i1,%o1
	st %o0,[%l0+4]
	ldsb [%l5+%l4],%o0
	cmp %o0,69
L938:
	bne,a L939
	addcc %l4,-1,%l4
	mov 0,%l3
	sll %l4,2,%o0
	mov %o0,%l2
	add %i0,%o0,%o0
	b L937
	ld [%o0+4],%o0
L934:
	ld [%l1+4],%o0
	sll %l3,2,%l0
	add %o0,%l0,%o0
	ld [%o0+4],%o0
	call _fixup_stack_1,0
	mov %i1,%o1
	ld [%l1+4],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	add %l3,1,%l3
	ld [%l1+4],%o0
L937:
	ld [%o0],%o0
	cmp %l3,%o0
	blu L934
	add %i0,%l2,%l1
	addcc %l4,-1,%l4
L939:
	bpos,a L940
	ldsb [%l5+%l4],%o0
L936:
	ret
	restore
	.align 4
	.proc	020
_optimize_bit_field:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+4],%o2
	lduh [%o2],%o0
	sethi %hi(65447),%o1
	or %o1,%lo(65447),%o1
	add %o0,%o1,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bgu L942
	mov %o2,%l0
	b L943
	mov 1,%l3
L942:
	ld [%i0+8],%l0
	mov 0,%l3
L943:
	ld [%l0+8],%o1
	lduh [%o1],%o0
	cmp %o0,30
	bne L944
	nop
	ld [%l0+12],%o0
	lduh [%o0],%o0
	cmp %o0,30
	bne L944
	sethi %hi(_mode_size+4),%o0
	or %o0,%lo(_mode_size+4),%o2
	ld [%o0+%lo(_mode_size+4)],%o0
	sll %o0,3,%o0
	ld [%o1+4],%o1
	cmp %o1,%o0
	be,a L977
	ld [%l0+12],%o0
	ld [%o2+4],%o0
	sll %o0,3,%o0
	cmp %o1,%o0
	bne L944
	nop
	ld [%l0+12],%o0
L977:
	ld [%l0+8],%o1
	ld [%o0+4],%o0
	call .rem,0
	ld [%o1+4],%o1
	cmp %o0,0
	bne L944
	nop
	ld [%l0+4],%o1
	lduh [%o1],%o0
	cmp %o0,37
	be L973
	mov 0,%l2
	ld [%l0+4],%o1
	lduh [%o1],%o0
	cmp %o0,34
	bne L978
	cmp %o0,35
	cmp %i2,0
	bne,a L979
	ld [%o1+4],%o0
	ld [%l0+4],%o1
	lduh [%o1],%o0
	cmp %o0,35
L978:
	bne,a L980
	ld [%l0+4],%o1
	ld [%o1+4],%o1
	lduh [%o1],%o0
	cmp %o0,37
	bne,a L980
	ld [%l0+4],%o1
L973:
	b L947
	mov %o1,%l2
L980:
	lduh [%o1],%o0
	cmp %o0,35
	bne L981
	cmp %l2,0
	cmp %i2,0
	be L981
	cmp %l2,0
	ld [%o1+4],%o1
	lduh [%o1],%o0
	cmp %o0,34
	bne L981
	cmp %l2,0
	ld [%o1+4],%o0
L979:
	sll %o0,2,%o0
	ld [%i2+%o0],%l2
L947:
	cmp %l2,0
L981:
	be L944
	nop
	call _mode_dependent_address_p,0
	ld [%l2+4],%o0
	cmp %o0,0
	bne L944
	mov 0,%o0
	ldub [%l0+2],%o1
	call _offsetable_address_p,0
	ld [%l2+4],%o2
	cmp %o0,0
	be L944
	sethi %hi(_mode_size+4),%o0
	ld [%l0+12],%o2
	or %o0,%lo(_mode_size+4),%i2
	ld [%o0+%lo(_mode_size+4)],%o1
	ld [%o2+4],%o0
	call .div,0
	sll %o1,3,%o1
	mov %o0,%l1
	ld [%l0+4],%o1
	lduh [%o1],%o0
	cmp %o0,35
	bne,a L982
	ld [%l0+8],%o1
	ld [%o1+8],%o0
	sll %o0,2,%o0
	add %l1,%o0,%l1
	ldub [%o1+2],%o0
	add %i2,-4,%o1
	sll %o0,2,%o0
	ld [%o0+%o1],%o2
	cmp %o2,4
	bg,a L955
	mov 4,%o2
L955:
	ldub [%l2+2],%o1
	sethi %hi(_mode_size),%o0
	or %o0,%lo(_mode_size),%o0
	sll %o1,2,%o1
	ld [%o1+%o0],%o0
	cmp %o0,4
	bg,a L956
	mov 4,%o0
L956:
	sub %o2,%o0,%o0
	sub %l1,%o0,%l1
	ld [%l0+8],%o1
L982:
	sethi %hi(_mode_size+4),%o0
	ld [%o0+%lo(_mode_size+4)],%o0
	sll %o0,3,%o0
	ld [%o1+4],%o1
	cmp %o1,%o0
	bne L957
	mov 2,%o1
	mov 1,%o1
L957:
	mov 37,%o0
	call _gen_rtx,0
	ld [%l2+4],%o2
	cmp %l3,0
	be L959
	mov %o0,%l2
	call _adj_offsetable_operand,0
	mov %l1,%o1
	st %o0,[%i0+4]
	ld [%i0+8],%o2
	lduh [%o2],%o1
	sethi %hi(65498),%o0
	or %o0,%lo(65498),%o0
	add %o1,%o0,%o0
	sll %o0,16,%o0
	srl %o0,16,%o0
	cmp %o0,1
	bleu L960
	mov %o1,%o0
	cmp %o0,30
	be L960
	cmp %o0,32
	be,a L983
	ld [%i0+8],%o0
	b L984
	cmp %o0,35
L963:
	lduh [%o2],%o0
	cmp %o0,35
L984:
	bne,a L985
	ldub [%o2+2],%o1
	ld [%o2+8],%o0
	cmp %o0,0
	be,a L963
	ld [%o2+4],%o2
	ldub [%o2+2],%o1
L985:
	ldub [%l2+2],%o0
	cmp %o1,%o0
	be,a L967
	st %o2,[%i0+8]
	call _gen_lowpart,0
	ld [%i0+8],%o1
	mov %o0,%o2
	b L967
	st %o2,[%i0+8]
L960:
	ld [%i0+8],%o0
L983:
	ldub [%o0+2],%o1
	cmp %o1,0
	be L986
	mov -1,%o0
	ldub [%l2+2],%o0
	cmp %o1,%o0
	be L986
	mov -1,%o0
	call _abort,0
	nop
L959:
	ld [%i0+4],%l0
L970:
	lduh [%l0],%o0
	cmp %o0,35
	bne,a L987
	st %l0,[%i0+4]
	ld [%l0+8],%o0
	cmp %o0,0
	be,a L970
	ld [%l0+4],%l0
	st %l0,[%i0+4]
L987:
	mov %l2,%o0
	call _adj_offsetable_operand,0
	mov %l1,%o1
	mov %o0,%l2
	ldub [%l0+2],%o1
	ldub [%l2+2],%o0
	cmp %o1,%o0
	bne L971
	nop
	b L967
	st %l2,[%i0+8]
L971:
	call _get_last_insn,0
	nop
	mov %o0,%l1
	call _gen_reg_rtx,0
	ldub [%l0+2],%o0
	mov %o0,%l0
	ld [%i0+8],%o0
	lduh [%o0],%o2
	xor %o2,90,%o2
	mov %l0,%o0
	mov %l2,%o1
	subcc %g0,%o2,%g0
	call _convert_move,0
	subx %g0,-1,%o2
	call _get_last_insn,0
	nop
	mov %o0,%o1
	ld [%l1+12],%o0
	call _reorder_insns,0
	ld [%i1+8],%o2
	st %l0,[%i0+8]
L967:
	mov -1,%o0
L986:
	st %o0,[%i1+20]
L944:
	ret
	restore
	.align 4
	.global _max_parm_reg_num
	.proc	04
_max_parm_reg_num:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_max_parm_reg),%g2
	ld [%g2+%lo(_max_parm_reg)],%i0
	ret
	restore
	.align 4
	.global _get_first_nonparm_insn
	.proc	0110
_get_first_nonparm_insn:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_parm_insn),%o0
	ld [%o0+%lo(_last_parm_insn)],%o0
	cmp %o0,0
	bne L990
	sethi %hi(_last_parm_insn),%o0
	call _get_insns,0
	nop
	b L991
	mov %o0,%i0
L990:
	ld [%o0+%lo(_last_parm_insn)],%o0
	ld [%o0+12],%i0
L991:
	ret
	restore
	.align 4
	.proc	0110
_parm_stack_loc:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_max_parm_reg),%g2
	ld [%i0+4],%g3
	ld [%g2+%lo(_max_parm_reg)],%g2
	cmp %g3,%g2
	bl,a L993
	ld [%i0+4],%g2
	b L994
	mov 0,%i0
L993:
	sethi %hi(_parm_reg_stack_loc),%g3
	ld [%g3+%lo(_parm_reg_stack_loc)],%g3
	sll %g2,2,%g2
	ld [%g3+%g2],%i0
L994:
	ret
	restore
	.align 8
LC13:
	.ascii "__builtin_va_alist\0"
	.align 4
	.proc	020
_assign_parms:
	!#PROLOGUE# 0
	save %sp,-144,%sp
	!#PROLOGUE# 1
	st %i0,[%fp-36]
	ld [%i0+8],%l0
	call _list_length,0
	ld [%i0+52],%o0
	add %o0,56,%i5
	st %g0,[%fp-44]
	ld [%i0+52],%o0
	cmp %o0,0
	be,a L1114
	ld [%l0+16],%o0
	ld [%o0+36],%o0
	cmp %o0,0
	be,a L1114
	ld [%l0+16],%o0
	ld [%o0+20],%o0
	sethi %hi(LC13),%o1
	call _strcmp,0
	or %o1,%lo(LC13),%o1
	cmp %o0,0
	be L1115
	mov 1,%o4
	ld [%l0+16],%o0
L1114:
	cmp %o0,0
	be,a L1116
	st %g0,[%fp-24]
	call _tree_last,0
	nop
	sethi %hi(_void_type_node),%o1
	ld [%o0+20],%o2
	ld [%o1+%lo(_void_type_node)],%o0
	cmp %o2,%o0
	be L996
	mov 1,%o4
L1115:
	st %o4,[%fp-44]
L996:
	st %g0,[%fp-24]
L1116:
	st %g0,[%fp-20]
	ld [%fp-36],%o4
	ld [%o4+56],%o0
	ld [%o0+28],%o0
	cmp %o0,26
	bne L999
	sethi %hi(_parm_reg_stack_loc),%l1
	sethi %hi(_struct_value_incoming_rtx),%o0
	ld [%o0+%lo(_struct_value_incoming_rtx)],%o0
	lduh [%o0],%o0
	cmp %o0,37
	bne L1117
	sll %i5,2,%l0
	sethi %hi(_mode_size+16),%o0
	ld [%o0+%lo(_mode_size+16)],%o0
	st %o0,[%fp-24]
L999:
	sll %i5,2,%l0
L1117:
	call _oballoc,0
	mov %l0,%o0
	st %o0,[%l1+%lo(_parm_reg_stack_loc)]
	mov 0,%o1
	call _memset,0
	mov %l0,%o2
	ld [%fp-36],%o4
	ld [%o4+52],%l6
	cmp %l6,0
	be L1001
	mov 0,%i0
	sethi %hi(_target_flags),%i2
	sethi %hi(_mode_size),%o0
	or %o0,%lo(_mode_size),%i3
	ld [%l6+8],%o0
L1139:
	ldub [%o0+12],%o0
	cmp %o0,16
	be L1004
	mov 0,%i4
	add %o0,-19,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu L1118
	mov -1,%o0
L1004:
	mov 1,%i4
	mov -1,%o0
L1118:
	st %o0,[%l6+44]
	sethi %hi(_error_mark_node),%o0
	ld [%l6+8],%o1
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	be L1006
	sethi %hi(_const0_rtx),%o2
	ldub [%l6+12],%o0
	cmp %o0,44
	bne L1119
	mov 37,%o0
	ld [%l6+52],%o0
	cmp %o0,0
	bne,a L1005
	ldub [%o0+28],%l7
L1006:
	mov 37,%o0
L1119:
	mov 26,%o1
	call _gen_rtx,0
	ld [%o2+%lo(_const0_rtx)],%o2
	st %o0,[%l6+64]
	ld [%l6+12],%o0
	or %o0,256,%o0
	b L1002
	st %o0,[%l6+12]
L1005:
	ld [%l6+8],%o0
	ldub [%o0+28],%i1
	ld [%fp-24],%o1
	st %o1,[%fp-32]
	ld [%fp-20],%o0
	st %o0,[%fp-28]
	add %o1,8,%o1
	cmp %l7,26
	bne L1009
	st %o1,[%fp-32]
	call _size_in_bytes,0
	ld [%l6+52],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	lduh [%o0],%o0
	cmp %o0,30
	bne L1008
	mov 1,%l3
	call _size_in_bytes,0
	ld [%l6+52],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	ld [%o0+4],%o1
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1011
	cmp %o1,1
	ble L1008
	mov 2,%l3
	b L1008
	mov 1,%l3
L1011:
	cmp %o1,3
	ble L1008
	mov 2,%l3
	b L1008
	mov 1,%l3
L1009:
	sll %l7,2,%o0
	ld [%o0+%i3],%o0
	sll %o0,3,%o1
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1013
	cmp %o1,15
	ble L1008
	mov 2,%l3
	b L1008
	mov 1,%l3
L1013:
	cmp %o1,31
	bg L1008
	mov 1,%l3
	mov 2,%l3
L1008:
	cmp %l3,2
	bne L1120
	ld [%fp-28],%o0
	cmp %l7,26
	be L1016
	sll %l7,2,%o0
	ld [%o0+%i3],%o0
	sll %o0,3,%o1
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1018
	andcc %o1,15,%g0
	bne L1121
	sll %l7,2,%o0
	b L1120
	ld [%fp-28],%o0
L1018:
	andcc %o1,31,%g0
	be L1015
	sll %l7,2,%o0
L1121:
	ld [%o0+%i3],%o0
	sll %o0,3,%o1
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be,a L1141
	add %o1,31,%o1
	add %o1,15,%o1
L1141:
	be L1022
	cmp %o1,0
	bl,a L1024
	add %o1,15,%o1
L1024:
	b L1023
	sra %o1,4,%o1
L1022:
	bl,a L1025
	add %o1,31,%o1
L1025:
	sra %o1,5,%o1
L1023:
	sll %l7,2,%o0
	ld [%o0+%i3],%o2
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1026
	ld [%fp-32],%o3
	b L1108
	sll %o1,1,%o0
L1026:
	sll %o1,2,%o0
L1108:
	sub %o0,%o2,%o0
	add %o3,%o0,%o0
	b L1015
	st %o0,[%fp-32]
L1016:
	call _size_in_bytes,0
	ld [%l6+52],%o0
	mov %o0,%l0
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1029
	mov 32,%o2
	mov 16,%o2
L1029:
	mov %l0,%o0
	call _convert_units,0
	mov 8,%o1
	mov %o0,%o2
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1031
	mov 32,%o1
	mov 16,%o1
L1031:
	mov %o2,%o0
	call _convert_units,0
	mov 8,%o2
	mov %o0,%o2
	ldub [%o2+12],%o0
	cmp %o0,35
	bne L1033
	ld [%fp-28],%o0
	ld [%fp-32],%o0
	ld [%o2+16],%o1
	add %o0,%o1,%o0
	b L1034
	st %o0,[%fp-32]
L1033:
	cmp %o0,0
	bne L1035
	mov 63,%o0
	b L1034
	st %o2,[%fp-28]
L1035:
	call _genop,0
	ld [%fp-28],%o1
	st %o0,[%fp-28]
L1034:
	mov %l0,%o2
	ldub [%o2+12],%o0
	cmp %o0,35
	bne L1037
	ld [%fp-28],%o0
	ld [%fp-32],%o0
	ld [%o2+16],%o1
	sub %o0,%o1,%o0
	b L1015
	st %o0,[%fp-32]
L1037:
	cmp %o0,0
	bne L1039
	mov 64,%o0
	sethi %hi(_integer_zero_node),%o1
	call _genop,0
	ld [%o1+%lo(_integer_zero_node)],%o1
	b L1015
	st %o0,[%fp-28]
L1039:
	call _genop,0
	ld [%fp-28],%o1
	st %o0,[%fp-28]
L1015:
	ld [%fp-28],%o0
L1120:
	cmp %o0,0
	bne,a L1041
	ld [%fp-28],%o0
	mov 30,%o0
	mov 0,%o1
	call _gen_rtx,0
	ld [%fp-32],%o2
	b L1122
	mov %o0,%l2
L1041:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _plus_constant,0
	ld [%fp-32],%o1
	mov %o0,%l2
L1122:
	sethi %hi(_arg_pointer_rtx),%o2
	mov 44,%o0
	mov 4,%o1
	ld [%o2+%lo(_arg_pointer_rtx)],%o2
	call _gen_rtx,0
	mov %l2,%o3
	mov %o0,%o1
	call _memory_address,0
	mov %l7,%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	mov %l7,%o1
	mov %o0,%l4
	sll %i4,3,%o1
	ld [%l4],%o0
	and %o0,-9,%o0
	or %o0,%o1,%o0
	st %o0,[%l4]
	ld [%l6+8],%o0
	ld [%o0+24],%o0
	ldub [%o0+12],%o0
	cmp %o0,35
	be L1044
	mov 0,%l5
	ld [%fp-28],%o0
	cmp %o0,0
	be L1123
	ld [%i2+%lo(_target_flags)],%o0
L1044:
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,16,%g0
	be L1045
	cmp %i0,7
	bg,a L1123
	mov 0,%l5
	cmp %i0,0
	bge L1047
	mov %i0,%o2
	add %i0,3,%o2
L1047:
	mov 34,%o0
	mov %l7,%o1
	call _gen_rtx,0
	sra %o2,2,%o2
	b L1043
	mov %o0,%l5
L1045:
	mov 0,%l5
L1043:
	ld [%i2+%lo(_target_flags)],%o0
L1123:
	andcc %o0,16,%g0
	be L1048
	cmp %i0,7
	bg L1049
	mov 0,%o2
	cmp %l7,26
	bne L1050
	sll %l7,2,%o0
	call _int_size_in_bytes,0
	ld [%l6+52],%o0
	add %i0,%o0,%o0
	cmp %o0,8
	bg L1124
	cmp %i0,0
	b L1049
	mov 0,%o2
L1050:
	ld [%o0+%i3],%o0
	add %i0,%o0,%o0
	cmp %o0,8
	ble L1048
	cmp %i0,0
L1124:
	bge L1052
	mov %i0,%o1
	add %i0,3,%o1
L1052:
	sra %o1,2,%o1
	mov 2,%o0
	b L1049
	sub %o0,%o1,%o2
L1048:
	mov 0,%o2
L1049:
	ld [%l6+4],%o0
	cmp %o0,0
	bne L1125
	cmp %o2,0
	ld [%fp-44],%o4
	cmp %o4,0
	be L1053
	cmp %l5,0
	be L1125
	cmp %o2,0
	ldub [%l5+2],%o0
	cmp %o0,26
	bne L1054
	sll %o0,2,%o0
	b L1113
	ld [%o0+%i3],%o2
L1054:
	call _int_size_in_bytes,0
	ld [%l6+52],%o0
	mov %o0,%o2
L1113:
	cmp %o2,0
	bl,a L1057
	add %o2,3,%o2
L1057:
	sra %o2,2,%o2
L1053:
	cmp %o2,0
L1125:
	ble L1058
	sethi %hi(_current_function_pretend_args_size),%o3
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1059
	sll %o2,2,%o1
	b L1144
	add %o1,1,%o1
L1059:
	add %o1,3,%o1
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
L1144:
	be L1061
	srl %o1,31,%o0
	add %o0,%o1,%o1
	b L1062
	sra %o1,1,%o1
L1061:
	cmp %o1,0
	bl,a L1063
	add %o1,3,%o1
L1063:
	sra %o1,2,%o1
L1062:
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	bne L1065
	sll %o1,1,%o0
	sll %o1,2,%o0
L1065:
	addcc %o2,-1,%l1
	bneg L1067
	st %o0,[%o3+%lo(_current_function_pretend_args_size)]
	mov %l1,%o0
L1126:
	sethi %hi(_mode_size+16),%o4
	call .umul,0
	ld [%o4+%lo(_mode_size+16)],%o1
	mov %o0,%o1
	call _plus_constant,0
	ld [%l4+4],%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	mov 4,%o1
	mov %o0,%l0
	ld [%l5+4],%o2
	mov 34,%o0
	mov 4,%o1
	call _gen_rtx,0
	add %l1,%o2,%o2
	mov %o0,%o1
	call _emit_move_insn,0
	mov %l0,%o0
	addcc %l1,-1,%l1
	bpos,a L1126
	mov %l1,%o0
L1067:
	mov %l4,%l5
L1058:
	cmp %l5,0
	be,a L1069
	mov %l4,%l5
L1069:
	cmp %l5,%l4
	bne L1127
	ld [%fp-32],%o0
	sll %o0,3,%o0
	st %o0,[%l6+44]
	cmp %l5,%l4
L1127:
	bne,a L1081
	mov 0,%l4
	call _size_in_bytes,0
	ld [%l6+52],%o0
	cmp %l3,0
	be L1072
	mov %o0,%o2
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1073
	mov 32,%o3
	mov 16,%o3
L1073:
	mov %o2,%o0
	mov 8,%o1
	call _convert_units,0
	mov %o3,%o2
	mov %o0,%o2
	ld [%i2+%lo(_target_flags)],%o0
	andcc %o0,32,%g0
	be L1075
	mov 32,%o1
	mov 16,%o1
L1075:
	mov %o2,%o0
	call _convert_units,0
	mov 8,%o2
	mov %o0,%o2
L1072:
	ldub [%o2+12],%o0
	cmp %o0,35
	bne L1077
	ld [%fp-20],%o0
	ld [%fp-24],%o0
	ld [%o2+16],%o1
	add %o0,%o1,%o0
	b L1081
	st %o0,[%fp-24]
L1077:
	cmp %o0,0
	bne L1079
	mov 63,%o0
	b L1081
	st %o2,[%fp-20]
L1079:
	call _genop,0
	ld [%fp-20],%o1
	st %o0,[%fp-20]
L1081:
	cmp %i1,26
	be L1082
	cmp %i1,%l7
	be L1082
	cmp %l4,0
	be L1082
	sll %i1,2,%o0
	ld [%o0+%i3],%o1
	cmp %o1,3
	bg L1128
	sethi %hi(_arg_pointer_rtx),%o2
	sll %l7,2,%o0
	ld [%o0+%i3],%o0
	sub %o0,%o1,%o0
	ld [%fp-32],%o1
	add %o0,%o1,%o2
	st %o2,[%fp-32]
	ld [%fp-28],%o0
	cmp %o0,0
	bne,a L1084
	mov 0,%o1
	mov 30,%o0
	call _gen_rtx,0
	mov 0,%o1
	b L1129
	mov %o0,%l2
L1084:
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _plus_constant,0
	ld [%fp-32],%o1
	mov %o0,%l2
L1129:
	sethi %hi(_arg_pointer_rtx),%o2
L1128:
	mov 44,%o0
	mov 4,%o1
	ld [%o2+%lo(_arg_pointer_rtx)],%o2
	call _gen_rtx,0
	mov %l2,%o3
	mov %o0,%o1
	call _memory_address,0
	mov %i1,%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	mov %i1,%o1
	mov %o0,%l4
	sll %i4,3,%o1
	ld [%l4],%o0
	and %o0,-9,%o0
	or %o0,%o1,%o0
	st %o0,[%l4]
L1082:
	cmp %i1,26
	bne L1086
	sethi %hi(_obey_regdecls),%o0
	lduh [%l5],%o0
	cmp %o0,34
	bne,a L1090
	st %l4,[%l6+64]
	cmp %l4,0
	bne L1088
	nop
	ldub [%l5+2],%l0
	call _int_size_in_bytes,0
	ld [%l6+8],%o0
	mov %o0,%o1
	call _assign_stack_local,0
	mov %l0,%o0
	mov %o0,%l4
L1088:
	call _int_size_in_bytes,0
	ld [%l6+8],%o0
	orcc %o0,%g0,%o2
	bl,a L1089
	add %o2,3,%o2
L1089:
	ld [%l5+4],%o0
	mov %l4,%o1
	call _move_block_from_reg,0
	sra %o2,2,%o2
	b L1090
	st %l4,[%l6+64]
L1086:
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L1092
	sethi %hi(8192),%o0
	ld [%l6+12],%o1
	andcc %o1,%o0,%g0
	bne L1130
	sethi %hi(1064960),%o0
	ld [%fp-36],%o4
	ld [%o4+12],%o0
	andcc %o0,512,%g0
	be L1131
	cmp %l7,%i1
L1092:
	ld [%l6+12],%o1
	sethi %hi(1064960),%o0
L1130:
	andcc %o1,%o0,%g0
	bne L1131
	cmp %l7,%i1
	sethi %hi(_flag_float_store),%o0
	ld [%o0+%lo(_flag_float_store)],%o0
	cmp %o0,0
	be L1093
	nop
	ld [%l6+8],%o0
	ldub [%o0+12],%o0
	cmp %o0,6
	be L1131
	cmp %l7,%i1
L1093:
	call _gen_reg_rtx,0
	mov %i1,%o0
	mov %o0,%l3
	ld [%l3],%o0
	or %o0,16,%o0
	st %o0,[%l3]
	st %l3,[%l6+64]
	ldub [%l3+2],%o1
	ldub [%l5+2],%o0
	cmp %o1,%o0
	be L1094
	mov %l3,%o0
	mov %l5,%o1
	call _convert_move,0
	mov 0,%o2
	b L1132
	ld [%l3+4],%o0
L1094:
	call _emit_move_insn,0
	mov %l5,%o1
	ld [%l3+4],%o0
L1132:
	cmp %o0,%i5
	bl,a L1133
	ld [%l3+4],%o0
	add %o0,5,%i5
	sll %i5,2,%l0
	call _oballoc,0
	mov %l0,%o0
	mov %o0,%l2
	sethi %hi(_parm_reg_stack_loc),%l1
	ld [%l1+%lo(_parm_reg_stack_loc)],%o1
	call _memcpy,0
	mov %l0,%o2
	st %l2,[%l1+%lo(_parm_reg_stack_loc)]
	ld [%l3+4],%o0
L1133:
	sethi %hi(_parm_reg_stack_loc),%o1
	ld [%o1+%lo(_parm_reg_stack_loc)],%o1
	sll %o0,2,%o0
	cmp %i1,%l7
	bne L1097
	st %l4,[%o1+%o0]
	lduh [%l5],%o0
	cmp %o0,37
	bne,a L1134
	ld [%l6+8],%o0
	ld [%fp-28],%o0
	cmp %o0,0
	bne,a L1134
	ld [%l6+8],%o0
	call _get_last_insn,0
	nop
	call _get_last_insn,0
	mov %o0,%l0
	mov %o0,%o3
	mov 2,%o0
	mov 3,%o1
	mov %l5,%o2
	call _gen_rtx,0
	ld [%o3+28],%o3
	st %o0,[%l0+28]
L1097:
	ld [%l6+8],%o0
L1134:
	ldub [%o0+12],%o0
	cmp %o0,11
	bne,a L1135
	ld [%l6+12],%o1
	call _mark_reg_pointer,0
	mov %l3,%o0
	b L1135
	ld [%l6+12],%o1
L1131:
	be L1100
	mov %i1,%o0
	mov %l5,%o1
	call _convert_to_mode,0
	mov 0,%o2
	mov %o0,%l5
L1100:
	cmp %l5,%l4
	be L1101
	cmp %l4,0
	bne L1136
	mov %l4,%o0
	ldub [%l5+2],%o0
	sll %o0,2,%o1
	call _assign_stack_local,0
	ld [%o1+%i3],%o1
	mov %o0,%l4
	mov %l4,%o0
L1136:
	call _emit_move_insn,0
	mov %l5,%o1
L1101:
	st %l4,[%l6+64]
	mov 1,%o0
	sethi %hi(_frame_pointer_needed),%o1
	st %o0,[%o1+%lo(_frame_pointer_needed)]
L1090:
	ld [%l6+12],%o1
L1135:
	sethi %hi(1048576),%o0
	andcc %o1,%o0,%g0
	be,a L1137
	ld [%l6+12],%o1
	ld [%l6+64],%o1
	ld [%o1],%o0
	or %o0,16,%o0
	st %o0,[%o1]
	ld [%l6+12],%o1
L1137:
	sethi %hi(262144),%o0
	andcc %o1,%o0,%g0
	be L1138
	cmp %l7,26
	ld [%l6+64],%o1
	ld [%o1],%o0
	or %o0,32,%o0
	st %o0,[%o1]
L1138:
	be L1105
	sll %l7,2,%o0
	b L1112
	ld [%o0+%i3],%o0
L1105:
	call _int_size_in_bytes,0
	ld [%l6+52],%o0
L1112:
	add %o0,3,%o0
	and %o0,-4,%o0
	add %i0,%o0,%i0
L1002:
	ld [%l6+4],%l6
	cmp %l6,0
	bne,a L1139
	ld [%l6+8],%o0
L1001:
	call _max_reg_num,0
	nop
	sethi %hi(_max_parm_reg),%o1
	call _get_last_insn,0
	st %o0,[%o1+%lo(_max_parm_reg)]
	sethi %hi(_last_parm_insn),%o1
	st %o0,[%o1+%lo(_last_parm_insn)]
	ld [%fp-24],%o0
	sethi %hi(_current_function_args_size),%o1
	st %o0,[%o1+%lo(_current_function_args_size)]
	ret
	restore
	.align 4
	.global _get_structure_value_addr
	.proc	0110
_get_structure_value_addr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	lduh [%i0],%o0
	cmp %o0,30
	be,a L1146
	ld [%i0+4],%o0
	call _abort,0
	nop
L1146:
	add %o0,1,%o0
	srl %o0,31,%o1
	add %o0,%o1,%o0
	and %o0,-2,%o1
	sethi %hi(_max_structure_value_size),%o2
	ld [%o2+%lo(_max_structure_value_size)],%o0
	cmp %o1,%o0
	ble L1149
	sethi %hi(_structure_value),%o0
	st %o1,[%o2+%lo(_max_structure_value_size)]
	call _assign_stack_local,0
	mov 26,%o0
	mov %o0,%o1
	sethi %hi(_structure_value),%o2
	st %o1,[%o2+%lo(_structure_value)]
	lduh [%o1],%o0
	cmp %o0,37
	bne L1149
	sethi %hi(_structure_value),%o0
	ld [%o1+4],%o0
	st %o0,[%o2+%lo(_structure_value)]
	sethi %hi(_structure_value),%o0
L1149:
	ld [%o0+%lo(_structure_value)],%i0
	ret
	restore
	.align 8
LC14:
	.ascii "`%s' may be used uninitialized in this function\0"
	.align 8
LC15:
	.ascii "variable `%s' may be clobbered by `longjmp'\0"
	.align 4
	.global _uninitialized_vars_warning
	.proc	020
_uninitialized_vars_warning:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+28],%l0
	cmp %l0,0
	be,a L1161
	ld [%i0+24],%i0
	sethi %hi(LC14),%l1
	ldub [%l0+12],%o0
L1165:
	cmp %o0,43
	bne,a L1164
	ld [%l0+4],%l0
	ld [%l0+8],%o0
	ldub [%o0+12],%o1
	add %o1,-19,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bleu L1154
	cmp %o1,16
	be,a L1163
	ldub [%l0+12],%o0
	ld [%l0+64],%o1
	lduh [%o1],%o0
	cmp %o0,34
	bne,a L1163
	ldub [%l0+12],%o0
	call _regno_uninitialized,0
	ld [%o1+4],%o0
	cmp %o0,0
	be L1154
	mov %l0,%o0
	call _warning_with_decl,0
	or %l1,%lo(LC14),%o1
L1154:
	ldub [%l0+12],%o0
L1163:
	cmp %o0,43
	bne,a L1164
	ld [%l0+4],%l0
	ld [%l0+64],%o1
	lduh [%o1],%o0
	cmp %o0,34
	bne,a L1164
	ld [%l0+4],%l0
	call _regno_clobbered_at_setjmp,0
	ld [%o1+4],%o0
	cmp %o0,0
	be L1153
	mov %l0,%o0
	sethi %hi(LC15),%o1
	call _warning_with_decl,0
	or %o1,%lo(LC15),%o1
L1153:
	ld [%l0+4],%l0
L1164:
	cmp %l0,0
	bne,a L1165
	ldub [%l0+12],%o0
	ld [%i0+24],%i0
L1161:
	cmp %i0,0
	be L1158
	nop
L1160:
	call _uninitialized_vars_warning,0
	mov %i0,%o0
	ld [%i0+4],%i0
	cmp %i0,0
	bne L1160
	nop
L1158:
	ret
	restore
	.align 4
	.global _setjmp_protect
	.proc	020
_setjmp_protect:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+28],%l0
	cmp %l0,0
	be,a L1176
	ld [%i0+24],%i0
	sethi %hi(8192),%l1
	ldub [%l0+12],%o0
L1178:
	add %o0,-43,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu,a L1177
	ld [%l0+4],%l0
	ld [%l0+64],%o0
	cmp %o0,0
	be,a L1177
	ld [%l0+4],%l0
	lduh [%o0],%o0
	cmp %o0,34
	bne,a L1177
	ld [%l0+4],%l0
	ld [%l0+12],%o0
	andcc %o0,%l1,%g0
	bne,a L1177
	ld [%l0+4],%l0
	call _put_var_into_stack,0
	mov %l0,%o0
	ld [%l0+4],%l0
L1177:
	cmp %l0,0
	bne,a L1178
	ldub [%l0+12],%o0
	ld [%i0+24],%i0
L1176:
	cmp %i0,0
	be L1173
	nop
L1175:
	call _setjmp_protect,0
	mov %i0,%o0
	ld [%i0+4],%i0
	cmp %i0,0
	bne L1175
	nop
L1173:
	ret
	restore
	.align 4
	.global _expand_function_start
	.proc	020
_expand_function_start:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_this_function),%o0
	st %i0,[%o0+%lo(_this_function)]
	sethi %hi(_optimize),%o0
	ld [%o0+%lo(_optimize)],%o0
	subcc %g0,%o0,%g0
	subx %g0,-1,%o0
	sethi %hi(_cse_not_expected),%o1
	st %o0,[%o1+%lo(_cse_not_expected)]
	sethi %hi(_flag_omit_frame_pointer),%o0
	ld [%o0+%lo(_flag_omit_frame_pointer)],%o0
	subcc %g0,%o0,%g0
	subx %g0,-1,%o0
	sethi %hi(_frame_pointer_needed),%o1
	st %o0,[%o1+%lo(_frame_pointer_needed)]
	sethi %hi(_goto_fixup_chain),%o0
	st %g0,[%o0+%lo(_goto_fixup_chain)]
	sethi %hi(_stack_slot_list),%o0
	st %g0,[%o0+%lo(_stack_slot_list)]
	sethi %hi(_invalid_stack_slot),%o0
	st %g0,[%o0+%lo(_invalid_stack_slot)]
	sethi %hi(_write_symbols),%o0
	call _init_emit,0
	ld [%o0+%lo(_write_symbols)],%o0
	call _init_expr,0
	mov 0,%l0
	call _init_const_rtx_hash_table,0
	nop
	sethi %hi(_current_function_pops_args),%o0
	or %o0,%lo(_current_function_pops_args),%l1
	sethi %hi(_target_flags),%o0
	ld [%o0+%lo(_target_flags)],%o0
	andcc %o0,8,%g0
	be,a L1201
	st %l0,[%l1]
	ld [%i0+8],%o1
	ldub [%o1+12],%o0
	cmp %o0,1
	be,a L1201
	st %l0,[%l1]
	ld [%o1+16],%o0
	cmp %o0,0
	be,a L1180
	mov 1,%l0
	call _tree_last,0
	nop
	sethi %hi(_void_type_node),%o1
	ld [%o0+20],%o2
	ld [%o1+%lo(_void_type_node)],%o0
	cmp %o2,%o0
	bne,a L1201
	st %l0,[%l1]
	mov 1,%l0
L1180:
	st %l0,[%l1]
L1201:
	ld [%i0+36],%o0
	ld [%o0+20],%o0
	sethi %hi(_current_function_name),%o1
	st %o0,[%o1+%lo(_current_function_name)]
	sethi %hi(_current_function_needs_context),%o0
	or %o0,%lo(_current_function_needs_context),%o2
	sethi %hi(_current_function_decl),%o0
	ld [%o0+%lo(_current_function_decl)],%o0
	ld [%o0+40],%o0
	cmp %o0,0
	be L1182
	mov 0,%o1
	ldub [%o0+12],%o0
	xor %o0,28,%o0
	subcc %g0,%o0,%g0
	subx %g0,-1,%o1
L1182:
	st %o1,[%o2]
	sethi %hi(_current_function_calls_setjmp),%o0
	st %g0,[%o0+%lo(_current_function_calls_setjmp)]
	sethi %hi(_current_function_returns_pcc_struct),%o0
	st %g0,[%o0+%lo(_current_function_returns_pcc_struct)]
	sethi %hi(_current_function_returns_struct),%o0
	st %g0,[%o0+%lo(_current_function_returns_struct)]
	sethi %hi(_max_structure_value_size),%o0
	st %g0,[%o0+%lo(_max_structure_value_size)]
	sethi %hi(_structure_value),%o0
	st %g0,[%o0+%lo(_structure_value)]
	sethi %hi(_block_stack),%o0
	st %g0,[%o0+%lo(_block_stack)]
	sethi %hi(_loop_stack),%o0
	st %g0,[%o0+%lo(_loop_stack)]
	sethi %hi(_case_stack),%o0
	st %g0,[%o0+%lo(_case_stack)]
	sethi %hi(_cond_stack),%o0
	st %g0,[%o0+%lo(_cond_stack)]
	sethi %hi(_nesting_stack),%o0
	st %g0,[%o0+%lo(_nesting_stack)]
	sethi %hi(_nesting_depth),%o0
	st %g0,[%o0+%lo(_nesting_depth)]
	sethi %hi(_tail_recursion_label),%o0
	st %g0,[%o0+%lo(_tail_recursion_label)]
	sethi %hi(_frame_offset),%o0
	st %g0,[%o0+%lo(_frame_offset)]
	sethi %hi(_save_expr_regs),%o0
	st %g0,[%o0+%lo(_save_expr_regs)]
	sethi %hi(_rtl_expr_chain),%o0
	st %g0,[%o0+%lo(_rtl_expr_chain)]
	sethi %hi(_immediate_size_expand),%o1
	ld [%o1+%lo(_immediate_size_expand)],%o0
	add %o0,1,%o0
	call _init_pending_stack_adjust,0
	st %o0,[%o1+%lo(_immediate_size_expand)]
	call _clear_current_args_size,0
	nop
	sethi %hi(_current_function_pretend_args_size),%o0
	st %g0,[%o0+%lo(_current_function_pretend_args_size)]
	ld [%i0+16],%o0
	call _emit_line_note,0
	ld [%i0+20],%o1
	mov 0,%o0
	call _emit_note,0
	mov -1,%o1
	call _assign_parms,0
	mov %i0,%o0
	ld [%i0+56],%o1
	ld [%o1+28],%o0
	cmp %o0,26
	be L1184
	sethi %hi(_flag_pcc_struct_return),%o0
	ld [%o0+%lo(_flag_pcc_struct_return)],%o0
	cmp %o0,0
	be,a L1202
	ld [%i0+56],%o0
	ld [%o1+8],%o0
	ldub [%o0+12],%o0
	add %o0,-19,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu,a L1202
	ld [%i0+56],%o0
L1184:
	sethi %hi(_flag_pcc_struct_return),%o0
	ld [%o0+%lo(_flag_pcc_struct_return)],%o0
	cmp %o0,0
	be L1185
	nop
	ld [%i0+56],%o0
	call _int_size_in_bytes,0
	ld [%o0+8],%o0
	call _assemble_static_space,0
	nop
	mov %o0,%l0
	mov 1,%o0
	sethi %hi(_current_function_returns_pcc_struct),%o1
	b L1186
	st %o0,[%o1+%lo(_current_function_returns_pcc_struct)]
L1185:
	call _gen_reg_rtx,0
	mov 4,%o0
	mov %o0,%l0
	sethi %hi(_struct_value_incoming_rtx),%o1
	call _emit_move_insn,0
	ld [%o1+%lo(_struct_value_incoming_rtx)],%o1
	mov 1,%o0
	sethi %hi(_current_function_returns_struct),%o1
	st %o0,[%o1+%lo(_current_function_returns_struct)]
L1186:
	ld [%i0+56],%o1
	mov 37,%o0
	ld [%o1+28],%o1
	call _gen_rtx,0
	mov %l0,%o2
	b L1203
	ld [%i0+56],%o1
L1202:
	ld [%o0+8],%o1
	mov 34,%o0
	ldub [%o1+28],%o1
	call _gen_rtx,0
	mov 0,%o2
	ld [%i0+56],%o1
L1203:
	st %o0,[%o1+64]
	ld [%i0+56],%o0
	ld [%o0+64],%o1
	lduh [%o1],%o0
	cmp %o0,34
	bne L1189
	nop
	ld [%o1],%o0
	or %o0,2,%o0
	st %o0,[%o1]
L1189:
	call _gen_label_rtx,0
	nop
	sethi %hi(_return_label),%o1
	st %o0,[%o1+%lo(_return_label)]
	sethi %hi(_obey_regdecls),%o0
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L1191
	nop
	call _get_last_insn,0
	mov 56,%i0
	sethi %hi(_parm_birth_insn),%o1
	st %o0,[%o1+%lo(_parm_birth_insn)]
	sethi %hi(_max_parm_reg),%o0
	ld [%o0+%lo(_max_parm_reg)],%o0
	cmp %i0,%o0
	bge L1191
	nop
	sethi %hi(_regno_reg_rtx),%l1
	sethi %hi(_max_parm_reg),%l0
	ld [%l1+%lo(_regno_reg_rtx)],%o0
L1204:
	sll %i0,2,%o1
	call _use_variable,0
	ld [%o0+%o1],%o0
	add %i0,1,%i0
	ld [%l0+%lo(_max_parm_reg)],%o0
	cmp %i0,%o0
	bl L1204
	ld [%l1+%lo(_regno_reg_rtx)],%o0
L1191:
	call _get_last_insn,0
	nop
	sethi %hi(_tail_recursion_reentry),%o1
	call _get_pending_sizes,0
	st %o0,[%o1+%lo(_tail_recursion_reentry)]
	orcc %o0,%g0,%i0
	be L1197
	nop
	ld [%i0+20],%o0
L1205:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	ld [%i0+4],%i0
	cmp %i0,0
	bne,a L1205
	ld [%i0+20],%o0
L1197:
	ret
	restore
	.align 4
	.global _expand_function_end
	.proc	020
_expand_function_end:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_sequence_stack),%o0
	ld [%o0+%lo(_sequence_stack)],%o0
	cmp %o0,0
	be L1224
	sethi %hi(_immediate_size_expand),%o1
	sethi %hi(_sequence_stack),%l0
L1209:
	call _end_sequence,0
	mov 0,%o0
	ld [%l0+%lo(_sequence_stack)],%o0
	cmp %o0,0
	bne L1209
	sethi %hi(_immediate_size_expand),%o1
L1224:
	ld [%o1+%lo(_immediate_size_expand)],%o0
	add %o0,-1,%o0
	st %o0,[%o1+%lo(_immediate_size_expand)]
	sethi %hi(_current_function_returns_struct),%o0
	ld [%o0+%lo(_current_function_returns_struct)],%o0
	cmp %o0,0
	be,a L1225
	sethi %hi(_obey_regdecls),%o0
	sethi %hi(_current_function_decl),%l0
	ld [%l0+%lo(_current_function_decl)],%o0
	ld [%o0+56],%o1
	ld [%o1+64],%o0
	ld [%o0+4],%l1
	call _build_pointer_type,0
	ld [%o1+8],%o0
	call _hard_function_value,0
	ld [%l0+%lo(_current_function_decl)],%o1
	call _emit_move_insn,0
	mov %l1,%o1
	sethi %hi(_obey_regdecls),%o0
L1225:
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L1211
	nop
	mov 56,%l0
	sethi %hi(_max_parm_reg),%o0
	ld [%o0+%lo(_max_parm_reg)],%o0
	cmp %l0,%o0
	bge,a L1226
	sethi %hi(_save_expr_regs),%o0
	sethi %hi(_regno_reg_rtx),%l2
	sethi %hi(_max_parm_reg),%l1
	ld [%l2+%lo(_regno_reg_rtx)],%o0
L1227:
	sll %l0,2,%o1
	call _use_variable,0
	ld [%o0+%o1],%o0
	add %l0,1,%l0
	ld [%l1+%lo(_max_parm_reg)],%o0
	cmp %l0,%o0
	bl L1227
	ld [%l2+%lo(_regno_reg_rtx)],%o0
	sethi %hi(_save_expr_regs),%o0
L1226:
	ld [%o0+%lo(_save_expr_regs)],%l0
	cmp %l0,0
	be L1211
	nop
	sethi %hi(_parm_birth_insn),%l1
L1219:
	call _use_variable,0
	ld [%l0+4],%o0
	ld [%l0+4],%o0
	call _use_variable_after,0
	ld [%l1+%lo(_parm_birth_insn)],%o1
	ld [%l0+8],%l0
	cmp %l0,0
	bne L1219
	nop
L1211:
	call _clear_pending_stack_adjust,0
	nop
	call _do_pending_stack_adjust,0
	nop
	mov 0,%o0
	call _emit_note,0
	mov -6,%o1
	mov %i0,%o0
	call _emit_line_note_force,0
	mov %i1,%o1
	sethi %hi(_return_label),%o0
	call _emit_label,0
	ld [%o0+%lo(_return_label)],%o0
	sethi %hi(_current_function_returns_pcc_struct),%o0
	ld [%o0+%lo(_current_function_returns_pcc_struct)],%o0
	cmp %o0,0
	be L1222
	nop
	sethi %hi(_current_function_decl),%l0
	ld [%l0+%lo(_current_function_decl)],%o0
	ld [%o0+56],%o1
	ld [%o1+64],%o0
	ld [%o0+4],%l1
	call _build_pointer_type,0
	ld [%o1+8],%o0
	call _hard_function_value,0
	ld [%l0+%lo(_current_function_decl)],%o1
	mov %o0,%l0
	call _emit_move_insn,0
	mov %l1,%o1
	call _use_variable,0
	mov %l0,%o0
L1222:
	call _get_insns,0
	nop
	mov %o0,%o3
	mov 0,%o0
	mov 0,%o1
	mov 0,%o2
	call _fixup_gotos,0
	mov 0,%o4
	ret
	restore
	.global _current_function_calls_setjmp
	.common _current_function_calls_setjmp,8,"bss"
	.global _save_expr_regs
	.common _save_expr_regs,8,"bss"
	.global _current_function_pops_args
	.common _current_function_pops_args,8,"bss"
	.global _current_function_returns_struct
	.common _current_function_returns_struct,8,"bss"
	.global _current_function_returns_pcc_struct
	.common _current_function_returns_pcc_struct,8,"bss"
	.global _current_function_needs_context
	.common _current_function_needs_context,8,"bss"
	.global _current_function_args_size
	.common _current_function_args_size,8,"bss"
	.global _current_function_pretend_args_size
	.common _current_function_pretend_args_size,8,"bss"
	.global _current_function_name
	.common _current_function_name,8,"bss"
	.global _return_label
	.common _return_label,8,"bss"
	.global _stack_slot_list
	.common _stack_slot_list,8,"bss"
	.global _emit_filename
	.common _emit_filename,8,"bss"
	.global _emit_lineno
	.common _emit_lineno,8,"bss"

	.reserve _parm_birth_insn,8,"bss"

	.reserve _this_function,8,"bss"

	.reserve _frame_offset,8,"bss"

	.reserve _invalid_stack_slot,8,"bss"

	.reserve _tail_recursion_label,8,"bss"

	.reserve _tail_recursion_reentry,8,"bss"

	.reserve _last_expr_type,8,"bss"

	.reserve _last_expr_value,8,"bss"

	.reserve _rtl_expr_chain,8,"bss"

	.reserve _last_parm_insn,8,"bss"
	.global _block_stack
	.common _block_stack,8,"bss"
	.global _stack_block_stack
	.common _stack_block_stack,8,"bss"
	.global _cond_stack
	.common _cond_stack,8,"bss"
	.global _loop_stack
	.common _loop_stack,8,"bss"
	.global _case_stack
	.common _case_stack,8,"bss"
	.global _nesting_stack
	.common _nesting_stack,8,"bss"
	.global _nesting_depth
	.common _nesting_depth,8,"bss"

	.reserve _goto_fixup_chain,8,"bss"
	.global _expr_stmts_for_value
	.common _expr_stmts_for_value,8,"bss"

	.reserve _max_parm_reg,8,"bss"

	.reserve _parm_reg_stack_loc,8,"bss"

	.reserve _max_structure_value_size,8,"bss"

	.reserve _structure_value,8,"bss"
