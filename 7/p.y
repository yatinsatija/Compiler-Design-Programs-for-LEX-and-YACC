%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
extern FILE* yyin;
%}
%token TYPE RETURN ID NUM
%right "="
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%

S    : FUN {printf("Input accepted\n"); exit(0);}
FUN    : TYPE ID '(' PARAM ')' '{' BODY '}'     
      ;
PARAM    : PARAM ',' TYPE ID
    | TYPE ID
    |
    ;         
BODY    : BODY BODY
    | PARAM ';'
    | E ';'        
        | RETURN E ';'
        |
    ;              
E    : ID '=' E
    | E '+' E
    | E '-' E
    | E '*' E
    | E '/' E       
    | ID
    | NUM   
    ;

%%

int main()
{
    yyin=fopen("inp.txt","r");
    printf("reading from file inp.txt:\n");
    yyparse();
    exit(0);
 }

 int yyerror(){
     printf("Invalid\n");
     exit(0);
 }