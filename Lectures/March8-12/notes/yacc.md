# Yacc (Yet another compiler compiler) Lecture


## yacc and parsing

* yacc allows us to describe the parsing rules of a language using context free grammars.

* It also allows us to specify what information to record and other actions to take once
  a rule is applied in a derivation.
  
* The actions taken and information recorded is done using C (e.g. we can use C functions,
  structs, data types etc..)
  
* Together with lex tokenizing code, yacc allows us to generate a full analysis tool
  for a specified language.
 
## yacc file organization

* A yacc file is divided into three core sections, seperated by '%%'

  - The 1st section is used to define token types, and for C library includes,
    prototypes, and typedefs
    
  - The 2nd section is used for the actual parsing rules and code to be applied
    when a derivation rule is applied
    
  - The 3rd and final section contains regular C code, typically the implementations
    for any functions prototyped in the first section
    
## declarations section

* yylex is auto generated for us, while yyerror and yywrap are defined in the .lex file

* if we wish to access variables defined in the .lex file we need to declare them as externals
  in the %{...  %}
  
* we can prototype additional C functions, as long as the full implementation is in the bottom
  section of the .yacc file
  
## declarations section: types, tokens

* We need to identify the available yylval data types and token types, and associate a data type
  with each token type
  
* yylval is a union of all the possible yylval types with a name for each, e.g. an int, a char*,
  or a struct of two ints
  
``` c
/*
  access the members like this in lex file: 
  yylval.id
  yylval.Finfo.num 
  
  NOTE: in the yacc file there is no need to refer to members through
  yylval, you can just access them directly, like:
  
  id
  str
*/

%union {
  int id;
  char* str;
  
  struct Finfo {
    int num;
    int den;
  } fract;
}
```

* We list each tyupe of token with its associated type
  - %token<int> FOOTOKEN, INTEGER
  - %token<char*> IDENTIFIER
  - %token<struct Finfo> FRACTION


## Declarations: non terminals

* We also need to provide a type and name for each non-terminal in our context free grammar

* The types get included in the union we declared earlier

* The non-terminals are usually denoted in lowercase ( as opposed to the terminals in uppercase )

* We also need to identify the "top level" non-terminal
  - %start program

  
## Declarations: associativity

* Finally, in the declarations section we can specify the associativity
  of operators (left-to-right or right-to-left)
  
* We give the list of tokens corresponding to the operators
  - %right ASSIGN
  - %left ADD MULT DIV SUB

* This ends the declarations section


## Augmented CFG parsling rules

* The second section (after the %%) gives the CFG rules

* Each rule will be a non-terminal, a colon, the sequence of terminals
  and non-terminals it is made up of, and then a code block to be executed
  when applying the rule, and a final semi-colon. two possible rules for a list
  of statements
  
``` c
statement_list: statement
  { printf("one statement\n"); } 
  ;
  
statement_list: statement statement_list
  { printf("more statements to go...\n"); }
  ;
```



