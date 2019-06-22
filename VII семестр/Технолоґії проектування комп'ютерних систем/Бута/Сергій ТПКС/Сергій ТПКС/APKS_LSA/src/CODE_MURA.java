/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.util.mxConstants;
import com.mxgraph.view.mxGraph;
import com.mxgraph.view.mxStylesheet;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.StringTokenizer;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

/**
 *
 * @author Drozd
 */
public class CODE_MURA extends JFrame {
    private ArrayList<ArrayList<String>> Automat; //матрица связности автомата!
    private ArrayList<String> VertexAutomat; //строки в автомате

    private int used; //список свободных незакодированей
    private boolean needAgain = true, coded = false;
    private ArrayList<Integer> arr = new ArrayList<Integer>();
    private ArrayList<Integer> was = new ArrayList<Integer>();

    private HashMap<Integer,Integer> code; //матрица принадлежности вершины и кода
    private int number; //количество цифр состояний
    private final Main app;
    private mxGraph grap;
    private mxGraphComponent graphComponent;
    private final JMenuItem save;
    private final JMenuItem load;
    private final CODE_MURA aThis;
 
    public CODE_MURA(ArrayList<ArrayList<String>> mura, String vertexes, Main mf) {
        super("Закодированный автомат!");
        app = mf;
        aThis = this;
        
        Automat = mura;
        VertexAutomat = new ArrayList<String>();

        StringTokenizer st = new StringTokenizer(vertexes, " ");
        int leng = st.countTokens();

        for (int i = 0; i < leng; i++) {
            VertexAutomat.add(st.nextToken());
        }

         //создание меню
        JMenuBar mbar = new JMenuBar();
        JMenu file = new JMenu("FILE");
        file.add(save = new JMenuItem("Save"));
        file.add(load = new JMenuItem("Load"));
        mbar.add(file);
        addMenuLoadAndSave();

        //расположение на более верхнем уровне
        Container contentPane = this.getContentPane();
        contentPane.setLayout(new BorderLayout());
        contentPane.add(mbar,BorderLayout.NORTH);
    }
    
    public ArrayList<String> getVertexAutomat() {
        return VertexAutomat;
    }

    public ArrayList<ArrayList<String>> getAutomat() {
        return Automat;
    }

    public HashMap<Integer,Integer> getCodeAutomat() {
        return code;
    }

    public void setVertexAutomat(ArrayList<String> va) { VertexAutomat = va; }
    public void setAutomat(ArrayList<ArrayList<String>> va) { Automat = va; }
    public void setCodeAutomat(HashMap<Integer,Integer> cddd) { code = cddd; }
    public void setCoded() { coded = true; }

