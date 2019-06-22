package programminglabs.Lab5;

/**
 * This class test class Mount,
 * extending classes Spine, SingleMount, Volcano
 * and their methods
 * @author Solimr
 */
public class Lab5 {
    /**
     * Main method while running test class Mount and sorting array
     * @param args is arguments from command line
     */
    public static void main(String[] args){
        //create array of objects Mount
        Mount[] Test= new Mount[6];
        //Now test constractors
        Test[0] = new SingleMount("Ararat");
        Test[1] = new SingleMount("Qomolangma","Eurasia","China",8848,true,
                1953,"Edmund Hillary and Tenzing Norgay");
        Test[2] = new Spine("Carpaty");
        Test[3] = new Spine("Pyrenees","Eurasia","Spain",430,160,"Aneto",3404);
        Test[4] = new Volcano("St. Helens");
        Test[5] = new Volcano("Vesuvius","Eurasia","Italy",1281,true,
                1944,"Stratovolcano");
        //write all objects
        PrintSpines(Test);
        System.out.println();
        //test modificate methods
        Test[1].SetName("Everest");
        Test[0].SetWorld("Eurasia");
        Test[0].SetCountry("Turkey");
        Test[0].SetHeigth(5165);
        ((SingleMount)Test[0]).SetConquest(1829);
        ((SingleMount)Test[0]).SetConqueror("Parrot");
        ((SingleMount)Test[0]).SetSnow(true);
        Test[2].SetName("Carpatians");
        Test[2].SetWorld("Eurasia");
        Test[2].SetCountry("Ukraina");
        Test[2].SetHeigth(2655);
        ((Spine)Test[2]).SetPeakName("Gerlach Peak");
        ((Spine)Test[2]).SetLength(1500);
        ((Spine)Test[2]).SetWidth(500);
        Test[4].SetName("Mount St. Helens");
        Test[4].SetWorld("North America");
        Test[4].SetCountry("USA");
        Test[4].SetHeigth(2549);
        ((Volcano)Test[4]).SetEruption(2008);
        ((Volcano)Test[4]).SetActivity(true);
        ((Volcano)Test[4]).SetType("Stratovolcano");
        //sort and write array by all sorting methods
        Spine.SortByName(Test);
        PrintSpines(Test);
        System.out.println();
        Spine.SortByHeigth(Test);
        PrintSpines(Test);
        }

    private static void PrintSpines(Mount[] Test) {
        for (int i=0;i<Test.length;i++){
            System.out.print(Test[i].ToString());
            System.out.println();
        }
    }
}
