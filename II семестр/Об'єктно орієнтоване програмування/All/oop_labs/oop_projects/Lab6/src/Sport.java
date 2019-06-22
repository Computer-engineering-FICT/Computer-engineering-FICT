/**
 * Додатковий клас для агрегації
 */
public class Sport {
	private String sport;
	Sport(){
		sport = "вид спорту";
	}
	Sport(String sport){
		setSport(sport);
	}
	public final void setSport(String sport){
		this.sport = sport;
	}
	public final String getSport(){
		return sport;
	}
}
