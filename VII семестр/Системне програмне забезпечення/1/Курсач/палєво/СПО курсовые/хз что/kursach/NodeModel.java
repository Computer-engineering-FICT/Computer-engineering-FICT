package kursach;

public class NodeModel {
        private boolean selected = false;
        private int weight;
        private int number;

        public NodeModel() {
        }

        public boolean isSelected() {
                return selected;
        }

        public void setSelected(boolean selected) {
                this.selected = selected;
        }

        public void setWeight(int weight) {
                this.weight = weight;
        }

        public int getWeight() {
               return weight;
        }

        public void setNumber(int num) {
                number = num;
        }

        public int getNumber() {
               return number;
        }
}
