package redactor.gui.graph;

import redactor.gui.graph.marking.BinaryMarkerCreator;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 10/10/12
 * Time: 8:09 PM
 * To change this template use File | Settings | File Templates.
 */
public class MealyTextCreator {

    private List<String[]> ways;
    private int zCounter;
    private List<int[]> markers;

    public MealyTextCreator() {
        ways = new ArrayList<String[]>();
        zCounter = 0;
        markers = new ArrayList<int[]>();

    }

    public MealyTextCreator(List<String[]> ways, int zCounter) {
        this.ways = ways;
        this.zCounter = zCounter;
        markers = new ArrayList<int[]>();

        BinaryMarkerCreator binaryMarkerCreator = new BinaryMarkerCreator(ways, zCounter);
        binaryMarkerCreator.useCreateMarking();
        for (int i = 0; i < zCounter; i++) {
            int[] temp = new int[2];
            temp[0] = binaryMarkerCreator.getTreeVertexList().get(i).getMyNumberOfVertex();
            temp[1] = binaryMarkerCreator.getTreeVertexList().get(i).getBinaryMarker();
            markers.add(temp);
        }
    }


    public void writeToFile(final String path) throws IOException {


        DataOutputStream out = new DataOutputStream(new BufferedOutputStream(
                new FileOutputStream(path)));

        for (int i = 0; i < ways.size(); i++) {
            for (int j = 0; j < ways.get(i).length; j++)
                out.writeUTF(ways.get(i)[j]);


        }

        out.writeUTF("endOfWays");

        out.writeInt(zCounter);

        for (int i = 0; i < zCounter; i++) {
            out.writeInt(markers.get(i)[0]);
            out.writeInt(markers.get(i)[1]);
        }


        out.flush();
        out.close();
    }

    public int readFromFile(final String path, List<String[]> ways, int counter, ArrayList<Integer[]> markers) throws IOException, ClassNotFoundException {

        DataInputStream in = new DataInputStream(new BufferedInputStream(
                new FileInputStream(path)));

        String temp = in.readUTF();

        if (temp != null) {
            do {
                String[] way = new String[4];
                way[0] = temp;
                System.out.println(way[0]);

                for (int i = 1; i < 4; i++) {
                    way[i] = in.readUTF();
                    System.out.println(way[i]);
                }
                System.out.println("---");

                ways.add(way);

                temp = in.readUTF();
            } while (!temp.equals("endOfWays"));

            counter = in.readInt();
            System.out.println("counter = " + counter);

            for (int i = 0; i< counter; i++){
                Integer[] mark = new Integer[2];
                mark[0] = in.readInt();
                mark[1] = in.readInt();
                markers.add(mark);
            }

        }


        in.close();
        return counter;


    }

    public List<String[]> getWays() {
        return ways;
    }
}
