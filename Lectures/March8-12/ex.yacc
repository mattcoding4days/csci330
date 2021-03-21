 /* part 1: declarations */


 /* C setup code: libraries, prototypes, etc */

%{
#include <stdio.h>
#include <string.h>
int yylex(void);
int yywrap();
int yyerror(char* s);
%}


 /* begin processing the top-level component */
%start program

 /*
    union of all the data types used by yylval, with a unique name,
    currently I'm just treating all the yylvals as longs
 */
%union { long info; }

 /* identify the valid token types, all have yylval type long */
%token<long> INT PRINT OPENSCOPE CLOSESCOPE
 /* Non terminals */
%type<long> program statement

 /* part 2: grammar rules */

%%

program: OPENSCOPE statement CLOSESCOPE
    ;

statement: PRINT INT
    ;

 /* part 3: supporting programs */

%%

 /* begin parsing */

int main() {
    printf("Compilation begins\n\n");
    /* yyparse is auto generated */
    int res = yyparse();

    return res;
}
