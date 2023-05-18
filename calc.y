%{
    #include <stdio.h>
    #include "math.h"
    int yylex(void);
    void yyerror(char *s);
%}

%token NUMBER CONTA POWER AND OR XOR SHIFT_LEFT SHIFT_RIGHT NOT

%start INICIO
%left '+' '-'
%left '*' '/'
%right POWER
%left AND
%left XOR
%left OR
%left SHIFT_LEFT SHIFT_RIGHT
%left NOT

%%  
    INICIO
        : CONTA '(' Expr ')' ';'
        {
            printf("\nResultado=%d\n", $3);
            return 0;
        }
    ;

    Expr
        : Expr '+' Expr
        {
            $$ = $1 + $3;
        }

        | Expr '-' Expr
        {
            $$ = $1 - $3;
        }

        | Expr '/' Expr
        {
            $$ = $1 / $3;
        }

        | Expr '*' Expr
        {
            $$ = $1 * $3;
        }

        | Expr POWER Expr
        {
            $$ = pow($1, $3);
        }

        | Expr AND Expr
        {
            $$ = $1 & $3;
        }

        | Expr OR Expr
        {
            $$ = $1 | $3;
        }

        | Expr XOR Expr
        {
            $$ = $1 ^ $3;
        }

        | Expr SHIFT_LEFT Expr
        {
            $$ = $1 << $3;
        }

        | Expr SHIFT_RIGHT Expr
        {
            $$ = $1 >> $3;
        }

        | NOT Expr
        {
            $$ = ~$2;
        }

        | NUMBER
        {
            $$ = $1;
        }
    ;
%%

int main()
{
    return(yyparse());

}

void yyerror(char *s){
    printf("\n%s\n", s);
}

int yywrap(){
    return 1;
}