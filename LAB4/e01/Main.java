import java.io.*;

public class Main{
    static public void main(String argv[]){
        try{
            Yylex I = new Yylex(new FileReader(argv[0]));
            parser p = new parser(I);
            Object result = p.parse();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}