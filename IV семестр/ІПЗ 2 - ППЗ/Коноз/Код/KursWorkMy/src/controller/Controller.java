package controller;


import controller.Factory.CommandFactory;
import controller.Validator.Validator;
import controller.commands.Command;
import dao.CRUIDRealisation;



/**
 * ��� ������ ��������� ��������.
 * @author ����� ����� 
 */
public class Controller {
	
	/**
	 * {@value} ��������� �� ������ ����.
	 */
	private static Controller controller;
	
	/**
	 * {@value} ��������� �� ��'��� ������� �� �����.
	 */
	public CRUIDRealisation dao;
	
	
	/**
	 * ��������� ����������� ��� ��������� ��'���� ������ ����. ������� ������� ������.
	 */
	private Controller(){
		
	}
	
	/**
	 * ������� ������� ������.
	 * @return ��������� �� ����� ���������.
	 */
	public static Controller getController(){
		if (controller == null){
			controller = new Controller();
		}
		return controller;
	}
	
	/**
	 * ����� ������� �� �������� �������. 
	 * ����� ������� ����������� �������� �������.
	 * @param context �������� ��� �������.
	 * @param id ����� �������.
	 */
	public void execute(ContextForCommand context, String id){
		Command command = CommandFactory.getCommand(id);
		command.setContext(context);
		if(Validator.isValid(command, context)){
			MyExecutor.execute(command);
		}
	}

}
