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
public class AllWaysDialog extends JDialog {

    public AllWaysDialog(final JFrame owner, List<List<String>> fullWays) {
        super(owner, "Ways found", false);

        setSize(490, 360);
        setLocation(owner.getX() + (owner.getWidth() - getWidth()) / 2,
                owner.getY() + (owner.getHeight() - getHeight()) / 2);

        TextArea area = new TextArea();

        if (fullWays.isEmpty())

            area.append("No ways");
        else {
            area.append("All ways from begin to end\n");
            for (int i = 0; i < fullWays.size(); i++) {
                for (int j = 0; j < fullWays.get(i).size(); j++) {

                    if (!fullWays.get(i).get(j).equals("1")) {
                        area.append(fullWays.get(i).get(j));

                        if (j < fullWays.get(i).size() - 1)
                            area.append(" ---> ");
                        else
                            area.append("\n");
                    }

                }
            }
        }

        area.setEditable(false);
        
        add(area);


    }
}
