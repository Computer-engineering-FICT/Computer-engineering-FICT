/**
 * Додатковий клас "Вид спорту" для агрегації
 */

public class Sport {
	private String sport;
	Sport(){
		sport = "вид спорту";
	}
	Sport(String s){
		setSport(s);
	}
	public final void setSport(String s){
		sport = s;
	}
	public final String getSport(){
		return sport;
	}
}
