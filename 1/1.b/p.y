%{
/* Definition section */
#include<stdio.h>
#include<stdlib.h>
int yylex();
  int yyerror(char *);
%}


%start S
/* Rule Section */
%%
S: A B
 ;
A : 'a' A 'b' 
  |
  ;
B : 'b' B 'c' 
  |
  ;

%%

//driver code
main()
{
printf("enter the string\n");
yyparse();
printf("string is accepted\n");
exit(0);
}


int yyerror(char *msg)
{
printf("invalid string\n");
exit(0);
}