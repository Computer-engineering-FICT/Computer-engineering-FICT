package application;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
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
 * ���� �������� ���������� ���������� ���� ���������
 * ��������
 * @author ����� ����� 
 */
public class CreateCatalog extends JDialog {
	/**
	 * ������� ������ ����.
	 */
	private final JPanel contentPanel = new JPanel();
	/**
	 * ���� ��� �������� ���� ��������.
	 */
	private JTextField textField;
	/**
	 * ������ ��� ������������.
	 */
	private JButton okButton;
	/**
	 * ��������� �� ������� ����.
	 */
	private MainFrame link;
	/**
	 * ������ ��� ����������.
	 */
	private JButton cancelButton;
	/**
	 * ������� � �������� �� �����������.
	 */
	private Hashtable<String, String> context;

	
	/**
	 * ��������� � ������������ ���������� ����.
	 * @param link ��������� �� ������� ����.
	 */
	public CreateCatalog(MainFrame link) {
		setIcon();
		setResizable(false);
		this.context = ContextUtils.loadContext("CreateCatalog");
		this.link = link;
		this.setModal(true);
		
		setTitle(context.get("title"));
		setBounds(100, 100, 274, 228);
		getContentPane().setLayout(new BorderLayout());
		
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
		
		textField = new JTextField();
		textField.setBounds(48, 54, 164, 25);
		contentPanel.add(textField);
		textField.setColumns(10);
		
		JLabel lblCatalogName = new JLabel(context.get("lblCatalogName"));
		lblCatalogName.setBounds(48, 36, 164, 14);
		contentPanel.add(lblCatalogName);
		
		JPanel buttonPane = new JPanel();
		buttonPane.setLayout(new FlowLayout(FlowLayout.RIGHT));
		getContentPane().add(buttonPane, BorderLayout.SOUTH);
		
		okButton = new JButton(context.get("okButton"));
		okButton.setActionCommand("OK");
		buttonPane.add(okButton);
		getRootPane().setDefaultButton(okButton);
		
		cancelButton = new JButton(context.get("cancelButton"));
		cancelButton.setActionCommand("Cancel");
		buttonPane.add(cancelButton);

		okButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				ContextForCommand context = new ContextForCommand();
				context.put("proprietor", CreateCatalog.this.link);
				context.put("name", textField.getText());
				Controller.getController().execute(context,
						CommandFactory.CREATE_CATALOG);
				CreateCatalog.this.dispose();

			}
		});
		cancelButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				CreateCatalog.this.dispose();

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
