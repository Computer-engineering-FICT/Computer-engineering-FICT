package redactor;

import redactor.gui.Page;
import redactor.gui.graphicalElements.*;

import java.io.*;
import java.util.*;

public class TextMsaBuilder {

    List<List<String>> listOfConnections;
    List<List<Entity>> listOfCommitted;
	private int finishVertexNumber;


	public TextMsaBuilder() {
        listOfConnections = new LinkedList<List<String>>();
        listOfCommitted = new LinkedList<List<Entity>>();
    }

    public Entity findElement(String name, int id, Data data) {
        List<Entity> listOfEntities = data.getListOfEntities();
        for (int i = 0; i < listOfEntities.size(); i++) {
            if ((name.equals(listOfEntities.get(i).getName())) && (id == listOfEntities.get(i).getNumber()))
                return listOfEntities.get(i);
            if ((name.equals("End")) && (name.equals(listOfEntities.get(i).getName())))
                return listOfEntities.get(i);
        }


        return null;
    }


    public String getAbbreviationName(Entity entity) {
        String abbreviation = "";

        if (entity.getName().equals("Begin"))
            abbreviation = "P0";
        if (entity.getName().equals("OperationalVertex"))
            abbreviation = "P" + entity.getNumber();
        if (entity.getName().equals("Condition"))
            abbreviation = "C" + entity.getNumber();
	    if (entity.getName().equals("End"))
		    abbreviation = "P" + finishVertexNumber;
        return abbreviation;
    }

    public boolean inMatrix(Entity entity1, Entity entity2, boolean condition) {
        String abbreviation1 = getAbbreviationName(entity1);
        String abbreviation2 = getAbbreviationName(entity2);
	    // work around "!C1" in path
	    if (!condition && entity1.getName().equals("Condition")) {
		    abbreviation1 = "!" + abbreviation1;
	    }
	    // Search for sequental occurence of abbreviations in all links;
	    // return true on first occurence
	    Iterator<List<String>> itPaths = listOfConnections.iterator();
	    while (itPaths.hasNext()) {
		    List<String> link = itPaths.next();
		    ListIterator<String> itNodes = link.listIterator();
		    while (itNodes.hasNext()) {
			    if (abbreviation1.equals(itNodes.next())) { // bad code style: poor readability!
				    if (itNodes.hasNext()) {
					    String targetNode = itNodes.next();
					    // if target is a condition, and following path lays through it's 'false' way,
					    // it starts with negation '!'. But since it's a target, this '!' must be
					    // ignored
					    if (targetNode.charAt(0) == '!')
						    targetNode = targetNode.substring(1);
					    if (abbreviation2.equals(targetNode)) {
						    return true;
					    } else {
						    itNodes.previous(); // get back one node stepped to in if()
					    }
				    }
			    }
		    }
	    }
	    return false;

    }


    public boolean restoreLinks(final String path, final Data data) {
        String currentLine;
        String[] currentWord;
        try {
            BufferedReader in = new BufferedReader(new FileReader(path));
            currentLine = in.readLine();
            if (currentLine == null) {
                in.close();
                return false;
            }


            ArrayList<Entity> currentLink = new ArrayList<Entity>();

            int indexOfSecondOutputBegin;

            currentWord = currentLine.split(" ");
            currentLine = in.readLine();

            String abbreviation = "";

            while (!currentLine.equals("matrix")) {
                currentWord = currentLine.split(" ");

                indexOfSecondOutputBegin = 8;


                Entity ownerEntity = findElement(currentWord[0], Integer.valueOf(currentWord[1]), data);

                abbreviation = getAbbreviationName(ownerEntity);

                if (currentWord[0].equals("Begin") || currentWord[0].equals("OperationalVertex")
                        || currentWord[0].equals("Condition")) {


                    int index = 5;

                    if (currentWord[0].equals("Condition")) {
                        index += 2;
                    }


                    if (currentWord[index].equals("null")) {
                        ownerEntity.setOutputLink(null);

                    } else {
                        currentLink.add(ownerEntity);
                        index += 2;

                        while (currentWord[index].equals("undirectedLine")) {

                            UndirectedLine line = new UndirectedLine(Integer.valueOf(currentWord[index + 1]),
                                    Integer.valueOf(currentWord[index + 2]),
                                    Integer.valueOf(currentWord[index + 3]),
                                    Integer.valueOf(currentWord[index + 4]));
                            currentLink.add(line);
                            index += 5;

                        }

                        Entity endOfLink = findElement(currentWord[index],
                                Integer.valueOf(currentWord[index + 1]), data);

                        indexOfSecondOutputBegin = index + 2;

                        currentLink.add(endOfLink);
	                    boolean condition = false;
	                    if (ownerEntity.getName().equals("Condition")) {
		                    condition = ((ConditionalVertex)ownerEntity).getLeftOutputValue() == 1;
	                    }
                        if (inMatrix(ownerEntity,endOfLink, condition)) {
                            ownerEntity.setOutputLink(currentLink);
                            endOfLink.addInputLink(currentLink);
                            listOfCommitted.add(currentLink);

                        }

                        currentLink = new ArrayList<Entity>();

                    }
                }

                if (currentWord[0].equals("Condition")) {

                    if (currentWord[indexOfSecondOutputBegin].equals("null")) {
                            ownerEntity.setOutput2Link(null);

                    } else {
                        currentLink.add(ownerEntity);

                        int index = indexOfSecondOutputBegin + 2;

                        while (currentWord[index].equals("undirectedLine")) {

                            UndirectedLine line = new UndirectedLine(Integer.valueOf(currentWord[index + 1]),
                                    Integer.valueOf(currentWord[index + 2]),
                                    Integer.valueOf(currentWord[index + 3]),
                                    Integer.valueOf(currentWord[index + 4]));
                            currentLink.add(line);
                            index += 5;

                        }

                        Entity endOfLink = findElement(currentWord[index],
                                Integer.valueOf(currentWord[index + 1]), data);

	                    currentLink.add(endOfLink);
	                    boolean condition = ((ConditionalVertex)ownerEntity).getRightOutputValue() == 1;
	                    if (inMatrix(ownerEntity,endOfLink, condition)) {
                            ownerEntity.setOutput2Link(currentLink);
                            endOfLink.addInputLink(currentLink);
                            listOfCommitted.add(currentLink);

                        }


                        currentLink = new ArrayList<Entity>();
                    }
                }

                indexOfSecondOutputBegin = 8;

                currentLine = in.readLine();
            }

            data.setListOfCommittedConnections(listOfCommitted);

            in.close();


        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }


        return true;
    }


