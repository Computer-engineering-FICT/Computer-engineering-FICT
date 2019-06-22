package configuration.Writers;

import java.util.Properties;

import configuration.CompositeStructure.CompositeComponent;

/**
 * 
 * ����� ��������� � ������ ����������� ��� ��� �����, �� ������
 * ��������� ������� ��������������� ����� �� �������� ����.
 * @author ����� ����� 
 */
public interface Writer {
	/**
	 *  ����� ����� ����������� ��� ������ ��'���� � �����.
	 * @param comp ��'��� ������������, ���� ��������� ��������
	 * � ����.
	 *
	 */
	public void write(CompositeComponent comp);
}
