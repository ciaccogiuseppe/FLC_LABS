%%
%class e01
%standalone
%unicode

WS = [\ \t]
NL = \r|\n|\r\n
Comment = \/\*.*\*\/
Keyword = if|else|while|print
Type = int|double
CO = \{
CC = \}
SO = \[
SC = \]
RO = \(
RC = \)
S = \;
EQ = \=
PLUS = \+
MINUS = \-
STAR = \*
DIV = \/
LT = \<
GT = \>
LEQ = \<\=
GEQ = \>\=
EQL = \=\<
EQG = \=\>
AND = \&
OR = \|
NOT = \!
ID = [_a-zA-Z][_a-zA-Z0-9]*
Int = [+-]?([1-9][0-9]*|0)
Double = [+-]?([0-9]*[.])?[0-9]+


%%
{Comment} {;}
{Keyword} {System.out.print(yytext().toUpperCase()+" ");}
{Type} {System.out.print(yytext().toUpperCase()+"_TYPE ");}
{CO} {System.out.print("CO ");}
{CC} {System.out.print("CC ");}
{SO} {System.out.print("SO ");}
{SC} {System.out.print("SC ");}
{RO} {System.out.print("RO ");}
{RC} {System.out.print("RC ");}
{EQ} {System.out.print("EQ ");}
{PLUS} {System.out.print("PLUS ");}
{MINUS} {System.out.print("MINUS ");}
{STAR} {System.out.print("STAR ");}
{DIV} {System.out.print("DIV ");}
{LT} {System.out.print("LT ");}
{GT} {System.out.print("GT ");}
{LEQ} {System.out.print("LEQ ");}
{GEQ} {System.out.print("GEQ ");}
{EQL} {System.out.print("EQL ");}
{EQG} {System.out.print("EQG ");}
{AND} {System.out.print("AND ");}
{OR} {System.out.print("OR ");}
{NOT} {System.out.print("NOT ");}
{S} {System.out.print("S ");}
{ID} {System.out.print("ID:"+yytext()+" ");}
{Int}  {System.out.print("INT:"+yytext()+" ");}
{Double}  {System.out.print("DOUBLE:"+yytext()+" ");}


{WS}  {;}
{NL}  {;}