package view;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Point;
import java.util.ArrayList;

import javax.swing.JPanel;


import controller.Controller;

import model.Model;
import model.Node;
import model.Properties;

public class Graph extends JPanel{
 Model graph;
 Controller control;
 Node[] nodes;
 int [][] lines;
 public Node selected;
 ArrayList<Node>[] levels;
 @SuppressWarnings("unchecked")
 public Graph(){
   control = Controller.getInstance();
   control.setGraph(this);
   graph = Model.getInstance();
   nodes = graph.getNodes();
   lines = graph.getConnections();
   
   levels = new ArrayList[graph.getMaxLevel()+1];
   for(int i = 0; i < levels.length; i++) {
    levels[i] = new ArrayList<Node>();
   }
   for(Node n: nodes) {
       levels[n.getLevel()].add(n);
   }
   control.addGListeners();
 }
 
 @SuppressWarnings("unchecked")
 public void newGraph() {
  nodes = graph.getNodes();
  lines = graph.getConnections();
   levels = new ArrayList[graph.getMaxLevel()+1];
   for(int i = 0; i < levels.length; i++) {
    levels[i] = new ArrayList<Node>();
   }
   for(Node n: nodes) {
       levels[n.getLevel()].add(n);
   }
   repaint();
   flag = false;
 }
 
 boolean flag = false;
 public void paint(Graphics g) {
  super.paint(g);
  //setBackground(Color.LIGHT_GRAY);
  int scale = Properties.GSCALE;
  if (!flag) {
   int cx = this.getWidth() / 2;
   int py = scale;
   int ctr = 1;
   int height = this.getHeight() - scale*2;
   int width = 0;
   int levelsize = (int) (height/(levels.length+0.0));
   for (ArrayList<Node> level : levels) {
    /*
     * /organized int stx = cx - scale*level.size()/2 -
     * scale*(level.size()-1); for(Node node: level) {
     * node.setLabel(""+ctr++); for(Node n: nodes)
     * if(n.next.contains(node) && n.getLocation().x == stx) stx +=
     * 3*scale; node.setLocation(new Point(stx,py)); stx += 3*scale;
     * }//
     */

    // random
    
    for (Node node : level) {
     // int limits = (level.size()+3)*3*scale;
     int stx = (int) (Math.random() * this.getWidth() / 2);
     node.setLabel("" + ctr++);
     node.setLocation(new Point(stx + this.getWidth() / 4, py));
     if(width < (stx + this.getWidth() / 4 + 2*scale)) width = stx + this.getWidth() / 4 + 2*scale;
    }// */
    py += levelsize;
   }
   this.setPreferredSize(new Dimension(width,this.getHeight()));
   this.revalidate();
   flag = true;
  }
  
  Graphics2D g2 = (Graphics2D) g;
  g2.setStroke(new BasicStroke(2, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
  FontMetrics fm = getFontMetrics(Font.decode(null));
  for (Node node : nodes) {
   int stx = node.getLocation().x;
   int y = node.getLocation().y;
   Color c = Color.green;
   
   for(Node to: node.next) {
    g2.setColor(c.darker());
    g2.drawLine(node.getLocation().x+scale/2, node.getLocation().y+scale/2, 
      to.getLocation().x+scale/2, to.getLocation().y+scale/2);
    g2.setColor(Color.magenta);
    g2.drawString(""+ lines[node.getId()][to.getId()], 
      (node.getLocation().x+scale+to.getLocation().x+10)/2,
      (node.getLocation().y+scale+to.getLocation().y)/2);    
   }
   g2.setColor(node.equals(selected)?Color.red:c);
   g2.fillOval(stx, y, scale, scale);
   g2.setColor(c.darker());
   g2.drawOval(stx, y, scale, scale);
   g2.setColor(Color.BLACK);
   String mes = "" + node.getDuration();
   int fwidth = fm.stringWidth(mes);
   g2.drawString(mes, stx + (scale - fwidth) / 2, y + (int) (scale / 1.7));
   g2.drawString("n"+node.getLabel(), stx - scale / 4, y - (scale / 4));
   y += (scale * 5) / 2;
  }
 }
 
}