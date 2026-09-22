//Anubhav Sethi  PRN: 25070521512
%{
#include <stdio.h>
%}

%%
.*COM\n     { printf("MATCHED: %s", yytext); }
.*\n        { /* Ignore lines that do not end with COM */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text line by line (Press Ctrl+D on a blank line to stop):\n\n");
    yylex();
    return 0;
}

