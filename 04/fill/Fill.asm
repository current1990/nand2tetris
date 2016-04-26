// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

// 256 * 512 / 16 = 8192
// Staring from 0 so offset is in [0, 8192)

(MAINLOOP)
@KBD
D=M

@CLEAR
D; JEQ

@FILL
D; JNE

@MAINLOOP
D; JMP

(CLEAR)
//Set initial offset to 8191
@8191
D=A

@offset
M=D

(CLRLOOP)
@offset
D=M

// Set M[SCREEN+OFFSET] = 0
@SCREEN
D=D+A
// A = SCREEN + offset
A=D
M=0

// offset--
@offset
M=M-1
D=M

@CLRLOOP
D; JGE

// Return
@MAINLOOP
D; JMP


(FILL)
//Set initial offset to 8191
@8191
D=A

@offset
M=D

(FILLLOOP)
@offset
D=M

@SCREEN
D=D+A
A=D
M=-1

@offset
M=M-1
D=M


@FILLLOOP
D; JGE

@MAINLOOP
D; JMP
