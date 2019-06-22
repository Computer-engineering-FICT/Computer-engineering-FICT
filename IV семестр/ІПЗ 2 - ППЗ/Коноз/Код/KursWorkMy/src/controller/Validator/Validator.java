package controller.Validator;

import java.util.Hashtable;

import controller.ContextForCommand;
import controller.Utils.ControllerAnnotationUtils;
import controller.annotations.PARAMETER;
import controller.commands.Command;

/**
 * ����, ���� ������ �������� �������� ���������.
 * @author ����� ����� 
 */
public class Validator {


	/**
	 * ����� �������� ���������� ��������, ���������� �������.
	 * @param com �������.
	 * @param context �������.
	 * @return ������� true ���� �������� ����������� ��������� �������, � ������ ��� ������� false.
	 */
	public static boolean isValid(Command com, ContextForCommand context){
		
		PARAMETER [] param = ControllerAnnotationUtils.getParameterList(com.getClass());
		Hashtable<String, Object> table = context.getHashTable();
		for(PARAMETER b : param){
			if (!b.type().equals(table.get(b.key()).getClass())){
				
				return false;
			}
		}
		
		
		
		return true;
	}

}
