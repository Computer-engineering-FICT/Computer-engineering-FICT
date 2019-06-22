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
            case 'ø':return 'i';
            case 'ô':return 'a';
            case '÷':return 'x';
            case 'ç':return 'p';
            case 'ù':return 'o';
            case 'ñ':return 'c';
            case 'í':return 'y';


            //english ->russian
            case 'y':return 'í';
            case 'i':return 'ø';
            case 'o':return 'ù';
            case 'a':return 'ô';
            case 'x':return '÷';
            case 'c':return 'ñ';
            case 'p':return 'ç';
            default:return in;
        }
    }
}
