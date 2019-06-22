package com.sulyma.lab111.labwork5.logic;

/**
 * Class Admin
 */
abstract public class Admin {
    public Admin() {
    }

    /**
     * Listener which wait changing of widgets
     *
     * @param widget widget which was changed
     */
    abstract public void widgetChanged(Widget widget);

    /**
     * Showing Dialog window
     */
    abstract public void showDialog();

    /**
     * Creating widgets
     */
    abstract protected void createWidgets();
}
