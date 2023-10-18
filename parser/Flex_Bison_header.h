#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

/* from lexer */
extern char* yytext;
extern int yylex();
extern int yylineno; 
extern FILE *yyin;

typedef struct YYLTYPE
{
int first_line;
int first_column;
int last_line;
int last_column;
} YYLTYPE;

//Declaration
void yyerror(const char *s);
void checkNumInstances(const char * msg, int* currentinstance, const int maxInstances);
void lowerNumInstances(const char * msg, int* currentinstance, const int maxInstances);
void lyyerror(YYLTYPE t, const char *s);

