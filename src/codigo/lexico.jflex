package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
Linea=[\n]

%{
    public String lexeme;
%}
%%
{espacio} {/*Ignore*/}
( "//"(.)* ) {/*Ignore*/}
( Linea ) {return Linea;}
( "\"" ) {lexeme=yytext(); return Comillas;}
( "\'" ) {lexeme=yytext(); return ComillaSimple;}
( ":" ) {lexeme=yytext(); return DosPuntos;}
( ";" ) {lexeme=yytext(); return PuntoComa;}
( "CONJ" ) {lexeme=yytext(); return Conjunto;}
( "{" ) {lexeme=yytext(); return LlaveAbierta;}
( "}" ) {lexeme=yytext(); return LLaveCierra;}
( "-" ) {lexeme=yytext(); return Guion;}
( ">" ) {lexeme=yytext(); return Mayorque;}
( "~" ) {lexeme=yytext(); return GuionCurvo;}
( "." ) {lexeme=yytext(); return Punto;}
("|") {lexeme=yytext(); return Disyuncion;}
( "+" ) {lexeme=yytext(); return UnoOMas;}
( "*" ) {lexeme=yytext(); return CeroOMas;}
( "?" ) {lexeme=yytext(); return CeroOUna;}

( "!" ) {lexeme=yytext(); return Exclamacion;}
( "#" ) {lexeme=yytext(); return Numeral;}
( "$" ) {lexeme=yytext(); return Dolar;}
( "%" ) {lexeme=yytext(); return Porcentaje;}
( "&" ) {lexeme=yytext(); return Ampersand;}
( "(" ) {lexeme=yytext(); return ParentesisA;}
( ")" ) {lexeme=yytext(); return ParentesisC;}
( "," ) {lexeme=yytext(); return Coma;}
( "/" ) {lexeme=yytext(); return BarraIncl;}
( "<" ) {lexeme=yytext(); return Menorque;}
( "=" ) {lexeme=yytext(); return Igual;}
( "@" ) {lexeme=yytext(); return Arroba;}
( "[" ) {lexeme=yytext(); return CorcheteAbierto;}
( "]" ) {lexeme=yytext(); return CorcheteCerrado;}
( "_" ) {lexeme=yytext(); return GuionBajo;}
( "^" ) {lexeme=yytext(); return Elevado;}
( "`" ) {lexeme=yytext(); return Acento;}
{L}({L})* {lexeme=yytext(); return Identificador;}
( "->" ) {lexeme=yytext(); return Asignacion;}
( "<!" ) {lexeme=yytext(); return ComentarioAbierto;}
( "!>" ) {lexeme=yytext(); return ComentarioCerrado;}
({L}{L}|{D}|{espacio}|{Linea})* {lexeme=yytext(); return Texto;}
. {return ERROR;}



