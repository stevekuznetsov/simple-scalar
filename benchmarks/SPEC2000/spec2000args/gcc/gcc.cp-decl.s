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

	align	 8
	global	 _delete_block
_delete_block:
@Ltb14:
	or.u	 r7,r0,hi16(_current_binding_level)
	ld	 r8,r7,lo16(_current_binding_level)
	ld	 r9,r8,20
	cmp	 r9,r9,r2
	bb1	 ne,r9,@L277
	ld	 r9,r0,r2
	st	 r9,r8,20
@L277:
	ld	 r9,r7,lo16(_current_binding_level)
	ld	 r8,r9,20
	bcnd	 eq0,r8,@L279
@L281:
	ld	 r7,r0,r8
	cmp	 r9,r7,r2
	bb1	 ne,r9,@L282
	ld	 r9,r0,r2
	br.n	 @L278
	st	 r9,r0,r8
	align	 4
@L282:
	or	 r8,r0,r7
@L278:
	bcnd	 ne0,r8,@L281
@L279:
	ld	 r9,r2,8
	st	 r0,r0,r2
	and	 r9,r9,0x7fff
	jmp.n	 r1
	st	 r9,r2,8
@Lte14:

	align	 8
	global	 _insert_block
_insert_block:
	subu	 r31,r31,48
	st	 r1,r31,36
	or	 r3,r0,r2
	st	 r25,r31,32
@Ltb15:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r3,8
	ld	 r12,r25,lo16(_current_binding_level)
	or	 r13,r13,32768
	st	 r13,r3,8
	bsr.n	 _chainon
	ld	 r2,r12,20
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@Lte15:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _add_block_current_level
_add_block_current_level:
	subu	 r31,r31,48
	st	 r25,r31,32
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r1,r31,36
@Ltb16:
	or	 r3,r0,r2
	bsr.n	 _chainon
	ld	 r2,r13,20
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@Lte16:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _set_block
_set_block:
@Ltb17:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	jmp.n	 r1
	st	 r2,r9,24
@Lte17:

	align	 8
	global	 _pushlevel_class
_pushlevel_class:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L307
	st.d	 r24,r31,40
@Ltb18:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L307:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L308
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L309
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L308:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L309:
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
	bcnd	 eq0,r13,@L311
	st	 r13,r25,28
	br.n	 @L312
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L311:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L312:
	mak	 r12,r24,3<9>
	ld	 r13,r25,32
	or	 r2,r0,r25
	or.u	 r25,r0,hi16(_current_binding_level)
	or	 r13,r13,160
	or.u	 r24,r0,hi16(_decl_stack)
	and	 r13,r13,0xf0ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	addu	 r3,r31,56
	ld	 r13,r24,lo16(_decl_stack)
	or	 r4,r0,16
	or.u	 r2,r0,hi16(_decl_obstack)
	st	 r13,r31,56
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r2,r2,lo16(_decl_obstack)
	bsr.n	 _push_stack_level
	st	 r0,r13,lo16(_keep_next_level_flag)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	or.u	 r11,r0,hi16(_class_binding_level)
	st	 r2,r24,lo16(_decl_stack)
	and	 r13,r13,0xfff
	st	 r12,r11,lo16(_class_binding_level)
	or	 r13,r13,8192
	st	 r13,r12,32
@L314:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L314
	st	 r12,r25,lo16(_current_binding_level)
@Lte18:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC3:
	string	 "syntax error too serious\000"
text
	align	 8
	global	 _poplevel_class
_poplevel_class:
	subu	 r31,r31,96
	or.u	 r13,r0,hi16(_class_binding_level)
	st.d	 r24,r31,72
	ld	 r25,r13,lo16(_class_binding_level)
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r23,r0,0
	bcnd.n	 ne0,r25,@L436
	st.d	 r16,r31,40
@Ltb19:
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	bcnd.n	 eq0,r13,@L551
	or	 r22,r0,r12
