%{
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]

%%

[\t \n]             ;
int|float|void|char         return TYPE;
return                 return RETURN;
{digit}+             return NUM;
{alpha}({alpha}|{digit})*     return ID;
for     return FOR;
.                 return yytext[0];


%%
int yywrap()
{ return 1; }
