%{
#include<stdio.h>
#include "y.tab.h"
extern char* yytext;
%}

%%
'a'  return 'a';
'b' return 'b';
'c' return 'c';
.  {return yytext[0];}
\n return 0;
%%

int yywrap(){}
