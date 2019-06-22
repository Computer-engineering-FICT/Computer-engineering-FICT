import java.util.stream.DoubleStream;

public class ChoiceMaking {
    private ExpDistr distr_0;
    private ExpDistr distr_1;
    private double[] variables;
    private double lambda;
    private enum criterias {zero_less_one, zero_greater_one};

    private double priory_probability;
    private int c_1;
    private int c_2;

    private double min_distr_0;
    private double max_distr_0;
    private double min_distr_1;
    private double max_distr_1;

    public ChoiceMaking(ExpDistr zero, ExpDistr one, double P, int C1, int C2){
        distr_0 = zero;
        distr_1 = one;
        priory_probability = P;
        c_1 = C1;
        c_2 = C2;
    }


    public void make_choice() {
        double k = priory_probability * c_1 / ((1-priory_probability) * c_2);
        criterias cases = distr_0.lambda() < distr_1.lambda() ? criterias.zero_less_one : criterias.zero_greater_one;
        double a = Math.log(k * distr_0.lambda() / distr_1.lambda()) / (distr_0.lambda() - distr_1.lambda());
        if (a < 0)
            a = 0;

        switch (cases) {
            case zero_less_one : {
                min_distr_0 = a;
                max_distr_0 = Double.POSITIVE_INFINITY;
                min_distr_1 = 0;
                max_distr_1 = a;
                System.out.println("Range for choosing E(λ0): y ∈ [" + a + "; +inf];");
                System.out.println("Range for choosing E(λ1): y ∈ [0; " + a + "];");
                System.out.println("Type I error probability:  p1 = " + distr_0.definite_integral(min_distr_1, max_distr_1));
                System.out.println("Type II error probability: p2 = " + distr_1.definite_integral(min_distr_0, max_distr_0));
                break;
            }
            case zero_greater_one : {
                min_distr_0 = 0;
                max_distr_0 = a;
                min_distr_1 = a;
                max_distr_1 = Double.POSITIVE_INFINITY;
                System.out.println("Range for choosing E(λ0): y ∈ [0; " + a + "];");
                System.out.println("Range for choosing E(λ1): y ∈ [" + a + "; +inf];");
                System.out.println("Type I error probability:  p1 = " + distr_0.definite_integral(min_distr_1, max_distr_1));
                System.out.println("Type II error probability: p2 = " + distr_1.definite_integral(min_distr_0, max_distr_0));
                break;
            }
        }
    }

//    public void test() {
//        int numbers_num = 1000;
//        double[] generated_0 = new double[numbers_num];
//        double[] generated_1 = new double[numbers_num];
//        int errors_1_num = 0;
//        int errors_2_num = 0;
//        for (int i = 0; i < numbers_num; i++) {
//            generated_0[i] = distr_0.nextNum();
//            generated_1[i] = distr_1.nextNum();
//            if ((generated_0[i] > max_distr_0) || (generated_0[i] < min_distr_0))
//                errors_1_num++;
//            if (generated_1[i] > max_distr_1 || generated_1[i] < min_distr_1)
//                errors_2_num++;
//        }
//        System.out.println("Experimentally defined error type I probability:  p1 = " + (double)errors_1_num/numbers_num);
//        System.out.println("Experimentally defined error type II probability: p2 = " + (double)errors_2_num/numbers_num);
//    }

    public void test(double[] input_0, double[] input_1, double P, int C1, int C2) {
        double sum_0 = 0;
        double sum_1 = 0;
        for (double i: input_0) {
            sum_0+=i;
        }
        for (double i: input_1) {
            sum_1+=i;
        }
        double expectation_0 = sum_0/input_0.length;
        double expectation_1 = sum_1/input_1.length;
        double lambda_0 = 1.0/expectation_0;
        double lambda_1 = 1.0/expectation_1;
        double k = P * C1 / ((1-P) * C2);
        criterias cases = lambda_0 < lambda_1 ? criterias.zero_less_one : criterias.zero_greater_one;
        double a = Math.log(k * lambda_0 / lambda_1) / (lambda_0 - lambda_1);
        if (a < 0)
            a = 0;
        double min_0 = 0;
        double max_0 = 0;
        double min_1 = 0;
        double max_1 = 0;
        switch (cases) {
            case zero_less_one : {
                min_0 = a;
                max_0 = Double.POSITIVE_INFINITY;
                min_1 = 0;
                max_1 = a;
                break;
            }
            case zero_greater_one : {
                min_0 = 0;
                max_0 = a;
                min_1 = a;
                max_1 = Double.POSITIVE_INFINITY;
                break;
            }
        }
        int first_type_errors = 0;
        int second_type_errors = 0;
        for (double i : input_0) {
            if (i > max_0 || i < min_0)
                first_type_errors+=1;
        }
        for (double i : input_1) {
            if (i > max_1 || i < min_1)
                second_type_errors += 1;
        }
        System.out.println("λ0 = " + lambda_0 + "; λ1 = " + lambda_1);
        System.out.println("Range for choosing E(λ0): y ∈ [" + min_0 + "; " + max_0 + "];");
        System.out.println("Range for choosing E(λ1): y ∈ [" + min_1 + "; " + max_1 + "];");
        System.out.println("Type I error probability:  p1 = " + (double)first_type_errors/input_0.length);
        System.out.println("Type II error probability: p1 = " + (double)second_type_errors/input_1.length);
    }
}
