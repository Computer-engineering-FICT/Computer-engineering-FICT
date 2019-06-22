package redactor.gui.dialogs;

import javax.swing.*;
import java.awt.*;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 9/29/12
 * Time: 7:23 PM
 * To change this template use File | Settings | File Templates.
 */
public class AllCyclesDialog extends JDialog {

    public AllCyclesDialog(final JFrame owner, List<List<String>> cycles, List<List<String>> endlessCycles) {
        super(owner, "Cycles found", false);

        setSize(490, 360);
        setLocation(owner.getX() + (owner.getWidth() - getWidth()) / 2,
                owner.getY() + (owner.getHeight() - getHeight()) / 2);

        TextArea area = new TextArea();

        if (cycles.isEmpty() && endlessCycles.isEmpty())

            area.append("No cycles");
        else {
            if (!cycles.isEmpty()) {
                area.append("Non-endless cycles\n");
                for (List<String> cycle : cycles) {
                    for (int j = 0; j < cycle.size(); j++) {
                        if (!cycle.get(j).equals("1")) {
                            area.append(cycle.get(j));

                            if (j < cycle.size() - 1)
                                area.append(" ---> ");
                            else
                                area.append("\n");
                        }
                    }
                }
            }
            else {
                area.append("No non-endless cycles\n");
            }
            if (!endlessCycles.isEmpty()) {
                area.append("\nEndless cycles\n");
                for (List<String> cycle : endlessCycles) {
                    int i=0;
                    for (String node : cycle) {
                        if ("1".equals(node))
                            continue;
                        if (i>0)
                            area.append(" ---> ");
                        area.append(node);
                        i++;
                    }
                    area.append("\n");
                }
            }
            else {
                area.append("\nNo endless cycles");
            }
        }

        area.setEditable(false);
        
        add(area);


    }
}
