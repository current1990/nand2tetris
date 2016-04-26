// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


// i = lhs(R0)
@R0
D=M

@i
M=D

// j = rhs(R1)
@R1
D=M

@j
M=D

// M[R2] = 0
@R0
D=A

@R2
M=D

// Multi
(LOOP)

// if lhs == 0, GOTO END
@i
D=M

@END
D; JEQ

@ADD
D; JGT

@MINUS
D; JLT

(ADD)
// R2 = R2 + j
@j
D=M

@R2
M=M+D

//i = i - 1
@i
M=M-1

@LOOP
M; JMP

(MINUS)
// R2 = R2 - j
@j
D=M

@R2
M=M-D

//i = i + 1
@i
M=M+1

@LOOP
M; JMP

(END)
@END
0; JEQ
