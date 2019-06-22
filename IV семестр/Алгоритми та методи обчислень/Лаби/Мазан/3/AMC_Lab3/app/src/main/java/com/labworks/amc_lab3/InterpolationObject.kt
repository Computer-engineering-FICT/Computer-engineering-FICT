package com.labworks.amc_lab3

import android.widget.Toast
import com.jjoe64.graphview.series.DataPoint
import com.jjoe64.graphview.series.LineGraphSeries

/**
 * Class to collect data necessary to a successful function interpolation
 * @author Yan Mazan
 *
 * @param n         power of our Newton's interpolation polynome
 * @param minRange  starting argument of interpolated function
 * @param maxRange  ending argument of interpolated function
 * @param function  a function to interpolate
 */
class InterpolationObject (val n: Int, val minRange: Double, val maxRange:Double, val function: (x:Double) -> Double) : Drawable {
    val delta = (maxRange - minRange)/n
    val keyArgums: MutableList<Double> = (0..n).map({i -> minRange + delta*i}).toMutableList()
    val keyVals: MutableList<Double> = keyArgums.map(function).toMutableList()

    /**
     * Plot of basic function
     * @override Function pointsList of basic interface Drawab
     * @return Points of raw function onClick within the given range
     */
    override fun pointsList(): LineGraphSeries<DataPoint> {
        val difference = (maxRange-minRange)/1000
        val plotArgs: List<Double> = List(1000, {i -> minRange + difference*i})
        val plotVals: List<Double> = List(1000, {i -> function(plotArgs[i])})
        return LineGraphSeries(Array<DataPoint>(1000, {i -> DataPoint(plotArgs[i],plotVals[i])}))
    }
}