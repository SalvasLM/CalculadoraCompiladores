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
INCREMENT "++"
DECREMENT "--"

%%
{NUM}+"."{NUM}+ { yylval = atof(yytext); return NUMBER; }
{NUM}+ { yylval = atoi(yytext); return NUMBER; }
{NUM} { yylval = atoi(yytext); return NUMBER; }
[-()+*/;] { return *yytext; }
"conta" { return CONTA;}
{POWER} { return POWER; }
{INCREMENT} {return INCREMENT;}
{DECREMENT} {return DECREMENT;}
"&" { return AND; }
"|" { return OR; }
"^" { return XOR; }
">>" { return SHIFT_RIGHT; }
"<<" { return SHIFT_LEFT; }
"~" { return NOT; }
[[:blank:]] ;
. yyerror("Caracter invalido");

%%