package controller.Utils;


import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;


/**
 * ���� � ���������� �������� ��� ������� �������� ����������.
 * @author ����� ����� 
 */
public class ControllerAnnotationUtils {
	
	
	/**
	 * ������� ����� �������.
	 * @param c ����, ����� ������� ����� ������� ���������.
	 * @return ����� �������.
	 */
	public static String getCommandKey(Class c){
		COMMAND t = (COMMAND) c.getAnnotation(COMMAND.class);
		return (t!=null) ? t.key() : null;
	}
	
	/**
	 * ������� ������ ���������, � ����� ������ ����.
	 * @param c ����, ������ ��� ����� ������� ���������.
	 * @return ������ ���������.
	 */
	public static PARAMETER[] getParameterList(Class c){
		CONTEXT t = (CONTEXT) c.getAnnotation(CONTEXT.class);
		if (t == null) return null;
		return t.list();
	}
	
	/**
	 * �������� ������������� ���������.
	 * @param paramKey ����� ���������.
	 * @param command ���� �������.
	 * @return ������� true ���� �������� ������������� � ������ ������� false.
	 */
	public static boolean paramIsOptional(String paramKey, Class command){
		
		PARAMETER[] pl = getParameterList(command);
		for(PARAMETER p : pl){
			if(p.key().equals(paramKey)) return p.optional(); 
		}
		
		return true;
	}
	
	
	
}

