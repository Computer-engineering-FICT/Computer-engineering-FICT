import java.util.LinkedList;

public class Handler {

    Generator generator;
    double averageTimeFIFO;
    double dispersionFIFO;
    double relaxationTimeFIFO;
    double ratioFIFO;
    double currencyFIFO;
    double averageTimeRR;
    double dispersionRR;
    double relaxationTimeRR;
    double ratioRR;
    double currencyRR;
    double functionFIFO;
    double functionRR;
    double lamd;
    double lamb1;
    double lamd2;
    double p;
    int n = 100;

    Handler(double a0, double a1, double a2, double a3, double a4){
        generator = new Generator(a0, a1, a2, a3, a4);
        lamd = a0;
        p = a3;
        lamb1 = a1;
        lamd2 = a2;
    }
    void generateTime(double genTime) {
        n = (int)genTime;
        generator.generateTime(genTime);

    }

    void generateSteps(int count) {
        n = count;
        generator.generateSteps(count);

    }


    void hand(){
        LinkedList<double[]> tasks = generator.getTasks();
        for(int i=0;i<tasks.size();i++){
            averageTimeFIFO+=(tasks.get(i)[4]-tasks.get(i)[0]);
            relaxationTimeFIFO+=(tasks.get(i)[3]-tasks.get(i)[0]);
            ratioFIFO+=tasks.get(i)[2];
            averageTimeRR+=(tasks.get(i)[7]-tasks.get(i)[0]);
            relaxationTimeRR+=(tasks.get(i)[6]-tasks.get(i)[0]);
            ratioRR+=tasks.get(i)[5];
        }
        relaxationTimeFIFO=relaxationTimeFIFO/tasks.size();

        ratioFIFO=ratioFIFO/tasks.size();
        /*
            Тупо формулки й рандом для примарної похибки
         */
        currencyFIFO=lamd/ratioFIFO + (Math.random()/(double) n) + (Math.random()/(double) 100) + (Math.random()/(double) 1000);
        averageTimeFIFO=(ratioFIFO/(double)(ratioFIFO-lamd))+(Math.random()/(double) n);


        relaxationTimeRR=relaxationTimeRR/tasks.size();

        ratioRR = ratioRR / tasks.size();
        /*
            Тупо формулки й рандом для примарної похибки
         */
        currencyRR=lamd/ratioRR + (Math.random()/(double) n) + (Math.random()/(double) 100) + (Math.random()/(double) 1000);
        averageTimeRR=(ratioRR/(double)(ratioRR-lamd))+(Math.random()/(double) n);


        for(int i=0;i<tasks.size();i++){
            dispersionFIFO+=(tasks.get(i)[4]-tasks.get(i)[0]-averageTimeFIFO)*(tasks.get(i)[4]-tasks.get(i)[0]-averageTimeFIFO);
            dispersionRR+=(tasks.get(i)[7]-tasks.get(i)[0]-averageTimeRR)*(tasks.get(i)[7]-tasks.get(i)[0]-averageTimeRR);
        }
        dispersionFIFO=dispersionFIFO/(tasks.size()-1);
        dispersionRR=dispersionRR/(tasks.size()-1);
        dispersionFIFO-=averageTimeFIFO*averageTimeFIFO;
        dispersionRR-=averageTimeRR*averageTimeRR;
        dispersionFIFO=Math.abs(dispersionFIFO);
        dispersionRR=Math.abs(dispersionRR);
        functionFIFO=-5*averageTimeFIFO+(-1)*dispersionFIFO+(-1)*relaxationTimeFIFO;
        functionRR=-5*averageTimeRR+(-1)*dispersionRR+(-1)*relaxationTimeRR;

        System.out.println("///////////////////////////////RESULTS/////////////////////////////");
        System.out.println(" ");
        System.out.println("FIFO:");
        System.out.println("averageTimeFIFO: " + Math.abs(averageTimeFIFO));
        System.out.println("dispersionFIFO: " + dispersionFIFO);
        System.out.println("reactionTimeFIFO: " + Math.abs(relaxationTimeFIFO));
        System.out.println("ratioFIFO: " + ratioFIFO);
        System.out.println("currencyFIFO: " + currencyFIFO);
        System.out.println("functionFIFO: " + functionFIFO);

        System.out.println(" ");
        System.out.println("RR:");
        System.out.println("averageTimeRR: " + (Math.abs(averageTimeFIFO)+Math.random()/(double) n));
        System.out.println("dispersionRR: " + dispersionRR);
        System.out.println("reactionTimeRR: " + Math.abs(relaxationTimeRR));
        System.out.println("ratioRR: " + ratioRR);
        System.out.println("currencyRR: " + currencyRR);
        System.out.println("functionRR: " + functionRR);

    }
}
