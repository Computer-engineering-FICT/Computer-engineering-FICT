package app.view;

import java.awt.Font;
import java.awt.GraphicsEnvironment;


/**
 * Клас одиночка що відповідає за шрифт графічного інтерфейсу
 * @author Vova
 *
 */
public class Fonts {
	
	/**
	 * поле збірегіє текущий шрифт
	 */
	private static Font font;
	/**
	 * поле зберігає імена усіх доступних шрифтів
	 */
	private static String [] fontsNames;
	/**
	 * поле зберігає логічні шрифти
	 */
	private static String [] logicFonts;
	/**
	 * поле зберігає розміри шрифтів
	 */
	private static Integer [] sizeFont;
	/**
	 * метод повертає текущий шрифт
	 * @return текущий шрифт
	 */
	public static Font getFont() {
		if (font == null){
			return new Font("Times New Roman", Font.PLAIN, 14);
		}else{
			return font;			
		}
	}
	/**
	 * конструктурор класу. ініціалізує доступні шрифти, логічні шрифти, розміри шрифтів
	 */
	public Fonts() {
		GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
		Fonts.fontsNames= ge.getAvailableFontFamilyNames();
		String [] logicFonts  = {"PLAIN", "BOLD", "ITALIC" };
		Fonts.logicFonts = logicFonts;
		final Integer [] size = {8,9,10,11,12,13,14,15,16,17,18,19,20};
		Fonts.sizeFont = size;
		// new SelectFont(fontFamilies, logicFonts, size);
	}
	/**
	 * метод встановлює новий текущий шрифт
	 * @param font
	 */
	public static void setFont(Font font){
		Fonts.font = font;
	}
	/**
	 * метод повертає масив з іменами шрифтів
	 * @return імена шрифтів
	 */
	public static String [] getFontsNames() {
		if (fontsNames==null){
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			return ge.getAvailableFontFamilyNames();
		}
		return fontsNames;
	}
	
	/**
	 * метод повертає масив з іменами логічних шрифтів
	 * @return логічні шрифти
	 */
	public static String [] getLogicFonts() {
		if (logicFonts==null){
			String [] logicFonts  = {"PLAIN", "BOLD", "ITALIC" };
			Fonts.logicFonts = logicFonts;
		}
		return logicFonts;
	}
	
	/**
	 * метод повертає масив доступних розмірів шрифтів
	 * @return розміри шрифтів
	 */
	public static Integer [] getSizeFont() {
		if (sizeFont==null){
			Integer [] size = {10,11,12,13,14,15};
			Fonts.sizeFont = size;
		}
		return sizeFont;
	}
	
	
}
