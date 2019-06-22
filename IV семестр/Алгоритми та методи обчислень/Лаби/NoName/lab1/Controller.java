package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;


public class Controller {

    private int i, q, d, u, x, p, c, h;
    private double resRozgMethod, resLineMethod;

    @FXML
    private Button btnRes, btnResRoz, btnResCycle;
    @FXML
    private TextField textFieldResult, textFieldResultCycles, textFieldResultRozgal;
    @FXML
    private TextField textFieldA, textFieldB, textFieldI, textFieldQ, textFieldD, textFieldU, textFieldX, textFieldP, textFieldC, textFieldH, textFieldN;

    @FXML
    public void initialize() {
        btnRes.setOnAction(e -> lineMethod());
        btnResRoz.setOnAction(e -> rozgalMethod());
        btnResCycle.setOnAction(e -> cycleMethod());
    }


    private void cycleMethod() {
        double helpVar = 1.0, res = 1.0;
        try {
            int n = Integer.parseInt(textFieldN.getText());
            for (double a = 1.0; a <= n; a += 0.25) {
                for (double b = 2.0; b <= n; b++) {
                    if (a == b) continue;
                    res *= (Math.pow(a, 4) + Math.pow(b, 4)) / (Math.pow(a, 4) - Math.pow(b, 4));
                }
                //res = Math.round(res);     CRUTCH
                helpVar *= res;
                res = 1.0;
            }
            textFieldResultCycles.setText(String.valueOf(helpVar));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void rozgalMethod() {
        try {
            i = Integer.parseInt(textFieldI.getText());
            q = Integer.parseInt(textFieldQ.getText());
            d = Integer.parseInt(textFieldD.getText());
            u = Integer.parseInt(textFieldU.getText());
            x = Integer.parseInt(textFieldX.getText());
            p = Integer.parseInt(textFieldP.getText());
            c = Integer.parseInt(textFieldC.getText());
            h = Integer.parseInt(textFieldH.getText());
            if (i % 3 == 0) {
                resRozgMethod = ((Math.pow(q, i) * d) / (Math.sqrt(u + x))) + ((Math.pow(p, i) * d) / (Math.sqrt(c + h)));
            } else {
                resRozgMethod = ((u * d) / (Math.sqrt(Math.pow(q, i) + x))) + ((c * d) / (Math.sqrt(Math.pow(p, i) + h)));
            }
            textFieldResultRozgal.setText(String.valueOf(resRozgMethod));
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private void lineMethod() {
        double firstUnit, thirdUnit, A, B;
        try {
            A = Integer.parseInt(textFieldA.getText());
            B = Integer.parseInt(textFieldB.getText());
            firstUnit = ((A / B) - 5) / 2;
            thirdUnit = Math.sqrt(((B / A) + 5) / 3);
            resLineMethod = firstUnit + thirdUnit;
            textFieldResult.setText(String.valueOf(resLineMethod));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
