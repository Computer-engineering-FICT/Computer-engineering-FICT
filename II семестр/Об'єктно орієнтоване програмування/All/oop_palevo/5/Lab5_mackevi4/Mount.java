package programminglabs.Lab5;

import java.util.*;

/**
 * This abstract class give some basic properties and methods
 * for all mounts, such as constructor without parametrs,
 * methods go get and set heigth, country, part of world,
 * abstract set and get key-field Name,
 * and sort by heigth or key-field Name
 * @author Solimr
 */
abstract class Mount {
    /**
     * Name of single mount
     */
    private String MountName;
    /**
     * Part of world, where mount is present
     */
    private String PartOfWorld;
    /**
     * Country, where mount is present
     */
    private String Country;
    /**
     * Heigth of mount or such object
     */
    private int Heigth;

    /**
     * Standart constructor
     */
    public Mount(){
    }

    /**
     * Method return name of single mount
     * @return name of single mount
     */
    public String GetMountName(){
        return MountName;
    }
    /**
     * Method return key-field Name
     * @return Some identificator name
     */
    abstract public String GetName();
    /**
     * Method return field PartOfWorld
     * @return Part of world, where mount is present
     */
    public String GetWorld() {
        return PartOfWorld;
    }
    /**
     * Method return field Countries
     * @return Countries, where mount is present
     */
    public String GetCountry() {
        return Country;
    }
    /**
     * Method return field Heigth
     * @return Heigth of mount
     */
    public int GetHeigth() {
        return Heigth;
    }

    /**
     * Abstract method overwrite key-field Name
     * @param N is setting Name
     */
    abstract public void SetName(String N);

    /**
     * Method overwrite Name of single mount
     * @param N is setting Name
     */
    protected void SetMountName(String N){
        MountName=N;
    }
    /**
     * Method overwrite field PartOfWorld
     * @param W is Part of world, where mount is present
     */
    public void SetWorld(String W) {
        PartOfWorld=W;
    }
    /**
     * Method overwrite field Countries
     * @param C is Countries, where mount is present
     */
    public void SetCountry(String C) {
        Country=C;
    }
    /**
     * Method overwrite field Heigth
     * @param H is Heigth of mount or such object
     */
    public void SetHeigth(int H) {
        Heigth=H;
    }

    /**
     * Abstract method return viewing of own fields of extending class
     * @return own fields in string
     */
    abstract protected String FieldsToString();

    /**
     * Method return viewing of all fields, include extended
     * @return all fields in string
     */
    public String ToString(){
        String Res=GetName()+", "+GetWorld()+
                ", "+GetCountry()+", "+GetHeigth()+", ";
        Res+=FieldsToString();
        return Res;
    }

    /**
     * Method sort array by key-field Name
     * @param arr is array of elements type Mount
     */
    public static void SortByName(Mount[] arr){
        //sort array with comparator ComparatorByName
        Arrays.sort(arr, new ComparatorByName());
    }

    /**
     * Method sort array by Heigth
     * @param arr is array of elements type Mount
     */
    public static void SortByHeigth(Mount[] arr){
        //sort array with comparatot ComparatorByHeigth
       Arrays.sort(arr, new ComparatorByHeigth());
    }

    /**
     * Class realese interface Comparator.
     * This allow us to use class in method Arrays.sort
     * as Comparator.
     * This class compare type Mount by key-field Name
     */
    private static class ComparatorByName implements Comparator {
        /**
         * Method compare two Objects, which must be issue of Mount
         * @param Sp1 is first Object, with which compare
         * @param Sp2 is second Object, factor of compare
         * @return 1 if first more,then second; -1 if first less, then second;
         * 0 if two Objects are equivalent
         */
        public int compare(Object Sp1, Object Sp2){
            //Get Name from Mount`s var
            String Sp1Name = ((Mount)Sp1).GetName();
            String Sp2Name = ((Mount)Sp2).GetName();
            //compare Name
            return Sp1Name.compareTo(Sp2Name);
        }

    }

    /**
     * Class realese interface Comparator.
     * This allow us to use class in method Arrays.sort
     * as Comparator.
     * This class compare type Mount by field Heigth
     */
    private static class ComparatorByHeigth implements Comparator {
        /**
         * Method compare two Objects, which must be issue of Mount
         * @param Sp1 is first Object, with which compare
         * @param Sp2 is second Object, factor of compare
         * @return 1 if first more,then second; -1 if first less, then second;
         * 0 if two Objects are equivalent
         */
        public int compare(Object Sp1, Object Sp2){
            //Get Heigth from Mount`s var
            int Sp1Heigth = ((Mount)Sp1).GetHeigth();
            int Sp2Heigth = ((Mount)Sp2).GetHeigth();
            //compare Heigth
            if (Sp1Heigth>Sp2Heigth) return 1;
            if (Sp1Heigth<Sp2Heigth) return -1;
            return 0;
        }

    }
}
