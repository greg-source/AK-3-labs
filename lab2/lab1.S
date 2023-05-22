.global lab1
.syntax unified
#define A #4
#define B #16

#define C #3
lab1:
	push {lr}
	mov r0, A
	mov r1, B
	mov r2, C
	bl calc
	pop {pc}
calc:
	push { r4, r5, lr }
	sub r3, r0, r1
	cmp r3, #0
	it ge
	addge r3, r1, r0
	sdiv r3, r2
	pop { r4, r5, lr }
