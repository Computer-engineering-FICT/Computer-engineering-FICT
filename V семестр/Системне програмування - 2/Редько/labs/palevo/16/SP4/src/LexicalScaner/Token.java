package LexicalScaner;

public class Token {
    public static int CONSTANT=3;
    public static int DELIMITER=1;
    public static int TERMINALWORD=2;
    public static int IDENTIFIER=4;
    public String line;
    public int type;    //1-delimiter, 2-terminal word, 3- constant,4-identifier
    public int index;
    public Token(String line1,int type1,int index1) throws IncorectTokenException{
        if(line1==null || type1<1 || type1>4 || index1<0){
            throw new IncorectTokenException();
        }
        line=line1;
        type=type1;
        index=index1;
    }

    public boolean equals(Object token){
        try{
        Token at=(Token)token;
        if(type==at.type){
            if(type==DELIMITER ||type== TERMINALWORD){
                if(index==at.index){
                    return true;
                }else {
                    return false;
                }
            }else{
                return true;
            }
        }
        }catch (Exception e){
            return false;
        }
        return false;
    }

}
