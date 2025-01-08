CC 	   = gcc
CFLAGS = -g -L.

all: grammar
	$(CC) $(CFLAGS) -o example-string src/main-string.c src/scanner.c src/parser.tab.c
	$(CC) $(CFLAGS) -o example-stdin src/main-stdin.c src/scanner.c src/parser.tab.c

.PHONY: grammar
grammar:
	bison -d --output=src/parser.tab.c src/parser.y
	flex -o src/scanner.c --header-file=src/scanner.h src/scanner.l

.PHONY: clean
clean:
	rm -f src/scanner.h src/scanner.c src/parser.tab.*

