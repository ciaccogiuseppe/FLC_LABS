import java_cup.runtime.*;
%%
%unicode
%cup

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
C = \,
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
AND = \&&
EQEQ = \=\=
OR = \|\|
NOT = \!
ID = [_a-zA-Z][_a-zA-Z0-9]*
Int = [+-]?([1-9][0-9]*|0)
Double = [+-]?([0-9]*[.])?[0-9]+


%%
{Comment} {;}
while       {return new Symbol(sym.WHILE);}
if          {return new Symbol(sym.IF);}
else        {return new Symbol(sym.ELSE);}
print       {return new Symbol(sym.PRINT);}
int         {return new Symbol(sym.INT_TYPE);}
double      {return new Symbol(sym.DOUBLE_TYPE);}
{CO}        {return new Symbol(sym.CO);}
{CC}        {return new Symbol(sym.CC);}
{SO}        {return new Symbol(sym.SO);}
{SC}        {return new Symbol(sym.SC);}
{RO}        {return new Symbol(sym.RO);}
{RC}        {return new Symbol(sym.RC);}
{EQ}        {return new Symbol(sym.EQ);}
{PLUS}      {return new Symbol(sym.PLUS);}
{MINUS}     {return new Symbol(sym.MINUS);}
{STAR}      {return new Symbol(sym.STAR);}
{DIV}       {return new Symbol(sym.DIV);}
{LT}        {return new Symbol(sym.LT);}
{GT}        {return new Symbol(sym.GT);}
{LEQ}       {return new Symbol(sym.LEQ);}
{GEQ}       {return new Symbol(sym.GEQ);}
{EQL}       {return new Symbol(sym.EQL);}
{EQG}       {return new Symbol(sym.EQG);}
{EQEQ}      {return new Symbol(sym.EQEQ);}
{AND}       {return new Symbol(sym.AND);}
{OR}        {return new Symbol(sym.OR);}
{NOT}       {return new Symbol(sym.NOT);}
{S}         {return new Symbol(sym.S);}
{C}         {return new Symbol(sym.C);}
{ID}        {/*System.out.print("ID:"+yytext()+" ")*/       return new Symbol(sym.ID);}
{Int}       {/*System.out.print("INT:"+yytext()+" ")*/      return new Symbol(sym.INT);}
{Double}    {/*System.out.print("DOUBLE:"+yytext()+" ")*/   return new Symbol(sym.DOUBLE);}


{WS}  {;}
{NL}  {;}