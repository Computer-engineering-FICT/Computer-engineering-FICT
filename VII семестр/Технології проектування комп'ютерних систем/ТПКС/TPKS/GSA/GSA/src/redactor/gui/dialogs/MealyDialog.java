package redactor.gui.dialogs;

import redactor.gui.graph.MealyContentCreator;
import redactor.gui.graphicalElements.Entity;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 9/29/12
 * Time: 7:23 PM
 * To change this template use File | Settings | File Templates.
 */
public class MealyDialog extends JDialog {

    ArrayList<ArrayList<Entity>> ways;
    HashMap<Entity, Integer> markers;

    public MealyDialog(final JFrame owner, MealyContentCreator mealyContentCreator) {
        super(owner, "Graph ways", false);

        setSize(490, 360);
        setLocation(owner.getX() + (owner.getWidth() - getWidth()) / 2,
                owner.getY() + (owner.getHeight() - getHeight()) / 2);

        TextArea area = new TextArea();

        try {
            mealyContentCreator.giveNamesToGraphVertexes();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        mealyContentCreator.useWayToNextVertex();
        ways = mealyContentCreator.getListOfWays();
        markers = mealyContentCreator.getAssociatedZ();

        if (ways.isEmpty())

            area.append("No ways");
        else {
            area.append("Markers\n");
            TreeMap<String,String> sortedMarkers = sortMarkers();

            for (Map.Entry<String,String> currentLine: sortedMarkers.entrySet()) {
                area.append(currentLine.getKey()+" before "+currentLine.getValue()+"\n");
            }

            area.append("Z1 before Pend\n");
            area.append("----------------------\n");

            area.append("All ways \n");
            for (int i = 0; i < ways.size(); i++) {
                area.append("Z"+markers.get(ways.get(i).get(0))+" ");

                for (int j = 0; j < ways.get(i).size()-1; j++) {
                    area.append(abbreviate(ways.get(i).get(j))+" ");

                }
                area.append("Z"+markers.get(ways.get(i).get(ways.get(i).size()-1))+"\n");

            }
        }

        area.setEditable(false);
        
        add(area);


    }

    public TreeMap<String, String> sortMarkers() {
        TreeMap<String,String> sortedMarkers = new TreeMap<String, String>();
        for (Map.Entry<Entity, Integer> currentLine : markers.entrySet()) {
            if (!currentLine.getValue().equals(0))
                sortedMarkers.put("Z"+currentLine.getValue(),abbreviate(currentLine.getKey()));
        }
        return sortedMarkers;

    }

    public String abbreviate(Entity entity) {
        String abbreviation;
        if (entity.getName().equals("Condition"))
            abbreviation = "C";
        else abbreviation = "P";
        abbreviation += entity.getNumber();

        return abbreviation;
    }
}


