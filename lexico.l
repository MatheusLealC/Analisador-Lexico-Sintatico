/* Nao usar a biblioteca do flex*/
%option noyywrap

%x IN_COMMENT

%{
#include<string.h>

int chars = 1;//contador de char
int token = 0;//contador de token
int lines = 1;//contador de linha
int lines2 = 0;
int chars2 = 1;
int pula_linha = 0;
int i=0;
char *string;

%}

%%

"int"      {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<TYPE_INT>");chars+=strlen(yytext);token++;}
"char"     {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<TYPE_CHAR>");chars+=strlen(yytext);token++;}
"retorne"  {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<RETURN>");chars+=strlen(yytext);token++;}
"parar"    {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<BREAK>");chars+=strlen(yytext);token++;}
"faça"     {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<DO>");chars+=strlen(yytext);token++;}
"enquanto" {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<WHILE>");chars+=strlen(yytext);token++;}
"para"     {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<FOR>");chars+=strlen(yytext);token++;}
"se"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<IF>");chars+=strlen(yytext);token++;}
"senao"    {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<ELSE>");chars+=strlen(yytext);token++;}
"imprime"  {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<PRINT>");chars+=strlen(yytext);token++;}
"leia"     {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<SCAN>");chars+=strlen(yytext);token++;}
"sair"     {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<SAIR>");chars+=strlen(yytext);token++;}
"+"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_SOM>");chars+=strlen(yytext);token++;}
"-"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_SUB>");chars+=strlen(yytext);token++;}
"*"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_MULT>");chars+=strlen(yytext);token++;}
"/"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_DIV>");chars+=strlen(yytext);token++;}
"%"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_RESTO>");chars+=strlen(yytext);token++;}
"++"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_INC>");chars+=strlen(yytext);token++;}
"--"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_DEC>");chars+=strlen(yytext);token++;}
"&"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_AND>");chars+=strlen(yytext);token++;}
"|"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_OR>");chars+=strlen(yytext);token++;}
"~"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_NOT>");chars+=strlen(yytext);token++;}
"^"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_XOR>");chars+=strlen(yytext);token++;}
"!"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<NOT>");chars+=strlen(yytext);token++;}
"&&"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<LOGICAL_AND>");chars+=strlen(yytext);token++;}
"||"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<LOGICAL_OR>");chars+=strlen(yytext);token++;}
"=="       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<EQUAL>");chars+=strlen(yytext);token++;}
"!="       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<NOT_EQUAL>");chars+=strlen(yytext);token++;}
"<"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<LESS_THAN>");chars+=strlen(yytext);token++;}
">"	   {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<GREATER_THAN>");chars+=strlen(yytext);token++;}
"<="       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<LESS_EQUAL>");chars+=strlen(yytext);token++;}
">="       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<GREATER_EQUAL>");chars+=strlen(yytext);token++;}
">>"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<SHIFT_ESQ>");chars+=strlen(yytext);token++;}
"<<"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<SHIFT_DIR>");chars+=strlen(yytext);token++;}
"<-"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_ATRIB>");chars+=strlen(yytext);token++;}
"+="       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_ADD_ATRIB>");chars+=strlen(yytext);token++;}
"-="       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<OP_MINUS_ATRIB>");chars+=strlen(yytext);token++;}
";"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<SEMICOLON>");chars+=strlen(yytext);token++;}
","        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<COMMA>");chars+=strlen(yytext);token++;}
":"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<COLON>");chars+=strlen(yytext);token++;}
"("        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<PARENT_ESQ>");chars+=strlen(yytext);token++;}
")"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<PARENT_DIR>");chars+=strlen(yytext);token++;}
"{"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<CHAVE_ESQ>");chars+=strlen(yytext);token++;}
"}"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<CHAVE_DIR>");chars+=strlen(yytext);token++;}
"["        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<COLCHETE_ESQ>");chars+=strlen(yytext);token++;}
"]"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<COLCHETE_DIR>");chars+=strlen(yytext);token++;}
"?"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<COND_TERN>");chars+=strlen(yytext);token++;}
"#"        {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<NUMBER_SIGN>");chars+=strlen(yytext);token++;}
"->"       {if(pula_linha != 0){printf("\n");}pula_linha=1;printf("<POINTER>");chars+=strlen(yytext);token++;}


[0-9]+              { if(pula_linha!=0) printf("\n"); printf("<NUM_INT, %s>", yytext); chars+= strlen(yytext); pula_linha++; }

'[\\]?(.)'	        { string = malloc(strlen(yytext)*sizeof(char));strcpy(string, yytext); i = 0;
                        while(string[i] != '\0'){string[i] = string[i+1]; i++;} string[i-2] = '\0';
			if(pula_linha!=0) printf("\n"); printf("<CARACTER, %s>",string); chars+= strlen(yytext); pula_linha++;}

\"([^\\\"]|\\.)*\"	{ string = malloc(strlen(yytext)*sizeof(char)); strcpy(string, yytext); i = 0;
			while(string[i] != '\0'){string[i] = string[i+1];i++;} string[i-2] = '\0';
			if(pula_linha!=0) printf("\n"); printf("<STRING, [%s]>",string); chars+= strlen(yytext); pula_linha++;}

[_a-zA-Z][_a-zA-Z0-9]*	{ if(pula_linha!=0) printf("\n"); printf("<ID, %s>",yytext); chars+= strlen(yytext); pula_linha++;}
" "		{ chars+= strlen(yytext); }
"\t"        { chars+= strlen(yytext); }   
"//"(.)*"\n"	{ lines++; chars=1; yylineno++;}
"\n"		{ lines++; chars=1; yylineno++;}


<INITIAL>{
     "/*"  {lines2 = lines; chars2 = chars; chars+=2; }  BEGIN(IN_COMMENT);
     }

<IN_COMMENT>{
     <<EOF>>   { if(pula_linha!=0) printf("\n"); printf("error:lexical:%d:%d: unterminated comment",lines2,chars2); pula_linha++; }BEGIN(INITIAL);
     "*/"      { chars+=2; } BEGIN(INITIAL);
     [^*\n]+   { chars+= strlen(yytext);}
     "*"       { chars+= strlen(yytext);}
     \n        yylineno++;lines++;
     }
\/\/([^\n])*                 { chars += strlen(yytext); }
.       {if(pula_linha!=0) printf("\n"); printf("error:lexical:%d:%d: %s",lines,chars,yytext); chars+= strlen(yytext); pula_linha++; }

%%

int main(int arc, char **argv){
   yylex();
   return 0;
}
