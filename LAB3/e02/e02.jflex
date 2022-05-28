import java_cup.runtime.*;
%%
%unicode
%cup

ISBN = [\d]{2}\-[\d]{2}\-{HEX}{5}\-{END}
HEX = [0-9ABCDEF]
END = [0-9A-Z]

INT = [1-9][0-9]*
COLLOCATION = (LI|LS){WS}(AV|BO|SO){WS}{INT}{WS}[A-Z]?
LOAN = {DATE}{WS}{ISBN}
DATE = {DD}\/{MM}\/{AAAA}
DD = (0[1-9])|([1-2][0-9])|(3[0-1]);
MM = (0[1-9])|(1[0-2])
AAAA = [0-9]{4}
NAME = \"~\"

BOOK = {ISBN}{WS}\:{WS}{NAME}{WS}\:{WS}{INT}{WS}(\:{WS}{COLLOCATION})?
C = ,
S = ;
CC = :
SEPARATOR =\%\%
LISTBEG = \-\>

WS = [\s\t]*
NL = \r|\n|\r\n

%%

{NAME} {return new Symbol(sym.NAME);}
{ISBN} {return new Symbol(sym.ISBN);}
{COLLOCATION} {return new Symbol(sym.COLLOCATION);}
{INT} {return new Symbol(sym.INT);}
{LISTBEG} {return new Symbol(sym.LISTBEG);}
{C} {return new Symbol(sym.C);}
{CC} {return new Symbol(sym.CC);}
{S} {return new Symbol(sym.S);}
{SEPARATOR} {return new Symbol(sym.SEP);}
{DATE} {return new Symbol(sym.DATE);}

{WS}  {;}
{NL}  {;}