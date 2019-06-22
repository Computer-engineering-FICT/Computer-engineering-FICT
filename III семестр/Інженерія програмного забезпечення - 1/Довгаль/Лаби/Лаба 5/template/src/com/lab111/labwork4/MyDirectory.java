package lab111.labwork4;

/**
 * Класс для работы с папками, реализующий интерфейс MyDirectoryIf.
 *
 * @author Error_404
 */
public class MyDirectory implements MyDirectoryIf {

    @Override
    public void create(String path) {
        System.out.println("Directory "+ path+ " created");
    }

    @Override
    public void rmdir(String path) {
        System.out.println("Directory "+ path+ " deleted");
    }
}
