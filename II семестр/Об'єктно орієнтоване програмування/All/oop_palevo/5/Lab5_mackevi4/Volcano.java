package programminglabs.Lab5;

/**
 *
 * @author Solimr
 */
public class Volcano extends Mount {

    public Volcano(String N){
        SetMountName(N);
    }

    public Volcano(String N,String P,String C){
        this(N);
        SetWorld(P);
        SetCountry(C);
    }

    public Volcano(String N, String P, String C, int H, boolean A){
        this(N,P,C);
        SetHeigth(H);
        Activity=A;
    }

    public Volcano(String N, String P, String C, int H, boolean A,
            int LE, String T){
        this(N,P,C,H,A);
        YearLastEruption=LE;
        Type=T;
    }

    public String GetName(){
        return GetMountName();
    }

    public int GetEruption(){
        return YearLastEruption;
    }

    public boolean IsActivity(){
        return Activity;
    }

    public String GetType(){
        return Type;
    }

    public void SetName(String N){
        SetMountName(N);
    }

    public void SetEruption(int E){
        YearLastEruption=E;
    }

    public void SetType(String T){
        Type=T;
    }

    public void SetActivity(boolean A){
        Activity=A;
    }

    protected String FieldsToString(){
        String Str;
        if (IsActivity()){
            Str="Active";
        } else
            Str="Not active";
        return GetEruption()+", "+GetType()+
                ", "+Str;
    }

    private int YearLastEruption;
    private String Type;
    private boolean Activity;
}
