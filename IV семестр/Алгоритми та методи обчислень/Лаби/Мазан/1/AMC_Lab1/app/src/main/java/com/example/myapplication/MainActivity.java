package com.example.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final Button task1 = (Button) findViewById(R.id.task1_btn);
        final Button task2 = (Button) findViewById(R.id.task2_btn);
        final Button task3 = (Button) findViewById(R.id.task3_btn);

        final EditText task1_input_a = (EditText) findViewById(R.id.input_a);
        final EditText task1_input_b = (EditText) findViewById(R.id.input_b);
        final EditText task1_input_c = (EditText) findViewById(R.id.input_c);

        final EditText task2_input_k = (EditText) findViewById(R.id.input_k);
        final EditText task2_input_d = (EditText) findViewById(R.id.input_d);

        final EditText task3_input_arr_a = (EditText) findViewById(R.id.input_arr_a);
        final EditText task3_input_arr_b = (EditText) findViewById(R.id.input_arr_b);

        final TextView res_1 = (TextView) findViewById(R.id.result1);
        final TextView res_2 = (TextView) findViewById(R.id.result2);
        final TextView res_3 = (TextView) findViewById(R.id.result3);

        task1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
                double a = 0;
                double b = 0;
                double c = 0;

                try {
                    a = (new Parser(task1_input_a.getText().toString())).parseNumber();
                    b = (new Parser(task1_input_b.getText().toString())).parseNumber();
                    c = (new Parser(task1_input_c.getText().toString())).parseNumber();
                }
                catch (Exception e) {
                    Toast error_msg = Toast.makeText(MainActivity.this, e.getMessage() + "in input 1", Toast.LENGTH_LONG);
                    error_msg.show();
                    return;
                }
                try {
                    double res = (new Calculator()).calculate1(a,b,c);
                    res_1.setText(Double.toString(res));
                }
                catch (Exception e) {
                    res_1.clearComposingText();
                    Toast error_msg = Toast.makeText(MainActivity.this, e.getMessage(), Toast.LENGTH_LONG);
                    error_msg.show();
                }
            }
        });

        task2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
                double k = 0;
                double d = 0;
                try {
                    k = (new Parser(task2_input_k.getText().toString())).parseNumber();
                    d = (new Parser(task2_input_d.getText().toString())).parseNumber();
                }
                catch (Exception e) {
                    Toast error_msg = Toast.makeText(MainActivity.this, e.getMessage() + " in input 2", Toast.LENGTH_LONG);
                    error_msg.show();
                }
                try {
                    double res = (new Calculator()).calculate2(k,d);
                    res_2.setText(Double.toString(res));
                }
                catch (Exception e) {
                    res_1.clearComposingText();
                    Toast error_msg = Toast.makeText(MainActivity.this, e.getMessage(), Toast.LENGTH_LONG);
                    error_msg.show();
                }
            }
        });

        task3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v){
                double[] a_arr = new double[1];
                double[] b_arr = new double[1];
                try {
                    a_arr = (new Parser(task3_input_arr_a.getText().toString())).parseArray();
                    b_arr = (new Parser(task3_input_arr_b.getText().toString())).parseArray();
                }
                catch (Exception e) {
                    Toast error_msg = Toast.makeText(MainActivity.this, e.getMessage() + " in input 3", Toast.LENGTH_LONG);
                    error_msg.show();
                }
                double res = (new Calculator()).calculate3(a_arr,b_arr);
                res_3.setText(Double.toString(res));
            }
        });
    }
}
