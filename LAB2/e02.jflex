%%
%class e02
%standalone
%unicode
%caseless

%{
    public int tags_count=0;
    public int tabletags_count=0;
    public int h1_count=0;
    public int h2_count=0;
    public int h3_count=0;
    public int h4_count=0;
%}

%eof{
    System.out.println("");
    System.out.println("");
    System.out.println("Total number of tags: "+tags_count);
    System.out.println("Total number of table tags: "+tabletags_count);
    System.out.println("Total number of h1 tags: "+h1_count);
    System.out.println("Total number of h2 tags: "+h2_count);
    System.out.println("Total number of h3 tags: "+h3_count);
    System.out.println("Total number of h4 tags: "+h4_count);
%eof}

Comment = \<\!\-\-.*\-\-\>[\n]*
Tag = \<~\>
H1 = (\<h1\>)|(\<\/h1\>)
H2 = (\<h2\>)|(\<\/h2\>)
H3 = (\<h3\>)|(\<\/h3\>)
H4 = (\<h4\>)|(\<\/h4\>)
TABLE = (\<table ~\>)|(\<\/table\>)

%%

{Comment} {;}
{H1} {tags_count++; h1_count++; System.out.print(yytext());}
{H2} {tags_count++; h2_count++; System.out.print(yytext());}
{H3} {tags_count++; h3_count++; System.out.print(yytext());}
{H4} {tags_count++; h4_count++; System.out.print(yytext());}
{TABLE} {tags_count++; tabletags_count++; System.out.print(yytext());}
{Tag} {tags_count++; System.out.print(yytext());}