package app.view;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JMenu;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import app.view.SelectLanguages;
/**
 * Клас що реалізує головне вікно програми
 * 
 * @author Vova
 * 
 */
@SuppressWarnings("serial")
public class MainFrame extends JFrame {
	/**
	 * панель вкладок
	 */
	private TabbedPane tabbedPane = new TabbedPane();
	/**
	 * контейнер для елементів меню
	 */
	private JMenuBar menuBar = new JMenuBar();

	/**
	 * конструктор головного вікна.
	 */
	/**
	 * 
	 */
	public MainFrame() {
		setFont(Fonts.getFont());
		setTitle(Languages.getProperty("mainFrameTitle"));
		setResizable(false);
		setContentPane(tabbedPane);
		setBounds(100, 100, 550, 400);
		tabbedPane.setVisible(true);
		setJMenuBar(menuBar);
		JMenu menuMain = new JMenu(Languages.getProperty("menu"));
		menuMain.setFont(Fonts.getFont());
		menuBar.add(menuMain);
		menuBar.setFont(Fonts.getFont());
		JMenu menuStoreman = new JMenu(Languages.getProperty("storeman"));
		menuStoreman.setFont(Fonts.getFont());
		menuBar.add(menuStoreman);

		JMenuItem menuItemGoodsforClient = new JMenuItem(Languages.getProperty("goodsForClient"));
		menuItemGoodsforClient.setFont(Fonts.getFont());
		menuStoreman.add(menuItemGoodsforClient);
		JMenuItem menuItemExitProgram = new JMenuItem(Languages.getProperty("exitOnProgram"));
		menuItemExitProgram.setFont(Fonts.getFont());
		menuMain.add(menuItemExitProgram);
		JMenuItem menuItemExitSystem = new JMenuItem(Languages.getProperty("exitOnSystem"));
		menuItemExitSystem.setFont(Fonts.getFont());
		menuMain.add(menuItemExitSystem);

		JMenuItem menuItemGoodsForCourier = new JMenuItem(Languages.getProperty("goodsForCourier"));
		menuItemGoodsForCourier.setFont(Fonts.getFont());
		menuStoreman.add(menuItemGoodsForCourier);
		

		JMenuItem menuItemGetNewGoods = new JMenuItem(Languages.getProperty("getGoods"));
		menuItemGetNewGoods.setFont(Fonts.getFont());
		menuStoreman.add(menuItemGetNewGoods);
		JMenu menuCourier = new JMenu(Languages.getProperty("courier"));
		menuCourier.setFont(Fonts.getFont());
		menuBar.add(menuCourier);
		JMenuItem menuItemCarryGoods = new JMenuItem(Languages.getProperty("deliveryGoods"));
		menuItemCarryGoods.setFont(Fonts.getFont());
		menuCourier.add(menuItemCarryGoods);

		JMenuItem menuItemInfo = new JMenuItem(Languages.getProperty("myData"));
		menuItemInfo.setFont(Fonts.getFont());
		menuMain.add(menuItemInfo);
		JMenu menuSetting = new JMenu(Languages.getProperty("properties"));
		menuSetting.setFont(Fonts.getFont());
		JMenuItem menuItemStyle = new JMenuItem(Languages.getProperty("style"));
		menuItemStyle.setFont(Fonts.getFont());
		menuSetting.add(menuItemStyle);
		JMenuItem menuItemLanguages = new JMenuItem(Languages.getProperty("languages"));
		menuItemLanguages.setFont(Fonts.getFont());
		menuSetting.add(menuItemLanguages);
		JMenuItem menuItemFont = new JMenuItem(Languages.getProperty("font"));
		menuItemFont.setFont(Fonts.getFont());
		menuSetting.add(menuItemFont);
		menuBar.add(menuSetting);

		if (Authorisation.getCategory().getCategory()
				.equalsIgnoreCase("courier")) {
			menuStoreman.setEnabled(false);
		} else {
			menuCourier.setEnabled(false);
		}
		JMenu menuItemAuthor = new JMenu(Languages.getProperty("info"));
		menuBar.add(menuItemAuthor);
		JMenuItem item = new JMenuItem(Languages.getProperty("author"));
		menuItemAuthor.add(item);
		item.setFont(Fonts.getFont());
		menuItemAuthor.setFont(Fonts.getFont());
		item.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				JOptionPane.showMessageDialog(MainFrame.this, Languages.getProperty("messageAuthor"), Languages.getProperty("message"), DISPOSE_ON_CLOSE, null);
				
			}
		});

		menuItemExitSystem.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				Authorisation dialog = new Authorisation();
				dialog.addWindowListener(new MyWindowsListener());
				dialog.setVisible(true);
				MainFrame.this.setVisible(false);
				MainFrame.this.dispose();
			}
		});

		menuItemInfo.addActionListener(new ActionListener() {

			@SuppressWarnings("static-access")
			@Override
			public void actionPerformed(ActionEvent arg0) {
				tabbedPane.addTabPanel(new WorkerInfo(), Languages.getProperty("myInfo"));
			}
		});

		menuItemCarryGoods.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				TabbedPane.addTabPanel(
						new CarryGoods(Authorisation.getProfile()),
						Languages.getProperty("deliveryGoods"));
			}
		});

		menuItemExitProgram.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				Object[] objects = new Object[2];
				objects[0] = new String(Languages.getProperty("yesBtn"));
				objects[1] = new String(Languages.getProperty("noBtn"));
				int result = JOptionPane.showOptionDialog(MainFrame.this,
						Languages.getProperty("MainFrameLabel1"), Languages.getProperty("info"),
						JOptionPane.YES_NO_OPTION,
						JOptionPane.QUESTION_MESSAGE, null, objects, null);

				if (result == JOptionPane.YES_OPTION) {
					MainFrame.this.dispose();
					System.exit(0);
				}

			}
		});
		menuItemGoodsforClient.addActionListener(new ActionListener() {

			@SuppressWarnings("static-access")
			@Override
			public void actionPerformed(ActionEvent e) {
				tabbedPane.addTabPanel(
						new CarryGoods(Authorisation.getProfile()),
						Languages.getProperty("deliveryGoods"));
			}
		});
		menuItemGoodsForCourier.addActionListener(new ActionListener() {

			@SuppressWarnings("static-access")
			@Override
			public void actionPerformed(ActionEvent e) {
				tabbedPane.addTabPanel(new GoodsForCourier(), Languages.getProperty("MainFrameLabel2"));
			}
		});

		menuItemGetNewGoods.addActionListener(new ActionListener() {

			@SuppressWarnings("static-access")
			@Override
			public void actionPerformed(ActionEvent e) {
				tabbedPane.addTabPanel(new ResupplyGoods(),Languages.getProperty("getGoods"));
			}
		});
		menuItemStyle.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				SelectStyle dialog = new SelectStyle(MainFrame.this);
				dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
				dialog.setVisible(true);

			}
		});
		menuItemLanguages.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				new SelectLanguages(MainFrame.this);
				
			}
		});
		menuItemFont.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				new SelectFont(Fonts.getFontsNames(), Fonts.getLogicFonts(), Fonts.getSizeFont(),MainFrame.this);
				
			}
		});
	}

	/**
	 * метод встановлює стиль головного вікна та меню
	 * 
	 * @param className
	 *            назва стилю
	 */
	public void setStyle(String className) {
		try {
			UIManager.setLookAndFeel(className);
			menuBar.updateUI();
			for (Component item : menuBar.getComponents()) {
				if (item.getClass().equals(JMenu.class)) {
					JMenu i = (JMenu) item;
					i.updateUI();
					for (Component e : i.getComponents()) {
						JMenuItem menuItem = (JMenuItem) e;
						menuItem.updateUI();
					}
				}
			}
			;

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
