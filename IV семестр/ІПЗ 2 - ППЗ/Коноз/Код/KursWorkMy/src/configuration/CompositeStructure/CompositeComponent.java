package configuration.CompositeStructure;

import java.util.Properties;

/**
 * ���� � ����������� ��� �������� ���������� ���������
 * ������������. ³� � �������� ����� {@link Properties},
 * �  ����� ���� ����� ������ ��� ������ � 
 * ����������� ����������.
 * @author ����� ����� 
 */
public abstract class CompositeComponent extends Properties {
	
	/**
	 * ����� ������ � ���� ��'���, � ����� ���� ���������
	 * ��� �����. ������, ��� ������ �������� ��� ��������
	 * ��'����.
	 */
	public abstract void save();
	/**
	 * ����� �������� ��'���, � ����� ���� ��������� ��� �����
	 * ����������� � �����. 
	 * @param savePath ������ �����
	 */
	public abstract void load(String savePath);
	/**
	 * ����� ��� ��������� ������ ����������.
	 * @return ������, �� ���� ���� ���������� ����
	 */
	public abstract String getPath();
	/**
	 * ����� ��� ��������� ���� ���������.
	 * @return ������� ��'� ���������.
	 */
	public abstract String getName();
	/**
	 * ����� ������� ��'��� ���� {@link CompositeComponent}, 
	 * ��'� ����� ���� �������� ������ � ����� ���������.
	 * @param name ����� ���������, ���� ������� ���������.
	 * @return ��'��� ���� {@link CompositeComponent}, ���� ��'���
	 * � ����� ������ �������� � ��������. � ������ ��� ������� <code>null</code>
	 */
	public abstract CompositeComponent getProperties(String name);
	/**
	 * ����� ���� �� ������ ��������� ��'��� ���� {@link CompositeComponent}.
	 * @param comp ��'���, ���� ������� �������� � ���������.
	 */
	public abstract void addComponent(CompositeComponent comp);
}
