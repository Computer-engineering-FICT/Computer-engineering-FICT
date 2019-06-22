package dao;

import java.util.List;

import config.AppConfig;
/**
 * ��������� ��� �����, �� ������ �� ����� ��������� � ����� �����
 * @author Vova
 *
 */
public interface CRUDInterface {
	/**
	 * ����� �� ������� �*������
	 * @throws Exception
	 */
	public void close() throws Exception;
	
/**
 * ����� �� ������ ���������� � ���� �����
 * @param instance �������� �� ����� ��������
 * @return Null
 * @throws Exception
 */
	public <T> T insert(T instance) throws Exception;
/**
 * ����� �� ����� ���������� � ���� �����
 * @param entityClass ���� �� ����������� ���������� � ����� �������� ��� �� ������ ��������� � ���� �����
 * @param id ���� �� ����� ���� �������� �����
 * @return �������� ���� ����� � ���� ���� ��������� ��������
 * @throws Exception
 */
	public <T> T read(@SuppressWarnings("rawtypes") Class entityClass, int id) throws Exception;
/**
 * ����� �� ������ ������� ��������� �����
 * @param instance ��� ��� ���������
 * @throws Exception
 */
	public <T> void update(T instance) throws Exception;
/**
 * ����� �� ������� ��� � ���� �����
 * @param instance ��� �� ����� ��������
 * @throws Exception
 */
	public <T> void delete(T instance) throws Exception;
/**
 * ����� �� ������ �� ��� �� �������� ���� �����
 * @param entityClass ���� - ��� �����
 * @return ������ ������� �����
 * @throws Exception
 */
	public <T> List<T> select(@SuppressWarnings("rawtypes") Class entityClass) throws Exception;

	public <T> List<T> select(String SQLString) throws Exception;
/**
 * ����� �� ���������� �'����� � ����� �����
 * @param config ������������ ��� ������������ ������ � ����� �����
 * @throws Exception
 */
	void open(AppConfig config) throws Exception;

}
