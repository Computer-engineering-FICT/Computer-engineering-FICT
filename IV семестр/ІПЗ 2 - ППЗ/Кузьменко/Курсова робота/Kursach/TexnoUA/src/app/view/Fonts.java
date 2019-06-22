package app.view;

import java.awt.Font;
import java.awt.GraphicsEnvironment;


/**
 * ���� �������� �� ������� �� ����� ���������� ����������
 * @author Vova
 *
 */
public class Fonts {
	
	/**
	 * ���� ����㳺 ������� �����
	 */
	private static Font font;
	/**
	 * ���� ������ ����� ��� ��������� ������
	 */
	private static String [] fontsNames;
	/**
	 * ���� ������ ����� ������
	 */
	private static String [] logicFonts;
	/**
	 * ���� ������ ������ ������
	 */
	private static Integer [] sizeFont;
	/**
	 * ����� ������� ������� �����
	 * @return ������� �����
	 */
	public static Font getFont() {
		if (font == null){
			return new Font("Times New Roman", Font.PLAIN, 14);
		}else{
			return font;			
		}
	}
	/**
	 * ������������� �����. �������� ������� ������, ����� ������, ������ ������
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
	 * ����� ���������� ����� ������� �����
	 * @param font
	 */
	public static void setFont(Font font){
		Fonts.font = font;
	}
	/**
	 * ����� ������� ����� � ������� ������
	 * @return ����� ������
	 */
	public static String [] getFontsNames() {
		if (fontsNames==null){
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			return ge.getAvailableFontFamilyNames();
		}
		return fontsNames;
	}
	
	/**
	 * ����� ������� ����� � ������� ������� ������
	 * @return ����� ������
	 */
	public static String [] getLogicFonts() {
		if (logicFonts==null){
			String [] logicFonts  = {"PLAIN", "BOLD", "ITALIC" };
			Fonts.logicFonts = logicFonts;
		}
		return logicFonts;
	}
	
	/**
	 * ����� ������� ����� ��������� ������ ������
	 * @return ������ ������
	 */
	public static Integer [] getSizeFont() {
		if (sizeFont==null){
			Integer [] size = {10,11,12,13,14,15};
			Fonts.sizeFont = size;
		}
		return sizeFont;
	}
	
	
}
