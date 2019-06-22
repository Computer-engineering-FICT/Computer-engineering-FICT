package app.controller;

import app.controller.command.Command;
import app.controller.command.annotation.CONTEXT;
import app.controller.command.annotation.PARAMETER;
import app.controller.command.annotation.ControllerAnnotationUtils;

/**
 * Валідатор для команд
 * @author Vova
 */
public class Validator {
/**
 * поле що містить у собі клас засобів для валідації
 */
	private static ControllerAnnotationUtils utils = new ControllerAnnotationUtils();
/**
 * метод що виконує валідацію
 * @param command соманда
 * @param context контекст команди
 * @return результат валідації
 */
	@SuppressWarnings("static-access")
	public static boolean isValide(Class<Command> command, CONTEXT context) {
		PARAMETER [] comandList = command.getAnnotation(CONTEXT.class).list();
		PARAMETER [] contextList = context.list();
		
		return utils.isValiedKey(comandList, contextList);
	}
}
