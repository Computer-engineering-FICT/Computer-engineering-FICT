package com.lab111.labwork9;

/**
 * Only workclass.
 *
 * @author Anastasia Brovchenko
 */
public class WorkClass {
    public static void main(String[] args) {

        //создаю файл и клиента, для пождальших опреаций с ними
        ConfigFile myFile= new ConfigFile();
        MyClient client = new MyClient();

        //создаю строителя с 1 вариантом
        ElementBuilder red50CircleBuilder = new Red50CircleBuilder();

        //говорю клиенту, что именно строить
        client.setBuilder(red50CircleBuilder);
        client.constructElement();

        //узнаю инфу
        MyElement myEl1= client.getMyEl();
        myEl1.getMyElInfo();
        System.out.println();

        //загружаю конфигурацию с файла
        client.loadConfigfromFile(myFile);
        client.constructElement();

        //узнаю инфу
        MyElement myEl2= client.getMyEl();
        myEl2.getMyElInfo();
    }
}
