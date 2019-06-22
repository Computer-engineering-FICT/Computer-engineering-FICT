package lab1_8;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;

public class ArrowNodePropertiesDialog extends JDialog {

	private static final long serialVersionUID = 1L;
	
	private JLabel lNodeNumber = new JLabel("Arrow Number:");
	private JSpinner sNodeNumber =  new JSpinner();
	
	private JButton bCancel = new JButton("Cancel");
	private JButton bOk = new JButton("Ok");
	
	public ArrowNodePropertiesDialog(JFrame owner, int Number) {
		
		this.setModal(true);
		this.setTitle("Arrow Node Properties");
		this.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		this.setResizable(false);
		this.setSize(200, 100);

		this.setLayout(new GridBagLayout());
		
		sNodeNumber.setModel(new SpinnerNumberModel(Number, 1, Integer.MAX_VALUE, 1));
		
		this.add(lNodeNumber, new GridBagConstraints(0, 0, 2, 1, 100, 0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
		this.add(sNodeNumber, new GridBagConstraints(0, 1, 2, 1, 100, 0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
		this.add(bOk, new GridBagConstraints(0, 2, 1, 1, 100, 0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
		this.add(bCancel, new GridBagConstraints(1, 2, 1, 1, 100, 0, GridBagConstraints.CENTER, GridBagConstraints.HORIZONTAL, new Insets(0, 0, 0, 0), 0, 0));
		
		bCancel.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				ArrowNodePropertiesDialog.this.dispose();
			}
		});
		
		bOk.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				
				setVisible(false);
			}
		});
		
		this.setVisible(true);
	}
		
	public int getNodeNumber() {
		
		return (Integer)sNodeNumber.getValue();
	}
}