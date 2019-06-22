package com.lab111.labwork4;

/**
 * Workclass
 * Realise pattern "Facade". Its a farcade part.
 * @author Anastasia Brovchenko
 */
public class MyExplorer {

    //объекты файла и папки для последующей манипуляции
    private MyFile file;
    private MyDirectory directory;

    //простой конструктор для создания проводника
    MyExplorer(){
        this.directory= new MyDirectory();
        this.file= new MyFile();
    }

    //создает нашу иерархию из 3-ох файлов и 2-х директорий
    public void create(){
        directory.create("/folder1/folder2");
        file.open("/folder1/file1.lol", true);
        file.open("/folder1/file2.lol", true);
        file.open("/folder1/folder2/file3.lol", true);
    }

    //удаляет нашу иерархию из 3-ох файлов и 2-х директорий
    public void destroy(){
        file.delete("/folder1/file1.lol");
        file.delete("/folder1/file2.lol");
        file.delete("/folder1/folder2/file3.lol");
        directory.rmdir("/folder1/folder2");
        directory.rmdir("/folder1");
    }
}
