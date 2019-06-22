package com.tdcs.ui;

import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextPane;
import javax.swing.SwingUtilities;
import javax.swing.border.BevelBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.BadLocationException;
import javax.swing.text.Style;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

import com.tdcs.document.Document;
import com.tdcs.document.Hint;

public class LogicAlgorithmEditor extends JPanel implements
		com.tdcs.document.DocumentListener {

	private static final long serialVersionUID = 1L;

	private JTextPane textPane;
	private StyledDocument doc;
	private Style styleText, styleIndex;

	private ActionListener addSymbolListener = new ActionListener() {

		@Override
		public void actionPerformed(ActionEvent arg0) {
			JButton btn = (JButton) arg0.getSource();

			try {
				doc.insertString(textPane.getCaretPosition(), btn.getText(),
						styleText);
			} catch (BadLocationException e) {
				e.printStackTrace();
			}
			updateDocument(textPane.getText());
		}
	};

	public LogicAlgorithmEditor() {
		super();
		Document.INSTANCE.addDocumentListener(this);

		setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));

		setLayout(new GridLayout(0, 1, 0, 0));

		textPane = new JTextPane();
		textPane.setFont(new Font("Dialog", Font.PLAIN, 18));
		textPane.getDocument().addDocumentListener(new DocumentListener() {

			@Override
			public void removeUpdate(DocumentEvent e) {
				updateDocument(textPane.getText());
				updateText();
			}

			@Override
			public void insertUpdate(DocumentEvent e) {
				updateDocument(textPane.getText());
				updateText();
			}

			@Override
			public void changedUpdate(DocumentEvent e) {

			}
		});

		doc = textPane.getStyledDocument();

		styleText = textPane.addStyle("styleText", null);
		styleIndex = textPane.addStyle("styleIndex", null);
		StyleConstants.setFontSize(styleIndex, 10);

		add(textPane);

		JScrollPane scrollPane = new JScrollPane(textPane);
		add(scrollPane);

		JPanel toolboxPanel = new JPanel();
		FlowLayout flowLayout = (FlowLayout) toolboxPanel.getLayout();
		flowLayout.setAlignment(FlowLayout.LEFT);
		add(toolboxPanel);

		JButton btnY = new JButton("Y");
		btnY.addActionListener(addSymbolListener);
		toolboxPanel.add(btnY);

		JButton btnX = new JButton("X");
		btnX.addActionListener(addSymbolListener);
		toolboxPanel.add(btnX);

		JButton btnArrUp = new JButton("↑");
		btnArrUp.addActionListener(addSymbolListener);

		JButton btnW = new JButton("w");
		btnW.addActionListener(addSymbolListener);

		toolboxPanel.add(btnW);
		toolboxPanel.add(btnArrUp);

		JButton btnArrDown = new JButton("↓");
		btnArrDown.addActionListener(addSymbolListener);
		toolboxPanel.add(btnArrDown);
	}

	private void updateDocument(String text) {
		Document.INSTANCE.setAlgorithmString(text);
		Document.INSTANCE.update(this, "New");
	}

	private void updateText() {
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				String text = "";

				try {
					text = doc.getText(0, doc.getLength());
				} catch (BadLocationException e) {
					e.printStackTrace();
					return;
				}

				doc.setCharacterAttributes(0, doc.getLength(), styleText, true);

				Matcher match = Pattern.compile("[0-9be]+").matcher(text);

				while (match.find()) {

					doc.setCharacterAttributes(match.start(), match.group()
							.length(), styleIndex, true);

					// System.out.println(s);
				}

			}
		});
	}

	@Override
	public void update(Object sender, String msg) {
		textPane.setText(Document.INSTANCE.getAlgorithmString());
		updateText();
		for (Hint h : Document.INSTANCE.getHints()) {
			h.mark(textPane.getHighlighter());
		}
	}

}
