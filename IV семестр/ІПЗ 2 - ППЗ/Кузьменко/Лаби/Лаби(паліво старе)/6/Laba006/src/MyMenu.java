import javax.swing.*;
import java.awt.event.*;
class MyMenu extends JMenuBar
             implements ActionListener
{
    String [] s1=new String []
                             {"Create File", "Open File", "Save File"};
    String [] s2=new String []
                             {"Undo", "Redo"};
    String [] s3=new String []
                             {"Greater", "Lower"};

 MyMenu()
 {
     JMenu menu1=new JMenu("File");
     JMenu menu2=new JMenu("Edit");
     JMenu menu3=new JMenu("View");

     JMenuItem [] items1=new JMenuItem [s1.length];
     JMenuItem [] items2=new JMenuItem [s2.length];
     JMenuItem [] items3=new JMenuItem [s3.length];

     for(int i=0; i < s1.length; i++)
      {
       items1 [i]=new JMenuItem(s1 [i]);
       menu1.add(items1 [i]);
       items1 [i].addActionListener(this);
      }
      add(menu1);
      for(int i=0; i < s2.length; i++)
      {
       items2 [i]=new JMenuItem(s2 [i]);
       menu2.add(items2 [i]);
       items2 [i].addActionListener(this);
      }
      add(menu2);
      for(int i=0; i < s3.length; i++)
      {
    	  items3 [i]=new JMenuItem(s3 [i]);
          menu3.add(items3 [i]);
          items3 [i].addActionListener(this);
         }
         add(menu3);
    }
    public static void main(String [] args)
    {
     JFrame f=new JFrame();
     f.setJMenuBar(new MyMenu());
     f.setBounds(100,100,400,300);
     f.setVisible(true);
    }
   }
