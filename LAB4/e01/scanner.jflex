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
integer =  ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

variable = [A-Z_][A-Za-z0-9_]*
atom = [a-z][A-Za-z0-9_]* | {double} | {integer}

nl = \r|\n|\r\n
ws = [ \t]

%%

"("     {return symbol(sym.RO);}
")"     {return symbol(sym.RC);}
"\:\-"    {return symbol(sym.RUL);}
,       {return symbol(sym.CM);}
"\?\-"    {return symbol(sym.INT);}
"\."       {return symbol(sym.DOT);}
{atom}    {return symbol(sym.ATOM);}
{variable} {return symbol(sym.VAR);}


"/*" ~ "*/"     {;}

{ws}|{nl}       {;}

