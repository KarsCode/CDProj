%{
#include "parser.tab.h"
#include <stdio.h>
%}

%option noyywrap

DIGIT   [0-9]
ID      [a-zA-Z_][a-zA-Z0-9_]*
NUMBER  {DIGIT}+(\.{DIGIT}+)?

%%

"let"       { return LET; }
"var"       { return VAR;}
"const"     { return CONST; }
"if"        { return IF; }
"else"      { return ELSE; }
"console"   { return CONSOLE; }
"log"       { return LOG; }

"=="        { return EQ; }
"!="        { return NEQ; }
"<="        { return LEQ; }
">="        { return GEQ; }
"<"         { return LT; }
">"         { return GT; }

"="         { return ASSIGN; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }

";"         { return SEMI; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"."         { return DOT; }

{NUMBER}    { yylval = atoi(yytext); return NUMBER; }
{ID}        { return ID; }

[ \t\r\n]+  ;   // Ignore whitespace
"//".*      ;   // Ignore comments
"/*"([^*]|\*+[^*/])*\*+"/" ;  // Ignore multi-line comments

.           { printf("Unknown token: %s\n", yytext); }

%%

