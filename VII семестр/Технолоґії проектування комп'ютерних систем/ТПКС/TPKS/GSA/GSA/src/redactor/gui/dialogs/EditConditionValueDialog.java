package redactor.gui.dialogs;


import redactor.Data;
import redactor.Mediator;
import redactor.Message;
import redactor.gui.graphicalElements.ConditionalVertex;
import redactor.gui.graphicalElements.Entity;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

/**
 * Builds dialog for conditions state change. Can be opened by right-click on condition vertex
 * or from menu->Edit->Set conditions
 */


public class EditConditionValueDialog extends JDialog {

    private JFrame owner;
    private JTextField valueOfCondition, leftOutput, rightOutput;
    private JComboBox comboBox;
    private List<ConditionalVertex> listOfConditions;

    private Entity chosenEntity;


    public EditConditionValueDialog(final JFrame owner, final Mediator mediator, Data data, Entity chosenEntity) {

        super(owner, "EditConditionState", false);
        this.chosenEntity = chosenEntity;

        this.owner = owner;

        setSize(250, 140);
        int x = owner.getX() + owner.getWidth() / 2 - 75;
        int y = owner.getY() + owner.getHeight() / 2 - 70;
        setLocation(x, y);

        JPanel buttonPanel = new JPanel(new GridLayout(5, 2));
        buttonPanel.add(new JLabel("  Condition Id :", JLabel.LEFT));
        comboBox = new JComboBox();
        comboBox.setEditable(false);

        listOfConditions = data.getAllConditionVertex();

        comboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent event) {

                String numberOfSelectedItem = (String)comboBox.getSelectedItem();
                numberOfSelectedItem = numberOfSelectedItem.substring(1, numberOfSelectedItem.length());

                for (int i = 0; i < listOfConditions.size(); i++) {
                    if (listOfConditions.get(i).getNumber() == Integer.valueOf(numberOfSelectedItem)) {
                        valueOfCondition.setText(String.valueOf(listOfConditions.get(i).getInitialValue()));
                        leftOutput.setText(String.valueOf(listOfConditions.get(i).getLeftOutputValue()));
                        rightOutput.setText(String.valueOf(listOfConditions.get(i).getRightOutputValue()));
                        break;
                    }
                }
            }
        });
        buttonPanel.add(comboBox);
        buttonPanel.add(new JLabel("  Condition value:", JLabel.LEFT));
        valueOfCondition = new JTextField();
        buttonPanel.add(valueOfCondition);

        buttonPanel.add(new JLabel("  Left output (0/1):", JLabel.LEFT));
        leftOutput = new JTextField();
        buttonPanel.add(leftOutput);

        buttonPanel.add(new JLabel("  Right output (1/0):", JLabel.LEFT));
        rightOutput = new JTextField();
        buttonPanel.add(rightOutput);

        JButton okButton = new JButton("Apply");
        okButton.addActionListener(new ActionListener() {
            public void actionPerformed(final ActionEvent event) {
                Message message = new Message(Message.conditionValuesUpdate);
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

        if (!listOfConditions.isEmpty()) {
            int selectedItem = 0;
            for (int i = 0; i < listOfConditions.size(); i++) {
                Entity vertex = listOfConditions.get(i);
                model.addElement("C" + vertex.getNumber());
                if (chosenEntity != null && chosenEntity.getNumber() == vertex.getNumber()) {
                    selectedItem = i;
                }
            }

            comboBox.setModel(model);
            comboBox.setSelectedIndex(selectedItem);

            valueOfCondition.setText(String.valueOf(listOfConditions.get(0).getInitialValue()));
            leftOutput.setText(String.valueOf(listOfConditions.get(0).getLeftOutputValue()));
            rightOutput.setText(String.valueOf(listOfConditions.get(0).getRightOutputValue()));
        } else {
            comboBox.setModel(model);
        }

		int x = owner.getX() + owner.getWidth() / 2 - 75;
        int y = owner.getY() + owner.getHeight() / 2 - 70;
        setLocation(x, y);
    }

	public List<ConditionalVertex> getListOfConditions() {
		return listOfConditions;
	}
	public JComboBox getComboBox() {
		return comboBox;
	}

    public JTextField getValueOfCondition() {
        return valueOfCondition;
    }

    public JTextField getLeftOutput() {
        return leftOutput;
    }

    public JTextField getRightOutput() {
        return rightOutput;
    }
}