@L439:
	ld	 r13,r12,lo16(_current_binding_level)
	ld	 r13,r13,32
	or	 r20,r0,0
	or	 r18,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L442
	extu	 r17,r12,1<eq>
	or	 r18,r0,r20
@L442:
	bcnd.n	 lt0,r18,@L444
	or	 r15,r0,0
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r19,r13,4
	br	 @L445
	align	 4
@L444:
	or	 r19,r0,0
@L445:
	bcnd.n	 lt0,r18,@L446
	or	 r21,r0,0
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r21,r13,20
@L446:
	ld	 r2,r22,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L449
	or	 r20,r0,1
@L449:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L452
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L454:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L453
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L453
	bb0	 (31-11),r12,@L453
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L453:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L454
@L452:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L457
	or	 r23,r0,0
	br.n	 @L458
	or	 r23,r0,r12
	align	 4
@L457:
	subu	 r13,r0,r18
	or	 r13,r13,r20
	bcnd	 eq0,r13,@L458
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L458:
	bcnd	 eq0,r23,@L460
	st	 r24,r23,16
	st	 r19,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r21,r23,24
@L460:
	bcnd	 lt0,r20,@L461
	bcnd.n	 eq0,r21,@L461
	or	 r25,r0,r21
@L465:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L465
@L461:
	or	 r25,r0,r24
	bcnd	 eq0,r25,@L468
@L470:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L469
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L472
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L598
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L598:
	bb0	 (31-11),r13,@L472
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L472:
	ld	 r13,r25,32
	st	 r0,r13,24
@L469:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L470
@L468:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd	 eq0,r25,@L592
@L479:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L479
	ld	 r13,r22,lo16(_current_binding_level)
@L592:
	ld	 r25,r13,12
	bcnd	 eq0,r25,@L482
@L484:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L484
@L482:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L487
@L489:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L489
@L487:
	bcnd.n	 eq0,r18,@L491
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L599
	st	 r0,r23,16
@L495:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L496
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
	addu	 r1,r1,@L600
@L601:
	align	 4
@L496:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L497
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L497
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L497:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L500
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L500:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L495
	or.u	 r13,r0,hi16(_named_labels)
@L599:
	st	 r0,r13,lo16(_named_labels)
@L491:
	ld	 r10,r22,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L502
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd	 eq0,r12,@L502
@L506:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L505
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L505:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L506
@L502:
	ld	 r11,r22,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L510
	extu	 r25,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L593
	or.u	 r11,r0,hi16(_free_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L510:
	or.u	 r11,r0,hi16(_free_binding_level)
@L593:
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L509
	st	 r10,r22,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	st	 r10,r13,lo16(_class_binding_level)
@L513:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L513
	st	 r12,r22,lo16(_current_binding_level)
@L509:
	bcnd.n	 eq0,r18,@L517
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L518
	st	 r23,r13,48
	align	 4
@L517:
	bcnd	 eq0,r23,@L519
	bcnd.n	 ne0,r16,@L594
	cmp	 r13,r25,2
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L590
	or	 r3,r0,r23
	align	 4
@L519:
	bcnd.n	 eq0,r21,@L518
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L523
	or	 r3,r0,r21
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L590
	or	 r2,r0,r21
	align	 4
@L523:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r2,r13,20
@L590:
	bsr	 _chainon
	ld	 r13,r22,lo16(_current_binding_level)
	st	 r2,r13,20
@L518:
	cmp	 r13,r25,2
@L594:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L525
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L525:
	bcnd	 eq0,r23,@L526
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L526:
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	bcnd.n	 eq0,r13,@L551
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L439
	or.u	 r13,r0,hi16(_class_binding_level)
	br	 @L595
	align	 4
@L551:
	or.u	 r2,r0,hi16(@LC3)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC3)
	or.u	 r13,r0,hi16(_class_binding_level)
