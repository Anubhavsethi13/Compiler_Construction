%{
  //Name:Anubhav Sethi PRN:25070521512
  #include<stdio.h>
%}
%%
one|ONE|One	printf("1");
two|TWO|Two	printf("2");
three|THREE|Three		printf("3");
four|FOUR|Four		printf("4");
%%
int main()
{
  yylex();
  return 0;
 }
