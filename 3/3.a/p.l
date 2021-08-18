%{
    #include<stdio.h>
    int single,multi;
%}


start \/\*

end \*\/


%%


\/\/(.*) {fprintf(yyout,"");single++;} 


{start}.*[\n]*{end} {fprintf(yyout,"");multi++;} 

%%

/*Driver function*/
int main(int k,char **argcv)
{
yyin=fopen(argcv[1],"r");
yyout=fopen("out.c","w");
/*call the yylex function.*/
yylex();
printf("number of single line : %d\n",single);
printf("number of multi line : %d",multi);
return 0;
}

int yywrap(){}
