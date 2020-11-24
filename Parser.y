%{
	
	#include <conio.h>
	#include <string.h>
	#include <stdlib.h>
	#include <ctype.h>
	
	#include <stdio.h>
	extern int yylex(void);
	extern void yyerror(char*);

%}
%token INICIO
%token FIN
%token LEER
%token ESCRIBIR
%token ASIGNACION
%token PARENIZQUIERDO
%token PARENDERECHO
%token COMA
%token PUNTOYCOMA
%token SUMA
%token RESTA
%token IDENTIFICADOR
%token CONSTANTE
%token FDT

%start programa

%%
programa: INICIO listaSentencias FIN FDT ;

listaSentencias: sentencia
		| sentencia listaSentencias
		;

sentencia: IDENTIFICADOR ASIGNACION expresion PUNTOYCOMA			
	| LEER PARENIZQUIERDO listaIdentificadores PARENDERECHO PUNTOYCOMA	
	| ESCRIBIR PARENIZQUIERDO listaExpresiones PARENDERECHO PUNTOYCOMA
	;


listaIdentificadores:  IDENTIFICADOR
			| IDENTIFICADOR COMA listaIdentificadores
			;

listaExpresiones: expresion
		| expresion COMA listaExpresiones
		;

expresion: primaria					
	|  primaria operadorAditivo expresion
	;


primaria: IDENTIFICADOR
	| CONSTANTE 
	| PARENIZQUIERDO expresion PARENDERECHO
	;

operadorAditivo: SUMA 
		| RESTA;

%%

int main() {
yyparse();
}
void yyerror (char *s){
printf ("%s\n",s);
}
int yywrap()  {
  return 1;  
} 

