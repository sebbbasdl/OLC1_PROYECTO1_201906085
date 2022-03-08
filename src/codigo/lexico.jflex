package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
D = [0-9]
SigE = [\]-_\{-\}\[\!-\/\:-\@]
L = [A-Za-z] 
espacios=[ \r\t]+
E = (\\\"|\\\'|\\n)
P = [\"](((\\\")|(\\n)|(\\\'))|[^\\\"\n])*[\"]
comment    =  ("<!"("!"[^>]|[^!]">"|[^><]|"<"[^!]|[^<]"!")*"!>")|(\/\/(.*)*)

%{
    public String lexeme;
%}
%%
{comment} {}
( ":" ) {lexeme=yytext(); return DosPuntos;}
("%%"|("%%"[\n])) {lexeme=yytext(); return DoblePorcentaje}
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
(",") {lexeme=yytext(); return Coma;}

\n {yychar=1;}
{espacios} {}

(SigE) {lexeme=yytext(); return SignosEspeciales;}
{L} {lexeme=yytext(); return Letra;}
{D} {lexeme=yytext(); return Digito;}
"\" \"" {lexeme=yytext(); return Diagonales;}
{P} {lexeme=yytext(); return P;}
{E} {lexeme=yytext(); return Especial;}


. {return ERROR1;}




