package app.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;
import javax.swing.border.EmptyBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

/**
 * Клас, що реалізує інтерфейс користувача для вибору стилю вікон
 * 
 * @author Vova
 * 
 */
@SuppressWarnings("serial")
public class SelectStyle extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private String style;
	private JButton okButton = new JButton(Languages.getProperty("yesBtn"));
	private String[] styles = new String[UIManager.getInstalledLookAndFeels().length];
	private String[] stylesName = new String[UIManager
			.getInstalledLookAndFeels().length];
	/**
	 * посилання на головне вікно
	 */
	private MainFrame mainFrame;

	/**
	 * Створення вікна для вибору стилю.
	 * 
	 * @param mainFrame
	 *            головне вікно програми
	 */
	public SelectStyle(MainFrame mainFrame) {
		setFont(Fonts.getFont());
		setTitle(Languages.getProperty("SelectStyleName"));
		setResizable(false);
		this.mainFrame = mainFrame;
		int i = 0;
		for (LookAndFeelInfo item : UIManager.getInstalledLookAndFeels()) {
			styles[i] = item.getName();
			stylesName[i] = item.getClassName();
			i++;
		}

		final JList<String> listStyle = new JList<>(styles);
		listStyle.setFont(Fonts.getFont());
		listStyle.setVisibleRowCount(5);
		listStyle.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		listStyle.setEnabled(true);
		listStyle.setVisible(true);
		JScrollPane pane = new JScrollPane(listStyle);
		contentPanel.add(pane);
		pane.setFont(Fonts.getFont());

		setBounds(100, 100, 350, 200);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setLayout(new FlowLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);

		okButton.setEnabled(false);
		buttonPane.add(okButton);
		okButton.setFont(Fonts.getFont());
		getRootPane().setDefaultButton(okButton);

		JButton cancelButton = new JButton(Languages.getProperty("cancelBtn"));
		cancelButton.setFont(Fonts.getFont());
		buttonPane.add(cancelButton);
		cancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				SelectStyle.this.dispose();
			}
		});

		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CarryGoods.setStyle(SelectStyle.this.getStyle());
				EditInfo.setStyle(SelectStyle.this.getStyle());
				GoodsForCourier.setStyle(SelectStyle.this.getStyle());
				SelectStyle.this.mainFrame.setStyle(SelectStyle.this.getStyle());
				OrderGoodsList.setStyle(SelectStyle.this.getStyle());
				SetGoodsList.setStyle(SelectStyle.this.getStyle());
				TabbedPane.setStyle(SelectStyle.this.getStyle());
				WorkerInfo.setStyle(SelectStyle.this.getStyle());
				SelectStyle.this.dispose();
			}
		});
		listStyle.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent event) {
				if (event.getValueIsAdjusting() == false) {
					String value = new String((String) listStyle
							.getSelectedValue());

					SelectStyle.this.setStyle(value);
					okButton.setEnabled(true);
					listStyle.setEnabled(false);
				}
			}
		});
	}

	/**
	 * метод, що повертає стиль вікна
	 * 
	 * @return назва стилю
	 */
	public String getStyle() {
		return style;
	}

	/**
	 * метод що встановлює стиль
	 * 
	 * @param style
	 *            назва стилю
	 */
	public void setStyle(String style) {
		for (int i = 0; i < styles.length; i++) {
			if (style.equalsIgnoreCase(styles[i])) {
				this.style = stylesName[i];
				break;
			}
		}
	}

}
