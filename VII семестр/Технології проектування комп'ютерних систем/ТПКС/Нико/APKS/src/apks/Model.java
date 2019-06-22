package apks;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import javax.swing.*;
import javax.swing.table.*;

public class Model {

    private JFrame frame;
    private JTable table;
    private DefaultTableModel tableModel;
    
    private Block currentBlock;
    private Block selectedBlock;
    private Block arrowedBlock;

    private ArrayList<Block> blocks = new ArrayList();
    private ArrayList<Arrow> arrows = new ArrayList();

    private ArrayList<ArrayList<Integer>> adjacencyMatrix = new ArrayList();
    private ArrayList<ArrayList<ArrayList<Integer>>> signalsMatrix = new ArrayList();

    private String saveFilename = "";

    public Model(JFrame frame) {
        this.frame = frame;        
    }

    public void addArrow() {
        selectedBlock = null;
        currentBlock = null;
        arrowedBlock = null;
    }

    public void addCondition() {
        currentBlock = new Condition();
        currentBlock.setColor(Color.BLACK);
        currentBlock.setNumber(blocks.size());
    }

    public void addNode() {
        currentBlock = new Node();
        currentBlock.setColor(Color.BLACK);
        currentBlock.setNumber(blocks.size());
    }

    public void addBegin() {
        currentBlock = Begin.getInstance();
        currentBlock.setColor(Color.BLACK);
        currentBlock.setNumber(blocks.size());
    }

    public void addEnd() {
        currentBlock = End.getInstance();
        currentBlock.setColor(Color.BLACK);
        currentBlock.setNumber(blocks.size());
    }

    public void newFlowchart() {
        currentBlock = null;
        selectedBlock = null;
        arrowedBlock = null;
        blocks = new ArrayList();
        arrows = new ArrayList();
        tableModel = new DefaultTableModel();
        table.setModel(tableModel);
        adjacencyMatrix = new ArrayList();
        saveFilename = "";
        frame.repaint();
    }

    public void setTable(JTable table) {
        this.table = table;
        tableModel = new DefaultTableModel();
        tableModel.setColumnIdentifiers(new String[] {"Block", "Signals"});
        this.table.setModel(tableModel);
    }

