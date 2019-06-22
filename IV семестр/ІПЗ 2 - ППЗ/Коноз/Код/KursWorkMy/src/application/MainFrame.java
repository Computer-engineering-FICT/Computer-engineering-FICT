package application;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.Hashtable;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JMenuBar;
import javax.swing.JTable;
import javax.swing.JSeparator;
import javax.swing.JViewport;
import javax.swing.SwingConstants;
import javax.swing.JMenu;
import javax.swing.JButton;
import javax.swing.JMenuItem;
import javax.swing.JRadioButtonMenuItem;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import configuration.CompositeStructure.AppConfiguration;
import configuration.CompositeStructure.CompositeComponent;
import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;

/**
 * Клас реалізує функціонал головного вікна програми.
 * @author Коноз Андрій 
 */
public class MainFrame extends JFrame {

	/**
	 * Основна панель, в якій будуть міститися всі інші об'єкти.
	 */
	private JPanel contentPane;
	/**
	 * Таблиця, в якій буде відображатися інформація директорій з товарами.
	 */
	private JTable goodsTable;
	/**
	 * Таблиця, в якій буде відображатися інформація про клієнтів.
	 */
	private JTable clientsTable;
	/**
	 * Кнопка, яка відображає таблицю товарів.
	 */
	private JButton btnGoods;
	/**
	 * Кнопка, яка викликає вікно для редагування коталогу.
	 */
	private JButton btnEditCatalog;
	/**
	 * Мітка, якій свідображається підказки.
	 */
	private JLabel lblNewLabel;
	/**
	 * Кнопка, яка видаляє каталог.
	 */
	private JButton btnDeleteCatalog;
	/**
	 * Кнопка, яка відображає таблицю клієнтів.
	 */
	private JButton btnClients;
	/**
	 * Кнопка, яка відкриває детальний перегляд товару.
	 */
	private JButton btnOpenGoods;
	/**
	 * Кнопка, яка відкриває вікно для створення каталогу.
	 */
	private JButton btnCreateCatalog;
	/**
	 * Кнопка, яка відкриває вікно для створення товару.
	 */
	private JButton btnCreateGood;
	/**
	 * Розділяє таблицю і кнопки лінією для кращого візуального ефекту.
	 */
	private JSeparator separator;
	/**
	 * Повертає таблицю в корінь каталогу.
	 */
	private JButton btnNewButton;
	/**
	 * Панель в яку поміщають таблицю для кращоговізуального ефекту.
	 */
	private JScrollPane scrollPane;
	/**
	 * Посилання на самого себе. Використовується при створенні команд
	 */
	private MainFrame link = this;
	/**
	 * Мітка, яка відображає назву вузла, вміст якого відображається
	 */
	private JLabel lblTitle;
	/**
	 * Видаляє товар
	 */
	private JButton btnDeleteGoods;
	/**
	 * Відкриває список клієнтів.
	 */
	private JButton btnOpenClient;
	/**
	 * Пункт меню, який відповідає англійській мові
	 */
	private JRadioButtonMenuItem rdbtnmntmEnglish;
	/**
	 * Пункт меню, який відповідає українській мові
	 */
	private JRadioButtonMenuItem rdbtnmntmUkrainian;
	/**
	 * Пункт меню, який відповідає системному стилю
	 */
	private JRadioButtonMenuItem rdbtnmntmSystem;
	/**
	 * Пункт меню, який відповідає стандартному стилю
	 */
	private JRadioButtonMenuItem rdbtnmntmStandart;
	/**
	 * Пункт меню, який відповідає за стиль німб
	 */
	private JRadioButtonMenuItem rdbtnmntmNimbus;
	/**
	 * Таблиця, в якій зберігаються написи компонентів
	 */
	private Hashtable<String, String> context;
	/**
	 * Меню допомоги
	 */
	private JMenu mnHelp;
	/**
	 * Компонент, на якому розміщюються всі пункти меню
	 */
	private JMenuBar menuBar;
	/**
	 * Меню налаштувань
	 */
	private JMenu mnSettings;
	/**
	 * Підменю мов
	 */
	private JMenu mnLanguage;
	/**
	 * Підменю стилів
	 */
	private JMenu mnStyle;
	/**
	 * Пункт меню, який відповідає за інформацію про програму
	 */
	private JMenuItem mntmAbout;
	/**
	 * Пункт меню, який відповідає за інформацію допомоги
	 */
	private JMenuItem mntmHelp;

