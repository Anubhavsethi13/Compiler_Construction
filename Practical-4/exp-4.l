%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

[0-9]+  { return NUM; }
[ \t]   { /* Skip spaces and tabs */ }
\n      { return 0; }   /* Tell parser to evaluate when Enter is pressed */
.       { return yytext[0]; } /* Return single characters like +, *, (, and ) */

%%

int yywrap() {
    return 1;
}

