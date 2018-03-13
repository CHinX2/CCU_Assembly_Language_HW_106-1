.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set SWI_WriteC, 0x3
.set SWI_Write, 0x5
.set SWI_Read, 0x6
.set SWI_FLen, 0xC
.set AngelSWI, 0x123456


/* ========================= */
/*       DATA section        */
/* ========================= */
        .data
        .align 4

/* --- a string --- */
.input_addr:
        .ascii "input.txt\000"
.output_addr:
	.ascii "output.txt\000"
.readbuffer:
        .space 4
/* ========================= */
/*       TEXT section        */
/* ========================= */
        .section .text
        .global main
        .type main,%function

.input_n:
        .word .input_addr
.output_n:
	.word .output_addr
.open_param_in:
        .word .input_addr
        .word 0x2
        .word 0x8
.open_param_out:
	.word .output_addr
	.word 0x2
	.word 0x8
.flen_param:
        .space 4
.read_param:
        .space 4
        .word .readbuffer
        .space 4
.write_param:
	.space 4	/* file descriptor */
	.space 4	/* address of the string */
	.space 4	/* length of the string */
.close_param:
        .space 4

main:
	mov ip, sp
        stmfd sp!, {fp, ip, lr, pc}
        sub fp, ip, #4

        /* open a file */
        mov r0, #SWI_Open
        adr r1, .open_param_in
        swi AngelSWI
        mov r2, r0                /* r2 is file descriptor of input*/

	mov r0, #SWI_Open
	adr r1, .open_param_out
        swi AngelSWI
        mov r3, r0                /* r3 is file descriptor of output*/
	

        /* get length of a file */
        mov r0, #SWI_FLen
        adr r1, .flen_param
        str r2, [r1, #0]
        swi AngelSWI
        mov r6, r0		  /* r6 is the length of input */

        /* read from a file */
	adr r1, .read_param
        str r2, [r1, #0]          /* store file descriptor */

        ldr r5, [r1, #4]          /* r5 is the address of readbuffer */

        mov r7, #1
        str r7, [r1, #8]          /* store the length of the string */

loop:
	/* read in a char */
	adr r1, .read_param
        mov r0, #SWI_Read
        swi AngelSWI
	ldrb r4, [r5, #0]	  /* r4 is the read-in data]

	/* to upper */
	cmp r4, #97		  /* is it < a */
	bcc other
	cmp r4, #122		  /* is it > z */
	bhi other
	sub r4,r4,#32
	strb r4, [r5]

other:
	/* write word in output */
	adr r1, .write_param
	str r3, [r1, #0]          /* store file descriptor */
        str r5, [r1, #4]          /* store the address of word */
        str r7, [r1, #8]          /* store the length of the word */
        mov r0, #SWI_Write
        swi AngelSWI

	cmp r6, #1
        sub r6, r6, #1
        bne loop

	/* close files */
	adr r1, .close_param
	str r2, [r1, #0]	  /* close input file */
	mov r0, #SWI_Close
	swi AngelSWI

	str r3, [r1,#0]		  /* close output file */
	mov r0, #SWI_Close
	swi AngelSWI

	ldmea fp, {fp, sp, pc}

	nop
	.end