@L595:
	ld	 r25,r13,lo16(_class_binding_level)
@L436:
	or.u	 r13,r0,hi16(_decl_stack)
	ld	 r2,r13,lo16(_decl_stack)
	ld	 r13,r2,4
	ld	 r9,r2,8
	ld	 r12,r13,12
	cmp	 r10,r12,r9
	bb0.n	 ne,r10,@L531
	subu	 r13,r9,r12
	bb1.n	 le,r10,@L557
	mask	 r11,r13,15
	bcnd.n	 eq0,r11,@L596
	subu	 r13,r12,4
	cmp	 r13,r11,12
	bb1.n	 ge,r13,@L557
	cmp	 r13,r11,8
	bb1.n	 ge,r13,@L558
	cmp	 r13,r11,3
	bb0.n	 gt,r13,@L596
	subu	 r13,r12,4
	subu	 r12,r12,4
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L558
	ld	 r13,r13,32
	st	 r0,r13,28
@L558:
	subu	 r12,r12,4
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L557
	ld	 r13,r13,32
	st	 r0,r13,28
@L557:
	br.n	 @L591
	subu	 r12,r12,4
	align	 4
@L532:
@L596:
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L569
	ld	 r13,r13,32
	st	 r0,r13,28
@L569:
	subu	 r13,r12,8
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L572
	ld	 r13,r13,32
	st	 r0,r13,28
@L572:
	subu	 r13,r12,12
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L575
	ld	 r13,r13,32
	st	 r0,r13,28
@L575:
	subu	 r12,r12,16
@L591:
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L578
	ld	 r13,r13,32
	st	 r0,r13,28
@L578:
	cmp	 r13,r12,r9
	bb1.n	 ne,r13,@L532
	subu	 r13,r12,4
@L531:
	bsr	 _pop_stack_level
	ld	 r11,r25,8
	or.u	 r13,r0,hi16(_decl_stack)
	bcnd.n	 eq0,r11,@L536
	st	 r2,r13,lo16(_decl_stack)
@L538:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,24
	ld	 r11,r0,r11
	bcnd	 ne0,r11,@L538
@L536:
	ld	 r11,r25,12
	bcnd	 eq0,r11,@L541
@L543:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,28
	ld	 r11,r0,r11
	bcnd	 ne0,r11,@L543
@L541:
	ld	 r11,r25,16
	bcnd.n	 eq0,r11,@L597
	or.u	 r24,r0,hi16(_class_binding_level)
@L548:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,4
	ld	 r11,r0,r11
	bcnd.n	 ne0,r11,@L548
	or.u	 r24,r0,hi16(_class_binding_level)