	/**
	 * Конструктор, в якому створюється і налаштовується головне вікно прогами.
	 */

	public MainFrame() {
		setIcon();
		setResizable(false);
		this.context = ContextUtils.loadContext("MainFrame");
		setTitle(context.get("title"));
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		setBounds(100, 100, 900, 472);
		initComponents();
		allocateComponents();
		

		mntmAbout.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {

				JOptionPane.showMessageDialog(link, context.get("AboutInform"),
						context.get("mntmAbout"),
						JOptionPane.INFORMATION_MESSAGE);
			}
		});

		mntmHelp.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {

				JOptionPane.showMessageDialog(link, context.get("HelpInform"),
						context.get("mntmHelp"), JOptionPane.WARNING_MESSAGE);
			}
		});

		rdbtnmntmEnglish.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CompositeComponent compprop = AppConfiguration
						.getAppConfiguration()
						.getProperties("SelectedLanguage");
				compprop.put("language", "EngLanguage");
				rdbtnmntmUkrainian.setSelected(false);
				context = ContextUtils.loadContext("MainFrame");
				changeLanguage();
			}
		});

		rdbtnmntmUkrainian.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CompositeComponent compprop = AppConfiguration
						.getAppConfiguration()
						.getProperties("SelectedLanguage");
				compprop.put("language", "UkrLanguage");
				rdbtnmntmEnglish.setSelected(false);
				context = ContextUtils.loadContext("MainFrame");
				changeLanguage();
			}
		});

		rdbtnmntmSystem.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CompositeComponent ob = AppConfiguration.getAppConfiguration()
						.getProperties("ProgramTheme");
				ob.put("theme",
						"com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
				try {
					rdbtnmntmNimbus.setSelected(false);
					rdbtnmntmStandart.setSelected(false);
					UIManager
							.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
					SwingUtilities.updateComponentTreeUI(MainFrame.this);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});

		rdbtnmntmNimbus.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CompositeComponent ob = AppConfiguration.getAppConfiguration()
						.getProperties("ProgramTheme");
				ob.put("theme",
						"com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
				try {
					rdbtnmntmSystem.setSelected(false);
					rdbtnmntmStandart.setSelected(false);
					UIManager
							.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
					SwingUtilities.updateComponentTreeUI(MainFrame.this);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		rdbtnmntmStandart.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CompositeComponent ob = AppConfiguration.getAppConfiguration()
						.getProperties("ProgramTheme");
				ob.put("theme", "javax.swing.plaf.metal.MetalLookAndFeel");
				try {
					rdbtnmntmNimbus.setSelected(false);
					rdbtnmntmSystem.setSelected(false);
					UIManager
							.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
					SwingUtilities.updateComponentTreeUI(MainFrame.this);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});

		btnNewButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				if (!lblTitle.getText().equals(context.get("Root")))
					runGetTable(context.get("Root"));

			}
		});

		btnClients.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				ContextForCommand context = new ContextForCommand();
				context.put("proprietor", link);
				Controller.getController().execute(context,
						CommandFactory.GET_LIST_OF_USERS);
				setButtonsEnabled(false, false, false, false, false, true,
						false, false, false, true);

			}
		});
		btnOpenGoods.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {

				OpenGoods ob = new OpenGoods(link);
				int row = ((JTable) ((JViewport) scrollPane.getComponent(0))
						.getComponent(0)).getSelectedRow();
				String goodsName = (String) ((JTable) ((JViewport) scrollPane
						.getComponent(0)).getComponent(0)).getValueAt(row, 0);
				ContextForCommand context = new ContextForCommand();
				context.put("name", goodsName);
				context.put("proprietor", ob);
				Controller.getController().execute(context,
						CommandFactory.OPEN_GOODS);
			}
		});

		btnDeleteGoods.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {

				Object[] options = { context.get("Yes"), context.get("No") };
				int result = JOptionPane.showOptionDialog(link,
						context.get("DeleteQuestionGoods"),
						context.get("Delete"), JOptionPane.YES_NO_OPTION,
						JOptionPane.QUESTION_MESSAGE, null, options, options[1]);
				if (result == JOptionPane.YES_OPTION) {
					ContextForCommand context = new ContextForCommand();
					context.put("proprietor", link);
					int row = ((JTable) ((JViewport) scrollPane.getComponent(0))
							.getComponent(0)).getSelectedRow();
					context.put("name",
							(String) ((JTable) ((JViewport) scrollPane
									.getComponent(0)).getComponent(0))
									.getValueAt(row, 0));
					Controller.getController().execute(context,
							CommandFactory.DELETE_GOODS);
				}

			}
		});

		btnGoods.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				runGetTable(context.get("Root"));
				setButtonsEnabled(true, false, false, false, false, false,
						true, false, false, false);

			}
		});
		btnCreateCatalog.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				new CreateCatalog(link);

			}
		});

		btnCreateGood.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				new CreateGood(link);

			}
		});
		btnEditCatalog.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				new EditCatalog(link);

			}
		});
		btnDeleteCatalog.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				Object[] options = { context.get("Yes"), context.get("No") };
				int confirm = JOptionPane.showOptionDialog(link,
						context.get("DeleteQuestionCatalog"),
						context.get("Delete"), JOptionPane.YES_NO_OPTION,
						JOptionPane.QUESTION_MESSAGE, null, options, options[1]);
				if (confirm == JOptionPane.YES_OPTION) {
					ContextForCommand context = new ContextForCommand();
					context.put("name", lblTitle.getText());
					context.put("proprietor", link);
					Controller.getController().execute(context,
							CommandFactory.DELETE_CATALOG);

				}

			}
		});

		btnOpenClient.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				User ob = new User(MainFrame.this);
				ContextForCommand context = new ContextForCommand();
				context.put("proprietor", ob);
				int row = ((JTable) ((JViewport) scrollPane.getComponent(0))
						.getComponent(0)).getSelectedRow();
				String login = (String) ((JTable) ((JViewport) scrollPane
						.getComponent(0)).getComponent(0)).getValueAt(row, 0);
				context.put("login", login);
				Controller.getController().execute(context,
						CommandFactory.GET_USER_INFO);

			}
		});
		this.addWindowListener(new WindowListener() {

			@Override
			public void windowOpened(WindowEvent arg0) {

			}

			@Override
			public void windowIconified(WindowEvent arg0) {

			}

			@Override
			public void windowDeiconified(WindowEvent arg0) {

			}

			@Override
			public void windowDeactivated(WindowEvent arg0) {

			}

			@Override
			public void windowClosing(WindowEvent event) {
				Object[] options = { context.get("Yes"), context.get("No") };
				int n = JOptionPane.showOptionDialog(event.getWindow(),
						context.get("CloseQuestion"), context.get("Confirm"),
						JOptionPane.YES_NO_OPTION,
						JOptionPane.QUESTION_MESSAGE, null, options, options[1]);
				if (n == 0) {
					AppConfiguration.getAppConfiguration().save();
					try {
						Controller.getController().dao.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					event.getWindow().setVisible(false);
					System.exit(0);
				}
			}

			@Override
			public void windowClosed(WindowEvent arg0) {

			}

			@Override
			public void windowActivated(WindowEvent arg0) {

			}
		});

		setVisible(true);
	}

	/**
	 * Відбувається ініціалізація компонентів.
	 */
	private void initComponents() {
		menuBar = new JMenuBar();
		mnSettings = new JMenu(context.get("mnSettings"));
		mnLanguage = new JMenu(context.get("mnLanguage"));
		rdbtnmntmEnglish = new JRadioButtonMenuItem(
				context.get("rdbtnmntmEnglish"));
		rdbtnmntmUkrainian = new JRadioButtonMenuItem(
				context.get("rdbtnmntmUkrainian"));
		mnStyle = new JMenu(context.get("mnStyle"));
		rdbtnmntmStandart = new JRadioButtonMenuItem(
				context.get("rdbtnmntmStandart"));
		rdbtnmntmSystem = new JRadioButtonMenuItem(
				context.get("rdbtnmntmSystem"));
		rdbtnmntmNimbus = new JRadioButtonMenuItem(
				context.get("rdbtnmntmNimbus"));
		mnHelp = new JMenu(context.get("mnHelp"));
		mntmAbout = new JMenuItem(context.get("mntmAbout"));
		mntmHelp = new JMenuItem(context.get("mntmHelp"));

		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(null);

		scrollPane = new JScrollPane();
		scrollPane.setBounds(0, 0, 670, 300);

		separator = new JSeparator();
		separator.setOrientation(SwingConstants.VERTICAL);
		separator.setBounds(668, 0, 11, 415);

		btnCreateCatalog = new JButton(context.get("btnCreateCatalog"));
		btnCreateCatalog.setBounds(701, 11, 173, 23);

		btnCreateGood = new JButton(context.get("btnCreateGood"));
		btnCreateGood.setBounds(701, 251, 173, 23);

		btnOpenGoods = new JButton(context.get("btnOpenGoods"));
		btnOpenGoods.setBounds(701, 217, 173, 23);

		btnClients = new JButton(context.get("btnClients"));
		btnClients.setBounds(701, 113, 173, 23);

		btnDeleteCatalog = new JButton(context.get("btnDeleteCatalog"));
		btnDeleteCatalog.setBounds(701, 79, 173, 23);

		btnEditCatalog = new JButton(context.get("btnEditCatalog"));
		btnEditCatalog.setBounds(701, 45, 173, 23);

		lblNewLabel = new JLabel("");
		lblNewLabel.setBounds(10, 332, 479, 72);

		btnGoods = new JButton(context.get("btnGoods"));
		btnGoods.setEnabled(false);
		btnGoods.setBounds(701, 183, 173, 23);

		lblTitle = new JLabel(context.get("Root"));
		lblTitle.setBounds(10, 307, 479, 23);

		btnNewButton = new JButton(context.get("btnNewButton"));
		btnNewButton.setBounds(701, 319, 173, 23);

		btnDeleteGoods = new JButton(context.get("btnDeleteGoods"));
		btnDeleteGoods.setBounds(701, 285, 173, 23);

		btnOpenClient = new JButton(context.get("btnOpenClient"));
		btnOpenClient.setBounds(701, 147, 173, 23);

	}

	/**
	 * Відбувається додавання до основного вікна.
	 */
	private void allocateComponents() {
		setJMenuBar(menuBar);

		menuBar.add(mnSettings);
		mnSettings.add(mnLanguage);
		mnLanguage.add(rdbtnmntmEnglish);
		mnLanguage.add(rdbtnmntmUkrainian);
		mnSettings.add(mnStyle);
		mnStyle.add(rdbtnmntmStandart);
		mnStyle.add(rdbtnmntmSystem);
		mnStyle.add(rdbtnmntmNimbus);
		setSettings();
		menuBar.add(mnHelp);
		mnHelp.add(mntmAbout);
		mnHelp.add(mntmHelp);

		setContentPane(contentPane);

		contentPane.add(scrollPane);
		runGetTable(context.get("Root"));
		contentPane.add(separator);
		contentPane.add(btnCreateCatalog);
		contentPane.add(btnCreateGood);
		contentPane.add(btnOpenGoods);
		contentPane.add(btnClients);
		contentPane.add(btnDeleteCatalog);
		contentPane.add(btnEditCatalog);
		contentPane.add(lblNewLabel);
		contentPane.add(btnGoods);
		contentPane.add(lblTitle);
		contentPane.add(btnNewButton);
		contentPane.add(btnDeleteGoods);
		contentPane.add(btnOpenClient);
	}

	/**
	 * Метод генерує оновлення таблиці для конкретного коріня.
	 * 
	 * @param pane
	 *            панель, в якій знаходиться таблиця.
	 * @param node
	 *            корінь, відносно якого відбувається оновлення.
	 */
	public void runGetTable(String node) {
		ContextForCommand context = new ContextForCommand();
		context.put("node", node);
		context.put("proprietor", link);
		Controller.getController().execute(context,
				CommandFactory.GET_LIST_OF_ITEM);
	}

	/**
	 * @return мітку, яка відображає назву вузла, зміст якого відображається
	 */
	public JLabel getTitleLabel() {
		return lblTitle;
	}

	/**
	 * @return панель, в середині якої знаходиться таблиця
	 */
	public JScrollPane getScrolPane() {
		return scrollPane;
	}

	/**
	 * Встановлює стан кнопок головного вікна
	 * @param createCatalog стан кнопки створення каталогу
	 * @param editCatalog стан кнопки редагування каталогу
	 * @param deleteCatalog стан кнопки видалення каталогу
	 * @param createGoods стан кнопки створення товару
	 * @param openGoods стан кнопки відкриття товару
	 * @param goods стан кнопки, яка відкриває таблицю товарів
	 * @param clients стан кнопки, яка відкриває таблицю клієнтів
	 * @param getRoot стан кнопки повернення на головну
	 * @param deleteGoods стан кнопки видалення товару
	 * @param openClient стан кнопки детального перегляду клієнта
	 */
	public void setButtonsEnabled(boolean createCatalog, boolean editCatalog,
			boolean deleteCatalog, boolean createGoods, boolean openGoods,
			boolean goods, boolean clients, boolean getRoot,
			boolean deleteGoods, boolean openClient) {
		btnCreateCatalog.setEnabled(createCatalog);
		btnEditCatalog.setEnabled(editCatalog);
		btnDeleteCatalog.setEnabled(deleteCatalog);
		btnCreateGood.setEnabled(createGoods);
		btnOpenGoods.setEnabled(openGoods);
		btnGoods.setEnabled(goods);
		btnClients.setEnabled(clients);
		btnNewButton.setEnabled(getRoot);
		btnDeleteGoods.setEnabled(deleteGoods);
		btnOpenClient.setEnabled(openClient);
	}

	/**
	 * Метод оновлює таблицю  товарів відносно головного вузла.
	 */
	public void refresh() {
		runGetTable(lblTitle.getText());
	}

	/**
	 * Метод оновлює таблицю товарів відносно конкретного вузла
	 * @param point назва вузла
	 */
	public void refresh(String point) {
		runGetTable(point);
	}

	/**
	 * Метод встановлює повідомлення в головному вікні
	 * @param title повідомлення, яке потрібно відобразити
	 */
	public void setTipForComponent(String title) {
		lblNewLabel.setText(title);
	}

	/**
	 * Метод налаштовує пункти меню згідно завантажених налаштувань
	 */
	private void setSettings() {
		CompositeComponent ob = AppConfiguration.getAppConfiguration()
				.getProperties("ProgramTheme");
		String language = AppConfiguration.getAppConfiguration()
				.getProperties("SelectedLanguage").getProperty("language");
		String theme = ob.getProperty("theme");
		switch (language) {
		case "UkrLanguage":
			rdbtnmntmEnglish.setSelected(false);
			rdbtnmntmUkrainian.setSelected(true);
			break;
		case "EngLanguage":
			rdbtnmntmEnglish.setSelected(true);
			rdbtnmntmUkrainian.setSelected(false);
			break;

		default:
			break;
		}
		switch (theme) {
		case "com.sun.java.swing.plaf.windows.WindowsLookAndFeel":
			rdbtnmntmSystem.setSelected(true);
			break;
		case "com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel":
			rdbtnmntmNimbus.setSelected(true);
			break;
		case "javax.swing.plaf.metal.MetalLookAndFeel":
			rdbtnmntmStandart.setSelected(true);
			break;

		default:
			break;
		}
	}

	/**
	 * Метод змінює написи на компонентах головного вікна
	 */
	private void changeLanguage() {
		setTitle(context.get("title"));
		btnCreateCatalog.setText(context.get("btnCreateCatalog"));
		btnNewButton.setText(context.get("btnNewButton"));
		lblTitle.setText(context.get("Root"));
		runGetTable(context.get("Root"));
		btnDeleteGoods.setText(context.get("btnDeleteGoods"));
		btnOpenClient.setText(context.get("btnOpenClient"));
		rdbtnmntmEnglish.setText(context.get("rdbtnmntmEnglish"));
		rdbtnmntmUkrainian.setText(context.get("rdbtnmntmUkrainian"));
		rdbtnmntmSystem.setText(context.get("rdbtnmntmSystem"));
		rdbtnmntmStandart.setText(context.get("rdbtnmntmStandart"));
		rdbtnmntmNimbus.setText(context.get("rdbtnmntmNimbus"));
		mnHelp.setText(context.get("mnHelp"));
		mnSettings.setText(context.get("mnSettings"));
		mnLanguage.setText(context.get("mnLanguage"));
		mnStyle.setText(context.get("mnStyle"));
		mntmAbout.setText(context.get("mntmAbout"));
		mntmHelp.setText(context.get("mntmHelp"));
		btnGoods.setText(context.get("btnGoods"));
		btnEditCatalog.setText(context.get("btnEditCatalog"));
		lblNewLabel.setText(context.get("lblNewLabel"));
		btnDeleteCatalog.setText(context.get("btnDeleteCatalog"));
		btnClients.setText(context.get("btnClients"));
		btnOpenGoods.setText(context.get("btnOpenGoods"));
		btnCreateGood.setText(context.get("btnCreateGood"));
	}

	/**
	 * Встановлює піктограму на дане вікно
	 */
	private void setIcon() {
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
