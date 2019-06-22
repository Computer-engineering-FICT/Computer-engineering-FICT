package redactor;

import redactor.gui.Page;
import redactor.gui.graphicalElements.*;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

/**
 * Container for saving and handling lists of vertexes, committed connections, current connections.
 */
public class Data {


    private int operationCount;
    private int conditionCount;
    private Page page;
    private List<Entity> listOfEntities;
    private List<Entity> listOfCurrentConnection;
    private List<List<Entity>> listOfCommittedConnections;
	private MatrixHandler dataAnalyser;

    public Data() {
        listOfEntities = new ArrayList<Entity>();
        operationCount = 1;
        conditionCount = 1;
        page = null;
        listOfCurrentConnection = new ArrayList<Entity>();
        listOfCommittedConnections = new ArrayList<List<Entity>>();

	    dataAnalyser = new MatrixHandler(listOfEntities);
    }

    public TreeMap<String, Entity> sortedListOfEntities(){

        TreeMap<String, Entity> treeMapStore = new TreeMap<String, Entity>();

        for (Entity entity : listOfEntities) {
            if ("OperationalVertex".equals(entity.getName())) {
                treeMapStore.put("P" + entity.getNumber(), entity);
            } else treeMapStore.put("C" + entity.getNumber(), entity);

        }

        return treeMapStore;
    }

    public void setListOfCommittedConnections(List<List<Entity>> listOfCommittedConnections) {
        this.listOfCommittedConnections = listOfCommittedConnections;
    }

    public void setOperationCount(int operationCount) {

        this.operationCount = operationCount;
    }

    public void refresh(){
        operationCount = 1;
        conditionCount = 1;
        listOfEntities.clear();
        listOfCommittedConnections.clear();
        listOfCurrentConnection.clear();

    }

    public void setConditionCount(int conditionCount) {
        this.conditionCount = conditionCount;
    }

    public List<Entity> getAllOperationVertex(){

        List<Entity> allOperations = new ArrayList<Entity>();

        for (Entity listOfEntity : listOfEntities)
            if (("OperationalVertex").equals(listOfEntity.getName()))
                allOperations.add(listOfEntity);

        return allOperations;

    }

    public void addEntity(Entity entity) {
        listOfEntities.add(entity);
        dataAnalyser.update();
    }

    public List<ConditionalVertex> getAllConditionVertex(){

        List<ConditionalVertex> allConditions = new ArrayList<ConditionalVertex>();

        for (Entity listOfEntity : listOfEntities)
            if (("Condition").equals(listOfEntity.getName()))
                allConditions.add((ConditionalVertex)listOfEntity);

        return allConditions;

    }

    public List<List<Entity>> findThisItemInCommited(Entity entity){

        List<List<Entity>> equalItems = new ArrayList<List<Entity>>() ;

        for (List<Entity> listOfCommittedConnection : listOfCommittedConnections)
            for (int j = 0; j < listOfCommittedConnection.size(); j++)
                if (entity == listOfCommittedConnection.get(j))
                    equalItems.add(listOfCommittedConnection);

        return equalItems;
    }



    public boolean isThisItemInListOfEntities(Entity entity){
        for (Entity listOfEntity : listOfEntities)
            if (entity.equals(listOfEntity))
                return true;
        return false;
    }

    public List<List<Entity>> getListOfCommittedConnections() {
        return listOfCommittedConnections;
    }

    /**
     * Saves current connection to list with committed connections. Sets output link to head-shape.
     * Creates new empty current connection.
     */
    public void commitConnection() {
        listOfCommittedConnections.add(listOfCurrentConnection);
        Entity source = listOfCurrentConnection.get(0);
        if (source.isOutputHighlighted()) {
            source.setOutputLink(listOfCurrentConnection);
        } else if (source.isOutput2Highlighted()) {
            source.setOutput2Link(listOfCurrentConnection);
        }
        listOfCurrentConnection.get(listOfCurrentConnection.size() - 1).addInputLink(listOfCurrentConnection);
        listOfCurrentConnection = new ArrayList<Entity>();
        dataAnalyser.update();
    }

    public List<Entity> getListOfCurrentConnection() {
        return listOfCurrentConnection;
    }



    public List<Entity> getListOfEntities() {
        return listOfEntities;
    }

