%{
	#include "sintatico.h"
	char atomo[100];
%}

identificador [a-zA-Z]([a-zAZ0-9])*
numero	      [0-9]*
espaco        [ \t\r]*
novalinha     [\n]

%%
programa      { return T_PROGRAMA; }
inicio        { return T_INICIO; }
fimprograma   { return T_FIMPROG; }
leia          { return T_LEIA; }
escreva       { return T_ESCREVA; }
se            { return T_SE; }
entao         { return T_ENTAO; }
senao         { return T_SENAO; }
fimse         { return T_FIMSE; }
enquanto      { return T_ENQUANTO; }
faca          { return T_FACA; }
fimenquanto   { return T_FIMENQTO; }

"+"           { return T_MAIS; }
"-"           { return T_MENOS; }
"*"           { return T_VEZES; }
div           { return T_DIV; }

">"           { return T_MAIOR; }
"<"           { return T_MENOR; }
"="           { return T_IGUAL; }

e             { return T_E; }
ou            { return T_OU; }
nao           { return T_NAO; }

"<-"          { return T_ATRIB; }
"("           { return T_ABRE; }
")"           { return T_FECHA; }

inteira       { return T_INTEIRO; }
logico        { return T_LOGICO; }
V             { return T_V; }
F             { return T_F; }

{identificador} { strcpy (atomo, yytext); return T_IDENTIF; }
{numero}        { strcpy (atomo, yytext); return T_NUMERO; }
{espaco}        /*  nada */
{novalinha}     /*  nada */
.               printf("%lls: ERRRO SIMBOLO NAO RECONHECIDO\n", yytext);

%%

int yywrap (void) {return 1;}
