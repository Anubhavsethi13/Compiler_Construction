//Name: Anubhav Sethi
//PRN: 25070521512
%{
#include <stdio.h>
int yylex(void);
int yyerror(const char *s);
int string_to_int(const char *str) {
    int result = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        result = (result * 10) + (str[i] - '0');
    }
    return result;
}
void decimal_to_hex(int num) {
    char hex[100];
    int i = 0;
    int remainder;
    if (num == 0) {
        printf("0x0");
        return;
    }
    while (num != 0) {
        remainder = num % 16;
        if (remainder < 10) {
            hex[i] = remainder + '0';  
        } else {
            hex[i] = remainder - 10 + 'A';  
        }
        i++;
        num = num / 16;
    }
    printf("0x");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
}
%}
%%
[0-9]+ {
    int num = string_to_int(yytext);
    decimal_to_hex(num);
}
.|\n {
    ECHO;
}
%%
int main(void) {
    yylex();
    return 0;
}
int yywrap(void) {
    return 1;
}
int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

