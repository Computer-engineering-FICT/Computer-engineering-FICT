package scheduler;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 27.12.10
 * Time: 17:38
 * To change this template use File | Settings | File Templates.
 */
public class GanttTableModel extends AbstractTableModel {

    private int columnCount;
    private String[] columnNames;
    private ArrayList<String[]> table;

    public GanttTableModel(int columnCount) {
        this.columnCount = columnCount;
        table = new ArrayList<String[]>();
    }

    public void addColumnNamesRow(String[] row) {
        columnNames = row;
    }

    public void addRow(String[] row) {
        table.add(row);
    }

    public void setValueAt(String value, int row, int column) {
        while (row >= table.size()) {
             table.add(new String[columnCount]);
        }
        table.get(row)[column] = value;
    }

    public int getRowCount() {
        return table.size();
    }

    public int getColumnCount() {
        return columnCount;
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
        return table.get(rowIndex)[columnIndex];
    }

}
