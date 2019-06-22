package configuration.EditFactory;

import configuration.CompositeStructure.CompositeComponent;
import configuration.Loaders.*;
import configuration.Writers.*;

/**
 * ����� ���� �� ������� ������ ��� ������ � ������������ 
 * ��'���� ������������. ³� ������� �� ������� ����� �������
 * �������� ��������� ����� ��� ������.
 * @author ����� �����.
 *
 */
public class EditFactory {
	/**
	 * @param writer �� ��������� �� ��'���, ���� ���������
	 * ������� � ���� ��'���� ������������.
	 * @param loader �� ��������� �� ��'���, ���� ��������� 
	 * ����������� � ����� ��'���� ������������.
	 */
	private static Writer writer;
	private static Loader loader;

	
	/**
	 * ����� ������ ���������� ��'���, ���� ������� �������� 
	 * � ����. ��'��� ��� ������ ������ � ��� ������, �� ��� 
	 * �� ���� ����������. ������� �� ����, ���� ����������� 
	 * ���������� ������, ���� ���������� ��'��� ���� {@link Writer}
	 * ���� ������������� �� ������ ����� ����� �������.
	 * ϳ��� ��������� ����� ��'����, � ����� ���� ���������
	 * ����� write(), ����� ���� �������� ��'��� ��� ������.
	 * @param comp ��'���, ���� ������� �������� � ����.
	 */
	public static void save(CompositeComponent comp){
		if(comp.getPath().endsWith(".xml")){
			writer = new XMLWriter();
			writer.write(comp);
		}
	}
	
	/**
	 * ����� ������ � ����� ��������� ������ ��'����, ���� ������� 
	 * �����������. ������� �� ����������, ���� ���������� ������, 
	 * ���� ���������� ��'��� ���� {@link Loader} ���� �������������
	 * �� ��������� �'���� � ����� ������ ����������.
	 * ϳ��� ��������� ����� ��'����, � ����� ���� ��������� ����� 
	 * load(), ����� ���� �������� ������ �����.
	 * @param savePath ������ �����.
	 * @return ������� ��'��� ���� {@link CompositeComponent}
	 */
	public static CompositeComponent load(String savePath){
		if(savePath.endsWith(".xml")){
			loader = new XMLLoader();
		}
		return loader.load(savePath);
	}
	

}
