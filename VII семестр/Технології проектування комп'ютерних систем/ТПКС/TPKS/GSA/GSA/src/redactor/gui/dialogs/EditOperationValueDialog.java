package redactor.gui.dialogs;

import redactor.Data;
import redactor.Mediator;
import redactor.Message;
import redactor.gui.graphicalElements.Entity;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

/**
 * Builds dialog for operations state change. Can be opened by right-click on operation vertex
 * or from menu->Edit->Set operations
 */

public class EditOperationValueDialog extends JDialog {

    private JFrame owner;

    private JTextField valueOfOperation;
    private JComboBox comboBox;
    private List<Entity> listOfOperations;

    private Entity chosenEntity;

    public EditOperationValueDialog(final JFrame owner, final Mediator mediator, Data data, Entity chosenEntity) {

        super(owner, "EditOperationValue", false);

        this.chosenEntity = chosenEntity;
        this.owner = owner;

        setSize(250, 140);
        int x = owner.getX() + owner.getWidth() / 2 - 75;
        int y = owner.getY() + owner.getHeight() / 2 - 70;
        setLocation(x, y);

        JPanel buttonPanel = new JPanel(new GridLayout(5, 2));
        buttonPanel.add(new JLabel("  Operation :", JLabel.LEFT));
        comboBox = new JComboBox();
        comboBox.setEditable(false);

        listOfOperations = data.getAllOperationVertex();
        
        comboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent event) {

                String numberOfSelectedItem = (String)comboBox.getSelectedItem();
                numberOfSelectedItem = numberOfSelectedItem.substring(1, numberOfSelectedItem.length());

                for (int i = 0; i < listOfOperations.size(); i++) {
                    if (listOfOperations.get(i).getNumber() == Integer.valueOf(numberOfSelectedItem)) {
                        valueOfOperation.setText(String.valueOf(listOfOperations.get(i).getInitialValue()));

                        break;
                    }
                }
            }
        });
        buttonPanel.add(comboBox);
        buttonPanel.add(new JLabel("  value :", JLabel.LEFT));
        valueOfOperation = new JTextField();
        buttonPanel.add(valueOfOperation);


        JButton okButton = new JButton("Apply");
        okButton.addActionListener(new ActionListener() {
            public void actionPerformed(final ActionEvent event) {
                Message message = new Message(Message.operationValuesUpdate);
                mediator.update(message);
            }
        });


        buttonPanel.add(okButton);
        JButton cancelButton = new JButton("Ok");
        cancelButton.addActionListener(new ActionListener() {
            public void actionPerformed(final ActionEvent event) {
                setVisible(false);
            }
        });


        buttonPanel.add(cancelButton);
        add(buttonPanel, BorderLayout.CENTER);
    }

	
	public void buildDialog () {


		DefaultComboBoxModel model = new DefaultComboBoxModel();
        if (!listOfOperations.isEmpty()) {
            int selectedIndex = 0;
            for (int i = 0; i < listOfOperations.size(); i++) {
                Entity currentEntity = listOfOperations.get(i);
                model.addElement("P" + currentEntity.getNumber());
                if (chosenEntity != null && chosenEntity.getNumber() == currentEntity.getNumber()) {
                    selectedIndex = i;
                }
            }

            comboBox.setModel(model);
            comboBox.setSelectedIndex(selectedIndex);

            valueOfOperation.setText(String.valueOf(listOfOperations.get(0).getInitialValue()));
        }
        else {
            comboBox.setModel(model);
        }

		int x = owner.getX() + owner.getWidth() / 2 - 75;
        int y = owner.getY() + owner.getHeight() / 2 - 70;
        setLocation(x, y);
    }




	public JTextField getValueOfOperation() {
		return valueOfOperation;
	}


    public JComboBox getComboBox() {
        return comboBox;
    }

    public List<Entity> getListOfOperations() {
        return listOfOperations;
    }




}
