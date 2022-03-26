%%
%class e01
%standalone

PathFileName = ({Drive}:)?(\\)?({PathName}\\)*{FileName}(\.{FileType})?
Drive = [a-zA-Z]
PathName = {Id}
FileName = {Id}
FileType = {Id}
Id = ([a-zA-Z]|[0-9])([a-zA-Z]|[0-9])*

%%
{PathFileName} {System.out.println("Path: "+yytext());}