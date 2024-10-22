package kursach;

import java.awt.Dimension;
import javax.swing.JComponent;

public class Node extends JComponent implements Parametrized{
        public static final int DEFAULT_RADIUS = 20;
        private NodeModel model;

        public Node() {
                super.setSize(2*DEFAULT_RADIUS, 2*DEFAULT_RADIUS);
                setModel(new NodeModel());
                setUI(UIStorage.node);
        }

        public boolean isSelected() {
                return model.isSelected();
        }

        public void setSelected(boolean selected) {
                model.setSelected(selected);
                repaint();
        }

        public void setModel(NodeModel model) {
                this.model = model;
        }

        public Dimension getPreferredSize() {
                return new Dimension(2*DEFAULT_RADIUS, 2*DEFAULT_RADIUS);
        }

        public Dimension getMinimumSize() {
                return new Dimension(2*DEFAULT_RADIUS, 2*DEFAULT_RADIUS);
        }

        public Dimension getMaximumSize() {
                return new Dimension(2*DEFAULT_RADIUS, 2*DEFAULT_RADIUS);
        }

        public NodeModel getModel() {
                return model;
        }

        public void setParameter(int param) {
                model.setWeight(param);
                repaint();
        }

        public int getWeight() {
                return model.getWeight();
        }

        public void setNumber(int num) {
                model.setNumber( num );
        }

        public int getNumber() {
               return model.getNumber();
        }
}
