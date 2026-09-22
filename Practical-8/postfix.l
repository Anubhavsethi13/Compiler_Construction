%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+*/]      { return yytext[0]; }
[ \t]+      ; /* Skip whitespace */
\n          { return '\n'; }
.           { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}
//NAME: Anubhav Sethi  PRN:25070521512
