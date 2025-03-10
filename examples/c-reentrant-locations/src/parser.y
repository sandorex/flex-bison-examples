%{
#include "stdio.h"
#include "parser.tab.h"
#include "scanner.h"

void yyerror (YYLTYPE*, yyscan_t, char const*);
%}

%lex-param { void* scanner }
%parse-param { void* scanner }

%locations
%define api.pure full

%define parse.trace
%define parse.error verbose

%union {
  int num;
  char* str;
}

%token END 0
%token <str> STRING
%token <num> NUMBER

/* note the following is not a good practice but just example code */
%%

assignment:
    STRING '=' NUMBER ';' END            { printf( "(assign %s %d)", $1, $3 ); }
|   STRING '=' NUMBER '+' NUMBER ';' END { printf( "(assign %s (%d + %d))", $1, $3, $5 ); }
|   STRING '=' NUMBER '-' NUMBER ';' END { printf( "(assign %s (%d - %d))", $1, $3, $5 ); }
|   STRING '=' NUMBER '/' NUMBER ';' END { printf( "(assign %s (%d / %d))", $1, $3, $5 ); }
|   STRING '=' NUMBER '*' NUMBER ';' END { printf( "(assign %s (%d * %d))", $1, $3, $5 ); }
|   STRING '=' NUMBER '%' NUMBER ';' END { printf( "(assign %s (%d %% %d))", $1, $3, $5 ); }
;

%%

void yyerror (YYLTYPE *location, yyscan_t scanner, char const *s) {
    fprintf(stderr, "%s\n", s);
}
