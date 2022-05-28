import java_cup.runtime.*;

%%
%unicode
%cup
%line
%column


%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
	
  }

  
%}
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
integer =  ([1-9][0-9]*|0)
scalar = {double}|{integer}
scalvar = [a-z]
vecvar = [A-Z]


nl = \r|\n|\r\n
ws = [ \t]

%%
"\["     {return symbol(sym.SO);}
"\]"     {return symbol(sym.SC);}
,       {return symbol(sym.CM);}
{scalar} {return symbol(sym.SCALAR, Double.valueOf(yytext()));}
{scalvar} {return symbol(sym.SCALVAR, yytext());}
{vecvar} {return symbol(sym.VECVAR, yytext());}
"\?" {return symbol(sym.IM);}
"\^" {return symbol(sym.EXP);}
"\*" {return symbol(sym.MUL);}
"\/" {return symbol(sym.DIV);}
"\." {return symbol(sym.DOT);}
"\+" {return symbol(sym.PLUS);}
"\-" {return symbol(sym.MINUS);}
"\=" {return symbol(sym.EQ);}
";" {return symbol(sym.S);}

"/*" ~ "*/"     {;}

{ws}|{nl}       {;}

