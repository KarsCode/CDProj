bison -d parser.y  # Generate the parser.tab.c and parser.tab.h
flex lexer.l       # Generate the lex.yy.c
gcc lex.yy.c parser.tab.c -o parser -lfl  # Compile everything


Issues: 
No String recognition ( Ex: console.log("Test") will throw an error )
Error with line count of error not updating correctly
