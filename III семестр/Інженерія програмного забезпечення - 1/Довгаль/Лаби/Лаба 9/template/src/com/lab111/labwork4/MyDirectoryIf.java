package lab111.labwork4;

/**
 * Интерфейс для работы с папками. Содержит методы create, rmdir.
 *
 * @author Error_404
 */
public interface MyDirectoryIf {

    /**
     * Создает папу по пути path.
     * @param path -путь создаваемой папки
     */
    public void create(String path);

    /**
     * Удаляет папку по пути path.
     * @param path - путь удаляемой папки
     */
    public void rmdir(String path);

}
