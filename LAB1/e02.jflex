%%
%class e02
%standalone

URL = ({Scheme}\/\/)?{Domain}
Scheme = [a-z]+:
Domain = {Address}+ {Port}? (\/(({Letter}|{Hex})+))* (\/({Letter}+\.{Letter}+(\#{Id}+)?)?)?
Hex = \%[a-eA-E0-9][a-eA-E0-9]
Address = {IPAddress}|{Name}
Name = ({Letter}+(\.{Letter}+)+) 
IPAddress = [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+
Letter = [a-zA-Z]
Id = [a-zA-Z0-9]
Port = :[0-9]+
%%

{URL} {System.out.println("URL: "+yytext());}