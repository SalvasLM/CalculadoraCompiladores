%{
    #include <stdio.h>
    #include "y.tab.h"
    #include "math.h"
    void yyerror(char *);
%}

%option noyywrap

DIGIT [0-9]
NUM {DIGIT}+
POWER "**"

%%

{NUM} { yylval = atoi(yytext); return NUMBER; }
[-()+*/;] { return *yytext; }
"conta" { return CONTA;}
{POWER} { return POWER; }
"&" { return AND; }
"|" { return OR; }
"^" { return XOR; }
">>" { return SHIFT_RIGHT; }
"<<" { return SHIFT_LEFT; }
"~" { return NOT; }
"(int)" { return CAST; }
[[:blank:]] ;
. yyerror("Caracter invalido");

%%