
public class Country {
	private String country;
	Country(){
		country = "������";
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
