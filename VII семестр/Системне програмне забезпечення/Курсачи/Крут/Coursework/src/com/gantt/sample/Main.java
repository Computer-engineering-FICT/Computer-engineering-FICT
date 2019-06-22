package com.gantt.sample;

import com.Link;
import com.Graph;
import com.Processor;
import javafx.scene.text.FontWeight;
import com.Transmission;
import com.Task;
import com.APN_MH;
import com.gantt.entity.Model;
import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.*;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;

import java.util.ArrayList;
import java.util.List;

public class Main extends Application {
    Group root;
    Model model;
    int PROC_NUMBER;
    double START_X = 100;
    double START_Y = 80;
    double END_X = 50;
    double END_Y = 50;
    double TASK_HEIGHT = 10;
    double TASK_WEIGHT = 15;
    double RATE_H = 2;
    double RATE_V = 2;
    double INTERVAL = 10;
    int FONT_HEIGHT = 18;
    double MAX_TIME = 0;

    @Override
    public void init() throws Exception {
        super.init();
        //set processors
        PROC_NUMBER = 9;
        List<Processor> processors = new ArrayList<Processor>();
        List<Link> links = new ArrayList<Link>();

        processors.add(new Processor(4));
        processors.add(new Processor(6));
        processors.add(new Processor(1));
        processors.add(new Processor(5));
        processors.add(new Processor(4));
        processors.add(new Processor(2));
        processors.add(new Processor(2));
        processors.add(new Processor(5));
        processors.add(new Processor(1));

        //set links

        addLane(processors, links, "Link 0-1", 0, 1, 1);
        addLane(processors, links, "Link 1-0", 1, 0, 1);
        addLane(processors, links, "Link 0-3", 0, 3, 1);
        addLane(processors, links, "Link 3-0", 3, 0, 1);

        addLane(processors, links, "Link 1-2", 1, 2, 1);
        addLane(processors, links, "Link 2-1", 2, 1, 1);
        addLane(processors, links, "Link 1-4", 1, 4, 1);
        addLane(processors, links, "Link 4-1", 4, 1, 1);

        addLane(processors, links, "Link 2-5", 2, 5, 1);
        addLane(processors, links, "Link 5-2", 5, 2, 1);

        addLane(processors, links, "Link 3-4", 3, 4, 1);
        addLane(processors, links, "Link 4-3", 4, 3, 1);
        addLane(processors, links, "Link 3-6", 3, 6, 1);
        addLane(processors, links, "Link 6-3", 6, 3, 1);

        addLane(processors, links, "Link 4-5", 4, 5, 1);
        addLane(processors, links, "Link 5-4", 5, 4, 1);
        addLane(processors, links, "Link 4-7", 4, 7, 1);
        addLane(processors, links, "Link 7-4", 7, 4, 1);

        addLane(processors, links, "Link 5-8", 5, 8, 1);
        addLane(processors, links, "Link 8-5", 8, 5, 1);

        addLane(processors, links, "Link 6-7", 6, 7, 1);
        addLane(processors, links, "Link 7-6", 7, 6, 1);

        addLane(processors, links, "Link 7-8", 7, 8, 1);
        addLane(processors, links, "Link 8-7", 8, 7, 1);


        Graph graph = new Graph(processors, links);

        //set task nodes
        int tNumber = 16;
        int[] weights = { 4, 8, 3, 3, 5,
                6, 2, 9, 7,
                3, 6, 6,
                7, 5, 5, 4 };
        //set task transmissions
        int[][] matrix = {
                {0, 0, 0, 0,    0, 1, 0, 0,     0, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 1, 2, 0,     0, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 1, 2,     0, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 1,     2, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     1, 0, 0, 0,     0, 0, 0, 0},

                {0, 0, 0, 0,    0, 0, 0, 0,     0, 1, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 1, 2, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 1, 2,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 1,     0, 0, 0, 0},

                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     1, 2, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     0, 1, 2, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     0, 0, 1, 2},

                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     0, 0, 0, 0},
                {0, 0, 0, 0,    0, 0, 0, 0,     0, 0, 0, 0,     0, 0, 0, 0}
        };
        ArrayList<Task> tasks = defineGraph(matrix, weights);

        //schedule
        APN_MH APNMh = new APN_MH(graph);
        int[][] plan = APNMh.schedule(tasks);

        //visualize
        model = new Model(PROC_NUMBER);
        for (int i = 0; i < tNumber; i++) {
             model.getProcessor(plan[0][i]).addTask(new com.gantt.entity.Task(i, plan[1][i], plan[2][i]));
        }

    }

    public static void main(String[] args) {
        launch(args);
    }

    private static void addLane(List<Processor> processors, List<Link> links, String laneId, int sourceLocNo, int destLocNo,
                                int duration) {
        Link lane = new Link(laneId, processors.get(sourceLocNo), processors.get(destLocNo), duration);
        links.add(lane);
    }

    private static ArrayList<Task> defineGraph(int[][] matrix, int[] weights) {
        ArrayList<Task> tasks = new ArrayList<>();
        for (int i = 0; i < matrix.length; i++) {
            Task task = new Task(weights[i], i);
            tasks.add(task);
        }
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                if (matrix[i][j] != 0) {
                    tasks.get(i).addChild(new Transmission(tasks.get(j), matrix[i][j]));
                    tasks.get(j).addParent(new Transmission(tasks.get(i), matrix[i][j]));
                }
            }
        }
        return tasks;
    }

    public void initiateData() {
        drawAxes();
        drawTasks();

    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        ScrollPane sp = new ScrollPane();
        root = new Group();
        primaryStage.setTitle("Krut Vladyslav");
        Scene scene = new Scene(sp, 1000, 600);

        scene.getStylesheets().add("com/gantt/resources/textstyle.css");
        primaryStage.setScene(scene);


        Line line = new Line();
        line.setStartX(0);
        line.setStartY(0);
        line.setEndX(0);
        line.setEndY(0);
        line.setStyle("-fx-stroke: red;");
        root.getChildren().add(line);

        sp.setLayoutX(0);
        sp.setFitToWidth(true);
        sp.setContent(root);
        sp.setHbarPolicy(ScrollPane.ScrollBarPolicy.AS_NEEDED);
        sp.setVbarPolicy(ScrollPane.ScrollBarPolicy.AS_NEEDED);
        sp.setStyle("-fx-background-color: transparent;   -fx-background: #FFFFFF;\n");

        initiateData();

        primaryStage.show();
    }

    public void drawTask(int procNumber, com.gantt.entity.Task task) {

        Rectangle temp = new Rectangle();
        temp.setX(START_X + RATE_H * TASK_WEIGHT * task.getEntryTime());
        temp.setY(START_Y + RATE_V * ((procNumber + 1) * (TASK_HEIGHT + INTERVAL) - TASK_HEIGHT * 2));
        temp.setWidth(RATE_H * TASK_WEIGHT * (task.getExitTime() - task.getEntryTime()));

        temp.setHeight(TASK_HEIGHT * RATE_V*2);
        temp.setArcWidth(50);
        temp.setArcHeight(0);
        temp.setFill(Color.WHITE);
        temp.setId("bord");
        temp.setStyle("-fx-stroke: blue; -fx-stroke-width: 2;");
        root.getChildren().add(temp);

        String capture = Integer.toString(task.getNumber());
        if (capture.length() < 2)
            capture = " " + capture;
        int taskTime= task.getExitTime() - task.getEntryTime();
        double prob = 0.1;
        prob = prob * taskTime/2 + 0.05;

        if(taskTime>1&&taskTime<=3) {
            prob+=taskTime*0.05;
        }

        Text texttemp = new Text(temp.getX() + temp.getWidth() * prob, temp.getY() + temp.getHeight() * 0.7, capture);

        texttemp.setFill(Color.BLACK);
        //texttemp.setRotate(270);
        texttemp.setFont(Font.font("Monaco", FontWeight.BOLD, 18));


        root.getChildren().add(texttemp);
    }

    public void drawTasks() {
        for (int i = 0; i < PROC_NUMBER; i++) {
            com.gantt.entity.Processor p = model.getProcessor(i);
            for (int j = 0; j < p.size(); j++) {
                drawTask(i, p.getTask(j));
            }
        }
    }

    public void drawAxes() {
        for (int i = 0; i < PROC_NUMBER; i++) {
            com.gantt.entity.Processor p = model.getProcessor(i);
            for (int j = 0; j < p.size(); j++) {
                if (p.getTask(j).getExitTime() > MAX_TIME)
                    MAX_TIME = p.getTask(j).getExitTime();
            }
        }

        Line line10 = new Line();
        line10.setStartX(START_X);
        line10.setStartY(START_Y);
        line10.setEndX(START_X);
        line10.setEndY(START_Y);
        line10.setStyle("-fx-stroke: green;  ");
        root.getChildren().add(line10);


        END_X = START_X + RATE_H * TASK_WEIGHT * MAX_TIME * 1.05;
        //double c =RATE_H*TASK_WEIGHT*(1-END_X%(RATE_H * TASK_WEIGHT*1.05));
        END_Y = START_Y + RATE_V * PROC_NUMBER * (TASK_HEIGHT + INTERVAL) * 1.05;

        for (int i = 0; i < PROC_NUMBER; i++) {
            Line lineTemp = new Line();
            lineTemp.setStartX(START_X);
            lineTemp.setStartY(START_Y + RATE_V * (i + 1) * (TASK_HEIGHT + INTERVAL));
            lineTemp.setEndX(END_X);
            lineTemp.setEndY(START_Y + RATE_V * (i + 1) * (TASK_HEIGHT + INTERVAL));
            lineTemp.setStyle("-fx-stroke: green; ");
            root.getChildren().add(lineTemp);
        }

        int istart = 1;
        int iinc = 1;
        int idesc = 5;

//        if(MAX_TIME>20&MAX_TIME<=50) {
////            istart = 2;
////            iinc = 2;
////            idesc = 10;
//            istart = 1;
//            iinc = 1;
//            idesc = 5;
//        }
//
//        if(MAX_TIME>100) {
//            istart = 5;
//            iinc = 5;
//            idesc = 10;
//        }

        for (int i = istart; i <= MAX_TIME; i=i+iinc) {
            Line lineTemp = new Line();
            lineTemp.setStartX(START_X + RATE_H * TASK_WEIGHT * i);
            lineTemp.setStartY(START_Y-3);
            lineTemp.setEndX(START_X + RATE_H * TASK_WEIGHT * i);
            lineTemp.setEndY(END_Y);
            lineTemp.setStyle("-fx-stroke: green;");

            if (i%idesc==0) {
                String capture = Integer.toString(i);
                if (capture.length() < 2)
                    capture = " " + capture;
                Text texttemp = new Text(START_X + RATE_H * TASK_WEIGHT * (i-0.15)-7,START_Y-8, capture);
                texttemp.setFill(Color.rgb(25, 25, 25));
                texttemp.setFont(Font.font("Monaco", FONT_HEIGHT));
                //lineTemp.setStyle("-fx-stroke: #8c8c8c;");

                root.getChildren().add(texttemp);

            }
            root.getChildren().add(lineTemp);
        }

        // Y axis
        Line line1 = new Line();
        line1.setStartX(START_X);
        line1.setStartY(START_Y);
        line1.setEndX(END_X-3);
        line1.setEndY(START_Y);
        line1.setStrokeWidth(1);
        line1.setStyle("-fx-stroke: red; -fx-stroke-width: 1;");
        root.getChildren().add(line1);

        // X axis
        Line line2 = new Line();
        line2.setStartX(START_X);
        line2.setStartY(START_Y);
        line2.setEndX(START_X);
        line2.setEndY(END_Y-3);
        line2.setStrokeWidth(1);
        line2.setStyle("-fx-stroke: red; -fx-stroke-width: 1;");
        root.getChildren().add(line2);


        // Right arrow
        double[] xint1 = {-15, -15};
        double[] yint1 = {-5, 5};
        for (int i = 0; i < xint1.length; i++) {
            Line l1 = new Line();
            l1.setStartX(END_X);
            l1.setStartY(START_Y);
            l1.setEndX(END_X + xint1[i]);
            l1.setEndY(START_Y + yint1[i]);
            l1.setStrokeWidth(1);
            l1.setStyle("-fx-stroke: black; -fx-stroke-width: 1;");
            root.getChildren().add(l1);
        }

        // Down arrow
        double[] xint2 = {-5, 5};
        double[] yint2 = {-15, -15};
        for (int i = 0; i < xint2.length; i++) {
            Line l2 = new Line();
            l2.setStartX(START_X);
            l2.setStartY(END_Y);
            l2.setEndX(START_X + xint2[i]);
            l2.setEndY(END_Y + yint2[i]);
            l2.setStrokeWidth(1);
            l2.setStyle("-fx-stroke: black; -fx-stroke-width: 1;");
            root.getChildren().add(l2);
        }

        for (int i = 0; i < PROC_NUMBER; i++) {
            String capture = "Processor "+Integer.toString(i);
            if (capture.length() < 2)
                capture = " " + capture;
            Text texttemp = new Text(0.1 * START_X, START_Y + RATE_V * ((i + 1) * (TASK_HEIGHT + INTERVAL) - 0.3 * TASK_HEIGHT), capture);
            texttemp.setFill(Color.rgb(0, 0, 0));
            texttemp.setFont(Font.font("Monaco", FONT_HEIGHT-5));


            root.getChildren().add(texttemp);
        }

        Text texttemp = new Text(START_X + (END_X-START_X)/2.5+5,START_Y-50, "Time line");
        texttemp.setFill(Color.rgb(0, 0, 0));
        texttemp.setFont(Font.font("Monaco", FONT_HEIGHT+5));


        root.getChildren().add(texttemp);
    }



}

