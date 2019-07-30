%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%%
"imprimir"				   {return print;}
"sair"				   {return exit_command;}
[a-zA-Z]			   {yylval.id = yytext[0]; return identifier;}
[1-9][0-9]*            {yylval.num = atoi(yytext); return number;}
[ \t\n]                ;
[-+=*/;]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

