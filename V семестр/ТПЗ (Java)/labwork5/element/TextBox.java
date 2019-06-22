package com.sulyma.lab111.labwork5.element;

import com.sulyma.lab111.labwork5.logic.Admin;
import com.sulyma.lab111.labwork5.logic.Widget;

/**
 * Class TextBox
 */
public class TextBox extends Widget {
    private String text;

    /**
     * Constructor with initialized fields
     *
     * @param admin  reference on mediator Admin
     * @param width  width of widget
     * @param height height of widget
     * @param x      coordinate x of widget
     * @param y      coordinate y of widget
     */
    public TextBox(Admin admin, int width, int height, int x, int y) {
        super(admin, width, height, x, y);
        text = new String();
        drawElement();
    }

    /**
     * Set the value of text
     * And call changed method
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
        System.out.println("TextBox text: " + getText());
    }
}
