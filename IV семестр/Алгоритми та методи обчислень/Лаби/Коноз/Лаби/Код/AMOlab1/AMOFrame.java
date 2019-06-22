package AMOlab1;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;


public class AMOFrame extends JFrame {
	Graphics g = getGraphics();
	JButton button = new JButton("Перший алгоритм");
	JButton button2 = new JButton("Другий алгоритм");
	JButton button3 = new JButton("Третій алгоритм");
	JPanel panel1 = new JPanel();
	JPanel panel3 = new JPanel();
	EnterPanel panel2 = new EnterPanel();
	JTextField field = new JTextField(30);
	JTextArea area = new JTextArea(3, 20);
	String information;
	public AMOFrame(String title){
		setTitle(title);
		Toolkit tool = Toolkit.getDefaultToolkit();
		Dimension dimension = tool.getScreenSize();
		setSize(dimension.width/3, dimension.height/3);
		
	//	panel3.
		
		
		
		panel1.add(button);
		panel1.add(button2);
		panel1.add(button3);
		panel2.add(field);
	//	panel3.add(area);
		
		
		MyListener listener = new MyListener(1);
		MyListener listener2 = new MyListener(2);
		MyListener listener3 = new MyListener(3);
		EnterListener listener4 = new EnterListener();
		
		button.addActionListener(listener);
		button2.addActionListener(listener2);
		button3.addActionListener(listener3);
		field.addActionListener(listener4);
		
		add(panel1, BorderLayout.NORTH);
		add(panel2, BorderLayout.CENTER);
		add(panel3, BorderLayout.SOUTH);
	
	}
	
	public void paintComponent(Graphics g){
		g.drawString("!!!!!", 100, 700);
	}
	public void program1(){
		System.out.println(information);
		panel3.repaint();
		area.append(information);
	//	g.drawString("Алгоритм 1 " + information, 500, 500);
		
	}
	public void program2(){
	//	g.drawString("Алгоритм 2", 500, 500);
		
	}
	public void program3(){
	//	g.drawString("Алгоритм 3", 500, 500);
		
	}
	class EnterListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			EnterPanel.info = field.getText();
			
		}
		
	}
	class MyListener implements ActionListener{
		int key;
		
		public MyListener(int key){
			this.key = key;
		}
		@Override
		public void actionPerformed(ActionEvent event) {
			switch (key) {
			case 1:
				program1();
				break;
			case 2:
				program2();
				break;
			case 3:
				program3();
				break;

			default:
				break;
			}
			
		}
	}
	
	

}
