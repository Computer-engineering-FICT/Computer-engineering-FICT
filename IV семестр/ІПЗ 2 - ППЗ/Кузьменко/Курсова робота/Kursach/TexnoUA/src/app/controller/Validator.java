package app.controller;

import app.controller.command.Command;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.controller.command.annotation.ControllerAnnotationUtils;

/**
 * �������� ��� ������
 * @author Vova
 */
public class Validator {
/**
 * ���� �� ������ � ��� ���� ������ ��� ��������
 */
	private static ControllerAnnotationUtils utils = new ControllerAnnotationUtils();
/**
 * ����� �� ������ ��������
 * @param command �������
 * @param context �������� �������
 * @return ��������� ��������
 */
	@SuppressWarnings("static-access")
	public static boolean isValide(Class<Command> command, CONTEXT context) {
		PARAMETER [] comandList = command.getAnnotation(CONTEXT.class).list();
		PARAMETER [] contextList = context.list();
		
		return utils.isValiedKey(comandList, contextList);
	}
}
