package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import javax.swing.*;
import java.util.Arrays;


public class Controller {

    private int[] arr;
    private String res = "", symbols;


    @FXML
    private TextField textFieldEnterElement, textFieldResult;
    @FXML
    private Button btnResult;
    @FXML
    private Button btnClear;

    @FXML
    public void initialize() {
        btnResult.setOnAction(e -> sortArray());
        btnClear.setOnAction(e -> clear());
    }

    private long firstTime, secondTime;
    public void sortArray() {
        symbols = textFieldEnterElement.getText();

        try {
            arr = Arrays.stream(symbols.split(" ")).mapToInt(Integer::parseInt).toArray();
            firstTime = System.nanoTime();
            for (int min = 0; min < arr.length - 1; min++) {
                int least = min;
                for (int j = min + 1; j < arr.length; j++) {
                    if (arr[j] < arr[least]) {
                        least = j;
                    }
                }
                int tmp = arr[min];
                arr[min] = arr[least];
                arr[least] = tmp;
            }

            for (int i = 0; i < arr.length; i++) {
                res += arr[i];
                res += " ";
            }
            textFieldResult.setText(res);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Please, enter correct data!");
        }
        secondTime = System.nanoTime();
        double endTime = secondTime - firstTime;
        //endTime /= 10E6;
        String resTime = Double.toString(Math.rint(endTime/10000.0) /1000.0);
        JOptionPane.showMessageDialog(null, resTime);
    }

    public void clear() {
        textFieldEnterElement.setText("");
        textFieldResult.setText("");
        res = "";
    }

}
