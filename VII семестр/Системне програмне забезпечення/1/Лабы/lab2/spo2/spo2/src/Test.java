import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 11/11/12
 * Time: 2:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class Test extends Thread{
    public static void main(String[] args) {
        OS os = new OS(100);
        String[] names = {"timon", "pumba", "simba", "mufasa"};
        int[] vmSize = {50,300,50,35} ;
        List<Process> list = new ArrayList<Process>();

        for (int i = 0; i < names.length; i++) {
           Process process = new Process(names[i], vmSize[i], os);
            list.add(process);

        }

        while (true) {
            int index = (int) Math.round(Math.random() * (names.length - 1));
            System.out.println();
            System.out.println("---> MAIN: execute allowed to " + names[index]+"----------------------------");
            System.out.println();
            list.get(index).setExecuteAllowed(true);

            try {
                sleep(50);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            list.get(index).setExecuteAllowed(false);
        }





    }
}
