package controller;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import controller.commands.Command;

/**
 * Клас створює однопотокову чергу на виконання.
 * @author Коноз Андрій 
 */
public class MyExecutor {

	
	/**
	 * {@value} Створення онопотокової черги на виконання.
	 */
	private static ExecutorService executor = Executors.newSingleThreadExecutor();
	
	/**
	 * Запускає на виконання команду типу {@link Command}
	 * @param command команда, яку потрібно запустити.
	 */
	public static void execute(Command command){
		
		executor.execute(command);
	}

}
