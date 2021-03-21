 /* ---- part 1: declarations ---- */


 /* ---- part 1a: any character sets we want to identify ---- */
ALPHA [a-zA-Z]
DIGIT [0-9]
SKIP [ \t\n]
 /* ---- part 1b: the C setup ---- */
%{
#include <stdio.h>
#include "y.tab.h"


extern YYSTYPE yylval;
int yywrap();
int yyerror(char* s);
%}
%%

 /* ---- part 2: token rules ---- */
 /* yytext will hold each lhs value */

({DIGIT})+ { return(INT); }

"{"     { return(OPENSCOPE); }
"}"     { return(CLOSESCOPE); }

"print" { return(PRINT); }

 /* identify any characters that should be skipped, e.g tabs, space*/
({SKIP})    { }

 /* anything else is an error, return it as a token so the yacc rules can deal with it*/
.   { char errmsg[] = "Bad char: x"; 
      errmsg[10] = yytext[0];
      yyerror(errmsg);
      return (yytext[0]); }
%%
 /* cleanup code , yywrap will be called automatically at the end */
int yywrap() { return(1); }

 /* process any error messages generated */
int yyerror(char* s)
{
    printf("ERROR: %d", s);
}
