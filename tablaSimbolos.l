%{
	int yylineno;
	int err;
	#define RESERVADA	1;
	#define TIPO_DATOS	2;
	#define NUM		8;
	#define ID		3;
	#define LIB		4;
	#define BLOQUE_OP	5;
	#define OP		6;
	#define CADENA		7;
%}
letra [a-zA-Z]
digito [0-9]
id {letra}({letra}|{digito})*
lib {id}(".h")
bloque "<"|">"|"("|")"|"{"|"}"
op	"#"|";"|","|"&"|"="|"-"|":"|"%"|"."|"\\"

%%
(i|I)(n|N)(t|T)				return TIPO_DATOS;
(d|D)(o|O)(u|U)(b|B)(l|L)(e|E)		return TIPO_DATOS;
(f|F)(l|L)(o|O)(a|A)(t|T)		return TIPO_DATOS;
(l|L)(o|O)(n|N)(g|G)			return TIPO_DATOS;
(s|S)(h|H)(o|O)(r|R)(t|T)		return TIPO_DATOS;
(b|B)(y|Y)(t|T)(e|E)			return TIPO_DATOS;
(b|B)(o|O)(o|O)(l|L)(e|E)(a|A)(n|N)	return TIPO_DATOS;
(c|C)(h|H)(a|A)(r|R)			return TIPO_DATOS;
(p|P)(r|R)(i|I)(n|N)(t|T)		return RESERVADA;
(r|R)(e|E)(t|T)(u|U)(r|R)(n|N)		return RESERVADA;
("\"")([^\n\"]*([.])*)*("\"")		return CADENA;
\n					yylineno++;
%%
int main(){
	int token;
	token = yylex();
	while(token){
		printf("Line: %d \tToken: %d \tLexema: %s \n",yylineno,token,yytext);
		token = yylex();
	}
	return 0;
}
