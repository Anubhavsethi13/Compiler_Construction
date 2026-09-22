%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUM

%%

E : E '+' T
  | T
  ;

T : T '*' F
  | F
  ;

F : '(' E ')'
  | NUM
  ;

%%

int yyerror(const char *s) { 
    printf("Invalid Expression\n");
    return 0;
}

int main() {
    printf("Enter Expression: ");
    
    if (yyparse() == 0) {
        printf("Valid Expression\n");
    }
    
    return 0;
}

