%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"

extern int yylineno;  // Declare yylineno to access line number
extern int yylex(void);  // Declare yylex to avoid implicit declaration
%}

%token LET VAR CONST IF ELSE CONSOLE LOG EQ NEQ LT GT LEQ GEQ ASSIGN PLUS MINUS MUL DIV SEMI LBRACE RBRACE LPAREN RPAREN DOT NUMBER ID

%%

Program:
    StmtList
    ;

StmtList:
    Stmt StmtList
    | /* empty */
    ;

Stmt:
    VarDeclStmt
    | AssignStmt
    | PrintStmt
    | IfStmt
    | Block
    ;

VarDeclStmt:
    LET ID ASSIGN Expr SEMI
    | CONST ID ASSIGN Expr SEMI
    | VAR ID ASSIGN Expr SEMI
    ;

AssignStmt:
    ID ASSIGN Expr SEMI
    ;

PrintStmt:
    CONSOLE DOT LOG LPAREN Expr RPAREN SEMI
    ;

IfStmt:
    IF LPAREN BoolExpr RPAREN Block ElsePart
    ;

ElsePart:
    ELSE Block
    | /* empty */
    ;

Block:
    LBRACE StmtList RBRACE
    ;

BoolExpr:
    Expr RelOp Expr
    ;

RelOp:
    EQ
    | NEQ
    | LT
    | GT
    | LEQ
    | GEQ
    ;

Expr:
    Expr PLUS Term
    | Expr MINUS Term
    | Term
    ;

Term:
    Term MUL Factor
    | Term DIV Factor
    | Factor
    ;

Factor:
    LPAREN Expr RPAREN
    | NUMBER
    | ID
    ;

%%

int yyerror(char *s) {
    fprintf(stderr, "Syntax error: %s at line %d\n", s, yylineno);
    return 0;
}

int main() {
    if (yyparse() == 0) {  // Check if parsing is successful
        printf("Parsing successful!\n");
    }
    return 0;
}
