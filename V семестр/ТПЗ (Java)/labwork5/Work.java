package com.sulyma.lab111.labwork5;

import com.sulyma.lab111.labwork5.logic.ModalAdmin;

/**
 * Template first class.
 *
 * @author Aleksandr Sulyma
 */
public final class Work {

    /**
     * Constructor.
     */
    private Work() {
        super();
    }

    /**
     * Invokes at application startup.
     *
     * @param args Parameters from command line
     */
    public static void main(final String[] args) {
        ModalAdmin modal = new ModalAdmin();
        modal.getListBox().changeCurrentIndex(2);
        modal.getTextBox().setText("New value for textBox");
        modal.getButton().onClick();
    }
}
