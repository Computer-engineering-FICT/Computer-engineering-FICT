package com.labworks.amc_lab3
import com.jjoe64.graphview.series.DataPoint
import com.jjoe64.graphview.series.LineGraphSeries

/**
 * Interface for my classes to make them return onClick points
 */
@FunctionalInterface
interface Drawable {
    fun pointsList() : LineGraphSeries<DataPoint>
}