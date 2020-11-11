#for report
.text
.global top1_pattern_search
.type top1_pattern_search, STT_FUNC

top1_pattern_search:
	stmfd sp!, {r4-r10, lr}
	mov r4, #0
 	mov r5, #0
	#initialize array "result" as 0 	
	str r5, [r3, #8]
        str r5, [r3, #12]
        str r5, [r3, #16]
        str r5, [r3, #20]
loop1:
	mov r6, #0
	mov r7, r0
	
loop2:
	ldrb r8, [r7], #1
	
	cmp r2, r8
	addeq r6, r6, #1
	
	cmp r7, r1
	bls loop2

	cmp r6, r4
	ldrgt r9, [r3, #8]	
	ldrgt r10, [r3, #12]    
	strgt r9, [r3, #16]
	strgt r10, [r3, #20]	
	strgt r4, [r3, #12]
	strgt r5, [r3, #8]	
	movgt r4, r6
	movgt r5, r2 
	bgt loop3

	ldr r9, [r3, #12]	
	cmp r6, r9
	ldrgt r10, [r3, #8] 
	strgt r9, [r3, #20] 
	strgt r10, [r3, #16] 
	strgt r6, [r3, #12]
	strgt r2, [r3, #8]
	bgt loop3 

	ldr r9, [r3, #20]
	cmp r6, r9
	ldrgt r10, [r3, #16] 
	strgt r6, [r3, #20]
	strgt r2, [r3, #16]

loop3:	
	cmp r2, #0xff
	addlt r2, r2, #1
	blt loop1

	str r5, [r3]
	str r4, [r3, #4]
	ldmfd sp!, {r4-r10, lr}

	mov pc, lr

.end
