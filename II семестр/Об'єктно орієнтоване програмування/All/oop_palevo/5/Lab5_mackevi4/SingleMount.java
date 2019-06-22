package programminglabs.Lab5;

/**
 *
 * @author Solimr
 */
public class SingleMount extends Mount {
    
    public SingleMount(String N){
        SetMountName(N);
    }

    public SingleMount(String N,String P,String C){
        this(N);
        SetWorld(P);
        SetCountry(C);
    }

    public SingleMount(String N, String P, String C, int H, boolean S){
        this(N,P,C);
        SetHeigth(H);
        Snow=S;
    }

    public SingleMount(String N, String P, String C, int H, boolean S,
            int Cq, String Cqr){
        this(N,P,C,H,S);
        YearConquest=Cq;
        Conqueror=Cqr;
    }

    public String GetName(){
        return GetMountName();
    }

    public int GetConquest(){
        return YearConquest;
    }

    public boolean IsSnow(){
        return Snow;
    }

    public String GetConqueror(){
        return Conqueror;
    }

    public void SetName(String N){
        SetMountName(N);
    }

    public void SetConquest(int Cq){
        YearConquest=Cq;
    }

    public void SetConqueror(String Cqr){
        Conqueror=Cqr;
    }

    public void SetSnow(boolean S){
        Snow=S;
    }

    protected String FieldsToString(){
        String Str;
        if (IsSnow()){
            Str="Snow";
        } else
            Str="No snow";
        return GetConquest()+", "+GetConqueror()+
                ", "+Str;
    }

    private int YearConquest;
    private String Conqueror;
    private boolean Snow;
}
