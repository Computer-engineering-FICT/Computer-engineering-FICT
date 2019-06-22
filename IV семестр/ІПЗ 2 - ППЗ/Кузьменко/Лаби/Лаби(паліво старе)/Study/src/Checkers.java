import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.Arc2D;
import java.awt.geom.CubicCurve2D;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import java.awt.geom.QuadCurve2D;
import java.awt.geom.Rectangle2D;
import java.awt.geom.RoundRectangle2D;

public class Checkers {
	public static void main (String[] args){
		System.out.println("It's my program");
		String[] fontNames = GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();
		for (int i =0; i<fontNames.length; i++)
			System.out.println(fontNames[i]);
		Frames frame1 = new Frames();
		frame1.show();
		frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}

class Frames extends JFrame
{
	public Frames()
	{
		setTitle("Main Frame");
		setBounds(500,500,500,500);
		Panel panel = new Panel();
		Container pane = getContentPane();
		pane.add(panel);
	}
}

class Panel extends JPanel
{
	public void paintComponent(Graphics g1)
	{
		super.paintComponent(g1);
		g1.drawString("This is my text",100,100);
	}
}
