package application.Model;

import dao.annotation.Primary;
import dao.annotation.Stored;
import dao.annotation.converter.intConverter;

/**
 * ���� ������ ���� ����� � ������� "Share" ���� �����.
 * @author ����� ����� 
 */
@Stored(name = "SHARE")
public class Share {
	/**
	 * {@value} ������ �������� ����.
	 */
	@Primary
	@Stored(name = "ID", converter = intConverter.class)
	private int id;
	/**
	 * {@value} ������ ���� �����.
	 */
	@Stored(name = "STATUS")
	private String state;
	/**
	 * {@value}������ �������� ������.
	 */
	@Stored(name = "DISCOUNT", converter = intConverter.class)
	private int share;
	
	/**
	 * ������ �����������.
	 */
	public Share(){
		
	}
	
	/**
	 * �����������, ���� �������� �� ����.
	 * @param id �������� ����.
	 * @param state ����.
	 * @param share ����� ������.
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
