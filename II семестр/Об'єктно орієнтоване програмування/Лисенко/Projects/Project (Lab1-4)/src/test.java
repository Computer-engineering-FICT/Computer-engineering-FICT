public class test {
    public static void main(String[] args) {
        String[] ms = new String[3];
        int i =0;
        ms[0]= "zxc";
        for (String s: ms){
            if (s!=null){
                i+=s.length();
            }
        }
        System.out.print(i);
    }
}
