/* ====================== */
/*      TEXT section      */
/* ====================== */
	.section .text
	.global main
	.type main,%function
main:
	mov r0, #50  /* set value of a */
	mov r1, #15  /* set value of b */
LOOP:
	cmp r0, r1 	 /* compare a & b */
	subhi r0, r0, r1 /* a>b : a=a-b */
	sublo r1, r1, r0 /* a<b : b=b-a */
	cmp r0, r1  	 /* compare a & b */
	bne LOOP

	nop
	.end
	
