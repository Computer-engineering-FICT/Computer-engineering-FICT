package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.border.EmptyBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

/**
 * клас виглудя що відповідає за можливість вибору шрифтів
 * @author Vova
 *
 */
@SuppressWarnings("serial")
public class SelectFont extends JFrame {

	/**
	 *  основна панель
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * список шрифтів
	 */
	private JList<String> listFonts;
	/**
	 * список логічних шрифтів
	 */
	private JList<String> listLogicFonts;
	/**
	 * списо розбірів шрифтів
	 */
	private JList<Integer> listSize;
	/**
	 *розмір текущого шрифта
	 */
	private int sizeFont;
	/**
	 * назва текущого шрифта
	 */
	private String name;
	/**
	 * ідентифікатор логічного шрифта
	 */
	private int logic;
	/**
	 * посилання на основне вікно вигляду
	 */
	private MainFrame frame;

	/**
	 * конструктор, створює вікно
	 */
	public SelectFont(String[] fonts, String[] logicFonts, Integer[] size, MainFrame frame) {
		setTitle(Languages.getProperty("fontTitle"));
		this.frame = frame;
		setResizable(false);
		setVisible(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		setBounds(100, 100, 450, 320);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		listFonts = new JList<>(fonts);
		listFonts.setFont(Fonts.getFont());
		listFonts.setVisibleRowCount(20);
		listFonts.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		listFonts.setEnabled(true);
		listFonts.setVisible(true);
		JScrollPane pane = new JScrollPane(listFonts);
		pane.setBounds(20, 11, 222, 218);
		contentPanel.add(pane);

		listLogicFonts = new JList<>(logicFonts);
		listLogicFonts.setFont(Fonts.getFont());
		listLogicFonts.setVisibleRowCount(3);
		listLogicFonts.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		listLogicFonts.setEnabled(true);
		listLogicFonts.setVisible(true);

		JScrollPane panelLogicFonts = new JScrollPane(listLogicFonts);

		panelLogicFonts.setBounds(252, 11, 104, 218);
		contentPanel.add(panelLogicFonts);

		listSize = new JList<>(size);
		listSize.setFont(Fonts.getFont());
		listSize.setVisibleRowCount(20);
		listSize.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		listSize.setEnabled(true);
		listSize.setVisible(true);

		JScrollPane panelFontSize = new JScrollPane(listSize);
		panelFontSize.setBounds(366, 11, 58, 218);
		contentPanel.add(panelFontSize);

		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);

		JButton okButton = new JButton(Languages.getProperty("okBtn"));
		buttonPane.add(okButton);
		getRootPane().setDefaultButton(okButton);

		JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
		buttonPane.add(cancelButton);
		this.repaint();
		cancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				SelectFont.this.dispose();

			}
		});
		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (name!=null && sizeFont!=0){
					Fonts.setFont(new Font(name, logic, sizeFont));
					SelectFont.this.frame.dispose();
					MainFrame mainFrame = new MainFrame();
					mainFrame.setVisible(true);
					SelectFont.this.dispose();
				}
			}
		});
		listFonts.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent event) {
				if (event.getValueIsAdjusting() == false) {
					name = listFonts.getSelectedValue();
				}

			}
		});
		listLogicFonts.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent event) {
				if (event.getValueIsAdjusting() == false) {
					logic = event.getFirstIndex();
				}
			}
		});
		listSize.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent event) {
				if (event.getValueIsAdjusting() == false) {
					sizeFont = listSize.getSelectedValue();
				}

			}
		});
	}
}
