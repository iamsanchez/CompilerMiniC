package lexico;

import java.io.*;


%%
%public

%class Yylex

%unicode

%line

%column

%type String
%%
"0x"[0-9A-F]+

{ return "numero_hexadecimal " + yytext() + " en linea: "+yyline+ " columna "+yycolumn ;

}

"0"[0-7]+ {return "numero_octal " + yytext() + " en linea: "+yyline+ " columna "+yycolumn;

}

[0-9]+	{return "numero_entero " + yytext() + " en linea: "+yyline+ " columna "+yycolumn;

}

[a-zA-Z]+

{ return "identificador " + yytext() + " en linea: "+yyline+ " columna "+yycolumn ;

}

[ \n] { // lleva la cuenta de lineas

}

[\t\r\f]+ { // accion vacia: se ignoran los espacios y tabuladores

}

.	{ // token desconocido: se produce un mensaje de error

return "Error Lexico: lexema " + yytext() + " no_valido en linea: "+yyline+ " columna "+yycolumn ;

}