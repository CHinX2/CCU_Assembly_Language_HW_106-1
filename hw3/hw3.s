/* ========================= */
/*        Homework #3        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

main:
	MOV r0, #100			/* r0 = 100 */
	CMP r0, #0			/* compare if r0 = 0 */
	MOVLT r1, r0			/* if r0 < 0, r1 = r0 */
	SUBLT r0, r1, r0, LSL #1	/* if r0 < 0, r2 = r1 - r0 * 2 */
	MOV r2, r0			/* r2 = r0*/
	nop
	.end 
