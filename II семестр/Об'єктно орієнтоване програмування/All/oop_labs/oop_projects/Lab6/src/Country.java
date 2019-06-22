
public class Country {
	private String country;
	Country(){
		country = "Україна";
	}
	Country(String country){
		setCountry(country);
	}
	public final void setCountry(String country){
		this.country = country;
	}
	public final String getCountry(){
		return country;
	}
}
