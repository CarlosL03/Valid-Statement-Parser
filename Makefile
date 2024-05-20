###########################################################
# Makefile for CS530 - Assignment 3
# Carlos Lopez
###########################################################

BB = bison
FF = flex
CC = gcc
BFLAGS = -d
CFLAGS = -ly -ll

scanner: scanner.l scanner.y
	$(BB) $(BFLAGS) scanner.y
	$(FF) scanner.l
	$(CC) scanner.tab.c lex.yy.c $(CFLAGS) -o scanner

clean:
	rm scanner scanner.tab* lex.yy.c

#######################[ EOF: Makefile ]###################
