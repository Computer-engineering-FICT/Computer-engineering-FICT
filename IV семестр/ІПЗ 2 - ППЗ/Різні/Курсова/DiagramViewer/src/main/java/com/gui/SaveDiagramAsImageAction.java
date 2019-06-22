package com.gui;

import java.awt.event.ActionEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.AbstractAction;
import javax.swing.Action;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

import com.main.Main;

/**
 * Клас, що виконує зберігання діагрми у файлі формату JPEG.
 *
 * @author Куцовол Віктор
 */

public class SaveDiagramAsImageAction extends AbstractAction {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 6061904337345719827L;

    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Діалог збереження файлу.
     */
    private JFileChooser jfc;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     * @param name
     *            назва дії
     */
    public SaveDiagramAsImageAction(final MainFrame fr, final String name) {
        frame = fr;
        putValue(Action.NAME, name);
        putValue(Action.SHORT_DESCRIPTION, name);
        putValue(SMALL_ICON, new ImageIcon(Main.class.
                getResource("img/thumbnail.png")));
        setEnabled(false);
        jfc = new JFileChooser();
        jfc.setFileFilter(new JPEGFileFilter());
    }

    /**
     * Виконується при виникненні події.
     *
     * @param e
     *            подія
     */
    public final void actionPerformed(final ActionEvent e) {
        int result = jfc.showSaveDialog(frame);
        if (result == JFileChooser.APPROVE_OPTION) {
            BufferedImage img = new BufferedImage(frame.getDiagramPanel()
                    .getWidth(), frame.getDiagramPanel().getHeight(),
                    BufferedImage.TYPE_INT_RGB);
            frame.getDiagramPanel().paint(img.getGraphics());
            File f = jfc.getSelectedFile();
            try {
                ImageIO.write(img, "jpg", f);
            } catch (IOException e1) {
                System.out.println("Помилка збереження діаграми");
                JOptionPane.showOptionDialog(frame,
                        "Помилка збереження діаграми", "Помилка",
                        JOptionPane.CLOSED_OPTION, JOptionPane.ERROR_MESSAGE,
                        null, null, null);
            }
        }
    }

}