@L597:
	ld	 r2,r24,lo16(_class_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 ne,r13,@L550
	st	 r12,r24,lo16(_class_binding_level)
	st	 r0,r24,lo16(_class_binding_level)
@L550:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r13,r12,lo16(_free_binding_level)
	st	 r13,r25,28
@Lte19:
	ld	 r1,r31,80
	ld	 r15,r31,36
	st	 r25,r12,lo16(_free_binding_level)
	ld.d	 r24,r31,72
	or	 r2,r0,r23
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L600,@L497-@L601

	global	 _no_print_functions
data
	align	 4
_no_print_functions:
	word	 0
	global	 _no_print_builtins
	align	 4
_no_print_builtins:
	word	 0
	align	 8
@LC4:
	string	 " blocks=\000"
	align	 8
@LC5:
	string	 "%x\000"
	align	 8
@LC6:
	string	 " n_incomplete=%d parm_flag=%d keep=%d\000"
	align	 8
@LC7:
	string	 " tag-transparent\000"
	align	 8
@LC8:
	string	 " more-cleanups-ok\000"
	align	 8
@LC9:
	string	 " have-cleanups\000"
	align	 8
@LC10:
	string	 " more-exceptions-ok\000"
	align	 8
@LC11:
	string	 " have-exceptions\000"
	align	 8
@LC12:
	string	 "\n\000"
	align	 8
@LC13:
	string	 " names:\t\000"
	align	 8
@LC14:
	string	 "<built-in>\000"
	align	 8
@LC15:
	string	 "\n\t\000"
	align	 8
@LC16:
	string	 "\000"
	align	 8
@LC17:
	string	 "\n\000"
	align	 8
@LC18:
	string	 " tags:\t\000"
	align	 8
@LC19:
	string	 "\n\t\000"
	align	 8
@LC20:
	string	 "<unnamed-typedef\000"
	align	 8
@LC21:
	string	 ">\000"
	align	 8
@LC22:
	string	 "\000"
	align	 8
@LC23:
	string	 "<typedef\000"
	align	 8
@LC24:
	string	 "\000"
	align	 8
@LC25:
	string	 ">\000"
	align	 8
@LC26:
	string	 "\n\000"
	align	 8
@LC27:
	string	 " shadowed:\000"
	align	 8
@LC28:
	string	 " %s \000"
	align	 8
@LC29:
	string	 "\n\000"
	align	 8
@LC30:
	string	 " class-shadowed:\000"
	align	 8
@LC31:
	string	 " %s \000"
	align	 8
@LC32:
	string	 "\n\000"
	align	 8
@LC33:
	string	 " type-shadowed:\000"
	align	 8
@LC34:
	string	 " %s \000"
	align	 8
@LC35:
	string	 "\n\000"
text
	align	 8
	global	 _print_binding_level
_print_binding_level:
	subu	 r31,r31,80
	or.u	 r3,r0,hi16(@LC4)
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r20,r31,40
	or.u	 r21,r0,hi16(__iob+64)
	st.d	 r24,r31,56
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC4)
	st	 r1,r31,64
@Ltb20:
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r25
	ld	 r4,r22,20
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	or	 r2,r0,r25
	ld	 r6,r22,32
	or.u	 r3,r0,hi16(@LC6)
	ld.hu	 r4,r22,32
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L713
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L713:
	bb0	 (31-24),r13,@L657
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L657:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L714
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L714:
	bb0	 (31-26),r13,@L659
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L659:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L660
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L660:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L661
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r24,r0,r22
	bcnd.n	 eq0,r24,@L663
	or.u	 r13,r0,hi16(_no_print_functions)
@L712:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L666
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L664
@L666:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L667
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L667
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r24,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L664
@L667:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r25,r13,2
	addu	 r23,r23,r25
	cmp	 r13,r23,6
	bb0	 gt,r13,@L670
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L670:
	or	 r2,r21,lo16(__iob+64)
	or	 r4,r0,r24
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r24,8
	bcnd	 eq0,r13,@L663
@L664:
	ld	 r24,r0,r24
	bcnd.n	 ne0,r24,@L712
	or.u	 r13,r0,hi16(_no_print_functions)
@L663:
	bcnd.n	 eq0,r23,@L661
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L661:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L674
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC18)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC18)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	ld	 r24,r22,4
	bcnd.n	 eq0,r24,@L676
	or	 r23,r0,0
	or	 r20,r0,r21
	or	 r21,r0,r25
@L678:
	ld	 r12,r24,12
	bcnd	 ne0,r12,@L679
	or	 r25,r0,3
	br.n	 @L715
	addu	 r23,r23,r25
	align	 4
@L679:
	ld	 r13,r24,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L680
	or	 r25,r0,4
	or	 r25,r0,2
@L680:
	addu	 r23,r23,r25
@L715:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L683
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L683:
	ld	 r4,r24,12
	bcnd	 ne0,r4,@L684
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L711
	or	 r3,r3,lo16(@LC21)
	align	 4
@L684:
	ld	 r12,r24,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L686
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L716
@L717:
	align	 4
@L686:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L711:
	bsr	 _fprintf
