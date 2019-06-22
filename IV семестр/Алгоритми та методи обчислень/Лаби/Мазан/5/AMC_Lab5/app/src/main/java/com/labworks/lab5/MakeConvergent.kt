package com.labworks.lab5

class MakeConvergent(system: EquationsSystem) {
    val correctEquation = makeConvergent(system)

    /**
     * @return convergent variant of input matrix
     */
    fun makeConvergent(equation: EquationsSystem) : EquationsSystem {
        val coeffs_matrix = equation.A
        val free_vals = equation.B
        val joint_matrix = Array(coeffs_matrix.size, {i -> coeffs_matrix[i].plus(free_vals[i])})
        val rowsCollection = joint_matrix.toMutableList()
        val permutations = PermutationIterator(rowsCollection)// Collections2.permutations(rowsCollection)
        while (permutations.hasNext()) {
            val el = permutations.next()
            val elFreeVals = Array(el.size, {i -> el[i].last()})
            val elCoeffs = el.map({elem -> elem.dropLast(1).toTypedArray()}).toMutableList()
            if (equation.solutionConverges(elCoeffs)) {
                //split free_vals and coefficients in equations
                val coeffs = elCoeffs
                val free_values = Array(coeffs_matrix.size, { i -> el[i].last()})
                return EquationsSystem(coeffs, free_values)
            }
        }
        val a = equation.A
        val b = equation.B
        var iterations_num = 0
//        while (!equation.solutionConverges(a, b)) {
//            println(iterations_num++)
//            println(EquationsSystem(newA, newB))
//            val newEquation = randomAction(a, b)
//            newA = newEquation[0] as MutableList<Array<Double>>
//            newB = newEquation[1] as Array<Double>
//        }
//        println(iterations_num)
//        return listOf(newA, newB)
        throw ArithmeticException("Matrix can't be made converged")
    }
}