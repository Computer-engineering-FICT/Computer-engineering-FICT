package app.controller.command.annotation;


/**
 * Клас що надає засоби для роботи з анотаціями та командами

 *
 */
public class ControllerAnnotationUtils {
	/**
	 * мето повертає ключ команди
	 * @param c клас команди
	 * @return ключ команди
	 */
	public static String getCommandKey(@SuppressWarnings("rawtypes") Class c) {
		@SuppressWarnings("unchecked")
		COMMAND t = (COMMAND) c.getAnnotation(COMMAND.class);
		return (t != null) ? t.key() : null;
	}
	/**
	 * метод перевіряє валідність команди
	 * @param paramOne параметри для порівняння з paramTwo
	 * @param paramTwo параметри для порявняння з paramOne
	 * @return результат валіації
	 */
	public static boolean isValiedKey(PARAMETER [] paramOne, PARAMETER [] paramTwo){
		boolean flag = false;
		
		for (PARAMETER param1 : paramOne) {
			for (PARAMETER param2 : paramTwo) {
				if (param1.key().equals(param1.key())){
					if (param1.type().equals(param2.type())){
						if(param1.optional()&&param2.optional()){
							flag = true;
						}else break;
					}else break;
				}else break;
				
			}
		}
		
		return flag;
	}
}
