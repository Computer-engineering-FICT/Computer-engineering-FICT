package edu.editor.algorithm.view.menubar;

import edu.editor.algorithm.checker.TreeWalk;
import edu.editor.algorithm.codegenerator.PseudoLanguage;
import edu.editor.algorithm.controller.listener.key.AlgorithmKeyListener;
import edu.editor.algorithm.language.AssemblerTranslator;
import edu.editor.algorithm.language.CppTranslator;
import edu.editor.algorithm.language.JavaTranslator;
import edu.editor.algorithm.language.PascalTranslator;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

//import edu.editor.algorithm.language.PascalLanguage;

public class AlgorithmMenu extends JMenuBar {

    private static final long serialVersionUID = -5194301522827109559L;
    private AlgorithmPanel panel;

    private JMenu fileMenu = new JMenu("File");
    private JMenu editMenu = new JMenu("Edit");
    private JMenu checkMenu = new JMenu("Analysis");
    private JMenu genMenu = new JMenu("Generation");
    private JMenu testMenu = new JMenu("Test");
    private JMenu optionsMenu = new JMenu("@Options");
    private JMenu helpMenu = new JMenu("@Help");

    private JMenuItem newItem = new JMenuItem("New");
    private JMenuItem saveItem = new JMenuItem("Save...");
    private JMenuItem openItem = new JMenuItem("Open...");

    private JMenuItem multiItem = new JMenuItem("Multi");
    private JMenuItem copyItem = new JMenuItem("@Copy");
    private JMenuItem pasteItem = new JMenuItem("@Paste");
    private JMenuItem cutItem = new JMenuItem("@Cut");
    private JMenuItem delItem = new JMenuItem("@Delete");

    private JMenuItem pathItem = new JMenuItem("Tree Walk");

    private JMenuItem pascalItem = new JMenuItem("Generate Pascal code");
    private JMenuItem javaItem = new JMenuItem("Generate Java code");
    private JMenuItem cppItem = new JMenuItem("Generate C++ code");
    private JMenuItem assemblerItem = new JMenuItem("Generate Assembler code");

    private JMenuItem generalTestItem = new JMenuItem("General test");
    private JMenuItem translationTimeTestItem = new JMenuItem("Translation time test");

    public AlgorithmMenu(final JFrame frame, AlgorithmPanel pan) {
        panel = pan;

        newItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                panel.setModel(new AlgorithmModel());
                frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(panel.getModel(), panel));
//               panel.getModel().setPanel(panel);
                panel.getModel().changedPanel(panel);
                frame.repaint();
            }
        });

        openItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                JFileChooser fc = new JFileChooser("src/res/saved algorithms");
                //fc.setLocation(-(int) fc.getLocation().getX(), (int) fc.getLocation().getY());
                /*fc.setLayout(null);
                fc.repaint(-(int) fc.getLocation().getX(), (int) fc.getLocation().getY(),
                        fc.getWidth(), fc.getHeight());*/
                try {
                    if (fc.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
                        ObjectInputStream in = new ObjectInputStream(new FileInputStream(fc.getSelectedFile()));
                        AlgorithmModel algorithmModel = (AlgorithmModel) in.readObject();
                        panel.setModel(algorithmModel);
//                        panel.setFocusable(true);
                        /*panel.removeKeyListener(panel.getKeyListeners()[0]);
                        panel.addKeyListener(new AlgorithmKeyListener(panel.getModel(),panel));*/
                        AlgorithmKeyListener algorithmKeyListener = ((AlgorithmKeyListener)panel.getKeyListeners()[0]);
                        algorithmKeyListener.setModel(algorithmModel);
                        algorithmKeyListener.setPanel(panel);
//                        frame.removeKeyListener(frame.getKeyListeners()[0]);
//                        frame.addKeyListener(new AlgorithmKeyListener(panel.getModel(), panel));
//       				   panel.getModel().setPanel(panel);
                        panel.getModel().deselectAll();
                        panel.getModel().changedPanel(panel);
                        frame.repaint();
                        in.close();
                    }
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        });

        saveItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                JFileChooser fc = new JFileChooser("src/res/saved algorithms");
//               fc.showSaveDialog(null);
                try {
                    if (fc.showSaveDialog(null) == JFileChooser.APPROVE_OPTION) {
                        ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(fc.getSelectedFile()));
                        out.writeObject(panel.getModel());
                        frame.repaint();
                        out.close();
                    }
                    /*ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(fc.getSelectedFile()));
   					out.writeObject(panel.getModel());
   					frame.repaint();   */
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        });

        fileMenu.add(newItem);
        fileMenu.add(openItem);
        fileMenu.add(saveItem);


        multiItem.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent arg0) {
                panel.getModel().makeMultiBlock();
            }
        });
        editMenu.add(multiItem);
        editMenu.add(copyItem);
        editMenu.add(pasteItem);
        editMenu.add(cutItem);
        editMenu.add(delItem);


        pathItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                TreeWalk tw = new TreeWalk(panel.getModel());
                tw.doTreeWalk();
            }

        });

        checkMenu.add(pathItem);

        pascalItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                //PseudoLanguage lan = new PseudoLanguage(panel.getModel(), new PascalLanguage());
                PseudoLanguage lan = new PseudoLanguage(panel.getModel(), new PascalTranslator());

                lan.generate();
            }

        });

        genMenu.add(pascalItem);

        javaItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                //PseudoLanguage lan = new PseudoLanguage(panel.getModel(), new PascalLanguage());
                PseudoLanguage lan = new PseudoLanguage(panel.getModel(), new JavaTranslator());

                lan.generate();
            }

        });
        genMenu.add(javaItem);

        cppItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                new PseudoLanguage(panel.getModel(), new CppTranslator()).generate();
            }
        });
        genMenu.add(cppItem);

        assemblerItem.addActionListener(evt -> {
            //PseudoLanguage lan = new PseudoLanguage(panel.getModel(), new PascalLanguage());
            PseudoLanguage lan = new PseudoLanguage(panel.getModel(), new AssemblerTranslator()); // todo EXETranslator?

            lan.generate();
        });
        genMenu.add(assemblerItem);

        generalTestItem.addActionListener(evt -> new PseudoLanguage(panel.getModel(), null).test());
        testMenu.add(generalTestItem);

        translationTimeTestItem.addActionListener(evt ->
                new PseudoLanguage(panel.getModel(), null).translationTimeTest());
        testMenu.add(translationTimeTestItem);

        add(fileMenu);
//        add(editMenu);
//        add(checkMenu);


        add(genMenu);

        add(testMenu);
//        add(optionsMenu);
//        add(helpMenu);

        frame.getContentPane().add("North", this);
    }


}
