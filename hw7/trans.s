/* ================== */
/*    TEXT section    */
/* ================== */
	.section .text
	.global trans
	.type trans,%function

trans:
	/* APCS rules */
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4
	
	cmp r0, #96		/* is it < a */
	cmplt r0, #122	  	/* is it > z */
	subgt r0, r0, #32	/* turn lower to upper */

	ldmea fp, {fp, sp, pc}
