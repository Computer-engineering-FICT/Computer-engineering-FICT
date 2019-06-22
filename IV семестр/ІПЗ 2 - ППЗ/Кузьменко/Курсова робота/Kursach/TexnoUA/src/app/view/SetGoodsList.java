package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Iterator;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.EmptyBorder;

import app.model.Description;
import app.model.Goods;
import app.model.Position;

@SuppressWarnings("serial")
/**
 * Клас, що реалізує інтерфейс користувача для відображення списку товарів 
 * @author Vova
 *
 */
public class SetGoodsList extends JDialog {
	/**
	 * панель для елементів графічного інтерфейсу
	 */
	private final JPanel contentPanel = new JPanel();

	/**
	 * ствоерння нового вікна
	 * @param goods список товарів
	 * @param descriptions список описів
	 * @param positions список позицій
	 */
	public SetGoodsList(List<Goods> goods, List<Description> descriptions,
			List<Position> positions) {
		setFont(Fonts.getFont());
		setResizable(false);
		this.setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
		setBounds(100, 100, 494, 300);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setLayout(new FlowLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		
		String[] columNames = { "ID", Languages.getProperty("name"), Languages.getProperty("maker"), Languages.getProperty("count"),
				Languages.getProperty("priceOneCell") };
		Object[][] cells = new Object[goods.size()][columNames.length];
		Iterator<Goods> gItr = goods.iterator();
		Iterator<Description> dItr = descriptions.iterator();
		Iterator<Position> pItr = positions.iterator();
		Goods g;
		Description d;
		Position p;
		for (int i = 0; i < cells.length; i++) {
			g = gItr.next();
			d = dItr.next();
			p = pItr.next();
			cells[i][0] = g.getId();
			cells[i][1] = d.getName();
			cells[i][2] = d.getMaker();
			cells[i][3] = p.getCount();
			cells[i][4] = g.getMarkofgoods();
		}
		JTable table = new JTable(cells, columNames);
		table.setFont(Fonts.getFont());
		table.setVisible(true);
		JScrollPane pane = new JScrollPane(table);
		pane.setFont(Fonts.getFont());
		contentPanel.add(pane);

		{
			JPanel buttonPane = new JPanel();
			buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
			getContentPane().add(buttonPane, BorderLayout.SOUTH);
			{
				JButton okButton = new JButton(Languages.getProperty("yesBtn"));
				okButton.setFont(Fonts.getFont());
				buttonPane.add(okButton);
				getRootPane().setDefaultButton(okButton);
				okButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent arg0) {
						SetGoodsList.this.dispose();

					}
				});
			}

		}
	}

	/**
	 * метод, що встановлює стиль вікна
	 * @param className назва стилю
	 */
	public static void setStyle(String className) {
		try {
			UIManager.setLookAndFeel(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
