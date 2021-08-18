# COMPILER DESIGN LAB PROGRAMS

Hello Everyone ,<br/>
These are some of the Compiler Design Programs taught in our college as a part of 6 semester, you can find the Aim of each of the program in the below given image. Also follow down the instructions to install LEX and YACC in your systems alongised the commands required to run the programs.<br/>

![Questions](https://github.com/yatinsatija/Compiler-Design-Programs-for-LEX-and-YACC/blob/main/compilerTopics.png)

<br/>

## Follow these commands to install LEX and YACC on your systems

### Windows

Follow the below given link https://techapple.net/2014/07/flex-windows-lex-and-yacc-flex-and-bison-installer-for-windows-xp788-1/ <br/>

### Linux

1. Open a terminal. To do this, use the keyboard shortcut (Ctrl + Alt + T).
2. To install Lex (Flex), use the command:
   `sudo apt install flex`
3. To install YACC (Bison), use the command:
   `sudo apt install bison`

## Follow these commands to run these programs on your system

1. Open Terminal and Navigate to the Directory where you have saved the files.
2. To compile Lex file type:
   `lex <filename>.l`
3. To compile YACC file type:
   `yacc -d <filename>.y`
4. Build the Lex and Yacc file using gcc/cc command:
   `cc lex.yy.c y.tab.h -ll`
5. Get the output :
   `./a.out`
