

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class Table extends JFrame {
	
	private ArrayList<ArrayList<String>> Graph; //������� ��������� ����� ����
	private HashMap<Integer, Integer> States; //���� ������
	private JMenuItem save;
	private JMenuItem load;
	private int triggerCount = 0; //���������� ��������� //list.get(l)[0]
	private ArrayList<String> VertexAutomat; //������ � ��������
	private int changes = 0; //���������� ���������!
	private ArrayList<String> signals; //������ ���� ������������ ��������
	private ArrayList<String[]> list = new ArrayList<String[]>(); //������ ������
	//1 ������� ������� - ������ ��������
	//2 ������� - ������� ������
	//3 ������� - ������� ����
	private Table thiss = this;
	private JScrollPane jScrollPane1;
	private JTable jTable1; //������� ��� �����������!!!
	
	private Object[][] table;
	private String[] str;
	private ArrayList<String> arrayListX;
	private ArrayList<String> arrayListY;
	
	//graph - ������� ��������� ����� ����
	//states - ������� ����������� ������� ����� -> ��������� Q0Q1...Qn
	//arrayList - ������ ���� ������������ ��������
	public Table(String lol, ArrayList<ArrayList<String>> graph, 
			HashMap<Integer, Integer> states,
			ArrayList<String> arrayList, ArrayList<String> VertexAuto) {
		super(lol);
		VertexAutomat = VertexAuto;
		Graph = graph; 
		States = states;
		signals = arrayList;
		
		//����������
		arrayListX = new ArrayList<String>();
		arrayListY = new ArrayList<String>();
		for (int i = 0; i < arrayList.size(); i++) {
			if (arrayList.get(i).contains("x")) 
				arrayListX.add(arrayList.get(i));
			else
				arrayListY.add(arrayList.get(i));
		}
		
		//�������� ����
        JMenuBar mbar = new JMenuBar();
        JMenu file = new JMenu("FILE");
        file.add(save = new JMenuItem("Save"));
        file.add(load = new JMenuItem("Load"));
        file.add(load = new JMenuItem("MINIMIZE AND MAKE"));
        mbar.add(file);
        addMenuLoadAndSave();
        
        Container contentPane = this.getContentPane();
        //������������ �� ����� ������� ������
        contentPane.setLayout(new BorderLayout());
        contentPane.add(mbar,BorderLayout.NORTH);

        this.setSize(600,600);
        this.setVisible(true);
        
        //1.4. ����������� ���������� RS - ���������.
        triggerCount = log2plus(graph.size());

        //1.6. ����������� ���������� ��������� ����� ���� � ������ ���������

        for (int i = 0; i < graph.size(); i++) {
        	for (int j = 0; j < graph.size(); j++) {
            	if (Graph.get(i).get(j).contains("-") |
        			Graph.get(i).get(j).contains("y") |
        			Graph.get(i).get(j).contains("x")) { //���� ���� �������
            		//������ ���������� ������ ��������� �� ����� � ��� �� �����
        			String[] temp = {Graph.get(i).get(j), i+"", j+""};
        			System.out.println(Graph.get(i).get(j) + " : " + i + " : " + j);
        			list.add(temp); //��������� ������ ���������... �����������
            	}
            }
        }
        changes = list.size();
        
        
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        
        jScrollPane1.setName("jScrollPane1"); // NOI18N
        //1.7. ����������� ���������� ��������� �������. ������� ����
        //sum_count = n + n + m + i + 2*n = 4*n + m + i
        //Qi(n) + Qi+1(n) + R(n) + s(n) + yxcount = 4 * triggerCount + yCount + xCount
        int sum_count = 4 * triggerCount + arrayListX.size() + arrayListY.size();

        //1.8. � ������ ����������� ��������� ������ ���������.
        str = new String[sum_count];
        
        int j = 0;
        //��������� ������� ���������
        for (int i = 0; i < triggerCount; i++) {
        	str[i] = "Qt" + j; j++;
        }
        //��������� ��������� ���������
        for (int i = triggerCount; i < triggerCount * 2; i++) {
        	str[i] = "Qt+1" + (i - triggerCount); j++;
        }
        //��������� ������� ��������
        for (int i = triggerCount * 2; 
        		 i < triggerCount * 2 + arrayListX.size(); 
        		 i++) {
        	//� ������� ������� ���� �, ����� y.
        	str[i] = arrayListX.get(i - triggerCount * 2); 
        }
        System.out.println(arrayList);
        //��������� �������� ��������
        for (int i = triggerCount * 2 + arrayListX.size(); 
		         i < triggerCount * 2 + arrayListX.size() + arrayListY.size();
		         i++) {
        	str[i] = arrayListY.get(i - triggerCount * 2 - arrayListX.size());
        }
      //��������� ������� ����������� ��������
        int f = 0;
        for (int i = triggerCount * 2 + arrayListX.size() + arrayListY.size();
        		 i < sum_count; i += 2) {
        	str[i] = "J" + f;
        	str[i+1] = "K" + f++;
        }
        
        //1.9. �������� �������� ���������� (�������).
        Object[][] obj = new Object[changes][sum_count];
        obj = formThisWay(obj, sum_count); 

        //1.10. ������� ������������ �� ������� �����, � ����.
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            obj,
            str
        ));
        jTable1.setName("jTable1"); // NOI18N
        jScrollPane1.setViewportView(jTable1);
        
        this.add(jScrollPane1);
        jTable1.setVisible(true);
	}

	//�������� ���������� �������
	private Object[][] formThisWay(Object[][] obj, int sum_count) {
		//������ ������ �����
		for (int l = 0; l < changes; l++) {
			//������� ���������...
			int numberQi = States.get(Integer.parseInt(list.get(l)[1]));
			int numberQi_plus_1 = States.get(Integer.parseInt(list.get(l)[2]));
			int j = triggerCount;
			//��������� Qi
			for (int i = 0; i < triggerCount; i++) {
				obj[l][i] = getBit(numberQi, j--);
	        }
			//��������� Qi+1
			j = triggerCount;
	        for (int i = triggerCount; i < triggerCount * 2; i++) {
	        	obj[l][i] = getBit(numberQi_plus_1, j--);
	        }
	        //������������ ������� �������, ������ ���������� ������ ������� ��������...
	        for (int i = triggerCount * 2; 
	        		 i < triggerCount * 2 + arrayListX.size(); 
	        		 i++) {
	        	if (list.get(l)[0].contains("!"+str[i])) {
	        		obj[l][i] = "0";
	        	} else if (list.get(l)[0].contains(str[i])) {
	        		obj[l][i] = "1";
	        	} else {
	        		obj[l][i] = "-";
	        	}
	        }
	        //... � ���������� ������ �������� ��������
	        for (int i = triggerCount * 2 + arrayListX.size(); 
			         i < triggerCount * 2 + signals.size();
			         i++) {
	        	if (VertexAutomat.get(Integer.parseInt(list.get(l)[1])).
	        			contains(signals.get(i - triggerCount * 2))) {
	        		obj[l][i] = "1";
	        	} else {
	        		obj[l][i] = "0";
	        	}
	        }
	      //������� ������� R � S (����������� �� ����� Qi � Qi+1)
	        j = triggerCount;
	        for (int i = triggerCount * 2 + signals.size();
	        		 i < sum_count; i += 2) {
	        	int Qi1 = getBit(numberQi, j);
	        	int Qi2 = getBit(numberQi_plus_1, j);
	        	j--;
	        	obj[l][i] = JKTrigger.getJSignal(Qi1, Qi2);
	        	obj[l][i+1] = JKTrigger.getKSignal(Qi1, Qi2);
	        }
		}
		table = obj;
		return obj; //������� ��������� ������ ��� �����������.
	}

	//�������!!!
	private void addMenuLoadAndSave() {
        save.addActionListener( new ActionListener()
        {
            public void actionPerformed(ActionEvent e) {
                JFileChooser fc = new JFileChooser();
                
                fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
                File FS;
                if (fc.showSaveDialog(thiss)==JFileChooser.APPROVE_OPTION){
                    FS = fc.getSelectedFile();
                    try {
                        FileOutputStream fos = new FileOutputStream(FS);
                        ObjectOutputStream oos = new ObjectOutputStream(fos);
                        oos.writeObject(jScrollPane1);
                        oos.writeObject(jTable1);
                        FS.createNewFile();
                    } catch (Exception ex) {}
                }
            }
        });

        load.addActionListener( new ActionListener()
        {
            public void actionPerformed(ActionEvent e) {
                JFileChooser fc = new JFileChooser();
                
                fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
                File FS;
                if (fc.showOpenDialog(thiss) == JFileChooser.APPROVE_OPTION){
                    FS = fc.getSelectedFile();
                    thiss.remove(jScrollPane1);
                    try {
                        FileInputStream fis = new FileInputStream(FS);
                        ObjectInputStream ois = new ObjectInputStream(fis);
                        
                        jScrollPane1 = (JScrollPane) ois.readObject();
                        jTable1 = (JTable) ois.readObject();
                        
                        jScrollPane1.setViewportView(jTable1);
                        
                        thiss.add(jScrollPane1);
                        jTable1.setVisible(true);
                        
                    } catch (Exception ex) {}
                }
            }
        });
	}
	
	public Object[][] getTable() {
		return table;
	}
	
	public static int log2plus(double num) {
    	if (num == 1) return 1;
   		double x = Math.log(num)/Math.log(2);
   		if (x > (int) x) {
   			return (int) x + 1;
   		} else {
   			return (int) x;
   		}
    }
    
    public static int getBit(int num, int place) {
    	return (num >> place - 1) & 1;
    }

    public int getXLNG() { return arrayListX.size(); }
    public int getYLNG() { return arrayListY.size(); }
    public int getCOUNT() { return log2plus(Graph.size()); }
    public String[] getHeader() { return str; }
}