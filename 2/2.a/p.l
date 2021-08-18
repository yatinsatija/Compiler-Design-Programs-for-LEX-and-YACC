%{
#include<stdio.h>
int pf,nf,p,n;
%}

digit [0-9]+

%%
{digit}+ {p++;}
-{digit}+ {n++;}
{digit}*\.{digit}+  {pf++;}
-{digit}*\.{digit}+  {nf++;}
{digit}+\/{digit}+  {pf++;}
-{digit}+\/{digit}+  {nf++;}
\n return 0;
%%

int main(){
    yylex();
    printf("-----------------------\n");
    printf("postive numbers=%d\n",p);
    printf("postive fractions=%d\n",pf);
    printf("negative numbers=%d\n",n);
    printf("negative fractions=%d\n",nf);
}

int yywrap(){

}