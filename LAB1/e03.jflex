%%
%class e03
%standalone

Comment = \/\*.*\*\/
Instruction = .*;
Scope = \{.*\}
Declaration = \s*{TypeName}\s+{TypeName}\s*
Function = {Declaration}\(({Param}?|({Param}(,{Param})+))\)
Param = Declaration;
TypeName = {Letter}+{Id}*
Letter = [a-zA-Z]
Dir = \<?{Letter}+\.{Letter}+\>?
Id = [a-zA-Z0-9]

Keyword = auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
Preprocessor = \#(include|define|undef|if|ifdef|ifndef|error)\s+{Dir}
%%

{Preprocessor} {System.out.println("Preprocessor: "+yytext());}