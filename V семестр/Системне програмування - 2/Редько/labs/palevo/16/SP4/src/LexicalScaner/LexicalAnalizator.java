package LexicalScaner;

import Automat.AutomatesManager;
import table.Record;
import table.Table;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class LexicalAnalizator {
    public AutomatesManager automatesManager;
    public Table delimiters;
    public String[] parts;
    public Token[] tokens;
    public Table identifiers;
    public Table constants;
    public Table terminalWords;
    public LexicalAnalizator(Table delimiters1,Table terminalWords1,AutomatesManager automatesManager1) throws IncorectLexicalAnalizatorException{
        if(automatesManager1==null ||delimiters1==null || terminalWords1==null){
            throw new IncorectLexicalAnalizatorException();
        }
        automatesManager=automatesManager1;
        delimiters=delimiters1;
        terminalWords=terminalWords1;
        identifiers=new Table();
        constants=new Table();
    }
    public void scann(String line) throws InvalidLine{
        if(line==null){
            throw new InvalidLine();
        }
        if(line.length()==0){
            throw new InvalidLine();
        }
        String delimSet=new String();
        for(int i=0;i<delimiters.getRowCount();i++){
            Record record=delimiters.select(i);
            if(record!=null){
                delimSet+=record.field;
            }
        }
        StringTokenizer tokenizer=new StringTokenizer(line,delimSet,true);
        ArrayList<String> tokens=new ArrayList<String>();
        while (tokenizer.hasMoreTokens()){
            tokens.add(tokenizer.nextToken());
        }
        parts=new String[tokens.size()];
        for (int i=0;i<parts.length;i++){
            parts[i]=tokens.get(i);
        }
    }

    public void analize(String line) throws IncorectAnalizeException{
        try{
            scann(line);
        }catch (InvalidLine e){
            throw new IncorectAnalizeException();
        }
        tokens=new Token[parts.length];
        try{
            for(int i=0;i<parts.length;i++){
                Token currentToken;
                int r=delimiters.search(parts[i]);
                if(r!=-1){
                    currentToken=new Token(parts[i],Token.DELIMITER,r);
                    tokens[i]=currentToken;
                    continue;
                }

                r = terminalWords.search(parts[i]);
                if(r!=-1){
                    currentToken=new Token(parts[i],Token.TERMINALWORD,r);
                    tokens[i]=currentToken;
                    continue;
                }
                r=automatesManager.getTokenTypes(parts[i]);
                if(r!=-1){
                    if(r==Token.CONSTANT){
                        int index=(int)constants.insert(new Record(parts[i],null));
                        currentToken=new Token(parts[i],Token.CONSTANT,index);
                        tokens[i]=currentToken;
                        continue;
                    }
                    if(r==Token.IDENTIFIER){
                        int index=(int)identifiers.insert(new Record(parts[i],null));
                        currentToken=new Token(parts[i],Token.IDENTIFIER,index);
                        tokens[i]=currentToken;
                        continue;
                    }
                }else{
                    throw new IncorectAnalizeException();
                }
            }
        }catch (Exception e){
           throw new IncorectAnalizeException();
        }
    }
}
