.section .text
.globl _start
_start:
	movq %rsp,%rbp
	movq 16(%rbp),%rdi	#pointer to first cmd_argument
	movq $2,%rax
	movq $0101, %rsi	#create the file if it does not exist already
	movq $0666,%rdx
	syscall

	movq %rax, %rbx
	movq $60, %rax	
	movq $0, %rdi
	syscall
