
public class TName {
	private String Name;
	
	public TName (){
		SetName(null);
	}
	public TName (String Name){
		SetName(Name);
	}
	public final void SetName(String Name){
		this.Name=Name;
	}
	public final String GetName(){
		return Name;
	}
}
