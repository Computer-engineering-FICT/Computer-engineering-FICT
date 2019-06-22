package configuration.Loaders;

import configuration.CompositeStructure.CompositeComponent;

/**
 * ��������� ������ ������������ �� �����, �� ������ ���������
 * ���������� ���������� ������������ � �����.
 * @author ����� �����.
 *
 */
public interface Loader {
	/**
	 * ����� ������ ���������� ����� �� �������, ��� ���������� ������
	 * �� ��� ���� �������.
	 * @param savePath ����� ������, �� ���� ����������� ���� ��� ����������
	 * @return ������� ��'��� ���� {@link CompositeComponent}
	 */
	public CompositeComponent load(String savePath);
}
