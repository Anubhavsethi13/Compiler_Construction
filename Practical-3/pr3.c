%{
#include<stdio.h>
int count = 0;
%}
%%
[Aa][a-zA-Z]*	{ Count++; }
.|\n		{ /* ignore other characters */ }
%%
int main() {
	yylex();
	printf("Number of Words Starting with 'A' or 'a': %d\n", count);
	return 0;
}
int yywrap() {
    return 1;
 }
