package com.sulyma.lab111.labwork5.element;

import com.sulyma.lab111.labwork5.logic.Admin;
import com.sulyma.lab111.labwork5.logic.Widget;

/**
 * Class Label
 */
public class Label extends Widget {
    private String text;

    /**
     * Constructor with initializing fields
     *
     * @param admin  reference on mediator Admin
     * @param width  width of label
     * @param height height of
     * @param x      coordinate x
     * @param y      coordinate y
     */
    public Label(Admin admin, int width, int height, int x, int y, String text) {
        super(admin, width, height, x, y);
        this.text = text;

        drawElement();
    }

    /**
     * Set the value of text and calling changed method from
     * Widget
     *
     * @param newVar the new value of text
     */
    public void setText(String newVar) {
        text = newVar;
        changed();
        drawElement();
    }

    /**
     * Get the value of text
     *
     * @return the value of text
     */
    public String getText() {
        return text;
    }


    public void drawElement() {
        System.out.println("Label text: " + getText());
    }
}
