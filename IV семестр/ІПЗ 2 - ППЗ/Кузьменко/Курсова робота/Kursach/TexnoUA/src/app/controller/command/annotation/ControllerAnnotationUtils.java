package app.controller.command.annotation;


/**
 * ���� �� ���� ������ ��� ������ � ���������� �� ���������

 *
 */
public class ControllerAnnotationUtils {
	/**
	 * ���� ������� ���� �������
	 * @param c ���� �������
	 * @return ���� �������
	 */
	public static String getCommandKey(@SuppressWarnings("rawtypes") Class c) {
		@SuppressWarnings("unchecked")
		COMMAND t = (COMMAND) c.getAnnotation(COMMAND.class);
		return (t != null) ? t.key() : null;
	}
	/**
	 * ����� �������� �������� �������
	 * @param paramOne ��������� ��� ��������� � paramTwo
	 * @param paramTwo ��������� ��� ���������� � paramOne
	 * @return ��������� �������
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
