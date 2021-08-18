%{
#include<stdio.h>
int keywords,identifier,operator ;
%}


id [a-zA-Z_]
%%


"while"|"if"|"else" {keywords++;}


"int"|"float" {keywords++;}


"<="|"=="|"="|"++"|"-"|"*"|"+"|"<"|">" {operator++;}

[0-9]+{id}* ;

{id}[a-zA-Z0-9_]* {identifier++;}

. ;


%%


int main(int argc,char* argv[])

{
    
	yyin=fopen(argv[1],"r");
	yylex();
	
	printf("\n keywords = %d\n", keywords);
    printf("\n identifier = %d\n", identifier);
    printf("\n operator = %d\n", operator);
	
}

int yywrap(){}
