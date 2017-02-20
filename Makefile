CC = gcc
CFLAGS = -ansi -Wall -g -O0 -Wwrite-strings -Wshadow -fstack-protector-all

.PHONY: = all clean

all: d8sh

clean:
	rm -r *.o d8sh



d8sh: d8sh.o lexer.o parser.tab.o executor.o
	$(CC) *.o -o d8sh



lexer.o: lexer.c lexer.h parser.tab.h
	$(CC) $(CFLAGS) -c lexer.c

parser.tab.o: parser.tab.c parser.tab.h command.h
	$(CC) $(CFLAGS) -c parser.tab.c

executor.o: executor.c executor.h command.h
	$(CC) $(CFLAGS) -c executor.c

d8sh.o: *.c executor.h lexer.h
	$(CC) $(CFLAGS) -c d8sh.c
