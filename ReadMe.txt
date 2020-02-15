Requirements to execute:

Install Ruby: 2.5.7

How to execute:

1. opend CMD
2. unzip the folder "assembler_interpreter"
3. cd assembler_interpreter
4. Run "ruby assembler_interpreter.rb"
5. Enter the list of commands for example:
CASE 1:
		print "START"
		mov ax 2.5+E1
		mov bx 5
		div ax bx
		push ax
		mov ax 100
		pop cx
		mul cx ax
		print cx
		print "Calculation complete"

		'Output Data'
		"START"
		50.0
		"Calculation complete"
CASE 2:
mov dx 5
mov ex 5
add dx ex
print dx
print "Calculation complete"
ERROR: dx is not defined

CASE 3:
mov ax 1
mov bx 0
div ax bx
print ax
print "Calculation complete"
Output data
Infinity

Output data
"Calculation complete"