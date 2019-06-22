package kursach;

import java.awt.Insets;

/**
 * ������������ ��� �������� ��������� ��� ������ ������������ TableLayout.
 * (Intended to create settings for a cell of a layout manager TableLayout.)
 */
public class TableConstraint implements Cloneable
{
        /** ����� �������, ��-��������� 0. (Column number. Default value is '0'.) */
    public int col = 0;
        /** ����� ����, ��-��������� 0. (Row number. Default value is '0'.) */
    public int row = 0;
        /** ���������� ���������� �������, ��-��������� 1. (Amount of occupied columns. Default value is '1'.) */
    public int colspan = 1;
        /** ���������� ���������� �����, ��-��������� 1. (Amount of occupied rows. Default value is '1'.) */
    public int rowspan = 1;
        /** ������� �� ������ ������, ��-��������� {0, 0, 0, 0}. (Padding of a cell. Default value is {0, 0, 0, 0}.) */
    public java.awt.Insets padding;

   /**
    * �����������. (Constructor.)
    */
    public TableConstraint()
    {
        this( new Insets( 0,0,0,0 ) );
    }

   /**
    * �����������. (Constructor.)
    *
    * @param padding ������� (insets).
    */
    public TableConstraint( Insets padding )
    {
        this( 0, 0, 1, 1, padding );
    }

   /**
    * �����������. (Constructor.)
    *
    * @param row ��� (row).
    * @param col ������� (column).
    */
    public TableConstraint( int row, int col )
    {
        this( row, col, 1, 1, new Insets( 0,0,0,0 ) );
    }

   /**
    * �����������. (Constructor.)
    *
    * @param row ��� (row).
    * @param col ������� (column).
    * @param padding ������� (insets).
    */
    public TableConstraint( int row, int col, Insets padding )
    {
        this( row, col, 1, 1, padding );
    }

   /**
    * �����������. (Constructor.)
    *
    * @param row ��� (row).
    * @param col ������� (column).
    * @param rowspan ������ (���������� ���������� ����� � ������)
    *       (height - amount of occupied cells in height).
    * @param colspan ������ (���������� ���������� ����� � ������)
    *       (width - amount of occupied cells in width).
    */
    public TableConstraint( int row, int col, int rowspan, int colspan )
    {
        this( row, col, rowspan, colspan, new Insets( 0,0,0,0 ) );
    }

   /**
    * �����������. (Constructor.)
    *
    * @param row ��� (row).
    * @param col ������� (column).
    * @param rowspan ������ (���������� ���������� ����� � ������)
    *       (height - amount of occupied cells in height).
    * @param colspan ������ (���������� ���������� ����� � ������)
    *       (width - amount of occupied cells in width).
    * @param padding ������� (insets).
    */
    public TableConstraint( int row, int col, int rowspan, int colspan, Insets padding )
    {
        this.padding = padding;
        this.col = col;
        this.row = row;
        this.colspan = colspan;
        this.rowspan = rowspan;
    }

   /**
    * ���������� ��������� ������������� �������. (Returns an object as a string.)
    *
    * @return string
    */
    public String toString()
    {
        StringBuffer ps = new StringBuffer();

        ps.append( row );
        ps.append( ',' );
        ps.append( col );
        ps.append( ',' );
        ps.append( rowspan );
        ps.append( 'x' );
        ps.append( colspan );
        ps.append( ',' );
        ps.append( "padding=" );
        ps.append( '{' );
        ps.append( padding.top );
        ps.append( ',' );
        ps.append( padding.left );
        ps.append( ',' );
        ps.append( padding.bottom );
        ps.append( ',' );
        ps.append( padding.right );
        ps.append( '}' );

        return( getClass().getName() + "[" + ps.toString() + "]" );
    }
}
