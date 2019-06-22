package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас зберігає поля рядка з таблиці "Share" бази даних.
 * @author Коноз Андрій 
 */
@Stored(name = "SHARE")
public class Share {
	/**
	 * {@value} зберігає основний ключ.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} зберігає стан акції.
	 */
	@Stored(name = "STATUS")
	private String state;
	/**
	 * {@value}Зберігає значення знижки.
	 */
	@Stored(name = "DISCOUNT", converter = intConverter.class)
	private int share;
	
	/**
	 * Пустий конструктор.
	 */
	public Share(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id основний ключ.
	 * @param state стан.
	 * @param share розмір знижки.
	 */
	public Share(int id, String state, int share){
		this.id = id;
		this.state = state;
		this.share = share;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getShare() {
		return share;
	}
	public void setShare(int share) {
		this.share = share;
	}

}
