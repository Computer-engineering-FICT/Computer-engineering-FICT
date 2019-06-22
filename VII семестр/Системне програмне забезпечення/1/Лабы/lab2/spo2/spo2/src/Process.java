import java.util.ArrayList;


public class Process extends Thread {

    private String name;
    private int sizeOfMemory;
    private int workSize;
    private ArrayList<Integer> addressList;
    private ArrayList<Integer> workAddressList;
    private volatile boolean executeAllowed;
    private OS os;


    public Process(String name, int sizeOfMemory, OS os) {
        super(name);
        this.name = name;
        System.out.println("---------------------");
        System.out.println(name + " process was created! Required memory size = " + sizeOfMemory);
        this.os = os;
        this.sizeOfMemory = sizeOfMemory;
        workSize = (int) Math.ceil(sizeOfMemory / 20);
        if (workSize > 7)
            workSize = 7;

        addressList = os.allocateVirtualAddressBlock(sizeOfMemory, name);
        System.out.println(name + ": received virtual addresses in [" + addressList.get(0) + ".." + addressList.get(addressList.size() - 1) + "]");

        workAddressList = new ArrayList<Integer>(workSize);

        for (int i = 0; i < workSize; i++) {
            int index = (int) Math.round(Math.random() * (addressList.size() - 1));
            workAddressList.add(addressList.get(index));
            addressList.remove(index);
        }

        printWorkTableInfo();

        int flag = os.mapWorkPages(workAddressList, name);
        if (flag == 0)
            System.out.println(name + ": mapping work pages OK");
        else
            System.out.println(name + ": mapping work pages FAIL");
        executeAllowed = false;

        start();
    }

    public void run() {

        while (true) {

            if (executeAllowed) {


                boolean enlargeWorkAddressList = false;
                if ((Math.random() > 0.9) && (addressList.size() > 0))
                    enlargeWorkAddressList = true;

                if (enlargeWorkAddressList) {
                    int index = (int) Math.round(Math.random() * (addressList.size() - 1));
                    workAddressList.add(addressList.get(index));
                    workSize++;
                    addressList.remove(index);
                    printWorkTableInfo();
                }

                int selectedAddress = workAddressList.get((int) Math.round(Math.random() * (workSize - 1)));

                int rwFlag = 0;   //read only
                if (Math.random() > 0.5)
                    rwFlag = 1;     //modify

                System.out.println(name + ": request for page #" + selectedAddress + " with rwFlag = " + rwFlag);

                os.requestPage(selectedAddress, rwFlag, name);

                try {
                    sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }

            } else try {
                sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }

        }

    }

    public void setExecuteAllowed(boolean executeAllowed) {
        this.executeAllowed = executeAllowed;
    }

    public void printWorkTableInfo() {
        System.out.print(name + ": work set (new size = " + workSize + ") was modified: ");
        for (int i = 0; i < workSize; i++)
            System.out.print(workAddressList.get(i) + "; ");
        System.out.println();
    }

}
