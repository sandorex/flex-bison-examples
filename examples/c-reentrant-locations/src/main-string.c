#include "parser.tab.h"
#include "scanner.h"

int main(int argc, char **argv) {
    yyscan_t scanner;
    yylex_init(&scanner);

    YY_BUFFER_STATE buf;
    buf = yy_scan_string("life=42;\n", scanner);

    // parse using the scanner
    yyparse(scanner);

    yy_delete_buffer(buf, scanner);
    yylex_destroy(scanner);

    return 0;
}
