package com.sulyma.lab111.labwork3;

/**
 * A class that created levels, created Game Space and demonstrate work.
 */
public class Work {
    public static void main(String[] args) {
        Area firstEdgeBath = new Edge(1, 2);
        Area secondEdgeBath = new Edge(2, 3);
        Area thirdEdgeBath = new Edge(3, 4);

        Area firstEdgeLiving = new Edge(5, 4);
        Area secondEdgeLiving = new Edge(2, 4);
        Area thirdEdgeLiving = new Edge(1, 1);


        Room bathRoom = new Room();
        Room livingRoom = new Room();
        Room house = new Room();

        int areaBathRoom;
        int areaLivingRoom;
        int areaHouse;

        bathRoom.addComponents(firstEdgeBath);
        bathRoom.addComponents(secondEdgeBath);
        bathRoom.addComponents(thirdEdgeBath);

        livingRoom.addComponents(firstEdgeLiving);
        livingRoom.addComponents(secondEdgeLiving);
        livingRoom.addComponents(thirdEdgeLiving);

        house.addComponents(bathRoom);
        house.addComponents(livingRoom);

        areaBathRoom = bathRoom.getSize();
        areaLivingRoom = livingRoom.getSize();
        areaHouse = house.getSize();
        System.out.println("Bath room: " + areaBathRoom + "\nLiving room: " + areaLivingRoom + "\nHouse: " + areaHouse);
    }
}
