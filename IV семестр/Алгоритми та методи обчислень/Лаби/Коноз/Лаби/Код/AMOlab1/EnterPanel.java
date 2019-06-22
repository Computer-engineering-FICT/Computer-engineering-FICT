package AMOlab1;

import java.awt.Color;
import java.awt.Graphics;

import javax.swing.JPanel;
import javax.swing.JTextField;

public class EnterPanel extends JPanel{
	static String info = "hhh";
	public EnterPanel(){
		
	}
	
	public void paintComponent(Graphics g){
		super.paintComponent(g);
		g.clearRect(10, 10, 100, 100);
		g.drawString(info, 30, 60);
	}
	

}
