package table;

public class StringComparator {
    public int compare(String patern,String line){
        String p=patern.toLowerCase();
        String l=line.toLowerCase();
        int res=0;
        int size=p.length();
        if(size>l.length()){
            size=l.length();
        }
        for(int i=0;i<size;i++){

            if(p.charAt(i)==l.charAt(i)){
                res++;
            }else {
                if(p.charAt(i)==convertLanguage(l.charAt(i))){
                    res++;
                }
            }
        }
        return res;
    }

    public char convertLanguage(char in){
        switch (in){
            //russian->english
            case '�':return 'i';
            case '�':return 'a';
            case '�':return 'x';
            case '�':return 'p';
            case '�':return 'o';
            case '�':return 'c';
            case '�':return 'y';


            //english ->russian
            case 'y':return '�';
            case 'i':return '�';
            case 'o':return '�';
            case 'a':return '�';
            case 'x':return '�';
            case 'c':return '�';
            case 'p':return '�';
            default:return in;
        }
    }
}
