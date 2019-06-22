/**
 * Додатковий клас для агрегації
 *
 */

public class Country {
	private String country;
	Country(){
		country = "Україна";
	}
	Country(String c){
		setCountry(c);
	}
	public final void setCountry(String c){
		country = c;
	}
	public final String gerCountry(){
		return country;
	}
}
