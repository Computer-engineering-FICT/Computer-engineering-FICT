import java.util.ArrayList;
/**
 * 
 * @author Volodia Kuzmenko
 *
 */
public class Chevalier {
	
	private Ammunition[] ammunition;
	/**
	 * 
	 * @param am амуніція для одного лицаря
	 */
	public Chevalier(Ammunition []am) {
		ammunition = am;
		
	}
	/**
	 * 
	 * @return ціну всієї амуніції для лицаря
	 */
	public int getPriceAmmunition(){
		int price=0;
		for (Ammunition ammun : ammunition) {
			price += ammun.getPrice();
		}
		return price;
	}
	/**
	 * 
	 * @param arr масив амуніції
	 * @param i позиція для заміни
	 * @param j позиція для заміни
	 */
	private void swap(Ammunition [] arr, int i, int j) {
		
	    Ammunition t = arr[i];
	    arr[i]=arr[j];
	    arr[j]=t;
	    //arr.set(i, arr.get(j));
	    //arr.set(j, t);
	}
	/**
	 * метод сортує амуніцію по вазі
	 * @param arr масив амуніції
	 * 
	 */
	public void sortAmmunition(Ammunition [] arr){
	    for(int i = arr.length -1 ; i > 0 ; i--){
	        for(int j = 0 ; j < i ; j++){
	            if( arr[j].getWeight() > arr[j+1].getWeight())
	               swap(arr, j, j+1);
	        }
	    }
	}
	/**
	 * 
	 * @return 
	 */
	public Ammunition[] getAmmunition(){
		return ammunition;
	}
}
