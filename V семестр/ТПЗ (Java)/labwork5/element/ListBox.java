package com.sulyma.lab111.labwork5.element;

import com.sulyma.lab111.labwork5.logic.Admin;
import com.sulyma.lab111.labwork5.logic.Widget;

/**
 * Class ListBox
 */
public class ListBox extends Widget {
    private String[] list;
    private int currentIndex;

    /**
     * Constructor with initializing fields
     *
     * @param admin  reference on mediator Admin
     * @param width  width of listbox
     * @param height height of listbox
     * @param x      coordinate of x
     * @param y      coordinate of y
     * @param list   list of elements
     */
    public ListBox(Admin admin, int width, int height, int x, int y, String[] list) {
        super(admin, width, height, x, y);
        this.list = list;
        currentIndex = 0;

        drawElement();
    }

    /**
     * Set the value of list
     * And call changed method
     *
     * @param newVar the new value of list
     */
    private void setList(String[] newVar) {
        list = newVar;
        changed();
    }

    /**
     * Get the value of currentIndex
     *
     * @return the value of currentIndex
     */
    private int getCurrentIndex() {
        return currentIndex;
    }

    /**
     * @return Current item that checked in listbox
     */
    public String getCurrentItem() {
        return list[currentIndex];
    }

    /**
     * @param index index of element that was checked
     */
    public void changeCurrentIndex(int index) {
        if (index >= 0 && index < list.length) {
            currentIndex = index;
            changed();

            drawElement();
        }
    }

    public void drawElement() {
        System.out.println("ListBox current item: " + getCurrentItem());
    }
}
