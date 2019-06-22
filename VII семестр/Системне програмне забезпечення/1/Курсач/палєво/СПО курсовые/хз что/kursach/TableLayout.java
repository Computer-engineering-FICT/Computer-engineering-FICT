package kursach;

import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.Point;
import java.awt.Rectangle;

/**
 * The layout manager is submitted as the grid which has an opportunity to create rubber columns and rows.
 * (�������� ���������� � ���� ����� � ������������ ������� ��������� ������� � �����.)
 */
public class TableLayout
implements java.awt.LayoutManager2
{
        // Constant of the undefined size in a grid. (��������� ��������������� ������� � �����.)
    public final static double UNDEFINED_SIZE = 0.0;

        // Empty insets. (������ �������.)
    protected final static Insets emptyInsets = new Insets(0,0,0,0);

        /** ���������� ����� �������� ������� */
    protected int gap = 0;
        /** ����������� ������� ������ */
    protected Dimension minSize = new Dimension( 4, 4 );
        /** Table of cells. (������� �����.) */
    protected Cell[][] table;
        /** Amount of rows of a grid. (���������� ����� �����.) */
    protected int rowCount = 0;
        /** Amount of columns of a grid. (���������� ������� �����.) */
    protected int columnCount = 0;
        /** List of sizes of rows. (������ �������� �����.) */
    protected Item rows[];
        /** List of sizes of columns. (������ �������� �������). */
    protected Item columns[];

   /**
    * Constructor.
    */
    public TableLayout()
    {
        this( 0, 0 );
    }

   /**
    * Constructor.
    *
    * @param int columnCount  the amount of columns (���������� �������).
    * @param int rows  the amount of rows (���������� �����).
    */
    public TableLayout( int columnCount, int rowCount )
    {
        setSize( columnCount, rowCount );
    }

   /**
    * Constructor.
    *
    * @param int columnCount  the amount of columns (���������� �������).
    * @param int rows  the amount of rows (���������� �����).
    */
    public TableLayout( double[] columns, double[] rows )
    {
        setSize( columns.length, rows.length );
        setColumns( columns );
        setRows( rows );
    }

   /**
    * ��������� ������ ��������.
    * @param list �������� ������.
    * @return ���� ������.
    * @exception CloneNotSupportedException ���� ��������� ������ ������������.
    */
    private Item[] clone( Item[] list )
    throws CloneNotSupportedException
    {
        Item[] clonedList = new Item[ list.length ];
        Item clonedItem = null;

        for( int n = 0; n < list.length; n++ )
        {
            clonedItem = (Item) list[ n ].clone();
            clonedList[ n ] = clonedItem;
        }

        return clonedList;
    }

   /**
    * ������������� ���������� ����� �������� �������.
    * @param value ����� ��������.
    * @exception IllegalArgumentException ���� �������� �������������.
    */
    public void setGap( int value )
    {
        if( gap != value )
        {
            if( value < 0 )
            {
                throw new IllegalArgumentException("gap can't be negative");
            }
            gap = value;
        }
    }

   /**
    * ���������� ���������� ����� �������� �������.
    * @return ��������.
    */
    public int getGap()
    {
        return gap;
    }

   /**
    * ������������� ����������� ������� ������.
    * @param value ����� ��������.
    */
    public void setMinimumSize( Dimension value )
    {
        minSize = value;
    }

   /**
    * ���������� ����������� ������� ������.
    * @return �������� ��� null, ���� ������� �� �������.
    */
    public Dimension getMinimumSize()
    {
        return minSize;
    }

        /* specified by java.awt.LayoutManager2 */
    public void addLayoutComponent( Component c, Object constraints )
    {
        if( constraints instanceof TableConstraint )
        {
            setComponentConstraints( c, (TableConstraint) constraints );
        }
    }

        /* specified by java.awt.LayoutManager2 */
    public void removeLayoutComponent( Component c )
    {
        Point pos = getPosition( c );

        if( pos != null )
        {
            clearComponentCell( pos.x, pos.y );
        }
    }

        /* specified by java.awt.LayoutManager2 */
    public synchronized void layoutContainer( Container container )
    {
            // Initiates the grid by real sizes. (������������������� ����� ��������� ���������.)
        initGrid( container );

        Insets cInsets = container.getInsets();
        Cell cell;
        CompCell ccell;

        for( int col = 0; col < columnCount; col++ )
        {
            for( int row = 0; row < rowCount; row++ )
            {
                cell = table[ col ][ row ];

                if( cell != null && !(cell instanceof RefCell) )
                // If the cell is occupied and is not the reference (���� ������ ������ � �� �������� �������).
                {
                    ccell = (CompCell)cell;
                        // Set the sizes for the component. (���������� ������� ����������.)
                    ccell.component.setBounds
                    (
                        cInsets.left + ccell.padding.left + columns[ col ].position,
                        cInsets.top + ccell.padding.top + rows[ row ].position,
                        getFragmentSize( columns, col, ccell.colspan ) - (ccell.padding.left + ccell.padding.right),
                        getFragmentSize( rows, row, ccell.rowspan ) - (ccell.padding.top + ccell.padding.bottom)
                    );
                }
            }
        }
    }

    protected int getMinWidth()
    {
        return minSize != null ? minSize.width : 0;
    }

    protected int getMinHeight()
    {
        return minSize != null ? minSize.height : 0;
    }

   /**
    * Initiates a grid by real sizes. (�������������� ����� ��������� �������.)
    *
    * @param Container container  the container (���������).
    */
    protected void initGrid( Container container )
    {
        Dimension size = container.getSize();

        Insets insets = container.getInsets();
        if( insets != null )
        {
            size.width -= (insets.left + insets.right);
            size.height -= (insets.top + insets.bottom);
        }
        else
        {
            insets = emptyInsets;
        }

        layoutItems( rows, size.height, getMinHeight() );
        layoutItems( columns, size.width, getMinWidth() );
    }

   /**
    * �������������� ������ ��������� (�����,�������) ��������� ���������.
    * @param items ������ ���������.
    * @param srcSize �������� ������ ��� ����������� ���������.
    */
    protected void layoutItems( Item[] items, int srcSize, int minSize )
    {
        if( items.length == 0 )
        {
            return;
        }

        int tmpTotal = 0;
        int undefCount = 0;
        int visibleCount = 0;
        double percent = 0;
        int totalGap = gap * (getVisibleCount( items ) - 1);
        int availSize = srcSize - getTotalFixedSize( items ) - totalGap;
        Item item = null;

        for( int n = 0; n < items.length; n++ )
        {
            item = items[ n ];

            if( item.visible )
            {
                if( item.isUndefined() )
                {
                    undefCount++;
                }
                else
                if( item.isPercentage() )
                {
                    percent = item.value;
                    item.size = (int) Math.max( Math.round( availSize * percent ), minSize );

                    tmpTotal += item.size;
                }
                else
                {
                    item.size = (int) Math.max( item.value, minSize );

                    tmpTotal += item.size;
                }
            }
            else
            {
                item.size = 0;
            }
        }

        int undefAvail = srcSize - totalGap - tmpTotal;
        int undefSize = Math.max( undefCount != 0 ? (undefAvail / undefCount) : undefAvail, minSize );
        int totalSize = totalGap;
        int position = 0;

        for( int n = 0; n < items.length; n++ )
        {
            item = items[ n ];

            if( item.visible )
            {
                if( item.isUndefined() )
                {
                    item.size = undefSize;
                }

                item.position = position;

                position += item.size + gap;
                totalSize += item.size;
            }
        }

        validateItems( items, srcSize, totalSize );
    }

   /**
    * ���������� ������������� �������� ���������.
    * @param items ������ ���������.
    * @param availSize ��������� ������.
    * @param totalSize ����� ������ ���� ��������� � ������ ����������
    *                  ����� ���������� (������,���������).
    */
    protected void validateItems( Item[] items, int availSize, int totalSize )
    {
//        if( totalSize >= availSize )
//        {
//            return;
//        }

        int diff = availSize - totalSize;

        Item item = null;
        int index = items.length - 1;

        while( index >= 0 )
        {
            item = items[ index ];
            if( item.visible && (item.isPercentage() || item.isUndefined()) )
            {
                item.size += diff;
                int delta = diff;
                if( item.size < 0 )
                {
                    delta += -item.size;
                    item.size = 0;
                }

                // Adjust subsequent items
                int tmpIndex = index + 1;
                int lastIndex = items.length - 1;
                while( tmpIndex <= lastIndex )
                {
                    item = items[ tmpIndex ];
                    if( item.visible )
                    {
                        item.position += delta;
                    }
                    tmpIndex++;
                }
                break;
            }
            index--;
        }
    }

        /* specified by java.awt.LayoutManager2 */
    public void addLayoutComponent( String stName, Component c ){}

        /* specified by java.awt.LayoutManager2 */
    public void invalidateLayout( Container c ){}

        /* specified by java.awt.LayoutManager2 */
    public float getLayoutAlignmentX( Container c )
    {
        return( 0.5f );
    }

        /* specified by java.awt.LayoutManager2 */
    public float getLayoutAlignmentY( Container c )
    {
        return( 0.5f );
    }

        /* specified by java.awt.LayoutManager2 */
    public Dimension maximumLayoutSize( Container c )
    {
        return( new Dimension( Integer.MAX_VALUE, Integer.MAX_VALUE ) );
    }

        /* specified by java.awt.LayoutManager2 */
    public Dimension minimumLayoutSize( Container c )
    {
        Dimension size = new Dimension();

        size.width = getTotalFixedSize( columns );
        size.height = getTotalFixedSize( rows );

        int undefinedRowsCount = getUndefinedSizeCount( rows, true );
        int undefinedColsCount = getUndefinedSizeCount( columns, true );

        if( minSize != null )
        {
            if( undefinedRowsCount > 0 )
            {
                size.height += minSize.height * undefinedRowsCount;
            }
            if( undefinedColsCount > 0 )
            {
                size.width += minSize.width * undefinedColsCount;
            }
        }

        if( gap > 0 )
        {
            size.width += gap * (getVisibleCount( columns ) - 1);
            size.height += gap * (getVisibleCount( rows ) - 1);
        }

        Insets insets = c.getInsets();
        if( insets != null )
        {
            size.width += (insets.left + insets.right);
            size.height += (insets.top + insets.bottom);
        }

        return size;
    }

        /* specified by java.awt.LayoutManager2 */
    public Dimension preferredLayoutSize( Container c )
    {
        return minimumLayoutSize( c );
    }

   /**
    * Sets the size of the table. All previous settings are lost.
    * (������������� ������ �������. ��� ���������� ��������� ��������.)
    *
    * @param int columnCount  the amount of columns (���������� �������).
    * @param int rowCount  the amount of rows (���������� �����).
    */
    public void setSize( int columnCount, int rowCount )
    {
        this.columnCount = columnCount;
        this.rowCount = rowCount;

        createGrid();
    }

   /**
    * Returns a size of a grid. (���������� ������ �����.)
    *
    * @return Dimension  the size (������).
    */
    public Dimension getSize()
    {
        return( new Dimension( columnCount, rowCount ) );
    }

   /**
    * Sets the sizes of the columns from the list of values.
    * (������������� ������� ������� �� ������ ��������.)
    * @param ArrayList aValues  the array of values (������ ��������).
    */
    public void setColumns( double[] values )
    {
//        int length = values.size();
//        if( columns == null )
//        {
            createColumns( values.length );
//        }
        if( rows != null )
        {
            Cell tempTable[][] = new Cell[0][0];
            if( table != null )
            {
                tempTable = (Cell[][])table.clone();
            }
            table = new Cell[ values.length ][ rows.length ];
            for( int i = 0; i < table.length && i < tempTable.length; i++ )
            {
                for( int j = 0; j < table[i].length && j < tempTable[i].length; j++ )
                {
                    table[i][j] = tempTable[i][j];
                }
            }
        }
        for( int n = 0; n < values.length; n++ )
        {
            setColumnWidth( n, values[n] );
        }
    }

   /**
    * ������� ������ �������.
    * @return ���������� ������ �������.
    */
    public Item[] getColumns()
    {
        return columns;
    }

   /**
    * Sets the sizes of the rows from the list of values.
    * (������������� ������� ����� �� ������ ��������.)
    * @param ArrayList aValues  the array of values (������ ��������).
    */
    public void setRows( double[] values )
    {
//        int length = values.size();
//        if( rows == null )
//        {
            createRows( values.length );
//        }
        if( rows != null )
        {
            Cell tempTable[][] = new Cell[0][0];
            if( table != null )
            {
                tempTable = (Cell[][])table.clone();
            }
            table = new Cell[ columns.length ][ values.length ];
            for( int i = 0; i < table.length && i < tempTable.length; i++ )
            {
                for( int j = 0; j < table[i].length && j < tempTable[i].length; j++ )
                {
                    table[i][j] = tempTable[i][j];
                }
            }
        }
        for( int n = 0; n < values.length; n++ )
        {
            setRowHeight( n, values[n] );
        }
    }

   /**
    * ������� ������ ������.
    * @return ���������� ������ ������.
    */
    public Item[] getRows()
    {
        return rows;
    }

   /**
    * Sets a width of a column. (������������� ������ �������.)
    *
    * @param int col  the column (�������).
    * @param value the value (��������).
    */
    public void setColumnWidth( int col, double value )
    {
        columns[col].value = value;
    }

   /**
    * Sets a flag of visibility of a column. (������������� ���� ��������� �������.)
    *
    * @param int col  the index of the column (������ �������).
    * @param boolean value  the flag (����).
    */
    public void setColumnVisible( int col, boolean value )
    {
        if( columns[col].visible != value )
        {
            columns[col].visible = value;

            for( int n = 0; n < rowCount; n++ )
            {
                Cell cell = table[col][n];
                if( cell != null && (cell instanceof CompCell) )
                {
                    CompCell ccell = (CompCell)cell;
                    if( ccell.colspan == 1 )
                    {
                        ccell.component.setVisible( value );
                    }
                }
            }
        }
    }

   /**
    * Sets a height of a row. (������������� ������ ����.)
    *
    * @param int row  the row (���).
    * @param value the value (��������).
    */
    public void setRowHeight( int row, double value )
    {
        rows[ row ].value = value;
    }

   /**
    * Sets a flag of visibility of a row. (������������� ���� ��������� ����.)
    *
    * @param int row  the index of the row (������ ����).
    * @param boolean value  the flag (����).
    */
    public void setRowVisible( int row, boolean value )
    {
        if( rows[ row ].visible != value )
        {
            rows[ row ].visible = value;

            for( int n = 0; n < columnCount; n++ )
            {
                Cell cell = table[n][row];
                if( cell != null && (cell instanceof CompCell) )
                {
                    CompCell ccell = (CompCell)cell;
                    if( ccell.rowspan == 1 )
                    {
                        ccell.component.setVisible( value );
                    }
                }
            }
        }
    }

   /**
    * Returns a width of a specified column. (���������� ������ ��������� �������.)
    *
    * @param int col  the index of the column (������ �������).
    * @return the wdth (������).
    */
    public double getColumnWidth( int col )
    {
        return( columns[ col ].value );
    }

   /**
    * Returns a width of a specified column in pixels.
    * (���������� ������� ������ ��������� ������� � ��������.)
    *
    * @param int col  the index of the column (������ �������).
    * @return the wdth (������).
    */
    public int getRealColumnWidth( int col )
    {
        return( columns[ col ].size );
    }

   /**
    * Flag of visibility of a column. (���������� ���� ��������� �������.)
    *
    * @param int col  the index of the column (������ �������).
    * @return boolean  <true> if the column is visible (���� ������� ������).
    */
    public boolean isColumnVisible( int col )
    {
        return columns[col].visible;
    }

   /**
    * Returns a height of a specified row. (���������� ������ ���������� ����.)
    *
    * @param int row  the index of the row (������ ����).
    * @return the height (������).
    */
    public double getRowHeight( int row )
    {
        return( rows[ row ].value );
    }

   /**
    * Returns a current height of a specified row in pixels.
    * (���������� ������� ������ ���������� ���� � ��������.)
    *
    * @param int row  the index of the row (������ ����).
    * @return the height (������).
    */
    public int getRealRowHeight( int row )
    {
        return( rows[ row ].size );
    }

   /**
    * Flag of visibility of a row. (���������� ���� ��������� ����.)
    *
    * @param row  the index of the row (������ ����).
    * @return boolean  <true> if the row is visible (���� ��� �����).
    */
    public boolean isRowVisible( int row )
    {
        return rows[ row ].visible;
    }

   /**
    * Sets the settings for the component. (������������� ��������� ��� ����������.)
    *
    * @param Component c  the component (���������).
    * @param TableConstraint fgc  the settings of the component (��������� ���������� ��� �����).
    */
    public void setConstraints( Component c, TableConstraint fgc )
    {
        Point p = getPosition( c );

        if( p != null )
        {
            CompCell ccell = getComponentCell( p.x, p.y );

            for( int n = 0; n < ccell.colspan; n++ )
            {
                for( int m = 0; m < ccell.rowspan; m++ )
                {
                    table[ p.x + n ][ p.y + m ] = null;
                }
            }
        }

        setComponentConstraints( c, fgc );
    }

   /**
    * Returns the settings of the componental cell in the specified position.
    * If the cell is the link to other cell then the settings of the real
    * componental cell will be returned.
    * (���������� ��������� ����������� ������ � ��������� �������.
    * ���� ������ �������� ������� �� ������ ������,
    * �� ����� ���������� ��������� �������� ������������ ������.)
    *
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return TableConstraint  the settings or NULL if the cell is empty
    *                          (��������� ��� null, ���� ������ ������).
    */
    public TableConstraint getConstraints( int col, int row )
    {
        CompCell ccell = getComponentCell( col, row );
        return (ccell != null) ? (new TableConstraint( row, col, ccell.rowspan, ccell.colspan, ccell.padding )) : null;
    }

   /**
    * Returns the settings of the componental cell for the specified component.
    * (���������� ��������� ������������ ������ ��� ���������� ����������.)
    *
    * @param Component c  the component (���������).
    * @return TableConstraint  the settings or NULL if the component is not found in the grid
    *                          (��������� ��� null, ���� ��������� �� ������ � �����).
    */
    public TableConstraint getConstraints( Component c )
    {
        Point p = getPosition( c );

        if( p == null )
        {
            return( null );
        }

        CompCell ccell = getComponentCell( p.x, p.y );
        return (ccell != null) ? (new TableConstraint( p.y, p.x, ccell.colspan, ccell.rowspan, ccell.padding )) : null;
    }

   /**
    * Returns an amount of rows. (���������� ���������� �����.)
    *
    * @return int  the amount of rows (���������� �����).
    */
    public int getRowCount()
    {
        return rowCount;
    }

   /**
    * Returns an amount of columns. (���������� ���������� �������.)
    *
    * @return int  the amount of columns (���������� �������).
    */
    public int getColumnCount()
    {
        return columnCount;
    }

   /**
    * Returns a component on the specified coordinates.
    * (���������� ��������� �� ��������� �����������.)
    *
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return Component  the component (���������).
    */
    public Component getAt( int col, int row )
    {
        CompCell ccell = getComponentCell( col, row );
        return( ccell != null ? ccell.component : null );
    }

   /**
    * Returns a location of a component. (���������� �������������� ����������.)
    *
    * @param Component c  the component (���������).
    * @return Point  the point of the location or NULL if the component is not found
    *                (����� ��������� ��� null ���� ��������� �� ������).
    */
    public Point getPosition( Component c )
    {
        Point p = null;
        boolean found = false;

        for( int col = 0; col < columnCount && !found; col++ )
        {
            for( int row = 0; row < rowCount && !found; row++ )
            {
                if( !isEmptyCell( col, row ) )
                {
                    if( c == getAt( col, row ) )
                    {
                        p = new Point( col, row );
                        found = true;
                        break;
                    }
                }
            }
        }
        return( p );
    }

   /**
    * Returns a component to the left from the specified component.
    * (���������� ��������� ����� �� ����������.)
    *
    *
    * @param Component c  the component (���������).
    * @return Component  the component or NULL.
    */
    public Component getLeft( Component c )
    {
        Component left = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.x >= 0 && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    left = tmp;
                    found = true;
                }
                p.x--;
            }
        }
        return left;
    }

   /**
    * Returns a component to the right from the specified component.
    * (���������� ��������� ������ �� ����������.)
    *
    * @param Component c  the component (���������).
    * @return Component  the component or NULL.
    */
    public Component getRight( Component c )
    {
        Component right = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.x != columnCount && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    right = tmp;
                    found = true;
                }
                p.x++;
            }
        }
        return right;
    }

   /**
    * Returns a component above from specified.
    * (���������� ��������� ������ �� ����������.)
    *
    * @param Component c  the component (���������).
    * @return Component  the component or NULL.
    */
    public Component getUp( Component c )
    {
        Component up = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.y >= 0 && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    up = tmp;
                    found = true;
                }
                p.y--;
            }
        }
        return up;
    }

   /**
    * Returns a component which there is lower from specified.
    * (���������� ��������� ����� �� ����������.)
    *
    * @param Component c  the component (���������).
    * @return Component  the component or NULL.
    */
    public Component getDown( Component c )
    {
        Component down = null;
        Point p = getPosition( c );

        if( p != null )
        {
            boolean found = false;
            Component tmp = null;

            while( p.y != rowCount && !found )
            {
                tmp = getAt( p.x, p.y );

                if( tmp != c )
                {
                    down = tmp;
                    found = true;
                }
                p.y++;
            }
        }
        return down;
    }

   /**
    * Returns a cell of a component.
    * (���������� ������ ����������.)
    *
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return CCell  the cell or NULL if there is no cell in a specified position
    *               (������ ��� null ���� � ������ ������� ��� ������).
    */
    protected CompCell getComponentCell( int col, int row )
    {
        Cell cell = table[ col ][ row ];
        if( cell != null )
        {
            return (cell instanceof RefCell) ? ((RefCell)cell).ref : (CompCell)cell;
        }
        return null;
    }

   /**
    * Returns a flag which defines whether a grid cell is a reference to a component.
    * (���������� ������� ���� �������� �� ������ ����� ������� �� ���������.)
    *
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return boolean  <true> if the grid cell is the reference (���� ��� ������).
    */
    public boolean isReferencedCell( int col, int row )
    {
        Cell cell = table[ col ][ row ];
        return cell != null && (cell instanceof RefCell);
    }

   /**
    * Returns a flag which defines whether a cell is empty.
    * (���������� ������� ���� �������� �� ������ ����� ������.)
    *
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return boolean  <true> if the cell is empty (���� ������ �����).
    */
    public boolean isEmptyCell( int col, int row )
    {
        return( table[ col ][ row ] == null );
    }

   /**
    * Creates a grid according to the specified sizes.
    * (������� ����� ������ �� �������� ��������.)
    */
    private void createGrid()
    {
        rows = new Item[ rowCount ];
        columns = new Item[ columnCount ];

        for( int n = 0; n < rows.length; n++ )
        {
            rows[ n ] = createItem();
        }

        for( int n = 0; n < columns.length; n++ )
        {
            columns[ n ] = createItem();
        }

        table = new Cell[ columnCount ][ rowCount ];
    }

   /**
    * Creates a grid of columns proceeding from the specified sizes.
    * (������� ����� ������� ������ �� �������� ��������.)
    *
    * @param int length  the size (������).
    */
    public void createColumns( int length )
    {
        this.columnCount = length;
        columns = new Item[ length ];

        for( int n = 0; n < length; n++ )
        {
            columns[n] = createItem();
        }
    }

   /**
    * Creates a grid of rows proceeding from the specified sizes.
    * (������� ����� ����� ������ �� �������� ��������.)
    *
    * @param int length  the size (������).
    */
    public void createRows( int length )
    {
        this.rowCount = length;
        rows = new Item[ length ];

        for( int n = 0; n < length; n++ )
        {
            rows[n] = createItem();
        }
    }

   /**
    * Returns an amount of columns with undefined sizes.
    * (���������� ���������� ������� � �������������� ��������.)
    *
    * @return int  the amount of columns (���������� �������).
    */
    public int getUndefinedColumnCount()
    {
        return( getUndefinedSizeCount( columns, false ) );
    }

   /**
    * Returns an amount of rows with undefined sizes.
    * (���������� ���������� ����� � �������������� ��������.)
    *
    * @return int  the amount of rows (���������� �����).
    */
    public int getUndefinedRowCount()
    {
        return( getUndefinedSizeCount( rows, false ) );
    }

   /**
    * Returns a flag which defines: whether a column is rubber.
    * (���������� ���� ����, �������� �� ������� ���������.)
    *
    * @param int col  the index of the column (������ �������).
    * @return boolean  <true> if the column has an undefined size
    *                 (���� ������� ����� �������������� ������).
    */
    public boolean isColumnUndefined( int col )
    {
        return( columns[ col ].isUndefined() );
    }

   /**
    * Returns a flag which defines: whether a row is rubber.
    * (���������� ���� ���� �������� �� ��� ���������.)
    *
    * @param int row  index of the row (������ ����).
    * @return boolean  <true> if the row has an undefined size
    *                  (���� ��� ����� �������������� ������).
    */
    public boolean isRowUndefined( int row )
    {
        return( rows[ row ].isUndefined() );
    }

   /**
    * Returns a flag which defines: whether the column size of in percents is specified.
    * (���������� ���� ���� �������� �� ������ ������� �������� � ���������.)
    *
    * @param int col  the index of the column (������ �������).
    * @return boolean  <true> if the size is specified in percents
    *                  (���� ������ ����� � ���������).
    */
    public boolean isColumnWidthInPercents( int col )
    {
        return( columns[ col ].isPercentage() );
    }

   /**
    * Returns a flag which defines: whether the row size of in percents is specified.
    * (���������� ���� ����, �������� �� ������ ���� �������� � ���������.)
    *
    * @param int row  the index of the row (������ ����).
    * @return boolean  <true> if the size is specified in percents
    *                  (���� ������ ����� � ���������).
    */
    public boolean isRowHeightInPercents( int row )
    {
        return( rows[ row ].isPercentage() );
    }

   /**
    * Returns an amount of undefined sizes.
    * (���������� ���������� �������������� ��������.)
    *
    * @param Item[] list  the list of sizes (������ ��������).
    * @return  the amount of undefined sizes (���������� �������������� ��������).
    */
    private int getUndefinedSizeCount( Item[] list, boolean checkVisible )
    {
        int count = 0;
        for( int n = 0; n < list.length; n++ )
        {
            if( list[ n ].isUndefined() && (checkVisible ? list[ n ].visible : true) )
            {
                count++;
            }
        }
        return( count );
    }

   /**
    * Returns a total size of all fixed sizes.
    * (���������� ��������� ������ ���� ������������� ��������.)
    *
    * @param Item[] list  list of sizes (������ ��������).
    * @return int  the total size (��������� ������).
    */
    protected int getTotalFixedSize( Item[] list )
    {
        int size = 0;
        for( int n = 0; n < list.length; n++ )
        {
            if( list[ n ].visible && list[ n ].isFixed() )
            {
                size += (int)list[ n ].value;
            }
        }
        return( size );
    }

   /**
    * Sets properties of a cell. (������������� �������� ������.)
    *
    * @param Component comp  the component (���������).
    * @param TableConstraint constraints  the properties (��������).
    */
    protected void setComponentConstraints( Component comp, TableConstraint constraints )
    {
        CompCell cell = new CompCell( comp, constraints.padding );
        cell.colspan = constraints.colspan;
        cell.rowspan = constraints.rowspan;
        setComponentCell( constraints.col, constraints.row, cell );
    }

   /**
    * Sets a cell in a specified position. (������������� ������ � ��������� �������.)
    *
    * @param int col the column (�������).
    * @param int row the row (���).
    * @param cell the cell (������).
    */
    private void setComponentCell( int col, int row, CompCell cell )
    {
        if( table != null )
        {
            if( cell.colspan > 1 || cell.rowspan > 1 )
            {
                Cell c = null;
                for( int tmpCol = 0; tmpCol < cell.colspan; tmpCol++ )
                {
                    for( int tmpRow = 0; tmpRow < cell.rowspan; tmpRow++ )
                    {
                        c = new RefCell( cell );
                        c.row = row + tmpRow;
                        c.col = col + tmpCol;
                        table[ c.col ][ c.row ] = c;
                    }
                }
            }
            cell.row = row;
            cell.col = col;
            table[ col ][ row ] = cell;
        }
    }

   /**
    * Clears a cell in a specified position. (������� ������ � �������� �������.)
    *
    * @param int col  the column (�������).
    * @param int row  the row (���).
    */
    private void clearComponentCell( int col, int row )
    {
        table[ col ][ row ] = null;
    }

    public Cell getCell( int col, int row )
    {
        return table[ col ][ row ];
    }

    public boolean isEmptyArea( Component excludedComponent, TableConstraint fgc )
    {
        return( isEmptyArea( excludedComponent, fgc.col, fgc.row, fgc.colspan, fgc.rowspan ) );
    }

    public boolean isEmptyArea( Component excludedComponent, int col, int row, int width, int height )
    {
        Cell cell = null;

        for( int n = 0; n < width; n++ )
        {
            for( int m = 0; m < height; m++ )
            {
                cell = table[ col + n ][ row + m ];
                if( cell != null )
                {
                    CompCell ccell = null;
                    if( cell instanceof RefCell )
                    {
                        ccell = ((RefCell)cell).ref;
                        return (ccell.component == excludedComponent);
                    }
                    else
                    {
                        ccell = (CompCell)cell;
                        return (ccell.component == excludedComponent);
                    }
                }
            }
        }
        return true;
    }

   /**
    * Returns bounds of a cell. (���������� ������� ������.)
    *
    * @param Container container  the container (���������).
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return Rectangle  the bounds of the cell (������� ������).
    */
    public Rectangle getCellBounds( Container container, int col, int row )
    {
        Rectangle r = new Rectangle();
        Cell cell = table[ col ][ row ];
        Insets cInsets = container.getInsets();
        Insets insets = null;
        int colspan = 1;
        int rowspan = 1;

        if( cell != null && !(cell instanceof RefCell) )
        {
            CompCell ccell = (CompCell)cell;
            insets = (ccell.padding != null) ? ccell.padding : emptyInsets;
            colspan = ccell.colspan;
            rowspan = ccell.rowspan;
        }
        else
        {
            insets = emptyInsets;
        }

        r.x         = cInsets.left + getOffsetForColumn( col ) + insets.left;
        r.y         = cInsets.top + getOffsetForRow( row ) + insets.top;
        r.width     = getFragmentSize( columns, col, colspan ) - (insets.left + insets.right);
        r.height    = getFragmentSize( rows, row, rowspan ) - (insets.top + insets.bottom);

        return( r );
    }

   /**
    * Returns a location of a left top corner of a grid cell.
    * (���������� ��������� ������ �������� ���� ������ �����.)
    *
    * @param Container container  the container (���������).
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return Point  the coordinates of the left top corner of the grid cell
    *                (���������� ������ �������� ���� ������).
    */
    public Point getCellLocation( Container container, int col, int row )
    {
        Point p = new Point();
        Insets cInsets = container.getInsets();
        p.x = cInsets.left + getOffsetForColumn( col );
        p.y = cInsets.top + getOffsetForRow( row );
        return( p );
    }

   /**
    * Returns a current size of the grid cell. (���������� ������� ������ ������ �����.)
    *
    * @param Container container  the container (���������).
    * @param int col  the column (�������).
    * @param int row  the row (���).
    * @return Dimension  the size of the cell (������ ������).
    */
    public Dimension getCellSize( Container container, int col, int row )
    {
        Dimension size = new Dimension();
        Cell cell = table[ col ][ row ];
        int colspan = 1;
        int rowspan = 1;

        size.width = getFragmentSize( columns, col, colspan );
        size.height = getFragmentSize( rows, row, rowspan );

        return( size );
    }

   /**
    * Returns a size of a grid fragment in pixels. The fragment is a section occupied by elements.
    * (���������� ������ ��������� ����� � ��������. ���������� �������� �������, ���������� ����� � ����� ����������.)
    *
    * @param Item[] list - the list of the elements (������ ���������).
    * @param int from - the start element (��������� �������).
    * @param int count - the amount of occupied elements (���������� ���������� ���������).
    * @return int - the size in pixels (������ � ��������).
    */
    protected int getFragmentSize( Item[] list, int from, int count )
    {
        int size = 0;
        int visibleCount = 0;
        for( int to = from + count; from < to; from++ )
        {
            if( list[ from ].visible )
            {
                size += list[ from ].size;
                visibleCount++;
            }
        }
        size += gap * (visibleCount - 1);
        return size;
    }

    public int getRowFragmentSize( int from, int count )
    {
        int size = getFragmentSize( rows, from, count );
        return size;
    }

    public int getColumnFragmentSize( int from, int count )
    {
        int size = getFragmentSize( columns, from, count );
        return size;
    }

    public int getVisibleRowCount()
    {
        return getVisibleCount( rows );
    }

    public int getVisibleColumnCount()
    {
        return getVisibleCount( columns );
    }

   /**
    * ���������� ���������� ������� ���������.
    * @param list ������ ���������.
    * @return ���������� ������� ���������.
    */
    protected int getVisibleCount( Item[] list )
    {
        int count = 0;
        for( int n = 0; n < list.length; n++ )
        {
            if( list[ n ].visible )
            {
                count++;
            }
        }
        return( count );
    }

   /**
    * Returns a displacement for a specified column. (���������� �������� ��� ��������� �������.)
    *
    * @param int col  the column (�������).
    * @return int the displacement for the specified column (�������� ��� ��������� �������).
    */
    private int getOffsetForColumn( int col )
    {
        int pos = 0;
        for( int n = 0; n < col; n++ )
        {
            pos += columns[ n ].size + gap;
        }
        return( pos );
    }

   /**
    * Returns a displacement for a row. (���������� �������� ��� ����.)
    *
    * @param int row  the row (���).
    * @return int  the displacement for the row (�������� ��� ����).
    */
    private int getOffsetForRow( int row )
    {
        int pos = 0;
        for( int n = 0; n < row; n++ )
        {
            pos += rows[ n ].size + gap;
        }
        return( pos );
    }

   /**
    * ������� ��������� �������� ������ ��������.
    * @return �������.
    */
    protected Item createItem()
    {
        return new Item();
    }

   /**
    * Outputs parameters of the manager of configuration in the standard stream of an output.
    * (������� ��������� ��������� ���������� � ����������� ����� ������.)
    */
    public void list()
    {
        list( System.out );
    }

   /**
    * Outputs the parameters of the manager of configuration in the specified stream of an output.
    * (������� ��������� ��������� ���������� � ��������� ����� ������.)
    *
    * @param java.io.PrintStream pstream - the output stream (�����).
    */
    public void list( java.io.PrintStream pstream )
    {
        pstream.println( "" + this.toString() );

        for( int r = 0; r < rowCount; r++ )
        {
            String str = "";

            for( int c = 0; c < columnCount; c++ )
            {
                str = "[" + c + "," + r + "] = " + table[ c ][ r ];

                pstream.println( str );
            }
        }

        pstream.println( "" );
    }

    public void listRows( java.io.PrintStream pstream )
    {
        list( rows, pstream );
    }

    public void listColumns( java.io.PrintStream pstream )
    {
        list( columns, pstream );
    }

    protected void list( Item[] list, java.io.PrintStream pstream )
    {
        for( int n = 0; n < list.length; n++ )
        {
            pstream.println( "" + n + ": " + list[ n ] );
        }
    }

   /**
    * Returns an object as a string. (���������� ��������� ������������� �������.)
    *
    * @return String - the string (������).
    */
    public String toString()
    {
        return( getClass().getName() + " " + hashCode() + " [" + paramString() + "]" );
    }

   /**
    * Returns a string of parameters of an object. (���������� ������ ���������� �������.)
    *
    * @return String - the string of parameters (������ ����������).
    */
    protected String paramString()
    {
        StringBuffer ps = new StringBuffer();
        ps.append( columnCount );
        ps.append( 'x' );
        ps.append( rowCount );
        return ps.toString();
    }

    /**
     * Class is intended for a storage of an information on an element of a table, row, column.
     * (����� ��� �������� ���������� � �������� �������, ���� ��� �������.)
     */
    public static class Item
    implements java.lang.Cloneable
    {
            // Start position of the element.  (����������, � ������� ���������� �������.)
        public int position = 0;
            // Real size in pixels. (�������� ������ � ��������.)
        public int size = 0;
            // Value of a size. (�������� �������.)
        public double value = TableLayout.UNDEFINED_SIZE;
            // Flag of the visibility of an element. (���� ����, �������� �� ������� �������.)
        public boolean visible = true;

        public boolean isFixed()
        {
            return( value > 1F );
        }

        public boolean isPercentage()
        {
            return( value > 0.0 && value < 1.0 );
        }

        public boolean isUndefined()
        {
            return( value <= 0.0 );
        }

        public Object clone()
        throws CloneNotSupportedException
        {
            return super.clone();
        }

       /**
        * Returns an object as a string. (���������� ��������� ������������� �������.)
        *
        * @return String - the string (������).
        */
        public String toString()
        {
            return( getClass().getName() + "[" + paramString() + "]" );
        }

       /**
        * Returns a string of parameters of an object. (���������� ������ ���������� �������.)
        *
        * @return String - the string of parameters (������ ����������).
        */
        protected String paramString()
        {
            String ps = "";
            ps += ",value=" + value;
            ps += ",size=" + size;
            ps += ",visible=" + visible;
            return( ps );
        }
    }

    public static abstract class Cell
    {
        protected int row = -1;
        protected int col = -1;

        public int getRow()
        {
            return row;
        }

        public int getCol()
        {
            return col;
        }

       /**
        * Returns an object as a string. (���������� ��������� ������������� �������.)
        * @return String - the string (������).
        */
        public String toString()
        {
            return( getClass().getName() + "[" + paramString() + "]" );
        }

       /**
        * Returns a string of parameters of an object. (���������� ������ ���������� �������.)
        * @return String - the string of parameters (������ ����������).
        */
        protected String paramString()
        {
            StringBuffer ps = new StringBuffer();
            ps.append("row=" + row);
            ps.append(",col=" + row);
            return ps.toString();
        }
    }

    public static class RefCell extends Cell
    {
            // Reference to a cell. (������ �� ������.)
        protected CompCell ref;

        protected RefCell( CompCell ref )
        {
            this.ref = ref;
        }

        public CompCell getRef()
        {
            return ref;
        }

       /**
        * Returns a string of parameters of an object. (���������� ������ ���������� �������.)
        * @return String - the string of parameters (������ ����������).
        */
        protected String paramString()
        {
            StringBuffer ps = new StringBuffer( super.paramString() );
            ps.append(",ref=" + ref);
            return ps.toString();
        }
    }

    /**
     * Class is intended for saving of an information on a cell.
     * (����� ��� �������� ���������� � ������.)
     */
    public static class CompCell extends Cell
    {
            // Indents from margins of a cell. (������� �� ������ ������.)
        protected Insets padding = null;
            // Component pegged to a grid cell. (��������� ����������� � ������ �����.)
        protected Component component = null;
            // Amount of cells occupied by a given cell on the horizontal. (���������� ����� ���������� ������ ������� �� �����������.)
        protected int colspan = 0;
            // Amount of cells occupied by a given cell on the vertical. (���������� ����� ���������� ������ ������� �� ���������.)
        protected int rowspan = 0;

        protected CompCell( Component comp, Insets padding )
        {
            component = comp;
            this.padding = padding;
        }

        public Component getComponent()
        {
            return component;
        }

        public int getColSpan()
        {
            return colspan;
        }

        public int getRowSpan()
        {
            return rowspan;
        }

        public Insets getPadding()
        {
            return padding;
        }

       /**
        * Returns a string of object parameters. (���������� ������ ���������� �������.)
        * @return - the string of parameters (������ ����������).
        */
        protected String paramString()
        {
            StringBuffer ps = new StringBuffer( super.paramString() );
            ps.append( "," + colspan + "x" + rowspan );
            if( padding != null )
            {
                ps.append( ",padding={" + padding.top +
                                    "," + padding.left +
                                    "," + padding.bottom +
                                    "," + padding.right + "}" );
            }
            ps.append( ",component=" + component);
            return ps.toString();
        }
    }
}
