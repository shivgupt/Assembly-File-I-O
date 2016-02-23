.section .text
.globl _start
_start:
	movq %rsp,%rbp
	movq 16(%rbp),%rdi	#pointer to first cmd_argument
	movq $2,%rax
	movq $0101, %rsi	#create the file if it does not exist already
	movq $0666,%rdx
	syscall
	
	movq %rax,%rdi
	movq $1,%rax
	movq 24(%rbp),%rsi	#pointer to second cmd_argument
	movq $5,%rdx		#writes 5 character to the file
	syscall

	movq %rax, %rbx
	movq $60, %rax	
	movq $0, %rdi
	syscall
