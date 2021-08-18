%{
#include<stdio.h>
#include<stdlib.h>
int yyerror(char *)
    int yylex();

in 
int count=0;
%}

%token IF RELOP S NUMBER ID NL

%%
stmt: if_stmt NL {printf("No. of nested if statements=%d\n",count);exit(0);}
;
if_stmt : IF'('cond')''{'if_stmt'}' {count++;}
          |body
;
body : ID '=' E ';' 
     | 
     ;
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | NUMBER
  | ID
  ;
cond: x RELOP x 
;
x:ID | NUMBER
;
%%

int yyerror(char *msg)
{
printf("the statement is invalid\n");
exit(0);
}

main()
{
printf("enter the statement\n");
yyparse();
}



// input format
// if(a>b){if(a>b){if(a>b){s}}} ---> level=3

//if(x>10){if(a<10){if(c<10){z=z*10;}}}
