.section .text
.globl _start
_start:
	movq %rsp,%rbp
	subq $8,%rsp		#space for local variable
	movq 16(%rbp),%rdi	#pointer to first cmd_argument
	movq $2,%rax
	movq $0101, %rsi	#create the file if it does not exist already
	movq $0666,%rdx
	syscall
br:
	movq %rax,%rdi
	movq $0,%rax
	leaq -8(%rbp),%rsi	#addres of local buffer
	movq $4,%rdx		#reads first 4 character from the file
	syscall

	movq %rax, %rbx
	movq $60, %rax	
	movq $0, %rdi
	syscall
