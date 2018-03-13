/* ======================== */
/*  Assembly Language HW#4  */
/* ======================== */
/*  Student ID : 405410034  */
/* ======================== */
/*       DATA section       */
/* ======================== */
	.data
	.align 4

/* --- variable a (2*3) --- */
	.type a, %object
	.size a, 24
a:
	.word 1 /* set a1-1 value */
	.word 1 /* a1-2 */
	.word 1 /* a1-3 */
	.word 2 /* a2-1 */
	.word 2 /* a2-2 */
	.word 2 /* a2-3 */

/* --- variable b (3*2) --- */
	.type b, %object
	.size b, 24
b:
	.word 1 /* set b1-1  value */
	.word 1 /* b1-2 */
	.word 2 /* b2-1 */
	.word 2 /* b2-2 */
	.word 3 /* b3-1 */
	.word 3 /* b3-2 */

/* --- variable c (2*2) --- */
c:
	.space 16, 0

/* --- variable d (2*2) --- */
	.type d, %object
	.size d, 16
d:
	.word 1	/* set d1-1 value*/
	.word 1	/* d1-2 */
	.word 2 /* d2-1 */
	.word 2 /* d2-2 */

/* ======================== */
/*       TEXT section       */
/* ======================== */
	.section .text
	.global main
	.type main, %function
.matrix:
	.word a
	.word b
	.word c
	.word d
main:
	/* load a in r5-r10 */
	ldr r0, .matrix
	ldmia r0, {r5-r10}	/* r5-r10 := mem32[r0+4*n]*/
				/* a's elements ; word-aligned */

	/* load b in r11 and mul with a */
	/* store c's element in r1-r4 */
	ldr r0, .matrix + 4
	ldr r11, [r0], #4	/* r11 := mem32[r0] ; b1-1 */
				/* r0 := r0 + 4 ; do 6 times */
	mul r1, r5, r11		/* c1-1 := a1-1 * b1-1 */
	mul r3, r8, r11		/* c2-1 := a2-1 * b1-1 */

	ldr r11, [r0], #4	/* b1-2 */
	mul r2, r5, r11		/* c1-2 := a1-1 * b1-2 */
	mul r4, r8, r11		/* c2-2 := a2-1 * b1-2 */

	ldr r11, [r0], #4	/* b2-1 */
	mla r1, r6, r11, r1	/* c1-1 := a1-2 * b2-1 + c1-1 */
	mla r3, r9, r11, r3	/* c2-1 := a2-2 * b2-1 + c2-1 */

	ldr r11, [r0], #4	/* b2-2 */
	mla r2, r6, r11, r2	/* c1-2 := a1-2 * b2-2 + c1-2 */
	mla r4, r9, r11, r4	/* c2-2 := a2-2 * b2-2 + c2-2 */

	ldr r11, [r0], #4	/* b3-1 */
	mla r1, r7, r11, r1	/* c1-1 := a1-3 * b3-1 + c1-1 */
	mla r3, r10, r11, r3	/* c2-1 := a2-3 * b3-1 + c2-1 */

	ldr r11, [r0]		/* b3-2 */
	mla r2, r7, r11, r2	/* c1-2 := a1-3 * b3-2 + c1-2 */
	mla r4, r10, r11, r4	/* c2-2 := a2-3 * b3-2 + c2-2 */

	/* load d in r5 and add with c-element */
	ldr r0, .matrix + 12
	ldr r5, [r0], #4	/* r5 := mem32[r0] ; d1-1 */
				/* r0 := r0 + 4 ; do 4 times */
	add r1, r5, r1		/* c1-1 := d1-1 + c1-1 */

	ldr r5, [r0], #4	/* d1-2 */
	add r2, r5, r2		/* c1-2 := d1-2 + c1-2 */

	ldr r5, [r0], #4	/* d2-1 */
	add r3, r5, r3		/* c2-1 := d2-1 + c2-1 */

	ldr r5, [r0]		/* d2-2 */
	add r4, r5, r4		/* c2-2 := d2-2 + c2-2 */

	/*load c in r0 and store r8-r11 in c */
	ldr r0, .matrix + 8

	stmia r0, {r1-r4}	/* mem32[r0+4*n] := r1-r4 */
				/* word-aligned : shift by 4 */
	nop