    public boolean restoreListOfEntities(final String path, final Data data) {
        String currentLine;
        String[] currentWord;
        try {
            BufferedReader in = new BufferedReader(new FileReader(path));
            currentLine = in.readLine();
            if (currentLine == null) {
                in.close();
                return false;
            }
            currentWord = currentLine.split(" ");

            data.setPage(new Page(Integer.valueOf(currentWord[0]), Integer.valueOf(currentWord[1])));

            ArrayList<Entity> listOfEntities = new ArrayList<Entity>();

            currentLine = in.readLine();

            int operationCount = 1;
            int conditionCount = 1;
            int num = 0;


            while (!currentLine.equals("matrix")) {
                currentWord = currentLine.split(" ");
                if (currentWord[0].equals("OperationalVertex")) {
                    num = Integer.valueOf(currentWord[1]);
                    if (num >= operationCount) {
                        operationCount = num + 1;
                    }
                    OperationalVertex operationalVertex = new OperationalVertex(Integer.valueOf(currentWord[2]), Integer.valueOf(currentWord[3]), num);
                    operationalVertex.setInitialValue(String.valueOf(currentWord[4]).substring(1, currentWord[4].length() - 1));  //remove < >
                    listOfEntities.add(operationalVertex);
                }


                if (currentWord[0].equals("Condition")) {
                    num = Integer.valueOf(currentWord[1]);
                    if (num >= conditionCount) {
                        conditionCount = num + 1;
                    }
                    ConditionalVertex conditionalVertex = new ConditionalVertex(Integer.valueOf(currentWord[2]), Integer.valueOf(currentWord[3]), num);
                    conditionalVertex.setInitialValue(String.valueOf(currentWord[4]).substring(1, currentWord[4].length() - 1));
                    conditionalVertex.setLeftOutputValue(Integer.valueOf(currentWord[5]));
                    conditionalVertex.setRightOutputValue(Integer.valueOf(currentWord[6]));

                    listOfEntities.add(conditionalVertex);
                }
                if (currentWord[0].equals("Begin")) {

                    InitialVertex initialVertex = new InitialVertex(Integer.valueOf(currentWord[2]), Integer.valueOf(currentWord[3]));
                    listOfEntities.add(initialVertex);

                }
                if (currentWord[0].equals("End")) {

                    FinishVertex finishVertex = new FinishVertex(Integer.valueOf(currentWord[2]), Integer.valueOf(currentWord[3]));
                    listOfEntities.add(finishVertex);
                }

                currentLine = in.readLine();
            }

	        loadMatrix(in);

            data.setOperationCount(operationCount);
            data.setConditionCount(conditionCount);
            data.setListOfEntities(listOfEntities);

	        finishVertexNumber = operationCount;


            in.close();

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

	private void loadMatrix(BufferedReader in) throws IOException {

		for (String currentLine = in.readLine(); currentLine != null; currentLine = in.readLine()) {
			String [] path = currentLine.split(" ");
			String start = path[0];
			String end = path[path.length - 1];
			List<String> link;
			String conditionalPaths[] = path[1].split(";");
			for (int i=0; i<conditionalPaths.length; i++) { // process all conditional paths
				if ("1".equals(conditionalPaths[i])) {
					link = new ArrayList<String>(2);
					link.add(start);
					link.add(end);
					listOfConnections.add(link);
					continue;
				}
				// remove surrounding ()
				conditionalPaths[i] = conditionalPaths[i].substring(1, conditionalPaths[i].length()-1);
				String[] linkPath = conditionalPaths[i].split(","); // get an array of single conditions
				link = new ArrayList<String>(2+linkPath.length);
				link.add(start);
				link.addAll(Arrays.asList(linkPath));
				link.add(end);
				listOfConnections.add(link);
			}
		}
	}

	public boolean writeToFile(final String path, Data data) {
        try {
            PrintWriter out = new PrintWriter(new FileOutputStream(path));


            if (data.getPage() != null) {
                out.println(data.getPage().getWidth() + " " + data.getPage().getHeight());     //page size
            }


            if (data.getListOfEntities() != null) {
                for (int i = 0; i < data.getListOfEntities().size(); i++) {
                    out.println(data.getListOfEntities().get(i).convert());
                }
            }

            out.println("matrix");
            MatrixHandler matrixHandler = new MatrixHandler(data.getListOfEntities());
            matrixHandler.useFillMatrix();
            ArrayList<String> listOfConnections = matrixHandler.getTextConnections();

            for (int i = 0; i < listOfConnections.size(); i++)
                out.println(listOfConnections.get(i));



            out.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
