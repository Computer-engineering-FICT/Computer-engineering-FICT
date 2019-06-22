package com.labworks.lab5

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*
import android.content.Context
import android.content.DialogInterface
import android.text.Html
import android.widget.Toast
import java.math.RoundingMode
import java.text.DecimalFormat


class MainActivity : AppCompatActivity() {
    var context: Context = this@MainActivity
    var equation: EquationsSystem? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

    }

    fun solveEquations(v: View) {
        val epsilon: Double
        try {
            epsilon = input_epsilon.text.toString().toDouble()
            val coefficients = mutableListOf(
                arrayOf(
                    ir0c0.text.toString().toDouble(),
                    ir0c1.text.toString().toDouble(),
                    ir0c2.text.toString().toDouble()
                ),
                arrayOf(
                    ir1c0.text.toString().toDouble(),
                    ir1c1.text.toString().toDouble(),
                    ir1c2.text.toString().toDouble()
                ),
                arrayOf(
                    ir2c0.text.toString().toDouble(),
                    ir2c1.text.toString().toDouble(),
                    ir2c2.text.toString().toDouble()
                )
            )
            val freeVals = arrayOf(
                ir0c3.text.toString().toDouble(),
                ir1c3.text.toString().toDouble(),
                ir2c3.text.toString().toDouble()
            )

            equation = EquationsSystem(coefficients, freeVals)
        } catch (e: Exception) {
            Toast.makeText(baseContext, R.string.input_error, Toast.LENGTH_SHORT).show()
            return
        }
        if (equation!!.solutionConverges(equation!!.A)) {
            val results = equation!!.solve(epsilon)
            buildResult(results, epsilon)
        } else {
            val title = "Попередження"
            val message = R.string.warning
            val ad: AlertDialog.Builder
            val button1String = "Так"
            val button2String = "Ні"
            ad = AlertDialog.Builder(context)
            ad.setTitle(title)
            ad.setMessage(message)
            ad.setPositiveButton(button1String,
                { dialog: DialogInterface, arg1: Int ->
                    try {
                        val converger = MakeConvergent(equation!!)
                        equation = converger.correctEquation
                        Toast.makeText(context, R.string.good_choice, Toast.LENGTH_SHORT).show()
                        buildResult(equation!!.solve(epsilon), epsilon)
                    }
                    catch (e: java.lang.ArithmeticException) {
                        resolveAnyway(epsilon)
                    }
                    catch (e: Exception) {
                        return@setPositiveButton
                    }

                })
            ad.setNegativeButton(button2String, { dialog: DialogInterface, arg1: Int ->
                Toast.makeText(context, R.string.probably_good_choice, Toast.LENGTH_SHORT).show()
            })

            val alert = ad.create()
            alert.show()
            }
    }

    fun resolveAnyway(epsilon: Double) {
        val ad = AlertDialog.Builder(context)
        ad.setTitle("Попередження 2")
        ad.setMessage(R.string.unresolvable)
        val button1String = "Так"
        val button2String = "Ні"
        ad.setPositiveButton(button1String, { dialog: DialogInterface, arg1: Int ->
            Toast.makeText(context, R.string.bad_choice, Toast.LENGTH_SHORT).show()
            val res = equation!!.solveUnconvergent(epsilon)
            buildResult(res, epsilon)
        })
        ad.setNegativeButton(button2String, { dialog: DialogInterface, arg1: Int ->
            Toast.makeText(context, R.string.good_choice, Toast.LENGTH_SHORT).show()
            return@setNegativeButton
        })
        val alert = ad.create()
        alert.show()
    }

    fun buildResult(result: Array<Double>, epsilon: Double) {
        val txt = java.lang.Double.toString(Math.abs(epsilon))
        val integerPlaces = txt.indexOf('.')
        val decimalPlaces = txt.length - integerPlaces - 1
        val pattern = "#." + ("#".repeat(decimalPlaces))
        val format = DecimalFormat(pattern)
//        val precision = if (epsilon.toString().length - 1 - epsilon.toString().indexOf(".") > 0) epsilon.toString().length - 1 - epsilon.toString().indexOf(".") else 1
//        Toast.makeText(context, decimalPlaces.toString(), Toast.LENGTH_SHORT).show()
        val text = Html.fromHtml("<br>x<sub>1</sub> = ${format.format(result[0])} ± ε;</br>" +
                "<br>x<sub>2</sub> = ${format.format(result[1])} ± ε;</br>" +
                "<br>x<sub>3</sub> = ${format.format(result[2])} ± ε</br>")
        view_result.text = text
    }
}