@L677:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L678
@L676:
	bcnd.n	 eq0,r23,@L674
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L674:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L690
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r24,r22,8
	bcnd	 eq0,r24,@L692
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC28)
@L694:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC28)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L694
@L692:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L690:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L696
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r24,r22,12
	bcnd	 eq0,r24,@L698
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC31)
@L700:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC31)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L700
@L698:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L696:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L702
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r24,r22,16
	bcnd.n	 eq0,r24,@L704
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC34)
@L706:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC34)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L706
@L704:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
@L702:
@Lte20:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L716,@L677-@L717

data
	align	 8
@LC36:
	string	 "binding level \000"
	align	 8
@LC37:
	string	 "%x\000"
	align	 8
@LC38:
	string	 "\n\000"
text
	align	 8
	global	 _print_other_binding_stack
_print_other_binding_stack:
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r24,r31,56
	cmp	 r13,r22,r13
	bb0.n	 ne,r13,@L779
	st.d	 r20,r31,40
@Ltb21:
	or.u	 r20,r0,hi16(__iob+64)
	or	 r21,r20,lo16(__iob+64)
	or.u	 r3,r0,hi16(@LC36)
@L842:
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC36)
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC37)
	or	 r4,r0,r22
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC37)
	or.u	 r3,r0,hi16(@LC38)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC38)
	or.u	 r3,r0,hi16(@LC4)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC4)
	ld	 r4,r22,20
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L843
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L843:
	bb0	 (31-24),r13,@L784
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L784:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L844
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L844:
	bb0	 (31-26),r13,@L786
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L786:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L787
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L787:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L788
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r25,r0,r22
	bcnd.n	 eq0,r25,@L790
	or.u	 r13,r0,hi16(_no_print_functions)
@L840:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L793
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L791
@L793:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L794
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L794
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r25,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L791
@L794:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r24,r13,2
	addu	 r23,r23,r24
	cmp	 r13,r23,6
	bb0	 gt,r13,@L797
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L797:
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r25
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r25,8
	bcnd	 eq0,r13,@L790
@L791:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L840
	or.u	 r13,r0,hi16(_no_print_functions)
@L790:
	bcnd	 eq0,r23,@L788
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L788:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L801
	or.u	 r3,r0,hi16(@LC18)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC18)
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L803
	or	 r23,r0,0
@L805:
	ld	 r12,r25,12
	bcnd	 ne0,r12,@L806
	or	 r24,r0,3
	br.n	 @L845
	addu	 r23,r23,r24
	align	 4
@L806:
	ld	 r13,r25,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L807
	or	 r24,r0,4
	or	 r24,r0,2
@L807:
	addu	 r23,r23,r24
@L845:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L810
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L810:
	ld	 r4,r25,12
	bcnd	 ne0,r4,@L811
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L839
	or	 r3,r3,lo16(@LC21)
	align	 4
@L811:
	ld	 r12,r25,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L813
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L846
@L847:
	align	 4
@L813:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L839:
	bsr	 _fprintf
@L804:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L805
@L803:
	bcnd	 eq0,r23,@L801
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L801:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L817
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r25,r22,8
	bcnd	 eq0,r25,@L819
	or.u	 r24,r0,hi16(@LC28)
@L821:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC28)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L821
@L819:
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L817:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L823
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r25,r22,12
	bcnd	 eq0,r25,@L825
	or.u	 r24,r0,hi16(@LC31)
@L827:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC31)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L827
@L825:
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L823:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L841
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r25,r22,16
	bcnd	 eq0,r25,@L831
	or.u	 r24,r0,hi16(@LC34)
@L833:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC34)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L833
@L831:
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
	or.u	 r13,r0,hi16(_global_binding_level)
@L841:
	ld	 r22,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L842
	or.u	 r3,r0,hi16(@LC36)
@L779:
@Lte21:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L846,@L804-@L847