    //отрисовка графа
    public void ppaint() {
        if (coded) { //если граф был нарисован... строем его!
            //отрисовка стрелочек
            grap = new mxGraph();
            Object parent = grap.getDefaultParent();

            mxStylesheet stylesheet = grap.getStylesheet();
            Hashtable<String, Object> style = new Hashtable<String, Object>();
            style.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_ELLIPSE);
            style.put(mxConstants.STYLE_OPACITY, 100);
            style.put(mxConstants.STYLE_FONTCOLOR, "#00000FF");
            stylesheet.putCellStyle("ROUNDED", style);

            grap.getModel().beginUpdate();
            try
            {
                //настройки
                String settings = "SQUARED;strokeColor=blue;fillColor=pink";
                Object[] v = new Object[Automat.size()]; //количество вершин состояний
                
                for (int i = 0; i < Automat.size(); i++) {
                        //распределяем вершины по кругу!
                        Point ptr = inRound(i, Automat.size(), 150); //находим положение вершины
                        v[i] = grap.insertVertex(parent, null,
                                        VertexAutomat.get(i)+"", ptr.x, ptr.y, 50,
                                        50, settings); //рисуем и выдаём ей имя!
                        Point ptr2 = inRound(i, Automat.size(), 200);
                                grap.insertVertex(parent, null,
						toString(code.get(i),log2plus(code.size())),
						ptr2.x, ptr2.y, 40,
						15, "ROUNDED;fillColor=pink;Opacity=20");

                }
                for (int i = 0; i < Automat.size(); i++) {
                        for (int j = 0; j < Automat.size(); j++) {
                                if (!Automat.get(i).get(j).contains("0")) {
                                        //обходя матрицу связности графа
                                        //рисуем стрелочки между соответствующими вершинами!
                                        grap.insertEdge(parent, null,
                                                        Automat.get(i).get(j),
                                                        v[i], v[j]);
                                }
                        }
                }
            }
            finally
            {
                grap.getModel().endUpdate(); //обновление графа...
            }

            graphComponent = new mxGraphComponent(grap);
            this.getContentPane().add(graphComponent);
        }
    }

    //начать обработку
    void start() {
        //1. Начальная длина кода********************
        number = log2plus(Automat.size());	//***
        code = new HashMap<Integer, Integer>(); //***
        //*******************************************
        number -= 1;
        used = Automat.size();

        while (needAgain) {
            code.clear();
            number += 1;
            needAgain = false;
            coode(0);
        }
        
        coded = true;

        for (int l = 0; l < Automat.size(); l++) {
            for (int j = 0; j < Automat.get(l).size(); j++) {
                System.out.print(Automat.get(l).get(j) + " ");
            }
            System.out.println();
        }

        for (int l = 0; l < Automat.size(); l++) {
            System.out.println("Vertex # " + l + " is : " + VertexAutomat.get(l));
        }
        cout();
    }

    private void cout() {
        if (code != null) {
            for (int i = 0 ; i < code.size(); i++) {
                if (code.get(i) != null)
                    System.out.println(i + " Вершина имеет код " +
                        toString(code.get(i), number) );
            }
        }
    }


    private void coode(int i) {
            int place = i; //номер вершины
            int state = 0;
            ArrayList<Integer[]> toPrepare = new ArrayList<Integer[]>();
            Integer[] curr = {i, 0}; //{вершина , её состояние}
            toPrepare.add(curr);

            while (!toPrepare.isEmpty()) {
                place = toPrepare.get(0)[0]; //достаём вершину из стека.
                state = toPrepare.get(0)[1];
                toPrepare.remove(0);
                //2 Если эта вершина не пройдена
                if (!code.containsKey(place)) {
                    //2.1 Включить розданные коды в список использованных
                    used--; //оставшиеся соседи
                    code.put(place, state); //добавить для нулевого - 0 код
                    System.out.println(place + "hhhhh" + state);
                    was.add(place);
                    //2.2 Найти все соседние коды (по отношению к текущему)
                    //2.3 Исключить из них все ранее использовавшиеся
                    //(то есть отданные другим вершинам)
                    arr.clear();
                    for (int k = 0; k <= number; k++) {
                            Integer newcode = invertBit(state, k);
                            arr.add(newcode);

                            if (code.containsValue(newcode))
                                    arr.remove(newcode);
                    }

                    for (int j = 0; j < Automat.size(); j++) {
                        //если кода у вершины нет, и при этом оно сам в себя не указывает
                        if ((place != j) & (!code.containsKey(j))) {
                            //2.4 Раздать соседям коды из полученного множества
                            //2.5. Рекурсивно вызвать функцию кодирования для каждого соседа

                            if (!Automat.get(place).get(j).contains("0")) {
                                if (!arr.isEmpty()) {
                                    Integer[] newVertex = {j, arr.get(0)};
                                    arr.remove(0);
                                    toPrepare.add(newVertex);
                                } //если нет, будем надеятся соседи добавят
                            }

                        } else if ((place != j) & (code.containsKey(j))
                            & (!Automat.get(place).get(j).contains("0"))) {
                            //2.7. Если есть конфликты с кодами соседей,
                            //попытаться решить их путем добавления
                            //промежуточных вершин.
                            //Если конфликты решить не удается —
                            //увеличить длину кода и начать процедуру кодирования
                            //всего графа заново
                            arr.clear();
                            if (!isNonConflictPair(code.get(j), code.get(place), number)) {
                            //2.7.1. добавляем вершину.
                                ArrayList<ArrayList<String>> graph = new ArrayList<ArrayList<String>>();
                                for (int f1 = 0; f1 < Automat.size() + 1; f1++) {
                                    ArrayList<String> ss = new ArrayList<String>();
                                    for (int f2 = 0; f2 < Automat.size() + 1; f2++) {
                                    //graph.get(Automat.size() - 1).add("0");
                                        ss.add("0");
                                    }
                                    graph.add(ss);
                                }

                                for (int f1 = 0; f1 < Automat.size(); f1++) {
                                    for (int f2 = 0; f2 < Automat.size(); f2++) {
                                        ArrayList<String> sss = graph.get(f1);
                                        sss.set(f2, Automat.get(f1).get(f2));
                                        graph.set(f1, sss);
                                    }
                                }

                                ArrayList<String> sss = graph.get(place);
                                sss.set(Automat.size(), Automat.get(place).get(j));
                                graph.set(place, sss);

                                sss = graph.get(place);
                                sss.set(j, "0");
                                graph.set(place, sss);

                                sss = graph.get(Automat.size());
                                sss.set(j, "-");
                                graph.set(Automat.size(), sss);

                                VertexAutomat.add("0");

                                Automat = graph;

                                if (used != 0) {
                                    arr.clear();
                                    for (int k = 0; k <= number; k++) {
                                        Integer newcode = invertBit(code.get(place), k);

                                        if (!code.containsValue(newcode))
                                            arr.add(newcode);
                                    }

                                        if (!arr.isEmpty()) {
                                            Integer[] newVertex =
                                            {graph.size() - 1, arr.get(0)};
                                            toPrepare.add(newVertex);
                                        } else  {
                                            used = 0;
                                        }
                                }

                            if (used == 0) {
                                arr.clear();
                                number++;
                                used = Automat.size();

                                toPrepare.clear();
                                needAgain = true;
                            }
                        }
                    }
                }
            }
        }
    }

    public int setBit(int body, int num) {
        return  body | (1<<num);
    }
    public int invertBit(int body, int num) {
        return body ^ (1<<num);
    }
    public String toString(int body, int length) {
        String str = "";
        str = Integer.toBinaryString(body);
        if (str.length() > length) {
            int t = str.length() - length;
            str = str.substring(t);
        }
        if (str.length() < length) {
            int t = length - str.length();
            for (int i = 0; i < t; i++) {
                str = "0" + str;
            }
        }
        return str;
    }
    public boolean isNonConflictPair(Integer i1, Integer i2, int len) {
        int t = i1 ^ i2;

        for (int i = 0; (i < len)  && ((t & 1) == 0); i++) {
            t >>= 1;
        }

        return (t == 1);
    }
    public int log2plus(double num) {
    if (num == 1) return 1;
        double x = Math.log(num)/Math.log(2);
        if (x > (int) x) {
                return (int) x + 1;
        } else {
                return (int) x;
        }
    }

    private Point inRound(int i, int length, int r) { //рисует чудеса
        //*************************************************
        // Преобразуем угол в радианы
        // 1 градус = pi/180 радиан
        //*************************************************
        double theta = ((i + 1) * 360/length) * (3.14/180);
        //*************************************************
        // Переводим в декартовы координаты
        // x = r cos @
        // y = r sin @
        //*************************************************
        double x = r * Math.cos(theta);
        double y = r * Math.sin(theta);
        Point mark2 = new Point(200, 200);
        mark2.translate((int)x, (int)y);
        return mark2;
    }

    private void addMenuLoadAndSave() {
        //сохранение алгоритма
        save.addActionListener( new ActionListener()
        {
            public void actionPerformed(ActionEvent e) {
                JFileChooser fc = new JFileChooser();

                fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
                File FS;
                if (fc.showSaveDialog(null)==JFileChooser.APPROVE_OPTION){
                    FS = fc.getSelectedFile();
                    try {
                            FileWriter fw = new FileWriter(FS);
                            FS.delete(); //если файл существовал и там была инфа
                            //его убъёт совсем! и создаст новый
                            FS.createNewFile();
                            String s = "";
                            for (int i = 0; i < Automat.size(); i++) {
                                    for (int j = 0; j < Automat.size(); j++) {
                                            //собираем строку в один СТринг,
                                            //и добавляем разделители элементов
                                            s += Automat.get(i).get(j);
                                            //если это не последний элемент строки матрицы конечно
                                            if (j != Automat.get(i).size() - 1) { s += "_"; }
                                    }
                                    fw.write(s + "\r\n"); //записываем в файл с переводом на новую строку.
                                    s = ""; //очищаем буфер накапливания на запись
                            }
                            for (int i = 0; i < VertexAutomat.size(); i++) {
                                s += VertexAutomat.get(i) + ";";
                            }
                            fw.write(s + "\r\n"); //записать значение вершин1
                            s = "";
                            for (int i = 0; i < VertexAutomat.size(); i++) {
                                s += code.get(i) + ";";
                            }
                            fw.write(s + "\r\n"); //записать значение кодов.
                            fw.close(); //и закроем файл
                    } catch (Exception ex) {}
                }
            }
        });

        //Загрузка алгоритма
        load.addActionListener( new ActionListener()
        {
            public void actionPerformed(ActionEvent e) {
                    JFileChooser fc = new JFileChooser();

                fc.setFileSelectionMode(JFileChooser.FILES_ONLY);
                File FS;
                if (fc.showOpenDialog(null) == JFileChooser.APPROVE_OPTION){
                    FS = fc.getSelectedFile();
                    try {
                        BufferedReader br = new BufferedReader(new FileReader(FS));
                        String s; StringTokenizer st;
                        s = br.readLine();
                        //разбивка строки на части определённые разделителем
                        st = new StringTokenizer(s, "_");
                        //колво разделённых токенов == размер матрицы, ведь так?
                        int leng = st.countTokens();
                        //создаём новую матрицу
                        Automat = new ArrayList<ArrayList<String>>();
                        VertexAutomat = new ArrayList<String>();
                        code = new HashMap<Integer, Integer>();
                        for (int i1 = 0; i1 < leng; i1++) {
                            ArrayList<String> arr = new ArrayList<String>();
                            for (int i2 = 0; i2 < leng; i2++) {
                                arr.add("0");
                            }
                            Automat.add(arr);
                        }
                        for (int j = 0; j < leng; j++) {
                            Automat.get(0).set(j, st.nextToken()); //и записываем туда элементы
                        }
                        for (int i = 1; i < leng; i++) {
                            s = br.readLine();
                            st = new StringTokenizer(s, "_");
                            for (int j = 0; j < leng; j++) {
                                Automat.get(i).set(j, st.nextToken()); //и записываем туда элементы
                            }
                        }

                        s = br.readLine();
                        st = new StringTokenizer(s, ";");
                        for (int j = 0; j < leng; j++) {
                            VertexAutomat.set(j, st.nextToken()); //и записываем туда элементы
                        }

                        s = br.readLine();
                        st = new StringTokenizer(s, ";");
                        for (int j = 0; j < leng; j++) {
                            code.put(j, Integer.parseInt(st.nextToken()));
                        }

                        br.close();
                        aThis.getContentPane().remove(graphComponent);
                        grap.refresh();
                        aThis.ppaint();
                        aThis.repaint();
                    } catch (Exception ex) {}
                }
            }
        });
    }
}
