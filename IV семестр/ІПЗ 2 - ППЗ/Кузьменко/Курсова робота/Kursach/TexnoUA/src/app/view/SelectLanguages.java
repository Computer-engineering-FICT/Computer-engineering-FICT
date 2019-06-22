package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.border.EmptyBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

/**
 * клас що реалізує модливість вибриати мову графічного інтерфейсу
 * @author Vova
 *
 */
@SuppressWarnings("serial")
public class SelectLanguages extends JDialog {
	/**
	 * основна панель
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * кнопка підтвердження
	 */
	private JButton okButton = new JButton(Languages.getProperty("okBtn"));
	/**
	 * кнопка відміни
	 */
	private JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
	/**
	 * посилання на головне вікно
	 */
	private static MainFrame main ;
	/**
	 * індекс вибраного елемента
	 */
	private int keySelected;


	/**
	 * Створення вікна для вибору мови
	 * 
	 * @param main
	 *            головне вікно програми
	 */
	@SuppressWarnings("static-access")
	public SelectLanguages(MainFrame main) {
		setFont(Fonts.getFont());
		this.main = main;
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setVisible(true);
		setTitle(Languages.getProperty("SelectLanguageName"));
		setResizable(false);
		String[] styles = { Languages.getProperty("Ukrainian"),
				Languages.getProperty("English"),
				Languages.getProperty("Russian") };
		JList<String> listLenguage = new JList<>(styles);
		listLenguage.setFont(Fonts.getFont());
		listLenguage.setVisibleRowCount(5);
		listLenguage.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		listLenguage.setEnabled(true);
		listLenguage.setVisible(true);
		JScrollPane pane = new JScrollPane(listLenguage);
		pane.setFont(Fonts.getFont());
		contentPanel.add(pane);
		cancelButton.setFont(Fonts.getFont());
		contentPanel.setFont(Fonts.getFont());
		setBounds(100, 100, 350, 200);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setLayout(new FlowLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);

		okButton.setEnabled(false);
		okButton.setFont(Fonts.getFont());
		buttonPane.add(okButton);
		getRootPane().setDefaultButton(okButton);

		
		
		
		
		buttonPane.add(cancelButton);
		cancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				SelectLanguages.this.dispose();
			}
		});

		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				SelectLanguages.this.dispose();
				switch (SelectLanguages.this.getKeySelected()) {
				case 0:
					Languages.setNewLanguage("languagesUkrainian");
					SelectLanguages.main.dispose();
					MainFrame f = new MainFrame();
					f.setVisible(true);
					f.addWindowListener(new MyWindowsListener());
					break;
				case 1:
					Languages.setNewLanguage("languagesEnglish");
					SelectLanguages.main.dispose();
					MainFrame frame = new MainFrame();
					frame.setVisible(true);
					frame.addWindowListener(new MyWindowsListener());
					break;
				case 2:
					Languages.setNewLanguage("languagesRussian");
					SelectLanguages.main.dispose();
					MainFrame fr = new MainFrame();
					fr.setVisible(true);
					fr.addWindowListener(new MyWindowsListener());
					break;	
				}

			}
		});
		listLenguage.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent event) {
				if (event.getValueIsAdjusting() == false) {
					SelectLanguages.this.setKeySelected(event.getFirstIndex());
					okButton.setEnabled(true);
				
				}

			}
		});
	}

	/**
	 * метод повертає індекс вибраного елемента зі списку
	 * @return індекс вибраного елемента
	 */
	public int getKeySelected() {
		return keySelected;
	}

	/**
	 * метод встановлює індекс вибраного елемента списку
	 * @param keySelected
	 */
	public void setKeySelected(int keySelected) {
		this.keySelected = keySelected;
	}

}