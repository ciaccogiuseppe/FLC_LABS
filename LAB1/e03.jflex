%%
%class e03
%standalone

%init{
    System.out.println("<HTML>\n<BODY bgcolor=\"#FFFFFF\">\n<CODE>");
%init}

%eof{
    System.out.println("<BR></CODE></BODY></HTML>");
%eof}

Comment = \/\* ~ \*\/
Space = [\s\t]+
Define = \#define{Space}{ID}
Elif = \#elif{Space}.+
Else = \#else
Endif = \#endif
Error = \#error
If = \#if{Space}.+
Ifdef = \#ifdef{Space}{ID}
Ifndef = \#ifndef{Space}{ID}
Import = \#import{Space}{IncludePath}
Line = \#line{Space}.+
Pragma = \#pragma{Space}.+
Undef = \#undef{Space}{ID}
Using = \#using({Space}{ID})+
Include = \#include{Space}{IncludePath}

IncludePath = \<~\>|\"~\"
Preprocessor = {Define}|{Elif}|{Else}|{Endif}|{Error}|{If}|{Ifdef}|{Ifndef}|{Include}|{Import}|{Line}|{Pragma}|{Undef}|{Using}
Keyword = auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
ID = [_a-zA-Z][_a-zA-Z0-9]*

Number = [0-9]+
Nl = \r\n|\r|\n


%%

{Comment} {System.out.print("<FONT COLOR=\"#C0C0C0\">" + yytext() + "</FONT>");}
{Preprocessor} {System.out.print("<FONT COLOR=\"#C000C0\">" + yytext().replace("<", "&lt").replace(">", "&gt") + "</FONT>");}
{Keyword} {System.out.print("<FONT COLOR=\"#0000FF\">" + yytext() + "</FONT>");}
{ID}      {System.out.print(yytext());}
{Number}  {System.out.print("<FONT COLOR=\"#FF0000\">" + yytext() + "</FONT>");}
{Nl} {System.out.print("<BR>");}
.   {System.out.print(yytext().replace(" " ,"&nbsp"));}