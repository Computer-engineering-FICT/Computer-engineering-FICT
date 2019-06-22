package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ����, ���� ������ ���� ����� ������� "Comment" � ���� �����.
 * @author ����� ����� 
 */
@Stored(name = "COMMENT")
public class Comment {

	/**
	 * {@value} �������� ����.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} ��������.
	 */
	@Stored(name = "COMMENT")
	private String comment;
	/**
	 * {@value} �������� ���� ������.
	 */
	@Stored(name = "GOODS_ID", converter = intConverter.class)
	private int goodId;
	/**
	 * {@value} �������� ���� ������� �����������.
	 */
	@Stored(name = "PROFILE_ID", converter = intConverter.class)
	private int profileId;
	
	/**
	 * ������ �����������.
	 */
	public Comment(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
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
