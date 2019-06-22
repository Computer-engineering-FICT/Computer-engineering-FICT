package line_graphics;

import java.awt.BorderLayout;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.Image;

import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JRootPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JToolBar;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * ����� ��������� ��������� ���������
 * �� ������ ������ ������ 
 * TableView.
 * @author ������ ������ ������������
 * �� - 73
 * septemberfalltirael@yahoo.com
 */
class DPainter extends JComponent implements MouseListener,
    MouseMotionListener {
  /**
   * 
   */
  private static final long serialVersionUID = -3833025795344674068L;
  /**
   * ���� �����.
   */
  private Color table_element_col = Color.BLACK;
  /**
   * ���� �����.
   */
  private Color lineColor = Color.BLACK;
  /**
   * ���� ����.
   */
  private Color foneColor = Color.WHITE;
  /**
   * ���� �����.
   */
  private Color pointColor = Color.BLACK;
  /**
   * ���� ��������� �����.
   */
  private Color selectedPointColor = Color.PINK;
  /**
   * ���� �����.
   */
  private Color gridColor = Color.black;
  /**
   * ����� ��������� �����.
   */
  private int selectedPoint = -1;
  /**
   * ���������� ������� �������� �����.
   * @return ����� �����
   */
  public int getSelectedPoint() {
    return selectedPoint;
  }
  /**
   * ���������� �������� ����
   */
  private int top_value;
  /**
   * ���������� �������� ���� 
   */
  private int graphicLeft;
  /**
   * ��������������� ����������.
   */
  private boolean isDown = false;
  /**
   * ��������������� ����������.
   */
  private int lastX;
  /**
   * ��������������� ����������.
   */
  private int lastY;
  /**
   * ���������� ��� ��������� �����.
   */
  private int firstX;
  /**
   * ���������� ��� ��������� �����.
   */
  private int firstY;
  /**
  ��������������� ����������.
   */
  private int numNewPoint;
  /**
   * ������ �������.
   */
  private int wight;
  /**
   * ������ ������� �������.
   */
  private int height;
  /**
   * ���������� ���������� 
   */
  private double zoomX;
  /**
   * ���������� ����������
   */
  private double zoomY;
  /**
   * ����������.
   */
  private double maxX;
  /**
   * ����������.
   */
  private double maxY;
  /**
   * ����������.
   */
  private double minX;
  /**
   * ����������.
   */
  private double minY;
  /**
   * ����� ����� �����.
   */
  private int numLinesX = 10;
  /**
   * ����� ����� �����.
   */
  private int numLinesY = 10;
  /**
   * ������ �����.
   */
  private int pointSize = 2;
  /**
   * �������� ����������
   */
  private final int UP = 0;
  /**
   * �������� ����������
   */
  private final int DOWN = 1;
  /**
   * ������ ������ TableView,
   */
  private TableView points;
  /**
   * ����������� ����� ���������.
   */
  private Image mImg = null;
  /**
   * ������ ���������. ���������
   */
  private boolean isPaint = false;
  /**
   * ���� �� ������ ����������� �����.
   */
  private boolean isMoving = false;
  /**
   * �����������.
   * 
   * @param points
   *            - ������ ������
   */
  public DPainter(final TableView points) {
    this.points = points;
    addMouseListener(this);
    addMouseMotionListener(this);
    setBackground(Color.ORANGE);
  }
  /**
   * ������������� ������ � ���������� ���������.
   * @param x - ���������� x
   * @param y - ���������� y
   * @param width - ������
   * @param height - ������
   * 
   */
  public void setBounds(int x, int y, int width, int height){
    super.setBounds(x, y, width, height);
    setZoom();
  }
  /**
   * ������������� �������� ��������
   * ���������, ���������� ���������������,
   * ����� ����� ������ ����������
   * �� �����������.
   * @param x - ���������� �������� ������ ����
   * @param y - ���������� �������� ������ ����
   * 
   * @param newDiagramW
   *            - ������
   * @param newDiagramH
   *            - ������
   * @return ��������� ���������������
   * (���� �� ���������)
   */
  public boolean setDiagramWH(int x, 
      int y,
      final int newDiagramW,
      final int newDiagramH) {
    if ((getWidth() != newDiagramW) 
        || (getHeight() != newDiagramH)) {
      setBounds(x, y, newDiagramW, newDiagramH);
      setZoom();
      return true;
    } else {
      repaint();
      return false;
    }
  }
  /**
   * ������������� �������
   * ���������� �����.
   * �������� ����������� ������
   * ����������� � ����� ��� �� �����
   * 
   * @param point
   *            - ������ ���������� �����
   */
  public void setSelectedPoint(final int point) {
    selectedPoint = point;
    drawDiagram();
    repaint();
  }
  /**
   * ��������������� ������� ��������
   * � �������� �������� � ��������
   * ���������� � ��������.
   * 
   * @param x - �������� ���������� �
   * �������� ��������
   * @return �������� � ��������
   */
  private double xToPixDoubleX(final double x) {
    return (x - minX) * zoomX + graphicLeft;
  }
  /**
   * ��������������� ������� ��������
   * � �������� �������� � ��������
   * ���������� � ��������.
   * 
   * @param y - �������� ���������� �
   * �������� ��������
   * @return �������� � ��������
   */
  private double yToPixDoubleY(final double y) {
    return top_value + height - (y - minY) * zoomY;
  }
  /**
   * ��������������� ������� ����������
   * � �������� �������� ����������
   * 
   * @param x
   *            - �������� ���������� � ��������
   * @return �������� � �������� ��������
   * ���������
   */
  private double PixXToDoubleX(final double x) {
    return (x - graphicLeft) / zoomX + minX;
  }
  /**
   * ��������������� ������� ����������
   * � �������� 
   * 
   * @param y - �������� ���������� � ��������
   * @return �������� � �������� ��������
   * ���������
   */
  private double PixYToDoubleY(final double y) {
    return (top_value + height - y) / zoomY + minY;
  }
  /**
   * ������������� ��������� ��������
   * ��������� 
   */
  public final void setZoom() {
    maxX = getTruncVal(getMaxX(), UP);
    maxY = getTruncVal(getMaxY(), UP);
    minX = getTruncVal(getMinX(), DOWN);
    minY = getTruncVal(getMinY(), DOWN);
    double dX = Math.abs(maxX - minX);
    double dY = Math.abs(maxY - minY);
    wight = (int) (getWidth() * 0.7);
    height = (int) (getHeight() * 0.8);
    graphicLeft = (int) (getWidth() * 0.2);
    top_value = (int) (getHeight() * 0.1);
    if ((dX != 0) && (dY != 0)) {
      zoomX = (double) (wight) / dX;
      zoomY = (double) (height) / dY;
    } else {
      zoomX = 0;
      zoomY = 0;
    }
    drawDiagram();
    repaint();
  }
  /**
   * ������������� ������ ���������.
   * 
   * @param newState
   *            - ����� ������
   */
  public void setIsPaint(final boolean newState) {
    isPaint = newState;
    if (isPaint) {
      setZoom();
      drawDiagram();
    }
    repaint();
  }
  /**
   * ������ � ������� ��������� �� �����������,
   */
  public void paint(final Graphics g) {
    if ((isPaint) && (mImg != null)) {
      g.drawImage(mImg, 0, 0, null);
    } else {
      super.paint(g);
    }
  }

  /**
   * ������ ����� XOR ������ � �����������
   * ����� ���������.
   * 
   * @param pixX
   *            - ���������� x � ��������
   * @param pixY
   *            - ���������� y � ��������
   * @param stateXOR - ��������� ������� ��
   *  �������� �����������. ������������� ���
   *  ���������� ��������, �����
   *  ������������ �������� �����
   *  (��������� ������) ����
   *  �������� � false, ������ ����� ��� ��
   *  �� ��������� �� ������
   */
  public void drawXORPoint(final int pixX,
      final int pixY, final boolean stateXOR) {
    Graphics gImg = mImg.getGraphics();
    gImg.setXORMode(Color.white);
    gImg.fillRect(pixX - pointSize, pixY - pointSize, 2 * pointSize,
        2 * pointSize);
    if ((mImg != null) && (stateXOR)) {
      getGraphics().drawImage(mImg, 0, 0, null);
    }
  }
  /**
   * ������ � ������ �����������
   * �����
   * 
   * @param g - ����������� ��������
   */
  private void drawGrid(final Graphics g) {
    double masX = (double) wight / numLinesX;
    double masY = (double) height / numLinesY;
    double stepX = (double) (maxX - minX) / numLinesX;
    double stepY = (double) (maxY - minY) / numLinesY;
    for (int i = numLinesY; i >= 0; i--) {
      g.setColor(gridColor);
      g.drawLine(graphicLeft, (int) (i * masY + top_value),
          (int) (numLinesX * masX + graphicLeft),
          (int) (i * masY + top_value));
      g.setColor(table_element_col);
      g.drawString(Double.valueOf(truncToTwoDigit(maxY - stepY * i))
          .toString(), (int) (0.05 * getWidth()),
          (int) (i * masY + top_value));
    }
    for (int i = 0; i < (numLinesX + 1); i++) {
      g.setColor(gridColor);
      g.drawLine((int) (i * masX + graphicLeft), top_value, (int) (i
          * masX + graphicLeft),
          (int) (numLinesY * masY + top_value));
      g.setColor(table_element_col);
      g.drawString(Double.valueOf(truncToTwoDigit(stepX * i + minX))
          .toString(), (int) (i * masX + graphicLeft),
          (int) (0.95 * getHeight()));
    }
  }

  /**
   * ������ � ������ �����������
   * ��������� ����� ���������
   * ���������������
   * ����������� ���������, ��� �������,
   * ��� ���������� ����� <> 0.
   * 
   * @param g - ����������� ��������
   */
  private void drawPoints(final Graphics g) {
    if (points.size() != 0) {
      int px, py, cx, cy;
      px = (int) xToPixDoubleX(points.getPoint(0).getX());
      py = (int) yToPixDoubleY(points.getPoint(0).getY());
      for (int i = 1; i < points.size(); i++) {
        cx = (int) xToPixDoubleX(points.getPoint(i).getX());
        cy = (int) yToPixDoubleY(points.getPoint(i).getY());
        g.setColor(lineColor);
        g.drawLine(px, py, cx, cy);
        px = cx;
        py = cy;
      }
      g.setColor(pointColor);
      // ���������� �����
      for (int i = 0; i < points.size(); i++) {
        px = (int) xToPixDoubleX(points.getPoint(i).getX());
        py = (int) yToPixDoubleY(points.getPoint(i).getY());
        g.fillRect(px - pointSize, py - pointSize, 2 * pointSize,
            2 * pointSize);
      }
      for (int i = 0; i < points.size(); i++) {
        if (i == selectedPoint) {
          g.setColor(selectedPointColor);
          px = (int) xToPixDoubleX(points.getPoint(selectedPoint)
              .getX());
          py = (int) yToPixDoubleY(points.getPoint(selectedPoint)
              .getY());
          g.fillRect(px - pointSize, py - pointSize, 2 * pointSize,
              2 * pointSize);
        }
      }

    }
  }

  /**
   * ������������ ��� �����������
   * ������� ��������� � ������ �����������
   * ���������.
   * 
   * @param g
   *            - ����������� ��������
   */
  private void drawFone(final Graphics g) {
    g.setColor(foneColor);
    g.fillRect(graphicLeft, top_value, wight, height);
  }

  /**
   * ������������ ��������� � ������,
   * ������������� ���������
   * � ������������� ������.
   */
  public void drawDiagram() {
    if (isPaint) {
      Graphics gImg = null;
      Dimension dmImg = null;
      Dimension dm = getSize();
      int wndWidth = dm.width;
      int wndHeight = dm.height;
      if (((dmImg == null)
          || (dmImg.width != wndWidth)
          || (dmImg.height != wndHeight))
          && (wndWidth != 0)
          && (wndHeight != 0)) {
        dmImg = new Dimension(wndWidth, wndHeight);
        mImg = createImage(wndWidth, wndHeight);
        gImg = mImg.getGraphics();
        try {
          drawFone(gImg);
          drawGrid(gImg);
          drawPoints(gImg);
        } catch (Exception e) {
          e.printStackTrace();
          System.out.println("������ ����� ����");
        }
      }
    }
  }

  /**
   * ���������� ������������ �������� X,
   * ���� ������ �����, �� ��������� 0.
   * 
   * @return �������� X
   */
  public double getMaxX() {
    if (points.size() != 0) {
      double max = points.getPoint(0).getX();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getX();
        if (max < cur) {
          max = cur;
        }
      }
      return max;
    } else {
      return 0;
    }
  }

  /**
   * ���������� ������������ �������� Y,
   * ���� ������ ����� ��������� 0.
   * 
   * @return �������� Y
   */
  public double getMaxY() {
    if (points.size() != 0) {
      double max = points.getPoint(0).getY();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getY();
        if (max < cur) {
          max = cur;
        }
      }
      return max;
    } else {
      return 0;
    }
  }

  /**
   * ���������� ����������� �������� X,
   * ���� ������ ����� ��������� 0.
   * 
   * @return ������� X
   */
  public double getMinX() {
    if (points.size() != 0) {
      double min = points.getPoint(0).getX();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getX();
        if (min > cur) {
          min = cur;
        }
      }
      return min;
    } else {
      return 0;
    }
  }

  /**
   * ���������� ����������� �������� Y,
   * ���� ������ ����� ��������� 0.
   * 
   * @return ������� Y
   */
  public double getMinY() {
    if (points.size() != 0) {
      double min = points.getPoint(0).getY();
      for (int i = 1; i < points.size(); i++) {
        double cur = points.getPoint(i).getY();
        if (min > cur) {
          min = cur;
        }
      }
      return min;
    } else {
      return 0;
    }
  }

  /**
   * ���������� ���������� ���������������
   * �������� �� 2 �������� ����, ��
   * ������ ����� ��������� 2.
   * �������� 6548.5451 ���������� �� 6700.
   * 
   * @param x - �������� �����
   * @param ptr - �������� ���������� 
   * @return ����������� �����
   */
  private double getTruncVal(double x, int ptr) {
    boolean sing = false;
    if (x < 0) {
      sing = true;
      x = -x;
    }
    if (x != 0) {
      int p = (int) Math.log10(x);
      if (p < 0) {
        p--;
      }
      BigDecimal bd = new BigDecimal(x);
      bd = bd.movePointLeft(p);
      bd = bd.setScale(1, RoundingMode.HALF_UP);
      switch (ptr) {
      case UP: {
        if (sing) {
          bd = bd.subtract(new BigDecimal(0.2));
        } else {
          bd = bd.add(new BigDecimal(0.2));
        }
        break;
      }
      case DOWN: {
        if (sing) {
          bd = bd.add(new BigDecimal(0.2));
        } else {
          bd = bd.subtract(new BigDecimal(0.2));
        }
        break;
      }
        default:
          break;
      }
      bd = bd.movePointRight(p);
      if (sing) {
        bd = bd.negate(); 
      }
      return bd.doubleValue();
    } else {
      return 0; 
    }
  }
 
  /**
   * ��������� �� ���� �������� ����
   * @param x - �������������� �����
   * @return ����������� �����
   */
  public double truncToTwoDigit(double x) {
    boolean sing = false;
    if (x < 0) {
      sing = true;
      x = -x;
    }
    if (x != 0) {
      int p = (int) Math.log10(x);
      BigDecimal bd = new BigDecimal(x);
      bd = bd.movePointLeft(p);
      bd = bd.setScale(2, RoundingMode.HALF_UP);
      bd = bd.movePointRight(p);
      if (sing)
        bd = bd.negate();
      return bd.doubleValue();
    } else
      return 0;
  }

  /**
   * ��������� ������� ����.
   * 
   * @param e
   *            - �������
   */
  public void mousePressed(final MouseEvent e) {
    numNewPoint = findPoint(e.getX(), e.getY());
    if (numNewPoint != -1) {
      setSelectedPoint(numNewPoint);
      isDown = true;
      isMoving = false;
      firstX = e.getX();
      firstY = e.getY();
    } else
      setSelectedPoint(-1);
  }

  /**
   * ���������� �������� �������������� �����.
   * @see java.awt.event.MouseListener#mouseReleased(java.awt.event.MouseEvent)
   */
  public void mouseReleased(MouseEvent e) {
    if ((isDown)&&(isMoving)) {
      isDown = false;
      isMoving = false;
      try {
        points.getPoint(numNewPoint).setX(PixXToDoubleX(e.getX()));
        points.getPoint(numNewPoint).setY(PixYToDoubleY(e.getY()));
      } catch (NullPointerException err){
        err.printStackTrace();
      }
      setZoom();
    } else isDown = false;
  }

  /** (non-Javadoc)
   * @see java.awt.event.MouseListener#mouseEntered(java.awt.event.MouseEvent)
   */
  public void mouseEntered(MouseEvent e) {}

  /** (non-Javadoc)
   * @see java.awt.event.MouseListener#mouseExited(java.awt.event.MouseEvent)
   */
  public void mouseExited(MouseEvent e) {}

  /**
   * (non-Javadoc)
   * @see java.awt.event.MouseListener#mouseClicked(java.awt.event.MouseEvent)
   */
  public void mouseClicked(MouseEvent e) {}
  
  /**
   * ������ �������������� �����.
   * @see java.awt.event.MouseMotionListener#mouseDragged(java.awt.event.MouseEvent)
   */
  public void mouseDragged(MouseEvent e) {
    if (isDown) {
      int newX = e.getX();
      int newY = e.getY();
      if (!isMoving) {
        int dx = Math.abs(newX-firstX);
        int dy = Math.abs(newY-firstY);
        if ((dx > pointSize / 2)
            || (dy > pointSize / 2)) {
          isMoving = true;
          lastX = e.getX();
          lastY = e.getY();
          drawXORPoint(e.getX(), e.getY(), true);
        }
      } else {
        drawXORPoint(lastX, lastY, false);
        drawXORPoint(newX, newY, true);
        lastX = e.getX();
        lastY = e.getY();       
      }
    }
  }

  /**
   * ����������� ����. 
   * @see java.awt.event.MouseMotionListener#mouseMoved(java.awt.event.MouseEvent)
   */
  public void mouseMoved(MouseEvent e) {
    if (findPoint(e.getX(), e.getY()) != -1) {
      setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
    } else
      setCursor(Cursor.getDefaultCursor());
  }

  /**
   * ��������� ����� ����� �� �������� �����������
   * 
   * @param pixX
   *            - ���������� X � ��������
   * @param pixY
   *            - ���������� Y � ��������
   * @return ����� ����� ��� -1, ���� ����� �� �������. ��������� ����� �
   *         ����.
   */
  private int findPoint(int pixX, int pixY) {
    int res = -1;
    for (int i = 0; i < points.size(); i++) {
      double pointPixX = xToPixDoubleX(points.getPoint(i).getX());
      double pointPixY = yToPixDoubleY(points.getPoint(i).getY());
      if (((pointPixX - pointSize < pixX) && (pixX < pointPixX
          + pointSize))
          && ((pointPixY - pointSize < pixY) && (pixY < pointPixY
              + pointSize))) {
        res = i;
      }
    }
    return res;
  }
  /**
   * ��������� ����������� ���������, ��� ��������.
   * @param filename - ��� �����
   */
  public void saveToJPG(String filename){

    BufferedImage bimg = null;
    int w = mImg.getWidth(null);
    int h = mImg.getHeight(null);
    int [] pixels = new int[w * h];
    PixelGrabber pg = new PixelGrabber(mImg,0,0,w,h,pixels,0,w);
    try { 
      pg.grabPixels(); 
    } 
    catch(InterruptedException ie) { 
      ie.printStackTrace();
    }

    bimg = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
    bimg.setRGB(0,0,w,h,pixels,0,w);

    try{
      FileOutputStream fos = new FileOutputStream(filename);
      JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos);
      jpeg.encode(bimg);
      fos.close();    
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}

