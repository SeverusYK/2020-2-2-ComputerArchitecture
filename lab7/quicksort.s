.text
.global quicksort
.type quicksort, STT_FUNC

quicksort:
	sub	sp, sp, #40
	str 	lr, [sp,#36]
	str	r10, [sp,#32]		
	str	r9, [sp,#28]		
	str	r8, [sp,#24]		
	str	r7, [sp,#20]		
	str	r6, [sp,#16]		
	str	r5, [sp,#12]		
	str	r4, [sp,#8]		
	str	r3, [sp,#4]		
	str	r2, [sp,#0]		
	cmp	r1, r2 
	bge	exit2 
	mov	r5, r1
	mov	r3, r1
	mov	r4, r2

while1st:
	cmp	r3, r4
	bge	exit1
while2nd:
	add	r7, r0, r3, LSL #2
	add	r8, r0, r5, LSL #2 
	ldr	r7, [r7]
	ldr	r8, [r8]
	cmp	r7, r8
	bgt	while3rd
	cmp 	r3, r2
	bge	while3rd
	add	r3, r3, #1
	b	while2nd
while3rd:
	add	r7, r0, r4, LSL #2
	ldr	r7, [r7]
	cmp	r7,r8
	ble	if2nd
	sub	r4, r4, #1
	b 	while3rd
if2nd:
	cmp	r3,r4
	bge	while1st
	add	r7, r0, r3, LSL #2
	add	r9, r0, r4, LSL #2
	ldr	r6, [r7]
	ldr	r10, [r9]
	str	r10, [r7]
	str	r6, [r9]
	b	while1st
exit1:
	add 	r8, r0, r5, LSL #2
	add	r9, r0, r4, LSL #2
	ldr 	r6, [r8]
	ldr	r10, [r9]
	str	r10, [r8]
	str	r6, [r9] 
	stmdb	sp!,{r2-10,lr}
	sub	r4, r4, #1
	mov	r2,r4
	bl	quicksort
	ldmia sp!,{r2-r10,lr}
	stmdb	sp!,{r1,r3-r10,lr}
	add	r4, r4, #1
	mov	r1,r4
	bl 	quicksort
	ldmia sp!,{r1,r3-10,lr}
exit2:
	ldr	r2, [sp,#0] 
	ldr	r3, [sp,#4] 
	ldr	r4, [sp,#8] 
	ldr	r5, [sp,#12] 
	ldr	r6, [sp,#16] 
	ldr	r7, [sp,#20] 
	ldr	r8, [sp,#24] 
	ldr	r9, [sp,#28] 
	ldr	r10, [sp,#32] 
	ldr	lr, [sp,#36] 
	add	sp, sp, #40
	mov	pc, lr

.end
