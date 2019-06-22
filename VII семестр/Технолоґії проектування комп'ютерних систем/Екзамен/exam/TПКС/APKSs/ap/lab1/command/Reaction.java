package lab1.command;

/**
 * ����� ��� �� ��� ������� ������� �� ���� ������ ���������� �����
 * ���������
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public interface Reaction {

	/**
	 * ĳ�, ��� ������� �������� �� �������� �������.
	 * @throws Exception ������� ��� ����� �������.
	 */
	public void execute() throws Exception;

	/**
	 * @return ��"� �������
	 */
	public String getName();
}
