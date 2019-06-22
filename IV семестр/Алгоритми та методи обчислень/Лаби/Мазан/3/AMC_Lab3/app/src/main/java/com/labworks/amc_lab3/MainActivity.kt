package com.labworks.amc_lab3

import android.graphics.Color
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.jjoe64.graphview.LegendRenderer
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    enum class Functions {
        SIN, FUNC
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        graph.getViewport().setScrollable(true)
//        graph.getViewport().setScrollableY(true)
        graph.getViewport().setXAxisBoundsManual(true)

    }

    //show test function sin(x)
    fun plot(interpolate: InterpolationObject) {
        val interpolated = NewtonInterpolation(interpolate)

        val rawFunction = interpolate.pointsList()
        rawFunction.setColor(Color.GREEN)
        rawFunction.setThickness(3)
        rawFunction.setTitle("Функція-оригінал");

        val interpolatedFunction = interpolated.pointsList()
        interpolatedFunction.setColor(Color.RED)
        interpolatedFunction.setThickness(3)
        interpolatedFunction.setTitle("Інтерпольована функція")



        graph.addSeries(rawFunction)
        graph.addSeries(interpolatedFunction)

        graph.getLegendRenderer().setVisible(true)
        graph.getLegendRenderer().setAlign(LegendRenderer.LegendAlign.TOP)
    }


    fun plotInfelicity (obj: InterpolationObject) {
        val infelicity = NewtonInterpolation(obj)
        val infelicityPlot = infelicity.pointsInfelicityList()

        val bluriness = ErrorBluriness(infelicity)
        val blurinessPlot = bluriness.pointsList()
        infelicityPlot.setColor(Color.parseColor("#A50021"))
        blurinessPlot.setColor(Color.parseColor("#E8ff00"))
        infelicityPlot.setTitle("Абсолютна похибка")
        blurinessPlot.setTitle("Розмитість похибки")
        infelicityPlot.setThickness(3)
        blurinessPlot.setThickness(3)

        graph_infelicity.addSeries(infelicityPlot)
        graph_infelicity_bluriness.addSeries(blurinessPlot)

        graph_infelicity.getLegendRenderer().setVisible(true)
        graph_infelicity.getLegendRenderer().setAlign(LegendRenderer.LegendAlign.BOTTOM)

        graph_infelicity_bluriness.getLegendRenderer().setVisible(true)
        graph_infelicity_bluriness.getLegendRenderer().setAlign(LegendRenderer.LegendAlign.TOP)
    }

    fun onClick(view: View) {
        val n: Int
        val minRange: Double
        val maxRange: Double
        try {
            n = power.text.toString().toInt()
            minRange = min_val.text.toString().toDouble()
            maxRange = max_val.text.toString().toDouble()
        } catch (e: Exception) {
            Toast.makeText(this, "Please input correct interpolation values!", Toast.LENGTH_LONG).show()
            return
        }
        val state = if (function_type.selectedItem.toString() == "sin x") Functions.SIN else Functions.FUNC

        graph.setVisibility(View.VISIBLE)
        graph_infelicity.setVisibility(View.VISIBLE)
        graph_infelicity_bluriness.setVisibility(View.VISIBLE)

        graph.getViewport().setYAxisBoundsManual(true)
        graph.getViewport().setXAxisBoundsManual(true)
        graph.getViewport().setMinX(minRange-0.5)
        graph.getViewport().setMaxX(maxRange+0.5)

        graph_infelicity.getViewport().setXAxisBoundsManual(true)
        graph_infelicity.getViewport().setMinX(minRange-0.5)
        graph_infelicity.getViewport().setMaxX(maxRange+0.5)

        graph_infelicity_bluriness.getViewport().setYAxisBoundsManual(true)
        graph_infelicity_bluriness.getViewport().setMaxY(10.0)

        graph.removeAllSeries()
        graph_infelicity.removeAllSeries()
        graph_infelicity_bluriness.removeAllSeries()
        if (state == Functions.SIN) {
            val interpolateSin = InterpolationObject(n,minRange,maxRange, sin)
            graph.getViewport().setMinY(-1.5)
            graph.getViewport().setMaxY(1.5)
            plot(interpolateSin)
            plotInfelicity(interpolateSin)
        }
        else {
            val interpolateFunc = InterpolationObject(n,minRange,maxRange, ourFunc)
            graph.getViewport().setMinY(ourFunc(maxRange) - 1)
            graph.getViewport().setMaxY(ourFunc(minRange) + 1)
            plot(interpolateFunc)
            plotInfelicity(interpolateFunc)
        }
    }
}
