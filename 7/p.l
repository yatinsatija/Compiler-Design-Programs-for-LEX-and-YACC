%{
    #include<stdio.h>
    #include "y.tab.h"
    extern FILE *yyin;
%}

alpha [A-Za-z]
digit [0-9]

%%

[\t \n]             ;
int|float|void|char         return TYPE;
return                 return RETURN;
{digit}+             return NUM;
{alpha}({alpha}|{digit})*     return ID;
.                 return yytext[0];

%%

int yywrap(){
    
}
