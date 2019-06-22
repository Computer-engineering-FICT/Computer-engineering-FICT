package redactor.gui.graph;

import redactor.Data;
import redactor.gui.graphicalElements.ConditionalVertex;
import redactor.gui.graphicalElements.Entity;

import java.util.*;

/**
 * Used for building Mealy automate graph.
 * Modification graph for binary marking.
 * After modification no self-connected and "triangle"-connected vertexes.
 */
public class MealyContentCreator {

    Data data;
    List<Entity> listOfEntity;              //import from data
    List<String[]> automateTable;           //automateTable format: [from] [to] [conditions] [operations]
    int zCounter;                           //for numerating Z
    HashMap<Entity, Integer> associatedZ;   //if value != 0 before this vertex is Z-marker
    ArrayList<ArrayList<Entity>> listOfWays;  //ways (can include conditions and operations) between Z-markers

    public MealyContentCreator(Data data) {
        this.data = data;
        listOfEntity = data.getListOfEntities();
        automateTable = new ArrayList<String[]>();
        zCounter = 2;

        associatedZ = new HashMap<Entity, Integer>();
        for (int i = 1; i < listOfEntity.size(); i++)               //without begin vertex, because it'll be never named
            associatedZ.put(listOfEntity.get(i), 0); //means that no Z associated to vertex

        listOfWays = new ArrayList<ArrayList<Entity>>();
    }

    /**
     * Creates ways between 2 Z-vertexes
     * Tests output links of elements.
     * If there is no Mealy marker before vertex, write its initValue to list of operations (conditions).
     * This information will be shown on graph (text on arrows=))
     * Else write vertex as destination
     *
     * @param currentEntity
     * @param currentWay
     */

    public void wayToNextVertex(Entity currentEntity, ArrayList<Entity> currentWay) {

        if (currentEntity.getOutputLink() != null) {

            Entity nextEntity = currentEntity.getOutputLink().get(currentEntity.getOutputLink().size() - 1);

            if (isMarked(nextEntity)) {
                ArrayList<Entity> way = new ArrayList<Entity>();
                way.addAll(currentWay);
                way.add(nextEntity);
                listOfWays.add(way);
                //    return;

            } else {
                currentWay.add(nextEntity);
                wayToNextVertex(nextEntity, currentWay);
                //return here
                currentWay.remove(nextEntity);
            }
        }

        if ((!isOperation(currentEntity)) && (currentEntity.getOutput2Link() != null)) {

            Entity nextEntity = currentEntity.getOutput2Link().get(currentEntity.getOutput2Link().size() - 1);

            if (isMarked(nextEntity)) {
                ArrayList<Entity> way = new ArrayList<Entity>();
                way.addAll(currentWay);
                way.add(nextEntity);
                listOfWays.add(way);
                //    return;

            } else {
                currentWay.add(nextEntity);
                wayToNextVertex(nextEntity, currentWay);
                //return here
                currentWay.remove(nextEntity);
            }


        }
        return;

    }

    /**
     * runner for wayToNextVertex()
     */

    public void useWayToNextVertex() {

        for (Map.Entry<Entity, Integer> currentLine : associatedZ.entrySet()) {
            if (!currentLine.getValue().equals(0) && (!isEnd(currentLine.getKey()))) {
                ArrayList<Entity> way = new ArrayList<Entity>();
                way.add(currentLine.getKey());
                wayToNextVertex(currentLine.getKey(), way);
            }

        }

    }


    /**
     * way[0] = from
     * way[1] = conditions
     * way[2] = operations
     * way[3] = to
     */

    public void fillAutomateTable() {

        for (int i = 0; i < listOfWays.size(); i++) {   //take way
            String[] thisWay = new String[4];
            thisWay[0] = "Z" + associatedZ.get(listOfWays.get(i).get(0));  //from
            thisWay[1] = "";
            thisWay[2] = "";
            thisWay[3] = "Z" + associatedZ.get(listOfWays.get(i).get(listOfWays.get(i).size() - 1));    //to


          //  if (listOfWays.get(i).size() > 2) {

                int temp = 0;
                while ((isCondition(listOfWays.get(i).get(temp))) && (temp != listOfWays.get(i).size() - 1)) {

                    Entity next = listOfWays.get(i).get(temp + 1);
                    if (isInverse((ConditionalVertex) listOfWays.get(i).get(temp), next))
                        thisWay[1] += "!";
                    thisWay[1] += "(" + listOfWays.get(i).get(temp).getInitialValue() + ")";
                    temp++;
                }

                if (temp == 0)
                    thisWay[1] = "-";   //no conditions;

                int temp2 = temp;
                while (temp2 < listOfWays.get(i).size() - 1) {
                    thisWay[2] += listOfWays.get(i).get(temp2).getInitialValue() + ","; //add operations
                    temp2++;
                }

                if (temp2 == temp) {
                    thisWay[2] = "-";   //no operations
                } else {
                    thisWay[2] = thisWay[2].substring(0, thisWay[2].length() - 1);  //delete last ","
                }

            automateTable.add(thisWay);
        }
        reformatAutomateTable();
    }

