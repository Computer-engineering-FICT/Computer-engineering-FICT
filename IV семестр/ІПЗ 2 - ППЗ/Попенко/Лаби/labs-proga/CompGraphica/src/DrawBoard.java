import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Shape;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.text.AttributedCharacterIterator;

import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class DrawBoard extends JFrame {
	protected static final int WIDTH = 800;
	protected static final int HEIGHT = 600;
	private static DrawPanel drPanel;
	private Object contentPane;
	
	
	public DrawBoard() {
		this.addNotify();
		this.setSize(this.getInsets().left + this.getInsets().right + WIDTH,
				this.getInsets().top + this.getInsets().bottom + HEIGHT);
		this.setTitle("Лабораторна №4 Варіант 3 Попенка Р. і Змеула Є.");
		JLabel label = new JLabel("\u0420\u0443\u0445 \u043F\u043E \u0432\u0435\u0440\u0445\u043D\u0456\u0439 \u0447\u0430\u0441\u0442\u0438\u043D\u0456 \u043A\u043E\u043B\u0430 \u0437\u0430 \u0433\u043E\u0434\u0438\u043D\u043D\u0438\u043A\u043E\u0432\u043E\u044E \u0441\u0442\u0440\u0456\u043B\u043A\u043E\u044E");
		label.setFont(new Font("Times New Roman", Font.BOLD, 18));
		label.setBounds(192, 11, 476, 22);
		this.add(label);
		
	    
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		drPanel = new DrawPanel(this);
		this.add(drPanel);
		
		this.setVisible(true);
		
	}
	
	

	
}
