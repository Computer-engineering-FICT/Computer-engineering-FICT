package Lab4;

import org.apache.commons.math.FunctionEvaluationException;
import org.apache.commons.math.analysis.UnivariateRealFunction;

public class LaplasFunction implements UnivariateRealFunction {

	@Override
	public double value(double t) throws FunctionEvaluationException {
		return 1/Math.pow(Math.E, t*t/2);
	}

}
