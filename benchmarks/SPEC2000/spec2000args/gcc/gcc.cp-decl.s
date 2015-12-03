	file	 "gcc.lgred.cp-decl.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	global	 _language_string
	align	 8
@LC0:
	string	 "GNU C++\000"
	align	 4
_language_string:
	word	 @LC0
text
	align	 8
	global	 _push_decl_level
_push_decl_level:
	subu	 r31,r31,64
	or	 r4,r0,16
	st	 r2,r31,40
	or	 r2,r0,r3
	st	 r1,r31,36
@Ltb0:
	bsr.n	 _push_stack_level
	addu	 r3,r31,40
@Lte0:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _global_bindings_p
_global_bindings_p:
@Ltb1:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r2,r9,lo16(_current_binding_level)
	or.u	 r9,r0,hi16(_global_binding_level)
	ld	 r9,r9,lo16(_global_binding_level)
	cmp	 r2,r2,r9
	jmp.n	 r1
	extu	 r2,r2,1<eq>
@Lte1:

	align	 8
	global	 _keep_next_level
_keep_next_level:
@Ltb2:
	or.u	 r8,r0,hi16(_keep_next_level_flag)
	or	 r9,r0,1
	jmp.n	 r1
	st	 r9,r8,lo16(_keep_next_level_flag)
@Lte2:

	align	 8
	global	 _kept_level_p
_kept_level_p:
@Ltb3:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,20
	bcnd.n	 ne0,r9,@L29
	or	 r2,r0,0
	ld	 r7,r8,32
	mask	 r9,r7,3584
	bcnd	 ne0,r9,@L29
	ld	 r9,r0,r8
	bcnd	 ne0,r9,@L29
	ld	 r9,r8,4
	bcnd	 eq0,r9,@L30
	bb1	 (31-23),r7,@L30
@L29:
	or	 r2,r0,1
@L30:
	jmp	 r1
@Lte3:

	align	 8
	global	 _declare_parm_level
_declare_parm_level:
@Ltb4:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	and	 r9,r9,0xfff
	or	 r9,r9,4096
	jmp.n	 r1
	st	 r9,r8,32
@Lte4:

	align	 8
	global	 _declare_implicit_exception
_declare_implicit_exception:
@Ltb5:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	and	 r9,r9,0xfff
	or	 r9,r9,12288
	jmp.n	 r1
	st	 r9,r8,32
@Lte5:

	align	 8
	global	 _have_exceptions_p
_have_exceptions_p:
@Ltb6:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<4>
@Lte6:

	align	 8
	global	 _declare_uninstantiated_type_level
_declare_uninstantiated_type_level:
@Ltb7:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	or	 r9,r9,8
	jmp.n	 r1
	st	 r9,r8,32
@Lte7:

	align	 8
	global	 _uninstantiated_type_level_p
_uninstantiated_type_level_p:
@Ltb8:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<3>
@Lte8:

	align	 8
	global	 _declare_pseudo_global_level
_declare_pseudo_global_level:
@Ltb9:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	or	 r9,r9,4
	jmp.n	 r1
	st	 r9,r8,32
@Lte9:

	align	 8
	global	 _pseudo_global_level_p
_pseudo_global_level_p:
@Ltb10:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<2>
@Lte10:

	align	 8
	global	 _pushlevel
_pushlevel:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L53
	st.d	 r24,r31,40
@Ltb11:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L53:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L54
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L55
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L54:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L55:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L57
	st	 r13,r25,28
	br.n	 @L58
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L57:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L58:
	ld	 r13,r25,32
	mak	 r12,r23,1<8>
	and	 r13,r13,0xfeff
	mak	 r11,r24,3<9>
	or	 r13,r13,r12
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf1ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
@Lte11:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	addu	 r31,r31,64
	jmp.n	 r1
	st	 r0,r13,lo16(_keep_next_level_flag)

	align	 8
	global	 _pushlevel_temporary
_pushlevel_temporary:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L69
	st.d	 r24,r31,40
@Ltb12:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L69:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L70
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L71
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L70:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L71:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L73
	st	 r13,r25,28
	br.n	 @L74
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L73:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L74:
	ld	 r13,r25,32
	mak	 r12,r23,1<8>
	and	 r13,r13,0xfeff
	or	 r2,r0,r25
	or	 r13,r13,r12
	or.u	 r25,r0,hi16(_current_binding_level)
	or	 r13,r13,160
	mak	 r12,r24,3<9>
	and	 r13,r13,0xf1ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r11,r25,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	and	 r13,r13,0xf1ff
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,1024
	bsr.n	 _clear_last_expr
	st	 r13,r11,32
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
@Lte12:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC1:
	string	 "label `%s' used but not defined\000"
	align	 8
