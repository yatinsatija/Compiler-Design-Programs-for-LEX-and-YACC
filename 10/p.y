%{/*declaration part*/
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
#include<string.h>
#define MAX 100 /*to store productions*/
int getREindex ( const char* );
signed char productions[MAX][MAX];
int count = 0 , i , j;
char temp[200] , temp2[200];
%}
%token ALPHABET
%left '|'
%left '.'
%nonassoc '*' '+'
%%/*rules section*/
S : re '\n' { 
printf ( "This is the rightmost derivation--\n" );
for ( i = count - 1 ; i >= 0 ; --i ) {
    if ( i == count - 1 ) {
        printf ( "\nre => " );
        strcpy ( temp , productions[i] );
        printf ( "%s" , productions[i] );
    }
    else {
        printf ( "\n => " );
        j = getREindex ( temp );    
        temp[j] = '\0';
        sprintf ( temp2 , "%s%s%s" , temp , productions[i] , (temp + j + 2) );
        printf ( "%s" , temp2 );
        strcpy ( temp , temp2 );
    }
}
printf ( "\n" );
exit ( 0 ); 
}
re : ALPHABET { 
temp[0] = yylval; temp[1] = '\0';
strcpy ( productions[count++] , temp );/*copy the input to the prodcution array*/
}/*only conditions defined here will be valid, this is the structure*/
| '(' re ')' /*adds the (expression) to the production array*/
{ strcpy ( productions[count++] , "(re)" ); }
| re '*'     
{ strcpy ( productions[count++] , "re*" ); }
| re '+' /*adds expression+ type to the production array*/
{ strcpy ( productions[count++] , "re+" ); }
| re '|' re /*adds the expression|expression to the production array*/
{strcpy ( productions[count++] , "re | re" );}
| re '.' re/*adds the expression.expression to the production array*/ 
{strcpy ( productions[count++] , "re . re" );}
;
%%
int main ( int argc , char **argv ) 
{
/* 
Parse and output the rightmost derivation,
from which we can get the parse tree 
*/
    yyparse();/*calls the parser*/
    return 0;
}

int yylex() /*calls lex and takes each character as input and feeds ALPHABET to check for the structure*/
{
    signed char ch = getchar(); 
    yylval = ch;
    if ( isalpha ( ch ) )
        return ALPHABET;
    return ch;
}

yyerror() /*Function to alert user of invalid regular expressions*/
{
    fprintf(stderr , "Invalid Regular Expression!!\n");
    exit ( 1 );
}

int getREindex ( const char *str ) 
{ 
    int i = strlen ( str ) - 1;
    for ( ; i >= 0 ; --i ) {
        if ( str[i] == 'e' && str[i-1] == 'r' )
        return i-1;
    }
}


// input 
// a+|b*|(b.c)*
