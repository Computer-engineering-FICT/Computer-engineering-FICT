package controller.Validator;

import java.util.Hashtable;

import controller.ContextForCommand;
import controller.Utils.ControllerAnnotationUtils;
import controller.annotations.PARAMETER;
import controller.commands.Command;

/**
 * Клас, який реалізує перевірку валідності контексту.
 * @author Коноз Андрій 
 */
public class Validator {


	/**
	 * Метод перевіряє відповідність контесту, параметрам команди.
	 * @param com команда.
	 * @param context контекс.
	 * @return Повертає true якщо контекст задовольняє параметри команди, в іншому разі повертає false.
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