@LC2:
	string	 "label `%s' defined but not used\000"
text
	align	 8
	global	 _poplevel
_poplevel:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r20,r0,r2
	st.d	 r16,r31,40
@Ltb13:
	or	 r24,r0,r4
	ld	 r13,r13,32
	or	 r15,r0,r3
	or	 r21,r0,r24
	mask	 r18,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r18,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L162
	extu	 r18,r12,1<eq>
	or	 r21,r0,0
@L162:
	bcnd.n	 lt0,r21,@L164
	or	 r16,r0,r24
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r19,r13,4
	br	 @L165
	align	 4
@L164:
	or	 r19,r0,0
@L165:
	bcnd.n	 lt0,r21,@L166
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L257
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L166:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L257:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r13,r2,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L168
	or	 r20,r0,1
@L168:
	bcnd	 eq0,r15,@L169
	bsr.n	 _nreverse
	ld	 r2,r0,r2
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r24,r0,r2
	br.n	 @L170
	st	 r24,r0,r13
	align	 4
@L169:
	ld	 r24,r0,r2
@L170:
	bcnd.n	 eq0,r24,@L172
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L174:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L173
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L173
	bb0	 (31-11),r12,@L173
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L173:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L174
@L172:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r17,r13,1<ne>
	bcnd.n	 eq0,r17,@L177
	or	 r23,r0,0
	br.n	 @L178
	or	 r23,r0,r12
	align	 4
@L177:
	cmp	 r12,r20,1
	cmp	 r13,r21,0
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L178
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L178:
	bcnd	 eq0,r23,@L180
	st	 r24,r23,16
	st	 r19,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L180:
	bcnd	 lt0,r20,@L181
	bcnd.n	 eq0,r22,@L181
	or	 r25,r0,r22
@L185:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L185
@L181:
	or	 r25,r0,r24
	bcnd	 eq0,r25,@L188
	or.u	 r10,r0,0x80
	or.u	 r11,r0,0x10
@L190:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L189
	ld	 r13,r25,28
	and	 r13,r13,r10
	bcnd	 eq0,r13,@L192
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L263
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L263:
	and	 r13,r13,r11
	bcnd	 eq0,r13,@L192
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,r11
	st	 r13,r12,8
@L192:
	ld	 r13,r25,32
	st	 r0,r13,24
@L189:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L190
@L188:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L258
	or.u	 r13,r0,hi16(_current_binding_level)
@L199:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L199
	or.u	 r13,r0,hi16(_current_binding_level)
@L258:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L259
	or.u	 r13,r0,hi16(_current_binding_level)
@L204:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L204
	or.u	 r13,r0,hi16(_current_binding_level)
@L259:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L207
@L209:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L209
@L207:
	bcnd.n	 eq0,r21,@L211
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L264
	st	 r0,r23,16
@L215:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L216
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L265
@L266:
	align	 4
@L216:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L217
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L217
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L217:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L220
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L220:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L215
	or.u	 r13,r0,hi16(_named_labels)
@L264:
	st	 r0,r13,lo16(_named_labels)
@L211:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L222
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L260
	or.u	 r13,r0,hi16(_current_binding_level)
@L226:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L225
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L225:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L226
@L222:
	or.u	 r13,r0,hi16(_current_binding_level)
@L260:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L230
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L261
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L230:
	or.u	 r9,r0,hi16(_current_binding_level)
@L261:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L229
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L233:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L233
	st	 r12,r11,lo16(_current_binding_level)
@L229:
	bcnd.n	 eq0,r21,@L237
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L238
	st	 r23,r13,48
	align	 4
@L237:
	bcnd	 eq0,r23,@L239
	bcnd.n	 ne0,r17,@L262
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L256
	or	 r3,r0,r23
	align	 4
@L239:
	bcnd.n	 eq0,r22,@L238
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L243
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L256
	or	 r2,r0,r22
	align	 4
@L243:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L256:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L238:
	cmp	 r13,r24,2
@L262:
	cmp	 r12,r18,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L245
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,r15
	bsr.n	 _poplevel
	or	 r4,r0,r16
	or	 r23,r0,r2
@L245:
	bcnd	 eq0,r23,@L246
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L246:
@Lte13:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	or	 r2,r0,r23
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L265,@L217-@L266

