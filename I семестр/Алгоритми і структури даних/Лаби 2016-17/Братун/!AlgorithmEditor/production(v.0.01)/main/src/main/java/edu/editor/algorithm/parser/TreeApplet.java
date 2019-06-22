package edu.editor.algorithm.parser;

import javax.swing.JApplet;

import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;

import edu.editor.algorithm.parser.operand.*;

public class TreeApplet extends JApplet{
	JTree tree;
	public TreeApplet(Operand first) {
		/*
		 * Пример запуска этого барахла - в StatementParser.main
		 * */
		DefaultMutableTreeNode root = new DefaultMutableTreeNode(first.getValue());
		addToTree(root,first);
		tree = new JTree(root);
		init();
		start();
	}
	private void addToTree(DefaultMutableTreeNode curBranch, Operand current){
		if (current instanceof Statement){
			DefaultMutableTreeNode left = new DefaultMutableTreeNode(((Statement)current).getLeft().getValue());
			curBranch.add(left);
			DefaultMutableTreeNode right = new DefaultMutableTreeNode(((Statement)current).getRight().getValue());
			curBranch.add(right);
			addToTree(left,((Statement)current).getLeft());
			addToTree(right,((Statement)current).getRight());
		}
		if (current instanceof Bracket){
			DefaultMutableTreeNode val = new DefaultMutableTreeNode( ((Bracket) current).getExpression().getValue());
			curBranch.add(val);
			addToTree(val,((Bracket) current).getExpression());
		}
		if (current instanceof Function){
			DefaultMutableTreeNode val = new DefaultMutableTreeNode(((Function) current).getArgument().getValue());
			curBranch.add(val);
			addToTree(val,((Function) current).getArgument());
		}
	}
	private static final long serialVersionUID = 8010136197140352766L;

	public void init(){
		getContentPane().add(tree);
		
	}
}
