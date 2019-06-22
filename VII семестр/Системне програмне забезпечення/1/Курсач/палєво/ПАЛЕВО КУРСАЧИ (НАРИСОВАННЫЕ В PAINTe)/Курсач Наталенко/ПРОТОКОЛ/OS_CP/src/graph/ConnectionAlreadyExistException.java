package graph;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 26.12.10
 * Time: 19:15
 * To change this template use File | Settings | File Templates.
 */
class ConnectionAlreadyExistException extends Exception {

    private static String TEXT = "Связь уже существует.";

    @Override
    public String getMessage() {
        return TEXT;
    }

}
