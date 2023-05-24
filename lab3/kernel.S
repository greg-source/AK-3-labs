.syntax unified
.cpu cortex-m4
.thumb
#define A #17
#define B #4
#define C #3

// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
    .word __stack_start 
    .word __kernel_reset__+1
    .size vtable_kernel, .-vtable_kernel

.section .rodata
    data: .asciz "kernel started!\n"
    final: .asciz "Value in register #4: "
.section .text
__kernel_reset__:
    ldr r0, =data
    bl dbgput_line
    
// Calculation start
    mov r0, A
    mov r1, B
    mov r2, C
    sub r3, r0, r1
    cmp r3, #0
    it ge
    addge r3, r1, r0
    sdiv r3, r3, r2
// Calculation end

ldr r0, =final
    bl dbgput
    mov r0, r3
    bl dbgput_num
    
    end:
    b end


