#for report
.text
.global matrix         
         
matrix:
	stmfd sp!, {r0-r12,lr}

	mov	r6,#0									
	mov	r7,#0									
	mov	r8,#0									
	mov	r9,#0

Loop:
	mov	r4, r6, LSL #2
	add	r10, r4, r0	
	ldr	r11,[r10]	
	add	r11,r11,r7,LSL #2				

	ldr	r12,[r11]							

	mov	r4,r7,LSL #2
	add	r10, r4, r1
	ldr	r11, [r10]
	add	r11,r11,r8,LSL #2	
	
	ldr	r11,[r11]							
	mul	r12,r11,r12						
	add	r9, r9, r12
	add	r7,r7,#1							

	ldr	r5, [r3,#4]
	cmp	r7,r5
	bne	Loop
	mov	r7,#0								
	
	mov	r4,r6,LSL #2
	add	r10, r4, r2
	ldr	r11,[r10]
	add	r11,r11,r8,LSL #2

	str	r9,[r11]

	mov	r9,#0

	add	r8,r8,#1
	ldr	r5, [r3, #8]
	cmp	r8, r5
	bne	Loop

	mov	r8,#0								
	
	add	r6,r6,#1
	ldr	r5,[r3] 
	cmp	r6,r5
	bne	Loop	

	ldmfd sp!, {r0-r12,pc}
	
.end
		
		
