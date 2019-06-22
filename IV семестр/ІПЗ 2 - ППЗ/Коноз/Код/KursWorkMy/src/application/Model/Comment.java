package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * Клас, який зберігає поля рядка таблиці "Comment" з бази даних.
 * @author Коноз Андрій 
 */
@Stored(name = "COMMENT")
public class Comment {

	/**
	 * {@value} Основний ключ.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} Коментар.
	 */
	@Stored(name = "COMMENT")
	private String comment;
	/**
	 * {@value} Основний ключ товару.
	 */
	@Stored(name = "GOODS_ID", converter = intConverter.class)
	private int goodId;
	/**
	 * {@value} Основний ключ профіля користувача.
	 */
	@Stored(name = "PROFILE_ID", converter = intConverter.class)
	private int profileId;
	
	/**
	 * Пустий конструктор.
	 */
	public Comment(){
		
	}
	
	/**
	 * Конструктор, який ініціалізує всі поля.
	 * @param id
	 * @param comment
	 * @param goodId
	 * @param profileId
	 */
	public  Comment(int id, String comment, int goodId, int profileId){
		this.id = id;
		this.comment = comment;
		this.goodId = goodId;
		this.profileId = profileId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

}
