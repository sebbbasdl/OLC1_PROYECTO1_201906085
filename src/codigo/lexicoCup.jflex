package codigo;
import java_cup.runtime.Symbol; 
import java.util.ArrayList;
import java.util.List;
import codigo.tablaErrores;

%% 
%class Lexico
%public
%line
%char
%cup 
%unicode
%ignorecase
%{
    public List<tablaErrores> tablaE1 = new ArrayList<>();
    public int contador = 1;
%}

%init{ 
    yyline = 1;
    yychar = 1;
%init}
D = [0-9]
SigE = [\]-_\{-\}\[\!-\/\:-\@]
L = [A-Za-z] 
espacios=[ \r\t]+
E = (\\\"|\\\'|\\n)
C = [\"](((\\\")|(\\n)|(\\\'))|[^\\\"\n])*[\"]
comment    =  ("<!"("!"[^>]|[^!]">"|[^><]|"<"[^!]|[^<]"!")*"!>")|(\/\/(.*)*)

%%
{comment} {}
 


//---> Notacion para expresiones regulares

"+" {return new Symbol(sym.UnoOMas,yyline,yychar, yytext());} 
"-" {return new Symbol(sym.Guion,yyline,yychar, yytext());} 
"*" {return new Symbol(sym.CeroOMas,yyline,yychar, yytext());} 
 "|" {return new Symbol(sym.Disyuncion,yyline,yychar, yytext());}
"?" {return new Symbol(sym.CeroOUna,yyline,yychar, yytext());} 

//---->Simbolos importantes y uso de expresiones reg para analisis Lexico
"CONJ" {return new Symbol(sym.Conjunto,yyline,yychar, yytext());}
":" {return new Symbol(sym.DosPuntos,yyline,yychar, yytext());}
("%%"|("%%"[\n])) {return new Symbol(sym.DoblePorcentaje,yyline,yychar, yytext());}
(";"|(";"[\n])) {return new Symbol(sym.PuntoComa,yyline,yychar, yytext());}
"." {return new Symbol(sym.Punto,yyline,yychar, yytext());}
"," {return new Symbol(sym.Coma,yyline,yychar, yytext());}
">" {return new Symbol(sym.Mayorque,yyline,yychar, yytext());}
":" {return new Symbol(sym.DosPuntos,yyline,yychar, yytext());}
"{" {return new Symbol(sym.LlaveAbierta,yyline,yychar, yytext());} 
"}" {return new Symbol(sym.LlaveCierra,yyline,yychar, yytext());} 
"~" {return new Symbol(sym.GuionCurvo,yyline,yychar, yytext());}
\n {yychar=1;}
{espacios} {}
{SigE} {return new Symbol(sym.SignosEspeciales,yyline,yychar, yytext());}
{L} {return new Symbol(sym.Letra,yyline,yychar, yytext());}
{D} {return new Symbol(sym.Digito,yyline,yychar, yytext());}
"\" \"" {return new Symbol(sym.Diagonales,yyline,yychar, yytext());}
{C} {return new Symbol(sym.Cadena,yyline,yychar, yytext());}
{E} {return new Symbol(sym.Especial,yyline,yychar, yytext());}

. {

    tablaErrores errortabla1 = new tablaErrores(contador, "Error Léxico", "Este caracter : "+yytext()+" NO pertenece a este lenguaje", yyline, yychar);

    contador++;

    tablaE1.add(errortabla1);
}
