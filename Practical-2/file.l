%{
#include <stdio.h>
int comments = 0, keywords = 0, identifiers = 0, words = 0, lines = 1, spaces = 0;
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/"    { comments++; } 
"//".*                        { comments++; } 
[ \t]+                        { spaces += yyleng; } 
\n                            { lines++; }  
"if"|"else"|"while"|"do"|"for"|"switch"|"case"|"break"|"continue"|"return"|"int"|"float"|"char"|"double"|"void"    { keywords++; words++; }
[a-zA-Z_][a-zA-Z0-9_]*        { identifiers++; words++; }
[^ \t\n\a-zA-Z0-9_]+          { words++; }
.                             { /* ignore other stray individual characters */ }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            printf("Error opening file.\n");
            return 1;
        }
        yyin = file;
    }
    
    yylex();
    
    printf("\n--- Analysis Results ---\n");
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Spaces: %d\n", spaces);
    printf("Comments: %d\n", comments);
    printf("Keywords: %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Total Words: %d\n", words);
    
    return 0;
}

