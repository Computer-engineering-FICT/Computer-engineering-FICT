package edu.editor.algorithm.view.toolbar;

import edu.editor.algorithm.controller.listener.BlockMouseMotionListener;
import edu.editor.algorithm.controller.listener.ConnectionMouseMotionListener;
import edu.editor.algorithm.controller.listener.mouse.*;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;
import javax.swing.*;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class AlgorithmToolbar extends JToolBar{

    private static final long serialVersionUID = 6734098938290430742L;

    private static final boolean TIMER_BUTTONS_VISIBLE = false;
    private static final boolean CLASS_BUTTONS_VISIBLE = false;

    public AlgorithmToolbar(final JFrame frame, final AlgorithmPanel panel, final AlgorithmModel model){
        super();
        final AlgorithmToolbar toolbar = this;

        if (TIMER_BUTTONS_VISIBLE) {
            ImageIcon startTimerIcon = new ImageIcon("src/res/images/blocks/startTimer.gif");
            final JLabel startTimerLabel = new JLabel(startTimerIcon);
            startTimerLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                    toolbar.clearBorder();
                    startTimerLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new StartTimerMouseListener(panel));
                }
            });
            add_comp(startTimerLabel);

            ImageIcon stopTimerIcon = new ImageIcon("src/res/images/blocks/stopTimer.gif");
            final JLabel stopTimerLabel = new JLabel(stopTimerIcon);
            stopTimerLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                    toolbar.clearBorder();
                    stopTimerLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new StopTimerMouseListener(panel));
                }
            });
            add_comp(stopTimerLabel);
        }

        ImageIcon beg = new ImageIcon("src/res/images/blocks/start.gif");
        final JLabel begLabel = new JLabel(beg);
        begLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                begLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new BeginMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(begLabel);

        ImageIcon end = new ImageIcon("src/res/images/blocks/end.gif");
        final JLabel endLabel = new JLabel(end);
        endLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }

                toolbar.clearBorder();
                endLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new EndMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(endLabel);

        ImageIcon output = new ImageIcon("src/res/images/blocks/output.gif");
        final JLabel outputLabel = new JLabel(output);
        outputLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                outputLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new OutputMouseListener(panel));

            }
        });
        add_comp(outputLabel);

        ImageIcon input = new ImageIcon("src/res/images/blocks/input.gif");
        final JLabel inputLabel = new JLabel(input);
        inputLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                inputLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new InputMouseListener(panel));

            }
        });
        add_comp(inputLabel);

        ImageIcon exec = new ImageIcon("src/res/images/blocks/exec.gif");
        final JLabel execLabel = new JLabel(exec);
        execLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                execLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new OperatorMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(execLabel);

        ImageIcon ifi = new ImageIcon("src/res/images/blocks/if.gif");
        final JLabel ifiLabel = new JLabel(ifi);
        ifiLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                ifiLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new ConditionMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(ifiLabel);

        ImageIcon conn = new ImageIcon("src/res/images/blocks/conn.gif");
        final JLabel connLabel = new JLabel(conn);
        connLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                connLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new ConnectorMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(connLabel);

        ImageIcon line = new ImageIcon("src/res/images/blocks/line.gif");
        final JLabel lineLabel = new JLabel(line);
        lineLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                	   	/*if (panel.getMouseMotionListeners() != null && panel.getMouseMotionListeners().length > 0) {
                	   		for (int i = 0; i < panel.getMouseMotionListeners().length; i++) {
                	   			panel.removeMouseMotionListener(panel.getMouseMotionListeners()[i]);
                	   		}
               			}*/


                toolbar.clearBorder();
                lineLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));

                panel.addMouseListener(new ConnectionMouseListener(panel));
                panel.addMouseMotionListener(new ConnectionMouseMotionListener(panel,model));
                model.deselectAll();
                /*frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(lineLabel);

        ImageIcon text = new ImageIcon("src/res/images/blocks/text.gif");
        final JLabel textLabel = new JLabel(text);
        textLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                	   /*panel.setPreferredSize(new Dimension(100,100));
                	   panel.setSize(200,200);*/
                if (panel.getMouseMotionListeners() != null && panel.getMouseMotionListeners().length > 0) {
                    for (int i = 0; i < panel.getMouseMotionListeners().length; i++) {
                        panel.removeMouseMotionListener(panel.getMouseMotionListeners()[i]);
                    }
                }


                toolbar.clearBorder();
                textLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new TextMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(textLabel);

        ImageIcon curs = new ImageIcon("src/res/images/blocks/cursor.gif");
        final JLabel cursLabel = new JLabel(curs);
        cursLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                	   	/*if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                	   		panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                	   	}*/
                panel.addMouseMotionListener(new BlockMouseMotionListener(panel));

                toolbar.clearBorder();
                cursLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new BlockMouseListener(panel));
                /*panel.addKeyListener(new AlgorithmKeyListener(model,panel));
                frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
                        /*System.out.println(panel.getFrame().getKeyListeners());
                        panel.getFrame().addKeyListener(new AlgorithmKeyListener(panel.getModel(), panel));
                        System.out.println(panel.getFrame().getKeyListeners());*/
            }
        });
        add_comp(cursLabel);
        cursLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));

        ImageIcon complexOperator = new ImageIcon("src/res/images/blocks/complexOperator.gif");
