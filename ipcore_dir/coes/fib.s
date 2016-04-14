mov r0,#4			@fib starting from 1 -- i.e 1,1,2,3
mov r1,#0
mov r2,#1

mov r3,#0

foo:
	add r3,r3,#1
	add r4,r1,r2
	mov r1,r2
	mov r2,r4
	cmp r3,r0
	bne foo

mov r0,r1