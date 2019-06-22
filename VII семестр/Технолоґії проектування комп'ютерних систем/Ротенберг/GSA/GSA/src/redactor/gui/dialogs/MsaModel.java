package redactor.gui.dialogs;

import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;

/**
 * Builds visual model of MSA.
 */
public class MsaModel implements TableModel {

    private String[][] matrix;

    public MsaModel(String[][] matrix) {
        this.matrix = matrix;
    }

    @Override
    public int getRowCount() {
        return matrix.length;
    }

    @Override
    public int getColumnCount() {
        return (matrix.length > 0) ? matrix[0].length : 0;
    }

    @Override
    public String getColumnName(int columnIndex) {
        return "";
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return String.class;
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return false;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        if (matrix == null)
            throw new NullPointerException("Incorrectly initialized MsaModel");
        if (rowIndex < 0 || rowIndex >= matrix.length)
            throw new IndexOutOfBoundsException("Invalid row number " + rowIndex + " for this MsaModel instance");
        if (columnIndex < 0 || columnIndex >= matrix[rowIndex].length)
            throw new IndexOutOfBoundsException("Invalid row number " + rowIndex + " for this MsaModel instance");
        return matrix[rowIndex][columnIndex];
    }

    @Override
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        throw new UnsupportedOperationException("MsaModel is immutable and should be initialized at construction time");
    }

    @Override
    public void addTableModelListener(TableModelListener l) {
//        throw new UnsupportedOperationException("MsaModel is immutable and doesn't support listeners");
    }

    @Override
    public void removeTableModelListener(TableModelListener l) {
//        throw new UnsupportedOperationException("MsaModel is immutable and doesn't support listeners");
    }
}
