import org.junit.Test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static org.junit.Assert.*;

public class MyListTest {

    @Test
    public void size() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        if(ex.size()!=t.size()){
            fail("Size fail!!!");
        }
    }

    @Test
    public void isEmpty() throws Exception {
        MyList<Ammunition> t = new MyList<>();
        ArrayList<Ammunition> ex=new ArrayList<>();
        if(t.isEmpty()!=ex.isEmpty()){
            fail("isEmpty fail!!!");
        }

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        if(t.isEmpty()!=ex.isEmpty()){
            fail("isEmpty fail!!!");
        }

    }

    @Test
    public void contains() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        if(t.contains(new Sword("sword1", 8, 2, 4, 0))!=ex.contains(new Sword("sword1", 8, 2, 4, 0))){
            fail("contain fail!!!!");
        }
        if(t.contains(new Sword("sword6", 8, 2, 4, 0))!=ex.contains(new Sword("sword6", 8, 2, 4, 0))){
            fail("contain fail!!!!");
        }
    }

    @Test
    public void iterator() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        Iterator<Ammunition> tItr = t.iterator();
        Iterator<Ammunition> exItr = ex.iterator();
        while(tItr.hasNext()){
            if(exItr.hasNext()){
                if (tItr.next()!=exItr.next()){
                    fail("iterator.next fail!!!");
                }
            } else {
                fail("iterator.hasNext fail!!!");
            }
        }
    }

    @Test
    public void toArray() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        Object[] testarr=t.toArray();
        Object[] exarr=ex.toArray();

        if(testarr.length!=exarr.length){
            fail("toArray size fail");
        }
        for(int i=0;i<testarr.length;i++){
            Ammunition test=(Ammunition)testarr[i];
            Ammunition examp=(Ammunition)exarr[i];
            if(!test.equals(examp)){
                fail("toArray contant fail");
            }
        }

    }

    @Test
    public void add() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));


        if(t.size()!=ex.size()){
            fail("add size fail");
        }
        for(int i=0;i<t.size();i++){
            Ammunition test=t.get(i);
            Ammunition examp=ex.get(i);
            if(!test.equals(examp)){
                fail("add contant fail");
            }
        }
    }

    @Test
    public void remove() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        ex.remove(0);
        ex.remove(5);

        t.remove(0);
        t.remove(5);
        if(t.size()!=ex.size()){
            fail("remove size fail");
        }
        for(int i=0;i<t.size();i++){
            Ammunition test=t.get(i);
            Ammunition examp=ex.get(i);
            if(!test.equals(examp)){
                fail("toArray contant fail");
            }
        }

    }

    @Test
    public void containsAll() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        if (!t.containsAll(ex)){
            fail("contains All fail!");
        }
        ex.add(new Armor("armor6", 1,4,0,1));
        if (t.containsAll(ex)){
            fail("contains All fail!");
        }
    }

    @Test
    public void addAll() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        ArrayList<Ammunition> ad=new ArrayList<>();
        ad.add(new Sword("sword6", 230,90,130,0));
        ad.add(new Shield("shield6", 260,20,0,80));
        ad.add(new Armor("armor6", 210,60,0,100));

        t.addAll(ad);
        ex.addAll(ad);

        for(int i=0;i<t.size();i++){
            Ammunition test=t.get(i);
            Ammunition examp=ex.get(i);
            if(!test.equals(examp)){
                fail("addAll contant fail");
            }
        }
    }

    @Test
    public void addAll1() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        ArrayList<Ammunition> ad=new ArrayList<>();
        ad.add(new Sword("sword6", 230,90,130,0));
        ad.add(new Shield("shield6", 260,20,0,80));
        ad.add(new Armor("armor6", 210,60,0,100));

        t.addAll(3,ad);
        ex.addAll(3,ad);

        for(int i=0;i<t.size();i++){
            Ammunition test=t.get(i);
            Ammunition examp=ex.get(i);
            if(!test.equals(examp)){
                fail("addAll contant fail");
            }
        }
    }

    @Test
    public void removeAll() throws Exception {
        MyList<Ammunition> t = new MyList<>();

        t.add(new Sword("sword1", 8, 2, 4, 0));
        t.add(new Shield("shield1", 9,2,0,6));
        t.add(new Armor("armor1", 8, 6, 0, 10));

        t.add(new Sword("sword2", 16,2,10,0));
        t.add(new Shield("shield2", 18,2,0,5));
        t.add(new Armor("armor2", 15,3,0,9));

        t.add(new Sword("sword3", 23,9,13,0));
        t.add(new Shield("shield3", 26,2,0,8));
        t.add(new Armor("armor3", 21,6,0,10));

        t.add(new Armor("armor4", 15,5,0,6));

        t.add(new Armor("armor5", 21,4,0,9));


        ArrayList<Ammunition> ex=new ArrayList<>();
        ex.add(new Sword("sword1", 8, 2, 4, 0));
        ex.add(new Shield("shield1", 9,2,0,6));
        ex.add(new Armor("armor1", 8, 6, 0, 10));

        ex.add(new Sword("sword2", 16,2,10,0));
        ex.add(new Shield("shield2", 18,2,0,5));
        ex.add(new Armor("armor2", 15,3,0,9));

        ex.add(new Sword("sword3", 23,9,13,0));
        ex.add(new Shield("shield3", 26,2,0,8));
        ex.add(new Armor("armor3", 21,6,0,10));

        ex.add(new Armor("armor4", 15,5,0,6));

        ex.add(new Armor("armor5", 21,4,0,9));

        ArrayList<Ammunition> ad=new ArrayList<>();
        ad.add(new Sword("sword3", 23,9,13,0));
        ad.add(new Shield("shield3", 26,2,0,8));
        ad.add(new Armor("armor3", 21,6,0,10));

        t.removeAll(ad);
        ex.removeAll(ad);

        for(int i=0;i<t.size();i++){
            Ammunition test=t.get(i);
            Ammunition examp=ex.get(i);
            if(!test.equals(examp)){
                fail("addAll contant fail");
            }
        }
    }