/**
 * ������,
 * ������� �������� ����, ������,
 * �������������� ������ � ���������.
 * @author ������ ������� ������������
 * �� - 73
 * septemberfalltirael@yahoo.com
 */
public final class FinalGraphicsEditor extends JFrame {
  /**
   * 
   */
  private static final long serialVersionUID = -4666522506690498389L;
  /**
   * ����������� ������.
   */
  private Dimension mini = new Dimension(550, 400);
  /**
   * ������ ������� �� ���������.
   */
  private Dimension tableDimension = new Dimension(150,100);
  /**
   * ��������� ������.
   */
  private Dimension startDimension = new Dimension(600, 430);
  /**
   * ������� ������, ������� �����.
   */
  public JTable table;
  /**
   * ����� ��� ��� �������.
   */
  public JScrollPane tableScrollPane;
  /**
   * ������ �� ��������� ������ DPainter,
   * ��������� ��������� �� ������.
   */
  public DPainter dd;
  /**
   * ������ �������� �����.
   */
  private JButton btnAdd = new JButton("+");
  /**
   * ������ ������� �����.
   */
  private JButton btnSub = new JButton("-");
  
  /**
   * ������ �� ��������� DiagramProcessor,
   * ���������������� ������ ���������.
   */
  DActions act;

  /**
   * �����������.
   * @param s - �������� �����
   * @param act - DActions ����������� �������
   */
  @SuppressWarnings("deprecation")
  public FinalGraphicsEditor(String s, DActions act) {
    super(s);
    this.act = act;
    setSize(startDimension);
    setMinimumSize(mini);
      setUndecorated(true);
      getRootPane().setWindowDecorationStyle(JRootPane.FRAME);
    setLayout(new BorderLayout());
    dd = new DPainter(act.tv);
    table = new JTable(act.tv);
    tableScrollPane = new JScrollPane(table);
    btnSub.addActionListener(act.removePoint);
    table.addMouseListener(act);
    dd.addMouseListener(act);
    addWindowListener(act.closeEditor);
    createMenu();
    tableScrollPane.setPreferredSize(new Dimension(150,100));
    add(dd, BorderLayout.CENTER);
    add(tableScrollPane, BorderLayout.WEST);
    show();
  }
  /**
   * ��������� ������� ��������������
   * ������� ���� � �����������
   * ��� � ������� ������
   * DActions.
   */
  private void createMenu() {
  // �������� ����
    JMenuBar menubar = new JMenuBar();
    JMenu menuFile = new JMenu("File...");
    menuFile.setMnemonic(KeyEvent.VK_A);
    menuFile.add(act.create);
    menuFile.add(act.openAction);
    menuFile.addSeparator();
    menuFile.add(act.save);
    menuFile.add(act.save_as);
    menuFile.addSeparator();
    menuFile.add(act.exitAction);
    menubar.add(menuFile);
// �������� ��� �������
    JMenu menuPoint = new JMenu("Point actions...");
    menuPoint.setMnemonic(KeyEvent.VK_N);
    menuPoint.add(act.addPoint);
    menuPoint.add(act.removePoint);
    menubar.add(menuPoint);
    setJMenuBar(menubar);
  }
}
