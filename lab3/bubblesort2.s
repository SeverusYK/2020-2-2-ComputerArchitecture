#for report
.text
.global bubblesort
.global swap
.type bubblesort, STT_FUNC

bubblesort:
		sub	sp, sp, #28
		str	lr, [sp, #24]
		str	r11,[sp, #20]
		str	r10,[sp, #16]	
		str	r7, [sp, #12]
		str	r6, [sp, #8]
		str 	r3, [sp, #4]
		str	r2, [sp, #0]
		
		mov	r6, r0
		mov	r7, r1
		mov	r2, #0

for1tst:
		sub	r10,r1,#1	
		cmp	r2, r10
		bge	exit1
		mov	r3, #0
for2tst:
		add	r11, r2, #1
		sub	r11, r1, r11 
		cmp	r3, r11
		bge	exit2
		add	r12, r0, r3, LSL #2
		ldr	r4, [r12, #0]
		ldr	r5, [r12, #4]
		cmp	r4, r5
		ble	exit2
		
	        stmdb	sp!,{r0,r1,r2,r3,r12}
		mov	r0, r6
		mov	r1, r3
		bl	swap
		ldmia sp!,{r0,r1,r2,r3,r12}
		
		add	r3, r3, #1
		b	for2tst
		
exit2:
		add	r2, r2, #1
		b	for1tst
		
exit1:
		ldr	r2, [sp, #0]
		ldr	r3, [sp, #4]
		ldr	r6, [sp, #8]
		ldr 	r7, [sp, #12]
		ldr	r10,[sp, #16]
		ldr	r11,[sp, #20]
		ldr	lr, [sp, #24]		
		add	sp, sp, #28
		
		mov	pc, lr
		
.end
