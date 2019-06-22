
public class TCountry {
	private String Country;
	
	public TCountry (){
		SetCountry(null);
	}
	public TCountry (String Country){
		SetCountry(Country);
	}
	public final void SetCountry(String Country){
		this.Country=Country;
	}
	public final String GetCountry(){
		return Country;
	}
}
