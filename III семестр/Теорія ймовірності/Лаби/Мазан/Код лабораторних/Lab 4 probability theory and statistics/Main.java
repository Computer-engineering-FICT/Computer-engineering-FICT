public class Main {

    public static void main(String[] args) {
        ExpDistr zero = new ExpDistr(1);
        ExpDistr one = new ExpDistr(0.2);
        ChoiceMaking choose = new ChoiceMaking(zero,one,0.5,1,1);
        choose.make_choice();
        //System.out.println("\n");
        //choose.test(new double[]{0.1, 12,5,6,4,8,2,3,45}, new double[]{0.8, 4,5,6,4}, 0.5,2,1);
    }
}