    public void setListOfEntities(final ArrayList<Entity> listOfEntities) {
        this.listOfEntities = listOfEntities;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(final Page page) {
        this.page = page;
    }

    /**
     * Factory method to create operation vertex.
     * @param x horizontal coordinate
     * @param y vertical coordinate
     * @param add automatically add created entity to algorithm
     * @return created vertex
     */
    public OperationalVertex createOperation(final int x, final int y, boolean add) {
        boolean exists;
        int number = operationCount;
        for (int i = 1; i <= operationCount; i++) {
            exists = false;
            for (Entity listOfEntity : listOfEntities) {
                if ("OperationalVertex".equals(listOfEntity.getName())) {
                    if (listOfEntity.getNumber() == i) {
                        exists = true;
                        break;
                    }
                }
            }
            if (!exists) {
                number = i;
                break;
            }
        }
        if (number == operationCount) {
            operationCount += 1;
        }

        OperationalVertex vertex = new OperationalVertex(x - TestMain.drawScale * 2, y - TestMain.drawScale * 2, number);
        if (add) {
            addEntity(vertex);
        }

        return vertex;
    }

    public InitialVertex createInitialVertex(final int x, final int y) {
        return new InitialVertex(x - TestMain.drawScale * 2, y - TestMain.drawScale * 2);
    }

    public FinishVertex createFinishVertex(final int x, final int y) {
        return new FinishVertex(x - TestMain.drawScale * 2, y - TestMain.drawScale * 2);
    }

    /**
     * Factory method to create conditional vertex
     * @param x horizontal coordinate
     * @param y vertical coordinate
     * @param add automatically add created entity to algorithm
     * @return created vertex
     */
    public ConditionalVertex createCondition(final int x, final int y, boolean add) {
        boolean exists;
        int number = conditionCount;
        for (int i = 1; i <= conditionCount; i++) {
            exists = false;
            for (Entity listOfEntity : listOfEntities) {
                if ("Condition".equals(listOfEntity.getName())) {
                    if (listOfEntity.getNumber() == i) {
                        exists = true;
                        break;
                    }
                }
            }
            if (!exists) {
                number = i;
                break;
            }
        }
        if (number == conditionCount) {
            conditionCount += 1;
        }
        ConditionalVertex vertex = new ConditionalVertex(x - TestMain.drawScale, y - TestMain.drawScale * 2, number);
        if (add) {
            addEntity(vertex);
        }

        return vertex;
    }

    public UndirectedLine createUndirectedLine(final int x, final int y) {
        return new UndirectedLine(x, y, 0, 0);
    }

    public DirectedLine createDirectedLine(final int x, final int y) {
        return new DirectedLine(x, y, x, y);
    }

    /**
     * Removes connection from list with committed.
     * Changes input and output links of entity.
     * @param entityToDisconnect an entity whose connections should be removed
     */
    public void removeConnection(List<Entity> entityToDisconnect) {
	    removeConnection(entityToDisconnect, true);
    }

	private void removeConnection(List<Entity> aListForRemove, boolean update) {
		listOfCommittedConnections.remove(aListForRemove);
		Entity source = aListForRemove.get(0);
		if (source.getOutputLink() == aListForRemove) {
			source.setOutputLink(null);
		}
		else if (source.getOutput2Link() == aListForRemove) {
			source.setOutput2Link(null);
		}
		aListForRemove.get(aListForRemove.size()-1).removeInputLink(aListForRemove);
		if (update) {
			dataAnalyser.update();
		}
	}

	public void removeEntity(Entity entityToRemove) {
		// remove all it's conections
		List<List<Entity>> connectionsToRemove = entityToRemove.clearInputLinks();
		if(entityToRemove.getOutputLink() != null)
			connectionsToRemove.add(entityToRemove.getOutputLink());
		if(entityToRemove.getOutput2Link() != null)
			connectionsToRemove.add(entityToRemove.getOutput2Link());
		for (List<Entity> connection : connectionsToRemove)
			removeConnection(connection, false);
		// remove entity
		listOfEntities.remove(entityToRemove);
		//
		dataAnalyser.update();
	}

    public void updateJustLoadedData() {
        dataAnalyser.setListOfEntities(listOfEntities);
        dataAnalyser.update();
    }

    public String[][] getMatrix() {
        return dataAnalyser.getMatrix();
    }

    public List<List<String>> getCycles() {
        return dataAnalyser.getCycles();
    }

    public List<List<String>> getFullWays() {
        return dataAnalyser.getFullWays();
    }

    public List<List<String>> getEndlessCycles() {
        return dataAnalyser.getEndlessCycles();
    }
}
	


