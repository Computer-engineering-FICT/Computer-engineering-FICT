import java.io.*;

/**
 * Class which describes methods for working with input and output streams
 * writes to files and reads data from them
 */
public class Serializing {

    /**
     * Method that writes a  collection into a file as single object
     * @param collection
     * @param nameOfFile
     * @throws IOException
     */
    public void writeCollectionAsOneObject(VegetablesCollection collection, String nameOfFile) throws IOException{
        File file = new File(nameOfFile);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        ObjectOutputStream output = new ObjectOutputStream(fileOutputStream);

        output.writeObject(collection);

        output.close();
    }

    /**
     * Method that writes a collection into a file as list of objects from whose the collection consists of
     * @param collection
     * @param nameOfFile
     * @throws IOException
     */
    public void writeCollectionAsObjectsList(VegetablesCollection collection, String nameOfFile) throws IOException{
        File file = new File(nameOfFile);
        FileOutputStream fileOutputStream = new FileOutputStream( file);
        ObjectOutputStream output = new ObjectOutputStream(fileOutputStream);
        for (Object i: collection){
            output.writeObject(i);
        }
        output.close();
    }

    /**
     * Method that writes a collection into a text file with information about its objects
     * @param collection
     * @param nameOfFile
     * @throws IOException
     */
    public void writeCollectionAsText(VegetablesCollection collection, String nameOfFile) throws IOException {
        File file = new File(nameOfFile);
        FileWriter fileOutputStream = new FileWriter(file);
        BufferedWriter output = new BufferedWriter(fileOutputStream);
        for (Object i: collection){
            output.write(i.toString() + "\n");
        }
        output.close();
    }

    /**
     * Method that reads collection from a file that includes a raw data with not modified collection
     * @param nameOfFile
     * @return VegetablesCollection collection
     * @throws IOException
     * @throws ClassNotFoundException
     */
    public VegetablesCollection readCollectionAsOneObject(String nameOfFile) throws IOException, ClassNotFoundException{
        File file = new File(nameOfFile);
        FileInputStream fileInput = new FileInputStream(file);
        ObjectInputStream objectInput = new ObjectInputStream(fileInput);
        VegetablesCollection collection = (VegetablesCollection)objectInput.readObject();
        objectInput.close();
        return collection;
    }

    /**
     * Method that reads collection from a file that includes a raw data with list of objects from whose the collection consists of
     * @param nameOfFile
     * @return VegetablesCollection collection
     * @throws IOException
     * @throws ClassNotFoundException
     */
    public VegetablesCollection readCollectionAsObjectsList(String nameOfFile) throws IOException, ClassNotFoundException{
        File file = new File(nameOfFile);
        FileInputStream fileInput = new FileInputStream(file);
        ObjectInputStream objectInput = new ObjectInputStream(fileInput);
        VegetablesCollection collection = new VegetablesCollection();
        try{
        Vegetable veg = (Vegetable) objectInput.readObject();
            while (true) {
                collection.add(veg);
                veg = (Vegetable) objectInput.readObject();
            }
        } catch (EOFException e) {
            objectInput.close();
        }
        return collection;
    }

    /**
     * Method that reads collection from a file that includes a text with information from which the collection can be revived
     * @param nameOfFile
     * @return VegetablesCollection collection
     * @throws IOException
     * @throws ClassNotFoundException
     */
    public VegetablesCollection readCollectionAsText(String nameOfFile) throws IOException, MyException, ClassNotFoundException{
        File file = new File(nameOfFile);
        FileReader fileInput = new FileReader(file);
        BufferedReader objectInput = new BufferedReader(fileInput);
        VegetablesCollection collection = new VegetablesCollection();
        String inputLine = objectInput.readLine();
        while (inputLine != null) {
            String[] values = inputLine.split(" ");
            String vegName = values[1];
            int nutrition = Integer.parseInt(values[3]);
            Vegetable veg = new Vegetable(vegName, nutrition);
            collection.add(veg);
            inputLine =objectInput.readLine();
        }
        objectInput.close();
        return collection;
    }
}