/////////////////////////////////////////////////////////
//    @Test
//    public void clear() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//        t.clear();
//
//        if(!t.isEmpty()){
//            fail("clear fail");
//        }
//
//    }
//
//    @Test
//    public void get() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//
//
//        if(t.size()!=ex.size()){
//            fail("get size fail");
//        }
//        for(int i=0;i<t.size();i++){
//            Ammunition test=t.get(i);
//            Ammunition examp=ex.get(i);;
//            if(!test.equals(examp)){
//                fail("get contant fail");
//            }
//        }
//    }
//
//    @Test
//    public void set() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//
//        t.set(3,new Armor('m', 140));
//        ex.set(3,new Armor('m', 140));
//
//        if(t.size()!=ex.size()){
//            fail("set size fail");
//        }
//        for(int i=0;i<t.size();i++){
//            Ammunition test=t.get(i);
//            Ammunition examp=ex.get(i);;
//            if(!test.equals(examp)){
//                fail("set contant fail");
//            }
//        }
//    }
//
//    @Test
//    public void add1() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//
//
//
//        t.add(5,new Armor('m', 15));
//        ex.add(5,new Armor('m', 15));
//
//        t.add(0,new Armor('m', 15));
//        ex.add(0,new Armor('m', 15));
//
//        t.add(t.size()-1,new Armor('m', 15));
//        ex.add(ex.size()-1,new Armor('m', 15));
//
//
//        if(t.size()!=ex.size()){
//            fail("add size fail");
//        }
//        for(int i=0;i<t.size();i++){
//            Ammunition test=t.get(i);
//            Ammunition examp=ex.get(i);;
//            if(!test.equals(examp)){
//                fail("add contant fail");
//            }
//        }
//    }
//
//    @Test
//    public void remove1() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//
//        t.remove(new Sword('s', 8));
//        ex.remove(new Sword('s', 8));
//
//        t.remove(new Sword('s', 800));
//        ex.remove(new Sword('s', 800));
//
//        t.remove(new tcube('l', 24));
//        ex.remove(new tcube('l', 24));
//
//
//
//        if(t.size()!=ex.size()){
//            fail("remove size fail");
//        }
//        for(int i=0;i<t.size();i++){
//            Ammunition test=t.get(i);
//            Ammunition examp=ex.get(i);;
//            if(!test.equals(examp)){
//                fail("remove contant fail");
//            }
//        }
//    }
//
//    @Test
//    public void indexOf() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//
//        if(t.indexOf(new Sword('m', 16))!=ex.indexOf( new Sword('m', 16)) ){
//            fail("indexOf fail");
//        }
//        if(t.indexOf(new Sword('m', 12))!=ex.indexOf( new Sword('m', 12)) ){
//            fail("indexOf fail");
//        }
//        if(t.indexOf(new tcube('l', 24))!=ex.indexOf( new tcube('l', 24)) ){
//            fail("indexOf fail");
//        }
//
//    }
//
//    @Test
//    public void lastIndexOf() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//
//        if(t.lastIndexOf(new Sword('m', 16))!=ex.lastIndexOf( new Sword('m', 16)) ){
//            fail("indexOf fail");
//        }
//        if(t.lastIndexOf(new Sword('m', 12))!=ex.lastIndexOf( new Sword('m', 12)) ){
//            fail("indexOf fail");
//        }
//        if(t.lastIndexOf(new tcube('l', 24))!=ex.lastIndexOf( new tcube('l', 24)) ){
//            fail("indexOf fail");
//        }
//    }
//
//    @Test
//    public void listIterator() throws Exception {
//
//    }
//
//    @Test
//    public void listIterator1() throws Exception {
//
//    }
//
//    @Test
//    public void subList() throws Exception {
//        MyList<Ammunition> t = new MyList<>();
//
//        t.add(new Sword('s', 8));
//        t.add(new Shield('s', 9));
//        t.add(new Armor('s', 8));
//        t.add(new tcube('s', 7));
//
//        t.add(new Sword('m', 16));
//        t.add(new Shield('m', 18));
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Sword('l', 23));
//        t.add(new Shield('l', 26));
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//
//        t.add(new Armor('m', 15));
//        t.add(new tcube('m', 13));
//
//        t.add(new Armor('l', 21));
//        t.add(new tcube('l', 24));
//        //-------------------------------------
//        ArrayList<Ammunition> ex=new ArrayList<>();
//        ex.add(new Sword('s', 8));
//        ex.add(new Shield('s', 9));
//        ex.add(new Armor('s', 8));
//        ex.add(new tcube('s', 7));
//
//        ex.add(new Sword('m', 16));
//        ex.add(new Shield('m', 18));
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Sword('l', 23));
//        ex.add(new Shield('l', 26));
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//
//        ex.add(new Armor('m', 15));
//        ex.add(new tcube('m', 13));
//
//        ex.add(new Armor('l', 21));
//        ex.add(new tcube('l', 24));
//        //-------------------------------------
//        MyList<Ammunition> testarr=(MyList<Ammunition>)(t.subList(0,10));
//        List<Ammunition> exarr=ex.subList(0,10);
//
//        if(testarr.size()!=exarr.size()){
//            fail("subList size fail");
//        }
//        for(int i=0;i<testarr.size();i++){
//            Ammunition test=testarr.get(i);
//            Ammunition examp=exarr.get(i);;
//            if(!test.equals(examp)){
//                fail("toArray contant fail");
//            }
//        }
//
//    }

}