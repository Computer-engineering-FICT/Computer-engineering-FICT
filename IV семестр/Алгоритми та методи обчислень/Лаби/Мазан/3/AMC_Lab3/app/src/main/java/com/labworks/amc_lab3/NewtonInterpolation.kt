package com.labworks.amc_lab3

import com.jjoe64.graphview.series.DataPoint
import com.jjoe64.graphview.series.LineGraphSeries
import java.lang.ArithmeticException

/**
 * Class which performs all interpolation operations
 * @author Yan Mazan
 *
 * @param array InterpolationObject to interpolate
 */
class NewtonInterpolation (val array: InterpolationObject) : Drawable {

    val polynomeCoeff: List<Double> = dividedDifferenceList()
    val plotArgs: List<Double> = calculatePlotArgs()
    val plotVals: List<Double> = calculatePlotVals()
    val infelicityVals: List<Double> = calculateInfelicity()


    /**
     * Calculation of divided differences constant f(x0...xk) that is used to calculate Newton's interpolation polynome
     * @param k - order of divided difference k in f(x0...xk), k <= n of array
     * @throws ArithmeticException if k > n
     * @return res = sum(i = 0 to k) f(x_i)/(x[i]-x[0])(x[i]-x[1])...(x[i]-x[i-1])(x[i]-x[i+1])...(x[i]-x[k])
     */
    fun dividedDifference (k: Int) : Double {
        if (k > array.n)
            throw ArithmeticException("k must be smaller than n!")
        var res = 0.0
        for (i in 0..k) {
            var part_sum = 0.0
            val denominator = (0..k)
                .map({j -> if (i!=j) array.keyArgums[i]-array.keyArgums[j] else 1.0})
                .fold(1.0){multipl,el -> multipl*el}
            res += array.keyVals[i]/denominator
        }
        return res
    }

    /**
     * Calculation of divided differences constants list that is used to calculate Newton's interpolation polynome
     * @return List of divided differences f(x0...xk) where k belongs to range [0,n]
     */
    fun dividedDifferenceList() : List<Double> {
        return List(array.n, {i -> dividedDifference(i)})
    }

    /**
     * @param array: [x0, x1, x2, ..., xn]
     * @input k - number of elements to truncate
     * @returns EG:
     *          polynomeArgs(0) = []
     *          polynomeArgs(3) = [x0, x1, x2]
     */
    private fun polynomeArgs(k: Int) : List<Double> {
        return array.keyArgums.dropLast(array.n-k+1)
    }

    /**
     * Calculates value of function using interpolation polynome
     * @input x - argument of Newton's polynome
     * @returns N(x) ~= f(x) where f is interpolated function
     */
    fun calculate (x: Double) : Double {
        var res = polynomeCoeff[0]
        for (i in 1..array.n-1) {
            res+=polynomeCoeff[i]*polynomeArgs(i).map({e -> x - e}).fold(1.0){multipl,el -> multipl*el}
        }
        return res
    }

    /**
     * Privately calculates 1000 arguments in our given class range to onClick then
     * @return List of arguments
     */
    private fun calculatePlotArgs() : List<Double> {
        val delta = (array.maxRange - array.minRange)/400
        return List(400, {i -> array.minRange + delta*i})
    }

    /**
     * Calculates values of interpolation function to onClick them
     * @return List of values of interpolation function depending of argument
     */
    private fun calculatePlotVals() : List<Double> {
        //println(plotArgs)
        return List(400, {i -> calculate(plotArgs[i])})
    }

    /**
     * Measures error value by calculating difference between real and interpolated values
     * @return list of differences (realValue - interpolatedValue)
     */
    private fun calculateInfelicity() : List<Double> {
        return List(400, {i -> plotVals[i] - array.function(plotArgs[i])})
    }

    /**
     * Plot of interpolated function
     * @override Function pointsList of basic interface Drawable
     * @return Points of interpolated function onClick within the given range
     */
    override fun pointsList(): LineGraphSeries<DataPoint> {
        val returnList: Array<DataPoint> = Array(400, {i -> DataPoint(plotArgs[i],plotVals[i])})
        return LineGraphSeries(returnList)
    }

    /**
     * Plot of interpolated function infelicity
     * @return Points of interpolated function onClick within the given range
     */
    fun pointsInfelicityList() : LineGraphSeries<DataPoint> {
        val returnList: Array<DataPoint> = Array(400, {i -> DataPoint(plotArgs[i],infelicityVals[i])})
        return LineGraphSeries(returnList)
    }
}