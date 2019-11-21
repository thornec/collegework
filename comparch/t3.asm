/*

a,b,c = r26,r27,r28
v = r16

*/

min:	add		r0, r26, r16		; v = a

		sub		r16, r27, r0, {C}	; cmp b, v
		jge		min_0				; if(v > b)
		xor		r0, r0, r0			; r0 = 0 (nop)
		add		r0, r27, r16		; v = b

min_0:	sub		r16, r28, r0, {C}	; cmp c, v
		jge		min_1				;
		xor		r0, r0, r0			; r0 = 0 (nop)
		add		r0, r28, r16		; v = c

min_1:	add		r0, r16, r1			; r1 = v (min val)
		ret		r25					; return

/*

i, j, k, l = r26, r27, r28, r29

*/
p:		; set up parameters for calling min
		add		r0, r27, r10		; r10 = j
		add		r0, r26, r11		; r11 = i
		callr	r25, min 			; call min(g, i, j)
		add		r0, g, r12			; r12 = g (jump delay)

		; set up parameters
		add		r0, r25, r10		; r10 = min(g,i,j) 
		add		r0, r28, r11		; r11 = k
		callr	r25, min 			; min(min(g, i, j),k, l)
		add		r0, r29, r12 		; r12 = l (jump delay)

		ret 	r25 				; return

/*

gcd:

a,b,k,m = r26, r27, r16, r17

mod:

a,b = r26, r27

*/

gcd:	add		r27, r27, r0, {C}	; r0 = b
		je      gcd_move 			; is b = 0?

		add 	r0, r26, r10  		; r10 = a
		callr 	r25, mod 			; call mod
		add 	r0, r27, r11 		; r11 = b (jump delay)

		add 	r0, r11, r10 		; a = b (from previous result)
		callr 	r25, gcd 			; call gcd recrusively
		add 	r0, r1, r11 		; b = result (jump delay)
		jmp 	gcd_done 			; jump to return
		xor     r0, r0, r0 			; r0 = 0 (nop)

gcd_move: add 	r0, r11, r1 		; store result
gcd_done: ret   r25 				; return