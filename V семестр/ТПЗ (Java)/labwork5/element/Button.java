package com.sulyma.lab111.labwork5.element;

import com.sulyma.lab111.labwork5.logic.Admin;
import com.sulyma.lab111.labwork5.logic.Widget;

/**
 * Class Button
 */
public class Button extends Widget {
    private String text;

    /**
     * Constructor with parameters to initialize fields
     *
     * @param admin  mediator Admin
     * @param width  width of button
     * @param height height of button
     * @param x      coordinate x for button
     * @param y      coordinate y for button
     */
    public Button(Admin admin, int width, int height, int x, int y, String text) {
        super(admin, width, height, x, y);
        this.text = text;

        drawElement();
    }

    /**
     * Set the value of text
     *
     * @param newVar the new value of text
     */
    public void setText(String newVar) {
        text = newVar;
    }

    public String getText() {
        return text;
    }

    /**
     * OnClick event for button which call chaged method
     * from widget
     */
    public void onClick() {
        changed();
        drawElement();
    }

    public void drawElement() {
        System.out.println("Button text: " + getText());
    }
}
