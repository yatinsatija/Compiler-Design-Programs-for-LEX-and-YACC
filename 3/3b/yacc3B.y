%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char *);
%}
%token FOR
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
ForStmt: FOR '(' Expr ';' Expr ';' Expr ')' Stmt
       | FOR '(' Expr ';' Expr ';' Expr ')' CompoundStmt
       | FOR '(' Expr ')' Stmt
       | FOR '(' Expr ')' CompoundStmt
    ;

%%

#include "lex.yy.c"
main()
{
    printf("Enter the expression:\n");
    yyparse();
 }
 