//          ImageIcon complexOperator = new ImageIcon("src/res/images/blocks/exec.gif");
        final JLabel complexOperatorLabel = new JLabel(complexOperator);
        complexOperatorLabel.addMouseListener(new MouseAdapter()
        {
            public void mousePressed(MouseEvent m)
            {
                if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                    panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                }
                toolbar.clearBorder();
                complexOperatorLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                panel.addMouseListener(new ComplexOperatorMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
            }
        });
        add_comp(complexOperatorLabel);

        if (CLASS_BUTTONS_VISIBLE) {
            ImageIcon begMethod = new ImageIcon("src/res/images/blocks/beginMethod.gif");
            final JLabel begMethodLabel = new JLabel(begMethod);
            begMethodLabel.addMouseListener(new MouseAdapter()
            {
                public void mousePressed(MouseEvent m)
                {
                    if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                        panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                    }
                    toolbar.clearBorder();
                    begMethodLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                    panel.addMouseListener(new BeginMethodMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
                }
            });
            add_comp(begMethodLabel);

            //TODO
            ImageIcon endMethod = new ImageIcon("src/res/images/blocks/endMethod.gif");
            final JLabel endMethodLabel = new JLabel(endMethod);
            endMethodLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                    if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                        panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                    }

                    toolbar.clearBorder();
                    endMethodLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new EndMethodMouseListener(panel));
                /*frame.removeKeyListener(frame.getKeyListeners()[0]);
                frame.addKeyListener(new AlgorithmKeyListener(model,panel));*/
                }
            });
            add_comp(endMethodLabel);

            ImageIcon classIcon = new ImageIcon("src/res/images/blocks/class.gif");
            final JLabel classLabel = new JLabel(classIcon);
            classLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                	   	/*if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                	   		panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                	   	}
                	   	panel.addMouseMotionListener(new ClassMouseMotionListener(panel));*/

                    toolbar.clearBorder();
                    classLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new ClassMouseListener(panel));
                        /*frame.addKeyListener(new AlgorithmKeyListener(model,panel));
                        System.out.println(panel.getFrame().getKeyListeners());
                        panel.getFrame().addKeyListener(new AlgorithmKeyListener(panel.getModel(), panel));
                        System.out.println(panel.getFrame().getKeyListeners());*/
                }
            });
            add_comp(classLabel);

            ImageIcon abstractClassIcon = new ImageIcon("src/res/images/blocks/abstractClass.gif");
            final JLabel abstractClassLabel = new JLabel(abstractClassIcon);
            abstractClassLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                	   	/*if (panel.getMouseMotionListeners() == null || panel.getMouseMotionListeners().length == 0) {
                	   		panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
                	   	}
                	   	panel.addMouseMotionListener(new ClassMouseMotionListener(panel));*/

                    toolbar.clearBorder();
                    abstractClassLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new AbstractClassMouseListener(panel));
                        /*frame.addKeyListener(new AlgorithmKeyListener(model,panel));
                        System.out.println(panel.getFrame().getKeyListeners());
                        panel.getFrame().addKeyListener(new AlgorithmKeyListener(panel.getModel(), panel));
                        System.out.println(panel.getFrame().getKeyListeners());*/
                }
            });
            add_comp(abstractClassLabel);

            ImageIcon interfaceIcon = new ImageIcon("src/res/images/blocks/interface.gif");
            final JLabel interfaceLabel = new JLabel(interfaceIcon);
            interfaceLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                    toolbar.clearBorder();
                    interfaceLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new InterfaceMouseListener(panel));
                }
            });
            add_comp(interfaceLabel);

              /*ImageIcon beginParallelsIcon = new ImageIcon("src/res/images/blocks/beginParallels.gif");
              final JLabel beginParallelsLabel = new JLabel(beginParallelsIcon);
              beginParallelsLabel.addMouseListener(new MouseAdapter()
                {
                       public void mousePressed(MouseEvent m)
                       {
                            toolbar.clearBorder();
                            beginParallelsLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                            //panel.addMouseListener(new BeginParallelsMouseListener(panel));
                       }
                });
              add_comp(beginParallelsLabel);

              ImageIcon endParallelsIcon = new ImageIcon("src/res/images/blocks/endParallels.gif");
              final JLabel endParallelsLabel = new JLabel(endParallelsIcon);
              endParallelsLabel.addMouseListener(new MouseAdapter()
                {
                       public void mousePressed(MouseEvent m)
                       {
                            toolbar.clearBorder();
                            endParallelsLabel.setBorder(new MatteBorder(1,1,1,1,Color.black));
                            //panel.addMouseListener(new EndParallelsMouseListener(panel));
                       }
                });
              add_comp(endParallelsLabel);*/

            ImageIcon beginActivityIcon = new ImageIcon("src/res/images/blocks/beginActivity.gif");
            final JLabel beginActivityLabel = new JLabel(beginActivityIcon);
            beginActivityLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                    toolbar.clearBorder();
                    beginActivityLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new BeginActivityMouseListener(panel));
                }
            });
            add_comp(beginActivityLabel);

            ImageIcon endActivityIcon = new ImageIcon("src/res/images/blocks/endActivity.gif");
            final JLabel endActivityLabel = new JLabel(endActivityIcon);
            endActivityLabel.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent m) {
                    toolbar.clearBorder();
                    endActivityLabel.setBorder(new MatteBorder(1, 1, 1, 1, Color.black));
                    panel.addMouseListener(new EndActivityMouseListener(panel));
                }
            });
            add_comp(endActivityLabel);
        }
        this.setOrientation(VERTICAL);
        frame.getContentPane().add("West",this);

    }

    private void add_comp(JLabel l)
    {
        addSeparator();
        l.setOpaque(true);
        l.setForeground(Color.black);
        add(l);
    }

    private void clearBorder (){
        Component[] comp =this.getComponents();
        for (int i=0; i<comp.length;i++){
            ((JComponent) comp[i]).setBorder(null);
        }
    }
}