    public void mouseReleased(MouseEvent e, Graphics g) {
        if (e.getButton() == MouseEvent.BUTTON1) {
            if (e.isControlDown()) {
                Block block = findBlockAt(e.getX(), e.getY());
                if (block != null) {
                    eraseAllBlocks(g);
                    blocks.remove(block);
                    for (int i = 0; i < tableModel.getRowCount(); i++)
                        if (tableModel.getValueAt(i, 0).equals(block.getNumber()))
                            tableModel.removeRow(block.getNumber());
                    adjacencyMatrix.remove(block.getNumber());
                    for (int i = 0; i < adjacencyMatrix.size(); i++)
                        adjacencyMatrix.get(i).remove(block.getNumber());
                    updateNumbers();
                    if (currentBlock != null) {
                        currentBlock.erase(g);
                        currentBlock.setNumber(blocks.size());
                        currentBlock.setColor(Color.BLACK);
                        currentBlock.paint(g);
                    }
                    paintAll(g);
                    Arrow arrow = block.getArrow();
                    if (arrow != null) {
                        arrow.erase(g);
                        if (blocks.contains(arrow.getNext()))
                            arrow.getNext().paint(g);
                        arrows.remove(arrow);
                    }
                    arrow = block.getNoArrow();
                    if (arrow != null) {
                        arrow.erase(g);
                        if (blocks.contains(arrow.getNext()))
                            arrow.getNext().paint(g);
                        arrows.remove(arrow);
                    }
                    for (int i = arrows.size() - 1; i >= 0; i--) {
                        arrow = arrows.get(i);
                        if (arrow.getNext() == block) {
                            arrow.erase(g);
                            arrows.remove(arrow);
                            Block prevBlock = arrow.getPrev();
                            if (prevBlock.getArrow() == arrow)
                                prevBlock.setArrow(null);
                            if (prevBlock.getNoArrow() == arrow)
                                prevBlock.setNoArrow(null);
                        }
                    }
                    return;
                } else {
                    Arrow arrow = findArrowAt(e.getX(), e.getY());
                    if (arrow != null) {
                        arrow.erase(g);
                        if (blocks.contains(arrow.getNext()))
                                arrow.getNext().paint(g);
                        arrows.remove(arrow);
                        block = arrow.getPrev();
                        adjacencyMatrix.get(block.getNumber())
                                        .set(arrow.getNext().getNumber(), 0);
                        if (block.getArrow() == arrow)
                            block.setArrow(null);
                        if (block.getNoArrow() == arrow)
                            block.setNoArrow(null);
                        return;
                    }
                }
            } else if (currentBlock != null) {
                if (getNear(e.getX(), e.getY()) == null) {
                    currentBlock.setLocation(e.getX(), e.getY());
                    currentBlock.setColor(Color.BLACK);
                    if (!blocks.contains(currentBlock)) {
                        if (currentBlock.getClassname().equals("Begin")) {
                            blocks.add(0, currentBlock);
                            tableModel.addRow(new Integer[] {0, 0});
                        }
                        else if ((!currentBlock.getClassname().equals("End"))
                                && (!blocks.isEmpty())
                                && (blocks.get(blocks.size() - 1).getClassname().equals("End"))) {
                            blocks.add(blocks.size() - 1, currentBlock);
                            tableModel.addRow(new Integer[] {currentBlock.getNumber(), 0});
                        } else {
                            blocks.add(currentBlock);
                            tableModel.addRow(new Integer[] {currentBlock.getNumber(), 0});
                        }
                        updateNumbers();
                        adjacencyMatrix.add(new ArrayList());
                        for (int i = 0; i < adjacencyMatrix.size(); i++)
                            while (adjacencyMatrix.get(i).size() < adjacencyMatrix.size())
                                adjacencyMatrix.get(i).add(0);
                    }
                    currentBlock.paint(g);
                    if (currentBlock.getClassname().equals("Condition")){
                        addCondition();
                        if ((!blocks.isEmpty())
                            && (blocks.get(blocks.size() - 1).getClassname().equals("End")))
                            currentBlock.setNumber(blocks.size() - 1);
                    } else if (currentBlock.getClassname().equals("Node")) {
                        addNode();
                        if ((!blocks.isEmpty())
                                && (blocks.get(blocks.size() - 1).getClassname().equals("End")))
                                currentBlock.setNumber(blocks.size() - 1);
                    } else {
                        currentBlock = null;
                    }
                    
                }
            } else {
                Block block = findBlockAt(e.getX(), e.getY());
                if (block != null) {
                    if (selectedBlock == null) {
                        if (block.getClassname().equals("End"))
                            return;
                        if (block.getArrow() != null) {
                            if (!block.getClassname().equals("Condition"))
                                return;
                            else if (block.getNoArrow() != null)
                                return;
                        }
                        selectedBlock = block;
                        block.setColor(Color.RED);
                        block.paint(g);
                    } else {
                        if (arrowedBlock != null)
                            return;
                        if (selectedBlock == block) {
                            block.setColor(Color.BLACK);
                            block.paint(g);
                            selectedBlock = null;
                            arrowedBlock = null;
                            return;
                        }
                        if (block.getClassname().equals("Begin"))
                            return;
                        arrowedBlock = block;
                        Arrow arrow = new Arrow();
                        arrow.setPrev(selectedBlock);
                        arrow.setNext(arrowedBlock);

                        int value;
                        if (selectedBlock.getArrow() == null) {
                            selectedBlock.setArrow(arrow);
                            value = 1;
                        } else {
                            selectedBlock.setNoArrow(arrow);
                            value = -1;
                        }
                        adjacencyMatrix.get(selectedBlock.getNumber())
                                    .set(arrowedBlock.getNumber(), value);

                        selectedBlock.setColor(Color.BLACK);
                        selectedBlock.paint(g);
                        arrow.countNewShiftX();
                        arrow.setColor(Color.BLACK);
                        arrow.paint(g);
                        arrows.add(arrow);

                        selectedBlock = null;
                        arrowedBlock = null;
                    }
                }
            }
        } else if (e.getButton() == MouseEvent.BUTTON3) {
            outputAdjacencyMatrix();
            Block block = findBlockAt(e.getX(), e.getY());
            if (block != null) {
                int newSignal = Integer.parseInt(JOptionPane.showInputDialog(""));
                if (!block.getSignals().contains(newSignal)) {
                    block.getSignals().add(newSignal);
                    signalsMatrix.get(block.getNumber()).ensureCapacity(newSignal);
                    signalsMatrix.set(block.getNumber(), signalsMatrix
                            .get(block.getNumber()));
                }
                table.invalidate();
            }
        }
    }

    public void mouseMoved(MouseEvent e, Graphics g) {
        if (currentBlock != null) {
            Arrow nextArrow = null;
            if (!currentBlock.getClassname().equals("Condition"))
                nextArrow = currentBlock.getArrow();
            if (nextArrow != null)
                nextArrow.erase(g);
            Arrow prevArrow = null;
            for (int i = 0; i < arrows.size(); i++) {
                prevArrow = arrows.get(i);
                if (prevArrow.getNext() == currentBlock) {
                    prevArrow.erase(g);
                    prevArrow.countNewShiftX();
                }
            }
            currentBlock.move(e.getX(), e.getY(), g);
            if (nextArrow != null)
                nextArrow.countNewShiftX();            
        }
        paintAll(g);
    }

    public void mouseExited(MouseEvent evt, Graphics g) {
        if (currentBlock != null) {
            g.setColor(Color.BLACK);
            paintAll(g);
            currentBlock.erase(g);
            Arrow arrow = currentBlock.getArrow();
            if (arrow != null)
                arrow.erase(g);
        }
    }

