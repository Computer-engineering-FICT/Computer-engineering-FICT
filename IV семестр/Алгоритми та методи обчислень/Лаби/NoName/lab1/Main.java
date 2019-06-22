package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;

public class Main extends Application {

    private Stage stage;
    private Scene scene;
    private AnchorPane pane;

    @Override
    public void start(Stage stage) {
        this.stage = stage;
        try {
            pane = FXMLLoader.load(Main.class.getResource("amo_lab1.fxml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        scene = new Scene(pane, 440, 300);
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
