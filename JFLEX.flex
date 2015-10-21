package lexico;
import java_cup.runtime.Symbol;


%%


%cup
%full
%line
%char
%ignorecase
%column
%eofval{
	return new Symbol(sym.EOF,new String("Fin del archivo"));
%eofval}
InputCharacter = [^\r\n]
Comment = {TraditionalComment}|{EndOfLineComment}
TraditionalComment = "/*" [^*]+ "*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}*  
LineTerminator = \r|\n|\r\n
Number= [0-9][0-9]*
Identifier = [_a-zA-Z][_a-zA-Z0-9]*
conststr = \"([a-zA-z_\-\d\s\r\n\t])*\"
constchar = \'[a-zA-Z0-9]\'
emptySpace = [\n\r\t ]


%%
<YYINITIAL>{
	/*keywords*/
        "main"          { return new Symbol(sym.MAIN, yycolumn, yyline, yytext());}
        "if"          { return new Symbol(sym.IF,yycolumn,yyline,yytext());}
        "else"         {  return new Symbol(sym.ELSE,yycolumn,yyline,yytext());}        
        "for"            {return new Symbol(sym.FOR,yycolumn,yyline,yytext());}        
        "while"       {return new Symbol(sym.WHILE,yycolumn,yyline,yytext());}    
        "break"         {return new Symbol(sym.BREAK,yycolumn,yyline,yytext());}    
        "return"         {return new Symbol(sym.RETURN,yycolumn,yyline,yytext());}        
        "void"           {return new Symbol(sym.VOID,yycolumn,yyline,yytext());}
        "int"           {return new Symbol(sym.INT,yycolumn,yyline,yytext());}
        "char"           {return new Symbol(sym.CHAR,yycolumn,yyline,yytext());}
        "string"       {return new Symbol(sym.STRING,yycolumn,yyline,yytext());} 
        "scanf"         {return new Symbol(sym.SCANF,yycolumn,yyline,yytext());}
        "printf"         {return new Symbol(sym.PRINTF,yycolumn,yyline,yytext());}
        "\"%d"\"        {return new Symbol(sym.DFLAG,yycolumn,yyline,yytext());}
        "\"%s\""        {return new Symbol(sym.SFLAG,yycolumn,yyline,yytext());}
        "\"%c\""         {return new Symbol(sym.CFLAG,yycolumn,yyline,yytext());}         

        /*Arithmetic Operators*/
        "+"             {return new Symbol(sym.PLUS,yycolumn,yyline,yytext());}        
        "++"             {return new Symbol(sym.PLUSPLUS,yycolumn,yyline,yytext());}        
        "-"              {return new Symbol(sym.MINUS,yycolumn,yyline,yytext());}
        "--"             {return new Symbol(sym.MINUSMINUS,yycolumn,yyline,yytext());}
        "*"              {return new Symbol(sym.MULT,yycolumn,yyline,yytext());}
        "/"              {return new Symbol(sym.DIV,yycolumn,yyline,yytext());}

        /*Relational Operators*/                
        "!="           {return new Symbol(sym.NOTEQ,yycolumn,yyline,yytext());}
        "=="            {return new Symbol(sym.EQEQ,yycolumn,yyline,yytext());}
        ">"             {return new Symbol(sym.GT,yycolumn,yyline,yytext());}
        "<"             {return new Symbol(sym.LT,yycolumn,yyline,yytext());}
        ">="             {return new Symbol(sym.GTEQ,yycolumn,yyline,yytext());}
        "<="            {return new Symbol(sym.LTEQ,yycolumn,yyline,yytext());}
         
        /*Logical Operators*/
        "||"            {return new Symbol(sym.OROR,yycolumn,yyline,yytext());}
        "&&"            {return new Symbol(sym.ANDAND,yycolumn,yyline,yytext());}
        "!"             {return new Symbol(sym.NOT,yycolumn,yyline,yytext());}
        "|"             {return new Symbol(sym.OR,yycolumn,yyline,yytext());}
        "&"             {return new Symbol(sym.AND,yycolumn,yyline,yytext());}    

        /*Assignment Operators*/
        "="             {return new Symbol(sym.EQ,yycolumn,yyline,yytext());}
        "+="            {return new Symbol(sym.PLUSEQ,yycolumn,yyline,yytext());}
        "-="             {return new Symbol(sym.MINUSEQ,yycolumn,yyline,yytext());}
        "*="            {return new Symbol(sym.MULTEQ,yycolumn,yyline,yytext());}
        "/="             {return new Symbol(sym.DIVEQ,yycolumn,yyline,yytext());}
        
        ";"           {return new Symbol(sym.SEMICOLON,yycolumn,yyline,yytext());}
        ","              {return new Symbol(sym.COMMA,yycolumn,yyline,yytext());}                 
        "{"             {return new Symbol(sym.LBRACE,yycolumn,yyline,yytext());}
        "}"             {return new Symbol(sym.RBRACE,yycolumn,yyline,yytext());}
        "("             {return new Symbol(sym.LPAREN,yycolumn,yyline,yytext());}
        ")"            {return new Symbol(sym.RPAREN,yycolumn,yyline,yytext());}
        "["            {return new Symbol(sym.LBRACK,yycolumn,yyline,yytext());}
        "]"             {return new Symbol(sym.RBRACK,yycolumn,yyline,yytext());}
        

     


}
        {conststr}      { return new Symbol(sym.CONSTSTR,yycolumn,yyline,yytext());}
        {Comment}       { /*ignore*/}
        {emptySpace}    { /*ignore*/}
        {Number}        {return new Symbol(sym.Number,yycolumn,yyline,yytext()); }        
        {constchar}     { return new Symbol(sym.CONSTCHAR,yycolumn,yyline,yytext());}  
        {Identifier}    {return new Symbol(sym.IDENTIFIER,yycolumn,yyline,yytext());}
        .               {System.out.println("Unexpected token: \'"+yytext()+"\' at: "+yyline);}