package com.gui;


import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.AbstractButton;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.plaf.basic.BasicButtonUI;

/**
 *
 * Клас, що використовується як tabComponent.
 * Створює JLabel, що використовується для закриття вкладки
 *
 * @author Куцовол Віктор
 *
 */

public class ButtonTabComponent extends JPanel {

    /**
     * serialVersionUID.
     */
    private static final long serialVersionUID = 7317026987770482813L;
    /**
     * Посилання на фрейм.
     */
    private MainFrame frame;

    /**
     * Конструктор.
     *
     * @param fr
     *            посилання на фрейм
     */
    @SuppressWarnings("serial")
    public ButtonTabComponent(final MainFrame fr) {
        super(new FlowLayout(FlowLayout.LEFT, 0, 0));
        frame = fr;
        final int shift = 5;
        if (frame.getJtp() != null) {
            setOpaque(false);
            JLabel label = new JLabel() {
                public String getText() {
                    int i = frame.getJtp().indexOfTabComponent(
                            ButtonTabComponent.this);
                    if (i != -1) {
                        return frame.getJtp().getTitleAt(i);
                    }
                    return null;
                }
            };
            add(label);
            label.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, shift));
            JButton button = new TabButton();
            add(button);
            setBorder(BorderFactory.createEmptyBorder(2, 0, 0, 0));
        }
    }

    /**
     * Клас кнопки.
     */
    private class TabButton extends JButton implements ActionListener {

        /**
         * serialVersionUID.
         */
        private static final long serialVersionUID = -1532516189094404360L;

        /**
         * Конструктор.
         */
        public TabButton() {
            final int size = 17;
            setPreferredSize(new Dimension(size, size));
            setToolTipText("close this tab");
            setUI(new BasicButtonUI());
            setContentAreaFilled(false);
            setFocusable(false);
            setBorder(BorderFactory.createEtchedBorder());
            setBorderPainted(false);
            addMouseListener(buttonMouseListener);
            setRolloverEnabled(true);
            addActionListener(this);
        }

        /**
         * Виконується при виникненні події.
         *
         * @param e
         *            подія
         */
        public void actionPerformed(final ActionEvent e) {
            int i = frame.getJtp().indexOfTabComponent(ButtonTabComponent.this);
            if (i != -1) {
                frame.getJtp().setSelectedIndex(i);
                frame.getCloseAction().actionPerformed(null);
            }
        }

        /**
         * Оновлює UI.
         */
        public void updateUI() {
        }

        /**
         * Виконується при відображенні.
         *
         * @param g
         *            графічний контекст
         */
        protected void paintComponent(final Graphics g) {
            super.paintComponent(g);
            Graphics2D g2 = (Graphics2D) g.create();
            if (getModel().isPressed()) {
                g2.translate(1, 1);
            }
            g2.setStroke(new BasicStroke(2));
            g2.setColor(Color.BLACK);
            if (getModel().isRollover()) {
                g2.setColor(Color.MAGENTA);
            }
            final int delta = 6;
            g2.drawLine(delta, delta, getWidth() - delta - 1, getHeight()
                    - delta - 1);
            g2.drawLine(getWidth() - delta - 1, delta, delta, getHeight()
                    - delta - 1);
            g2.dispose();
        }
    }

    /**
     * Клас оброблювача подій миші.
     */
    private static final MouseListener buttonMouseListener =
        new MouseAdapter() {
        public void mouseEntered(final MouseEvent e) {
            Component component = e.getComponent();
            if (component instanceof AbstractButton) {
                AbstractButton button = (AbstractButton) component;
                button.setBorderPainted(true);
            }
        }

        public void mouseExited(final MouseEvent e) {
            Component component = e.getComponent();
            if (component instanceof AbstractButton) {
                AbstractButton button = (AbstractButton) component;
                button.setBorderPainted(false);
            }
        }
    };
}
