package controller.Utils;


import controller.annotations.COMMAND;
import controller.annotations.CONTEXT;
import controller.annotations.PARAMETER;


/**
 * Клас зі статичними методами для обробки анотацій контролера.
 * @author Коноз Андрій 
 */
public class ControllerAnnotationUtils {
	
	
	/**
	 * Повертає назву команди.
	 * @param c клас, назву команди якого потрібно повернути.
	 * @return назва команди.
	 */
	public static String getCommandKey(Class c){
		COMMAND t = (COMMAND) c.getAnnotation(COMMAND.class);
		return (t!=null) ? t.key() : null;
	}
	
	/**
	 * Повертає список параметрів, з якими пряцює клас.
	 * @param c клас, список для якого потрібно повернути.
	 * @return список параметрів.
	 */
	public static PARAMETER[] getParameterList(Class c){
		CONTEXT t = (CONTEXT) c.getAnnotation(CONTEXT.class);
		if (t == null) return null;
		return t.list();
	}
	
	/**
	 * Перевіряє опціональність параметра.
	 * @param paramKey назва параметра.
	 * @param command клас команди.
	 * @return повертає true якщо параметр опціональнийб в іншому випадку false.
	 */
	public static boolean paramIsOptional(String paramKey, Class command){
		
		PARAMETER[] pl = getParameterList(command);
		for(PARAMETER p : pl){
			if(p.key().equals(paramKey)) return p.optional(); 
		}
		
		return true;
	}
	
	
	
}