    /**
     * Look for self-connected vertexes and modificate graph by equivalent vertexes.
     * Then fix triangle connections.
     */
    public void reformatAutomateTable() {

        ArrayList<String[]> equalVertexes = new ArrayList<String[]>();

        for (int i = 0; i < automateTable.size(); i++) {
            if (isSelfConnected(automateTable.get(i)))
                reformatSelfConnected(automateTable.get(i), equalVertexes);
        }
        reformatTriangleConnections(equalVertexes);
    }

    /**
     *  Looks for triangle connections.
     *  Try to fix it using existing equivalent vertexes, else create new equivalent.
     * @param equalVertexes pairs of vertexes [from, to], where path between
     * them doesn't contain conditions/operations
     */

    public void reformatTriangleConnections(ArrayList<String[]> equalVertexes) {

        int tableSize = zCounter - 1;
        ArrayList<ArrayList<Integer>> table = createBinaryTable(tableSize);

        for (int i = 0; i < tableSize; i++) {
            for (int j = i; j < tableSize; j++) {
                if (table.get(i).get(j).equals(1)) {
                    for (int k = j; k < tableSize; k++) {
                        if (table.get(j).get(k).equals(1) && table.get(k).get(i).equals(1)) {
                            String[] eqVer = findOwnerOfEqual(i, j, k, equalVertexes);

                            if (eqVer != null) {

                                for (int h = 0; h < automateTable.size(); h++) {
                                    String[] temp = automateTable.get(h);

                                    if (temp[0].equals(eqVer[0]) && temp[3].equals("Z" + (j + 1))) {
                                        temp[3] = eqVer[1];
                                        String[] newWay = new String[4];
                                        newWay[0] = eqVer[1];
                                        newWay[1] = "-";
                                        newWay[2] = "-";
                                        newWay[3] = "Z" + (j + 1);

                                        automateTable.add(newWay);
                                        break;

                                    }

                                    else if (temp[3].equals(eqVer[0]) && (temp[0]).equals("Z"+(j+1))) {
                                        temp[3] = eqVer[1];
                                        String[] newWay = new String[4];
                                        newWay[0] = eqVer[1];
                                        newWay[1] = "-";
                                        newWay[2] = "-";
                                        newWay[3] = eqVer[0];

                                        automateTable.add(newWay);
                                        break;
                                    }
                                }

                            } else {
                                for (int h = 0; h < automateTable.size(); h++) {
                                    String[] temp = automateTable.get(h);

                                    if (temp[0].equals("Z"+(i+1)) && (temp[3].equals("Z"+(j+1)))) {

                                        String[] newWay = new String[4];
                                        newWay[0] = "Z"+zCounter;
                                        zCounter++;
                                        newWay[1] = "-";
                                        newWay[2] = "-";
                                        newWay[3] = "Z" + (j + 1);

                                        temp[3] = newWay[0];
                                        
                                        String[] eq = new String[2];
                                        eq[0] = temp[0];
                                        eq[1] = temp[3];
                                        equalVertexes.add(eq);

                                        automateTable.add(newWay);
                                        break;

                                    }
                                    else if (temp[3].equals("Z"+(i+1)) && (temp[0].equals("Z"+(j+1)))) {

                                        String[] newWay = new String[4];
                                        newWay[0] = "Z"+zCounter;
                                        zCounter++;
                                        newWay[1] = "-";
                                        newWay[2] = "-";
                                        newWay[3] = "Z" + (i + 1);

                                        temp[3] = newWay[0];


                                        String[] eq = new String[2];
                                        eq[0] = newWay[3];
                                        eq[1] = newWay[0];

                                        equalVertexes.add(eq);
                                        automateTable.add(newWay);
                                        break;

                                    }
                                }
                                tableSize++;
                            }
                            table = createBinaryTable(tableSize);
                            i = 0;
                            j = 0;
                            break;

                        }

                    }
                }
            }
        }
    }


        public String[] findOwnerOfEqual ( int a, int b, int c, ArrayList<String[]> eq){
            for (int i = 0; i < eq.size(); i++)
                if ((Integer.valueOf(eq.get(i)[0].substring(1)) == (a + 1))
                        || (Integer.valueOf(eq.get(i)[0].substring(1)) == (b + 1))
                        || (Integer.valueOf(eq.get(i)[0].substring(1)) == (c + 1)))
                    return eq.get(i);
            return null;

        }


