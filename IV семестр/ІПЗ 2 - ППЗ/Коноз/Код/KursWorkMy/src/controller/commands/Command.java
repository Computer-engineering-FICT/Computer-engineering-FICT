package controller.commands;

import java.util.Hashtable;

import controller.ContextForCommand;
import controller.Controller;

/**
 * ���� ���� ��������� ��� �� ������, �� ������ ���� �������� ����������.
 * @author ����� ����� 
 */
public abstract class Command implements Runnable{

	/**
	 * {@value} �������� �������.
	 */
	protected Hashtable<String, Object> context;
	/**
	 * ������� � �������� �� ������ �����������.
	 */
	protected Hashtable<String, String> continfo;
	/**
	 * {@value} ��������� �� ��������� ��������.
	 */
	Controller controller = Controller.getController();
	/* (non-Javadoc)
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public abstract void  run();
	
	/**
	 * ����� ���������� �������.
	 * @param context ��������, ���� ������� ���������� ���� ������.
	 */
	public void setContext(ContextForCommand context){
		
		this.context = context.getHashTable();
	}
}
