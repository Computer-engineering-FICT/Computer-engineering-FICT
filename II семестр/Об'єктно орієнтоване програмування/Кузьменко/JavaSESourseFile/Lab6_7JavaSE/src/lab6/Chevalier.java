package lab6;



import java.util.Collection;
import java.util.ListIterator;
/**
 * 
 * @author Volodia Kuzmenko
 *
 */
public class Chevalier {
	
	private MyCollection ammunition;
	/**
	 * 
	 * @param am ������� ��� ������ ������
	 */
	public Chevalier(MyCollection c) {
		ammunition = c;
		
	}
	/**
	 * 
	 * @return ���� �񳺿 ������� ��� ������
	 */
	public int getPriceAmmunition(){
		int price=0;
		ListIterator<Ammunition> itr = ammunition.listIterator();
		while (itr.hasNext()) {
			Ammunition ambuf = itr.next();
			price +=ambuf.getPrice(); 
			
		}
		
		return price;
	}
	/**
	 * 
	 * @param arr ����� �������
	 * @param i ������� ��� �����
	 * @param j ������� ��� �����
	 */
	private void swap(Ammunition [] arr, int i, int j) {
		
	    Ammunition t = arr[i];
	    arr[i]=arr[j];
	    arr[j]=t;
	}
	/**
	 * ����� ����� ������� �� ���
	 * @param arr ����� �������
	 * 
	 */
	public MyCollection sortAmmunition(MyCollection c){
		ListIterator<Ammunition> itr = ammunition.listIterator();
		Ammunition [] arr = new Ammunition [ammunition.size()];
		int k=0;
		while (itr.hasNext()) {
			Ammunition ammunition = itr.next();
			if (ammunition!=null){
			arr[k]= ammunition;
			k++;
			}
		}
	    for(int i = ammunition.size() -1 ; i > 0 ; i--){
	        for(int j = 0 ; j < i ; j++){
	            if ( arr[j].getWeight() > arr[j+1].getWeight())
	               swap(arr, j, j+1);
	        }
	    }
	    MyCollection sortCollection = new MyCollection(arr);
	    return sortCollection;
	    
	}
	/**
	 * 
	 * @return 
	 */
	public Collection<Ammunition> getAmmunition(){
		return ammunition;
	}
}

