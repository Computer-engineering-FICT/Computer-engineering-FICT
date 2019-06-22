package application;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Hashtable;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextField;

import controller.ContextForCommand;
import controller.Controller;
import controller.Factory.CommandFactory;

/**
 * ���� �������� �������� ���� ��� ����������� ������.
 * @author ����� ����� 
 */
public class EditCatalog extends JDialog {

	/**
	 * ������, �� ��� �������������� �� ���������� ����.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * ���� ��� �������� ���� �����.
	 */
	private JTextField textField;
	/**
	 * ��������� �� ������� ����.
	 */
	private MainFrame link;
	/**
	 * ������� � �������� �� �����������.
	 */
	private Hashtable<String, String> context;

	
	/**
	 * ��������� � ������������ ���������� ����
	 * @param link ��������� �� ������� ����.
	 */
	public EditCatalog(MainFrame link) {
		this.link = link;
		setIcon();
		setResizable(false);
		getContentPane().setLayout(null);
		context = ContextUtils.loadContext("EditCatalog");
		setTitle(context.get("title"));
		setBounds(100, 100, 302, 210);
		getContentPane().setLayout(new BorderLayout());

		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);

		JLabel lblNewName = new JLabel(context.get("lblNewName"));
		lblNewName.setBounds(15, 38, 261, 14);
		contentPanel.add(lblNewName);

		textField = new JTextField();
		textField.setBounds(15, 63, 261, 25);
		contentPanel.add(textField);
		textField.setColumns(10);

		JButton okButton = new JButton(context.get("okButton"));
		okButton.setBounds(10, 136, 119, 25);
		contentPanel.add(okButton);
		okButton.setActionCommand("OK");
		getRootPane().setDefaultButton(okButton);
		JButton cancelButton = new JButton(context.get("cancelButton"));
		cancelButton.setBounds(157, 136, 119, 25);
		contentPanel.add(cancelButton);
		cancelButton.setActionCommand("Cancel");
		
		cancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				dispose();

			}
		});

		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				ContextForCommand context = new ContextForCommand();
				context.put("proprietor", EditCatalog.this.link);
				context.put("name", textField.getText());
				Controller.getController().execute(context,
						CommandFactory.EDIT_CATALOG);
				dispose();

			}
		});

		setModal(true);
		setLocationRelativeTo(link);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);
	}

	/**
	 * ����� ���������� ��������� �� ����
	 */
	private void setIcon() {
		ImageIcon icon = new ImageIcon("D:\\DatabaseClient\\icon.png");
		setIconImage(icon.getImage());
	}
}