    public void reformatSelfConnected(String[] currentWay, ArrayList<String[]> equalVertexes) {
        String[] temp = new String[4];
        temp[0] = "Z" + zCounter;
        zCounter++;
        temp[1] = "-";
        temp[2] = "-";
        temp[3] = currentWay[3];
        currentWay[3] = temp[0];
        String[] equal = new String[2];
        equal[0] = currentWay[0];
        equal[1] = temp[0];
        automateTable.add(temp);
        equalVertexes.add(equal);

    }

    public ArrayList<ArrayList<Integer>> createBinaryTable(int size) {
        ArrayList<ArrayList<Integer>>  table = new ArrayList<ArrayList<Integer>>(size);

        for (int i = 0; i< size; i++)  {
            ArrayList<Integer> temp = new ArrayList<Integer>();
            for (int j = 0; j<size; j++)
                temp.add(0);
            table.add(temp);
        }


        for (int i = 0; i < automateTable.size(); i++) {

            int indexFrom = Integer.valueOf(automateTable.get(i)[0].substring(1));
            int indexTo = Integer.valueOf(automateTable.get(i)[3].substring(1));
            if (indexFrom != indexTo) {
                ArrayList<Integer> temp  = table.get(indexFrom-1);
                temp.set(indexTo-1, 1);
                temp = table.get(indexTo-1);
                temp.set(indexFrom-1,1);
            }

        }
        return table;

    }


    public void printAutomateTable() {
        for (int i = 0; i < automateTable.size(); i++) {
            System.out.println(automateTable.get(i)[0] + " ---> " +
                    automateTable.get(i)[1] + " / " + automateTable.get(i)[2] + " --->" +
                    automateTable.get(i)[3]);
        }
    }

    public boolean isSelfConnected(String[] way) {
        return (way[0].equals(way[3]));
    }

    /**
     * Tests condition (true or false condition output used)
     *
     * @param conditionalVertex
     * @param nextEntity
     * @return
     */

    public boolean isInverse(ConditionalVertex conditionalVertex, Entity nextEntity) {
        Entity inEnd = conditionalVertex.getOutputLink().get(conditionalVertex.getOutputLink().size() - 1);
        boolean leftValue = inEnd.equals(nextEntity);
        if (leftValue)
            return (conditionalVertex.getLeftOutputValue() == 0);
        else
            return (conditionalVertex.getRightOutputValue() == 0);


    }

    public boolean isCondition(Entity entity) {
        return (entity.getName().equals("Condition"));
    }


    public void giveNamesToGraphVertexes() {

        Entity currentVertex = listOfEntity.get(0); //begin vertex
        associatedZ.put(currentVertex.getOutputLink().get(currentVertex.getOutputLink().size() - 1), 1);  //Z1 after begin vertex


        currentVertex = listOfEntity.get(1); //end vertex
        associatedZ.put(currentVertex, 1); //Z1 before end vertex

        for (int i = 2; i < listOfEntity.size(); i++) {   //doesn't handle  begin and end
            if ((isAfterOperation(listOfEntity.get(i))) && (associatedZ.get(listOfEntity.get(i)).equals(0))) {
                associatedZ.put(listOfEntity.get(i), zCounter);
                zCounter++;
            }
        }
    }


    public HashMap<Entity, Integer> getAssociatedZ() {
        return associatedZ;
    }

    public ArrayList<ArrayList<Entity>> getListOfWays() {
        return listOfWays;
    }


    public boolean isEnd(Entity entity) {
        return (entity.getName().equals("End"));
    }


    public boolean isAfterOperation(Entity currentEntity) {
        if (currentEntity.getInputLinks() == null)
            System.out.println("Disconnected item (input unused)");
        else {
            for (int i = 0; i < currentEntity.getInputLinks().size(); i++) {
                if (isOperation(currentEntity.getInputLinks().get(i).get(0)))
                    return true;
            }
        }


        return false;
    }

    public boolean isMarked(Entity entity) {
        return !associatedZ.get(entity).equals(0);
    }


    public static boolean isOperation(Entity entity) {
        if (("Begin").equals(entity.getName()) || ("OperationalVertex".equals(entity.getName()))
                || ("End".equals(entity.getName())))
            return true;
        return false;
    }


    public List<String[]> getAutomateTable() {
        printAut();
        return automateTable;
    }

    public int getzCounter() {
        return zCounter;
    }
    private void printAut(){
        for (int i = 0; i < automateTable.size(); i++) {
            System.out.println(i+") "+automateTable.get(i));
        }
    }
}
