package Automat;

public class AutomatTable {
    public int typeSolution;
    public String[][] table;
    public int startPosition;
    public int[] endPositions;
    public AutomatTable(String[][] table1,int startPosition1,int[] endPositions1,int typeSolution1) throws InvalidTableException{
        if(table1==null || endPositions1==null){
            System.out.println("table or end position null");
            throw new InvalidTableException();
        }
        if(table1.length==0 || endPositions1.length==0){
            System.out.println("table or end position size incorect");
            throw new InvalidTableException();
        }
        if(table1.length!=table1[0].length){
            System.out.println("table size incorect");
            throw new InvalidTableException();
        }
        if(startPosition1<0 || startPosition1>table1.length){
            System.out.println("start position incorect");
            throw new InvalidTableException();
        }
        for(int i=0;i<endPositions1.length;i++){
            if(endPositions1[i]<0 || endPositions1[i]>table1.length){
                System.out.println("end position incorect");
                throw new InvalidTableException();
            }
        }
        typeSolution=typeSolution1;
        table=table1;
        startPosition=startPosition1;
        endPositions=endPositions1;
    }

    public int check(String line){
        if(line==null){
            return -1;
        }
        if(line.length()==0){
            return -1;
        }
        int stepCount=0;
        boolean haveFind;
        int currentPos=startPosition;
        for(int i=0;i<line.length();i++){
            haveFind=false;
            for (int j=0;j<table.length;j++){
                if(table[currentPos][j]!=null){
                    if(table[currentPos][j].indexOf(line.charAt(i))>-1){
                        currentPos=j;
                        stepCount++;
                        haveFind=true;
                        break;
                    }
                }
            }
            if(!haveFind){
                for (int j=0;j<endPositions.length;j++){
                    if(endPositions[j]==currentPos){
                        return stepCount;
                    }
                }
                return -1;
            }

        }
        return stepCount;
    }
}
