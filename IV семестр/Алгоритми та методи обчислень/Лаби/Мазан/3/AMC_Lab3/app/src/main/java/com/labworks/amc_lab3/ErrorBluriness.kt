package com.labworks.amc_lab3

import com.jjoe64.graphview.series.DataPoint
import com.jjoe64.graphview.series.LineGraphSeries

class ErrorBluriness(val polynomeP: NewtonInterpolation) : Drawable {
    val polynomePow: Int = polynomeP.array.n
    val polynomePplusOne: NewtonInterpolation = NewtonInterpolation(InterpolationObject(polynomePow+1,polynomeP.array.minRange,polynomeP.array.maxRange,polynomeP.array.function))
    val polynomePplusTwo: NewtonInterpolation = NewtonInterpolation(InterpolationObject(polynomePow+2,polynomeP.array.minRange,polynomeP.array.maxRange,polynomeP.array.function))

    val deltaN: List<Double> = List(polynomeP.plotArgs.size, {i -> polynomeP.plotVals[i]-polynomePplusOne.plotVals[i]})
    val deltaDeltaN: List<Double> = List(polynomeP.plotArgs.size, {i -> polynomePplusOne.plotVals[i]-polynomePplusTwo.plotVals[i]})
    val interpolationBluriness: List<Double> = List(polynomeP.plotArgs.size, {i -> if (deltaN[i] != 0.0) Math.abs(deltaDeltaN[i]/deltaN[i]) else 0.0})

    fun getBluriness() : List<Double> {
        return interpolationBluriness
    }

    val deltaExactN: List<Double> = List(polynomeP.plotArgs.size, {i -> polynomeP.plotVals[i] - polynomeP.array.function(polynomeP.plotArgs[i])})
    val kDelta: List<Double> = List(polynomeP.plotArgs.size, {i -> if (deltaN[i] != 0.0) 1 - deltaExactN[i]/deltaN[i] else 0.0})

    override fun pointsList(): LineGraphSeries<DataPoint> {
        return LineGraphSeries(Array<DataPoint>(polynomeP.plotArgs.size, {i -> DataPoint(polynomeP.plotArgs[i],interpolationBluriness[i])}))
    }
}