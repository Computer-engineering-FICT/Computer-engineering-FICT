package com.sulyma.lab111.labwork5.logic;

import com.sulyma.lab111.labwork5.element.Button;
import com.sulyma.lab111.labwork5.element.Label;
import com.sulyma.lab111.labwork5.element.ListBox;
import com.sulyma.lab111.labwork5.element.TextBox;

/**
 * Class ModalAdmin
 */
public class ModalAdmin extends Admin {
    private Button button;
    private ListBox listBox;
    private TextBox textBox;
    private Label label;

    /**
     * Constructor
     */
    public ModalAdmin() {
        createWidgets();
    }

    /**
     * Listener which wait changing of widgets
     *
     * @param widget widget which was changed
     */
    @Override
    public void widgetChanged(Widget widget) {
        if (widget == button) {
            System.out.println("\nUser clicked on button");
            System.out.println("Text on label was changed from " + label.getText() + " on " + listBox.getCurrentItem());
            label.setText(listBox.getCurrentItem());
        } else if (widget == textBox) {
            System.out.println("\nText in TextBox was changed and after that text on button will change");
            button.setText(textBox.getText());
        } else if (widget == listBox) {
            System.out.println("\nIndex on ListBox was changed. After that text in TextBox will change.");
            textBox.setText(listBox.getCurrentItem());
        } else if (widget == label) {
            System.out.println("\nText on label was changed");
        }
    }

    /**
     * Showing Dialog window
     */
    @Override
    public void showDialog() {
        System.out.println("Show items");
    }

    /**
     * Creating widgets
     */
    @Override
    protected void createWidgets() {
        String[] list = new String[5];
        list[0] = "1";
        list[1] = "2";
        list[2] = "3";
        list[3] = "4";
        list[4] = "5";
        button = new Button(this, 50, 100, 150, 300, "button");
        listBox = new ListBox(this, 200, 300, 10, 10, list);
        textBox = new TextBox(this, 100, 50, 30, 80);
        label = new Label(this, 100, 50, 50, 100, "Label");
    }

    public Button getButton() {
        return button;
    }

    public ListBox getListBox() {
        return listBox;
    }

    public TextBox getTextBox() {
        return textBox;
    }

    public Label getLabel() {
        return label;
    }
}
