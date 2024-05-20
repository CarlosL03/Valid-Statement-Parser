README

CS-530, Spring 2024 -- Assignment 3: Statement Parser using flex & bison
Carlos Lopez
REDID: 827117558
Class Acount: cssc4002

Project Grammar:
<stmts> ::= <statement> 
                | <stmts> <statement>

<statement> ::= <assignment> <newline>
                | <expression> <newline>
                | error <newline>
                <newline>;

<assignment> ::= <id> <equ> <expression> <semicolon>

<expression> ::= <term> 
                | <expression> <op> <term>

<term> ::= <id> 
            | <open_paren> <expression> <op> <term> <close_paren>

<op> ::= '-' | '+' | '*' | '/' | '%'

<id> ::= <letter> | <id> <letter> | <id> <digit>

<letter> ::= 'a' | 'b' | ... | 'y' | 'z' | 'A' | 'B' | ...| 'Y' | 'Z'
<digit> ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'

<newline> ::= '\n'
<equ> ::= '='
<semicolon> = ';'
<open_paren> ::= '('
<close_paren ::= ')'


The files included in this project are
    - Makefile: make file used to compile project and create executable
    - scanner.l: 
    - scanner.y
    - README.txt

Compile Instructions
    - By utilizing the Makefile, all that needs to be done to compile is to type
        "make" on the terminal and hit enter on your keyboard.

Operating Instructions:
    - In order to execute the project, it is necessary to then type "./scanner".
    - The input file, scanme.txt, is hardcoded to be opened and read.
    - If the input file is missing from the directory, executing the project will allow
        command line inputs to be parsed.

Design choices/Deficiencies/Lessons Learned:
    - I tried at first to create grammar specifically for invalid expressions and assignments but after 
        countless attempts at changing the lex and rewritting definitions I wasn't able to accomplish
        what I wanted.
    - The yacc file uses the bison built-in error checking that detects and reports syntax errors on
        the statements. It cuts printing the parsed line right where a syntax error was found and as
        such doesn't print the whole statement before printing the type of syntax error.