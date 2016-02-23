.section .data
file_name:
.string "sample.txt\0"	#hard coded file name
data:
.ascii "Hello World\0"	#hard coded text to be written onto the file

.section .text
.globl _start
_start:
	movq %rsp,%rbp
	movq $file_name,%rdi	#pointer to hard coded file name
	movq $2,%rax
	movq $0101, %rsi	#create the file if it does not exist already
	movq $0666,%rdx
	syscall
	
	movq %rax,%rdi
	movq $1,%rax
	movq $data,%rsi		#pointer to hard coded text
	movq $11,%rdx
	syscall

	movq %rax, %rbx
	movq $60, %rax	
	movq $0, %rdi
	syscall
