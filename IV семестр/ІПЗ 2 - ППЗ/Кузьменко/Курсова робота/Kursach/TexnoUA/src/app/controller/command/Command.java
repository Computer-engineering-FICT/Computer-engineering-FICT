package app.controller.command;



/**
 *	��������� �������
 *
 */
public interface Command extends Runnable  {
/**
 * ���������� ����� �������
 */
	@Override
	public void run();
/**
 * ����� ��� ������������ ��'���� � ��������	
 * @param dataView ��������� �� ���� �������
 */
	public void setDataView(Object dataView);
	
	
}
