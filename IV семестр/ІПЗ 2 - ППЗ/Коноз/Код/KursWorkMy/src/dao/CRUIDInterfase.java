package dao;

import java.util.*;

import configuration.CompositeStructure.AppConfiguration;
import dao.exception.*;

/**
 * ��������� ����������� ���������� DAO ��� ������ � �������.
 * @author ����� �����
 */
public interface CRUIDInterfase {
	/**
	 * ����� ��������� �'������� � ����� ����� �� ��������� ��������� ��
	 * ���������� � ���������������� ���� ��������.
	 * 
	 * @param configuration ��������������� ���� ��������.
	 * @throws DAOException
	 */
	public void open(AppConfiguration configuration) throws DAOException;

	/**
	 * ����� ���� ������� ����������� �'������� � ����� �����.
	 * @throws DAOException
	 */
	public void close() throws DAOException;

	/**
	 * ����� �������� � ���� ��'���, ��������� � ����� ���������.
	 * @param instance ��'���, ���� ������� �������� � ����.
	 * @return ������� ��'���, ����� ��� ���������� ����, �� ����
	 * �� ��� ���������� � ���.
	 * @throws DAOException
	 */
	public <T> T insert(T instance) throws DAOException;

	/**
	 * ����� � ���� ��'��� �� �������� ��������.
	 * @param entityClass ��� ��'����, � ���� ������� ��������
	 * ���������.
	 * @param id ���� ��'���� � ���.
	 * @return ������� ��'��� �������� ���� � ����.
	 * @throws DAOException
	 */
	public <T> T read(Class entityClass, int id) throws DAOException;

	/**
	 * �������� ��'��� � ��� ����� ����������� � ��'����, ���� ���
	 * ��������� ������ � ����� ���������.
	 * @param instance ��'���, ���������� ����� ��������������.
	 * @throws DAOException
	 */
	public <T> void update(T instance) throws DAOException;

	/**
	 * ������� � ���� ��'���, ��������� � ����� ���������.
	 * @param instance ��'���, ���� ������� ��������.
	 * @throws DAOException
	 */
	public <T> void delete(T instance) throws DAOException;

	/**
	 * ������ ������ � ���� ����� ����� ��'���� ����, ���� ��� ��������
	 * � ����� ������ � ��������� ������. ������ ���������� � ��� ��'����
	 * �� ������������� ����� �������.
	 * @param entityClass ��� ��'���� ������.
	 * @param filter ��'��� ���� {@link DAOFilter}, ���� ���������� �������
	 * ������ ��'���� � ���� �����.
	 * @return ������� ������ ��'����.
	 * @throws DAOException
	 */
	public <T> List<T> select(Class entityClass, DAOFilter filter)
			throws DAOException;

	/**
	 * ������� ������ ��'����, �� ���� ������ � ���� �����
	 * �� ��������� SQL-������, ���� ��� ��������� ������ � ����� 
	 * ���������.
	 * @param SQLString SQL-�����.
	 * @return ������� ������ ��'����, �� ���� ������ � ���� �����
	 * �� ��������� SQL-������, ���� ��� ��������� ������ � ����� 
	 * ���������.
	 * @throws DAOException
	 */
	public <T> List<T> select(String SQLString) throws DAOException;

}
