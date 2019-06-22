package Automat;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class LoadAutomateTable {
    public static AutomatTable load(String fileName) throws IOException,IncorectFileException{
        BufferedReader in;
        AutomatTable automatTable;
        ArrayList<String> lines=new ArrayList<String>();
        String type="";
        try{
            in = new BufferedReader(new InputStreamReader(new FileInputStream(fileName)));

            boolean fl=false;
            while (in.ready()) {
                String s = in.readLine();
                if(fl){
                    lines.add(s);
                }else{
                    fl = true;
                    type=s;
                }
            }
            in.close();
        }catch (IOException e) {
            throw new IOException("Cann't read file");
        }
        if(lines.size()<0){
            throw new IncorectFileException();
        }
        String[][] table=new String[lines.size()][lines.size()];
        for(int i=0;i<lines.size();i++){
            String s=lines.get(i);
            int st=0;
            while (true){
                int stBr=s.indexOf("(");
                int stFBr=s.indexOf(" )");
                String num=s.substring(st,stBr);
                int n=Integer.valueOf(num);
                String value=s.substring(stBr+1,stFBr);
                table[i][n]=value;
                s=s.substring(stFBr+2,s.length());
                if(s.length()==0){
                    break;
                }
            }
        }
        /*for(int i=0;i<table.length;i++){
            for(int j=0;j<table[0].length;j++){
                System.out.print(table[i][j]+"  ");
                if(table[i][j]!=null){
                    System.out.print("length="+table[i][j].length());
                }
            }
            System.out.println();
        } */
        String paternStrart=" start position=";
        String paternEnd=" end position=";
        int stPos=type.indexOf(paternStrart);
        int typeInt=Integer.valueOf(type.substring(0,stPos));
        type=type.substring(stPos+paternStrart.length(),type.length());
        int endPos=type.indexOf(paternEnd);
        int startPosition=Integer.valueOf(type.substring(0, endPos));
        type=type.substring(endPos+paternEnd.length(),type.length());
        ArrayList<Integer> positions=new ArrayList<Integer>();
        while (true){
            int colPos=type.indexOf(",");
            if(colPos!=-1){
                positions.add(Integer.valueOf(type.substring(0,colPos)));
                type=type.substring(colPos+1,type.length());
            }
           // System.out.println("type="+type);
            if(type.indexOf(",")==-1){
                positions.add(Integer.valueOf(type));
                break;
            }
        }
        int[] endposVar=new int[positions.size()];
        for(int i=0;i<positions.size();i++){
            endposVar[i]=positions.get(i);
            //System.out.println("position="+endposVar[i]);
        }
        try{
            automatTable=new AutomatTable(table,startPosition,endposVar,typeInt);
        }catch (InvalidTableException e){
            throw new IncorectFileException();
        }
        return automatTable;
    }
}
