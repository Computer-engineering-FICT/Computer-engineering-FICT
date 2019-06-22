package com.diuk.pt.labwork2;

import java.util.List;
import java.util.Collection;
import java.util.LinkedList;
import java.util.ArrayList;
import java.util.Iterator;

public class DiscreteOperations {
	static public double M(Collection<Double> numbers){
		double M =0;
		
		Iterator<Double> it = numbers.iterator();
		while (it.hasNext()){
			M += it.next();
		}
		
		M /= numbers.size();
		
		return M;
	}
	
	static public double D(Collection<Double> numbers){
		double D = 0;
		double M = DiscreteOperations.M(numbers);
		
		Iterator<Double> it = numbers.iterator();
		while (it.hasNext()){
			D += Math.pow(it.next() - M, 2);
		}
		
		D /= numbers.size();
		
		return D;
	}
	
	static public double Q(Collection<Double> numbers){
		double Q = DiscreteOperations.D(numbers);
		Q = Math.sqrt(Q);
		return Q;
	}
}
