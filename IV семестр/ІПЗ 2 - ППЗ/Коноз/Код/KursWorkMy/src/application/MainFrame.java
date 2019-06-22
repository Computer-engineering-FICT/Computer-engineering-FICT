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
 * ���� ������ ���������� ��������� ���� ��������.
 * @author ����� ����� 
 */
public class MainFrame extends JFrame {

	/**
	 * ������� ������, � ��� ������ �������� �� ���� ��'����.
	 */
	private JPanel contentPane;
	/**
	 * �������, � ��� ���� ������������ ���������� ��������� � ��������.
	 */
	private JTable goodsTable;
	/**
	 * �������, � ��� ���� ������������ ���������� ��� �볺���.
	 */
	private JTable clientsTable;
	/**
	 * ������, ��� �������� ������� ������.
	 */
	private JButton btnGoods;
	/**
	 * ������, ��� ������� ���� ��� ����������� ��������.
	 */
	private JButton btnEditCatalog;
	/**
	 * ̳���, ��� ������������� �������.
	 */
	private JLabel lblNewLabel;
	/**
	 * ������, ��� ������� �������.
	 */
	private JButton btnDeleteCatalog;
	/**
	 * ������, ��� �������� ������� �볺���.
	 */
	private JButton btnClients;
	/**
	 * ������, ��� ������� ��������� �������� ������.
	 */
	private JButton btnOpenGoods;
	/**
	 * ������, ��� ������� ���� ��� ��������� ��������.
	 */
	private JButton btnCreateCatalog;
	/**
	 * ������, ��� ������� ���� ��� ��������� ������.
	 */
	private JButton btnCreateGood;
	/**
	 * ������� ������� � ������ ��� ��� ������� ���������� ������.
	 */
	private JSeparator separator;
	/**
	 * ������� ������� � ����� ��������.
	 */
	private JButton btnNewButton;
	/**
	 * ������ � ��� �������� ������� ��� ����������������� ������.
	 */
	private JScrollPane scrollPane;
	/**
	 * ��������� �� ������ ����. ��������������� ��� �������� ������
	 */
	private MainFrame link = this;
	/**
	 * ̳���, ��� �������� ����� �����, ���� ����� ������������
	 */
	private JLabel lblTitle;
	/**
	 * ������� �����
	 */
	private JButton btnDeleteGoods;
	/**
	 * ³������ ������ �볺���.
	 */
	private JButton btnOpenClient;
	/**
	 * ����� ����, ���� ������� ��������� ���
	 */
	private JRadioButtonMenuItem rdbtnmntmEnglish;
	/**
	 * ����� ����, ���� ������� ��������� ���
	 */
	private JRadioButtonMenuItem rdbtnmntmUkrainian;
	/**
	 * ����� ����, ���� ������� ���������� �����
	 */
	private JRadioButtonMenuItem rdbtnmntmSystem;
	/**
	 * ����� ����, ���� ������� ������������ �����
	 */
	private JRadioButtonMenuItem rdbtnmntmStandart;
	/**
	 * ����� ����, ���� ������� �� ����� ���
	 */
	private JRadioButtonMenuItem rdbtnmntmNimbus;
	/**
	 * �������, � ��� ����������� ������ ����������
	 */
	private Hashtable<String, String> context;
	/**
	 * ���� ��������
	 */
	private JMenu mnHelp;
	/**
	 * ���������, �� ����� ����������� �� ������ ����
	 */
	private JMenuBar menuBar;
	/**
	 * ���� �����������
	 */
	private JMenu mnSettings;
	/**
	 * ϳ����� ���
	 */
	private JMenu mnLanguage;
	/**
	 * ϳ����� �����
	 */
	private JMenu mnStyle;
	/**
	 * ����� ����, ���� ������� �� ���������� ��� ��������
	 */
	private JMenuItem mntmAbout;
	/**
	 * ����� ����, ���� ������� �� ���������� ��������
	 */
	private JMenuItem mntmHelp;

	/**
	 * �����������, � ����� ����������� � ������������� ������� ���� �������.
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
	 * ³��������� ����������� ����������.
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
	 * ³��������� ��������� �� ��������� ����.
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
	 * ����� ������ ��������� ������� ��� ����������� �����.
	 * 
	 * @param pane
	 *            ������, � ��� ����������� �������.
	 * @param node
	 *            �����, ������� ����� ���������� ���������.
	 */
	public void runGetTable(String node) {
		ContextForCommand context = new ContextForCommand();
		context.put("node", node);
		context.put("proprietor", link);
		Controller.getController().execute(context,
				CommandFactory.GET_LIST_OF_ITEM);
	}

	/**
	 * @return ����, ��� �������� ����� �����, ���� ����� ������������
	 */
	public JLabel getTitleLabel() {
		return lblTitle;
	}

	/**
	 * @return ������, � ������� ��� ����������� �������
	 */
	public JScrollPane getScrolPane() {
		return scrollPane;
	}

	/**
	 * ���������� ���� ������ ��������� ����
	 * @param createCatalog ���� ������ ��������� ��������
	 * @param editCatalog ���� ������ ����������� ��������
	 * @param deleteCatalog ���� ������ ��������� ��������
	 * @param createGoods ���� ������ ��������� ������
	 * @param openGoods ���� ������ �������� ������
	 * @param goods ���� ������, ��� ������� ������� ������
	 * @param clients ���� ������, ��� ������� ������� �볺���
	 * @param getRoot ���� ������ ���������� �� �������
	 * @param deleteGoods ���� ������ ��������� ������
	 * @param openClient ���� ������ ���������� ��������� �볺���
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
	 * ����� ������� �������  ������ ������� ��������� �����.
	 */
	public void refresh() {
		runGetTable(lblTitle.getText());
	}

	/**
	 * ����� ������� ������� ������ ������� ����������� �����
	 * @param point ����� �����
	 */
	public void refresh(String point) {
		runGetTable(point);
	}

	/**
	 * ����� ���������� ����������� � ��������� ���
	 * @param title �����������, ��� ������� ����������
	 */
	public void setTipForComponent(String title) {
		lblNewLabel.setText(title);
	}

	/**
	 * ����� ��������� ������ ���� ����� ������������ �����������
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
	 * ����� ����� ������ �� ����������� ��������� ����
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
	 * ���������� ��������� �� ���� ����
	 */
	private void setIcon() {
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
