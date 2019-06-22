import javax.swing.*;
import java.awt.event.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
public class jtableFrame {
static  DefaultTableModel model = new DefaultTableModel();
static JButton button = new JButton("ADD");
static JButton button1 = new JButton("Remove");
static JButton button2 = new JButton("Draw ");
public static Vector rowData=new Vector();
 public static class MyActionListener implements ActionListener {
        public void actionPerformed(ActionEvent evt) {
            JButton button = (JButton)evt.getSource();
            System.out.println("Додавти рядок");
            rowData.add("11");
            rowData.add("22");
            rowData.add("33");
            rowData.add("44");
            rowData.add("55");
            rowData.add("66");
            model.insertRow(0, rowData);
        }
    }
 public static class MyActionListener2 implements ActionListener {
	  



	 public void actionPerformed(ActionEvent evt) {
	            JButton button1 = (JButton)evt.getSource();
	          System.out.println("Удалить строку");
	          model.removeRow(0);
	      }
	  }
	 public static void main(String[] args) {
	      model.addColumn("Column");
	      model.addColumn("Column");
	      model.addColumn("Column");
	      model.addColumn("Column");
	      model.addColumn("Column");
	      model.addColumn("Column");
	  Vector rowData=new Vector();
	  JTable jtbl=new JTable(model);
	  JPanel jp=new JPanel();
	  jp.add(jtbl);
	  Box box = new Box(BoxLayout.X_AXIS);
	  int width = 30;
	  box.add(Box.createVerticalStrut(width));
	  button.addActionListener(new MyActionListener());
	         JFrame jf=new JFrame();
	         box.add(jp);
	         box.add(button1);
	         box.add(button);
	         box.add(button2);

	         jf.setDefaultCloseOperation(jf.EXIT_ON_CLOSE);
	         jf.getContentPane().add(box);
	         jf.setSize(1280,1024);
	            jf.setVisible(true);
	         button1.addActionListener(new MyActionListener2());
	                  }
	 }
