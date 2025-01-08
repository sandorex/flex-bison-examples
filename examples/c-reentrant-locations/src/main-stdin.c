#include "parser.tab.h"
#include "scanner.h"

int main(int argc, char **argv) {
    yyscan_t scanner;
    yylex_init(&scanner);
    yyparse(scanner);
    yylex_destroy(scanner);

    return 0;
}
