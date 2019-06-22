import java.io.Serializable;

/**
 * Додатковий клас "Вид спорту" для агрегації
 */

public class Sport implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -9034521014015302675L;
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
