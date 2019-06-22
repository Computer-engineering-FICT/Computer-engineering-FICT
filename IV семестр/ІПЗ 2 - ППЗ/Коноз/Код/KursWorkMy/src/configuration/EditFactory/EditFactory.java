package configuration.EditFactory;

import configuration.CompositeStructure.CompositeComponent;
import configuration.Loaders.*;
import configuration.Writers.*;

/**
 * Даний клас має статичні методи для запису і завантаження 
 * об'єктів конфігурації. Він залежно від формату файла повертає
 * потрібний екземпляр класу для роботи.
 * @author Коноз Андрій.
 *
 */
public class EditFactory {
	/**
	 * @param writer має посилання на об'єкт, який займається
	 * записом в файл об'єкта конфігурації.
	 * @param loader має посилання на об'єкт, який займається 
	 * зчитуванням з файлу об'єкта конфігурації.
	 */
	private static Writer writer;
	private static Loader loader;

	
	/**
	 * Метод приймає параметром об'єкт, який потрібно записати 
	 * у файл. Об'єкт для запису містить в собі адресу, по якій 
	 * він буде збережений. Залежно від того, яким розширенням 
	 * закінчується адреса, буде сформовано об'єкт типу {@link Writer}
	 * який спеціалізується на запису файлів цього формату.
	 * Після створення цього об'єкта, в нього буде викликано
	 * метод write(), якому буде передано об'єкт для запису.
	 * @param comp об'єкт, який потрібно записати у файл.
	 */
	public static void save(CompositeComponent comp){
		if(comp.getPath().endsWith(".xml")){
			writer = new XMLWriter();
			writer.write(comp);
		}
	}
	
	/**
	 * Метод приймає в якості параметру адресу об'єкта, який потрібно 
	 * завантажити. Залежно від розширення, який закінчується адреса, 
	 * буде сформовано об'єкт типу {@link Loader} який спаціалізується
	 * на зчитуванні о'бєктів з файлів даного розширення.
	 * Після створення цього об'єкта, в нього буде викликано метод 
	 * load(), якому буде передана адреса файла.
	 * @param savePath адреса файла.
	 * @return повертає об'єкт типу {@link CompositeComponent}
	 */
	public static CompositeComponent load(String savePath){
		if(savePath.endsWith(".xml")){
			loader = new XMLLoader();
		}
		return loader.load(savePath);
	}
	

}