    public void saveAs() {
        JFileChooser chooser = new JFileChooser();
		int val = chooser.showSaveDialog(new JFrame());
		try {
			if(val == JFileChooser.APPROVE_OPTION){
				saveFilename = chooser.getSelectedFile().getPath();
				save();
			}
		} catch (Exception e) {}
    }

    public void save() {
        if (!saveFilename.equalsIgnoreCase(""))
            try {
                ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(saveFilename));
                Flowchart flowchart = new Flowchart(blocks, arrows, tableModel, adjacencyMatrix, signalsMatrix);
                out.writeObject(flowchart);
                out.close();
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(null, "IOException!", "Error", JOptionPane.ERROR_MESSAGE);
            }
        else
            saveAs();
    }

    public void open(Graphics g) {
        JFileChooser chooser = new JFileChooser();
		int val = chooser.showOpenDialog(this.frame);
		if(val == JFileChooser.APPROVE_OPTION){
			String openFilename = chooser.getSelectedFile().getPath();
			try {
                ObjectInputStream in = new ObjectInputStream(new FileInputStream(openFilename));
                Flowchart flowchart = (Flowchart)in.readObject();
                in.close();
                currentBlock = null;
                selectedBlock = null;
                arrowedBlock = null;
                this.blocks = flowchart.getBlocks();
                this.arrows = flowchart.getArrows();
                this.tableModel = flowchart.getTableModel();
                this.adjacencyMatrix = flowchart.getAdjacencyMatrix();
                this.signalsMatrix = flowchart.getSignalsMatrix();
                table.setModel(tableModel);
                //table.validate();
                frame.repaint();
                paintAll(g);
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(null, "IOException!", "Error", JOptionPane.ERROR_MESSAGE);
            } catch (ClassNotFoundException ex) {
                JOptionPane.showMessageDialog(null, "ClassNotFoundException!", "Error", JOptionPane.ERROR_MESSAGE);
            }
		}
        
    }
    
    public Block findBlockAt(int x, int y) {
        for (int i = 0; i < blocks.size(); i++) {
            Block item = blocks.get(i);
            if ((x > item.getX()) &&
            (x < item.getX() + item.getWidth()) &&
            (y > item.getY()) &&
            (y < item.getY() + item.getHeight()))
                return item;
        }
        return null;
    }

    public Arrow findArrowAt(int x, int y) {
        for (int i = 0; i < arrows.size(); i++) {
            Arrow item = arrows.get(i);
            if ((x > item.getShiftX() - 5)
                && (x < item.getShiftX() + 5)) {
                    int prevY = item.getPrev().getY();
                    int nextY = item.getNext().getY();
                    int prevHeight = item.getPrev().getHeight();
                    int nextHeight = item.getNext().getHeight();
                    if (prevY > nextY) {
                        if ((y > nextY - 15) && (y < prevY + prevHeight + 15))
                            return item;
                    } else
                        if ((y < nextY + nextHeight + 15) && (y > prevY - 15))
                            return item;
                }
        }
        return null;
    }
    
    public Block getNear(int x, int y) {
        Block block;
        for (int i = 0; i < blocks.size(); i++) {
            block = blocks.get(i);
            if (block != currentBlock)
                if (x < block.getX() + block.getWidth())
                    if (x > block.getX() - block.getWidth())
                        if (y < block.getY() + block.getHeight())
                            if (y > block.getY() - block.getHeight())
                                return block;
        }
        return null;
    }

    public void paintAll(Graphics g) {
        Block block;
        updateNumbers();
        for (int i = 0; i < blocks.size(); i++) {
            block = blocks.get(i);
            block.paint(g);                     
        }
        for (int i = 0; i < arrows.size(); i++)
            arrows.get(i).paint(g);
    }

    public void eraseAllBlocks(Graphics g) {
        Block block;
        for (int i = 0; i < blocks.size(); i++) {
            block = blocks.get(i);
            block.setColor(Color.WHITE);
            block.paint(g);
            block.setColor(Color.BLACK);
        }
    }

    public void updateNumbers() {
        for (int i = 0; i < blocks.size(); i++) {
            Block block = blocks.get(i);
            block.setNumber(i);
            tableModel.setValueAt(block.getNumber(), i, 0);
            String str = "";
            for (int j = 0; j < block.getSignals().size(); j++) {
                str += block.getSignals().get(j);
                if (j < block.getSignals().size() - 1)
                    str += ", ";
            }
            tableModel.setValueAt(str, i, 1);
        }
    }

    public void outputAdjacencyMatrix() {
        System.out.println();
        for (int i = 0; i < adjacencyMatrix.size(); i++) {
            for (int j = 0; j < adjacencyMatrix.get(i).size(); j++)
                System.out.print("\t" + adjacencyMatrix.get(i).get(j));
            System.out.println();
        }
    }
}
