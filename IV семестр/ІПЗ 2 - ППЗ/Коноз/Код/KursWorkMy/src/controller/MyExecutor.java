package controller;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import controller.commands.Command;

/**
 * ���� ������� ������������ ����� �� ���������.
 * @author ����� ����� 
 */
public class MyExecutor {

	
	/**
	 * {@value} ��������� ����������� ����� �� ���������.
	 */
	private static ExecutorService executor = Executors.newSingleThreadExecutor();
	
	/**
	 * ������� �� ��������� ������� ���� {@link Command}
	 * @param command �������, ��� ������� ���������.
	 */
	public static void execute(Command command){
		
		executor.execute(command);
	}

}
