package programminglabs.Lab5;

/**
 * This class realize abstract class Mount,
 * make spines in object, have constructors to init
 * properties, methods to get them values, rewrite properties
 * and override abstract methods get and set key-field Name
 * and view own fields
 * @author Solimr
 */
public class Spine extends Mount {

    /**
     * Constructor make new specimen of class Spine, and initialize
     * it by given parametrs.
     * @param N is Name of Spine
     */
    public Spine(String N){
        SpineName=N;
    }

    /**
     * Constructor make new specimen of class Spine, and initialize
     * it by given parametrs.
     * @param N is Name of Spine
     * @param P is Part of world, where spine is present
     * @param C is Countries, where spine is present
     */
    public Spine(String N,String P,String C){
        this(N);
        SetWorld(P);
        SetCountry(C);
    }

     /**
     * Constructor make new specimen of class Spine, and initialize
     * it by given parametrs.
     * @param N is Name of Spine
     * @param P is Part of world, where spine is present
     * @param C is Countries, where spine is present
     * @param L is Length of spine
     * @param W is Width of spine
     */
    public Spine(String N, String P, String C, int L, int W){
        this(N,P,C);
        Length=L;
        Width=W;
    }

    /**
     * Constructor make new specimen of class Spine, and initialize
     * it by given parametrs.
     * @param N is Name of Spine
     * @param P is Part of world, where spine is present
     * @param C is Countries, where spine is present
     * @param L is Length of spine
     * @param W is Width of spine
     * @param Pk is Name of spine`s pike
     * @param H is Heigth of spine`s pike
     */
    public Spine(String N, String P, String C, int L, int W,
            String Pk, int H){
        this(N,P,C,L,W);
        SetMountName(Pk);
        SetHeigth(H);
    }

    /**
     * Method return key-field Name
     * @return Name of Spine
     */
    public String GetName(){
        return SpineName;
    }

    /**
     * Method return name of pike
     * @return Name of spine`s pike
     */
    public String GetPeakName(){
        return GetMountName();
    }

    /**
     * Method return field Length
     * @return Length of spine
     */
    public int GetLength(){
        return Length;
    }

    /**
     * Method return field Width
     * @return Width of spine
     */
    public int GetWidth(){
        return Width;
    }

    /**
     * Method overwrite key-field Name
     * @param N is Name of Spine
     */
    public void SetName(String N){
        SpineName=N;
    }

    /**
     * Method overwrite name of pike
     * @param P is Name of spine`s pike
     */
    public void SetPeakName(String N){
        SetMountName(N);
    }

    /**
     * Method overwrite field Length
     * @param L is Length of spine
     */
    public void SetLength(int L){
        Length=L;
    }

    /**
     * Method overwrite field MaxWidth
     * @param W is Width of spine
     */
    public void SetWidth(int W){
        Width=W;
    }

    protected String FieldsToString(){
        return GetLength()+", "+GetWidth()+", "+GetPeakName();
    }

    private String SpineName;
    private int Length;
    private int Width;
}
