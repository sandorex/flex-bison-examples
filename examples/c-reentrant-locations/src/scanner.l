%{
#include "parser.tab.h"
%}

%option noyywrap
%option reentrant
%option bison-bridge bison-locations

%%

[[:digit:]]+ { yylval->num = atoi(yytext); return NUMBER; }
[[:alnum:]]+ { yylval->str = strdup(yytext); return STRING; }
"="|"+"|"-"|"/"|"%"|";" { return yytext[0]; }
. {}

%%
