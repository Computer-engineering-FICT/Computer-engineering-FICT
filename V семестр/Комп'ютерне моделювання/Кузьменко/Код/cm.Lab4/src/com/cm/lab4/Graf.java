package com.cm.lab4;

import java.util.ArrayList;

import Jama.Matrix;

import sun.launcher.resources.launcher;
import static java.lang.Math.*;

public class Graf {

	ArrayList<State> uniqueStates = new ArrayList<State>();
	ArrayList<Transition> uniqueArcs = new ArrayList<Transition>();
	public int nodeCount = 1;
	public int arcCount = 1;
	Level previousLevel;

	private double[] prop;

	public void config() {
		Device proc = new Device(1,//ідентифікатор
				4,//черга
				2,//ресурс
				0,//вільні ядра
				"Процесор",//назва 
				0.25//середній час
				);
		Device nourthBridge = new Device(2, 0, 0, 1, "Північний міст", 19.0);
		Device southBridge = new Device(3, 0, 0, 1, "Південний міст", 65.0);
		Device ram = new Device(4, 0, 0, 1, "Ram", 0.5);
		Device videoProc = new Device(5, 0, 0, 1, "Відео процесор", 68);

		
		
		proc.linkOutDevice(proc, nourthBridge);
		proc.linkOutProbability(0.85, 0.15);

		nourthBridge.linkOutDevice(proc, southBridge, ram);
		nourthBridge.linkOutProbability(0.1, 0.4, 0.5);

		ram.linkOutDevice(nourthBridge);
		ram.linkOutProbability(1.0);

		southBridge.linkOutDevice(videoProc);
		southBridge.linkOutProbability(1.0);

		videoProc.linkOutDevice(proc);
		videoProc.linkOutProbability(1.0);

		State head = new State(proc, nourthBridge, southBridge, ram, videoProc);
		uniqueStates.add(head);
		Level headLevel = new Level(0, this);
		headLevel.add(head);

		previousLevel = headLevel;

	}

	public void buildTree() {
		Level nextLevel;
		int i = 0;
		previousLevel.printLevel();
		int s = 0;
		s = s + previousLevel.size();
		do {

			nextLevel = new Level(i + 1, this);
			previousLevel.buildNextLevel(nextLevel);
			i++;
			previousLevel = nextLevel;
			s = s + previousLevel.size();
			previousLevel.printLevel();
		} while (previousLevel.isEnd());

		
		System.out.println("E N D");

		System.out.println("Cтанів " + uniqueStates.size());
		System.out.println("Переходів " + uniqueArcs.size());

	}

	public int findThisState(State state) {
		int p = -1;
		for (State stt : uniqueStates) {
			if (stt.equals(state)) {
				p = stt.id;
				break;
			}
		}
		return p;
	}

	public int findThisArc(Transition transition) {
		int p = -1;
		for (Transition arc : uniqueArcs) {
			if (arc.equals(transition)) {
				p = arc.id;
				break;
			}
		}
		return p;
	}

	public double[][] buildUnceasingGraf() {
		double[][] matrixTransit = new double[uniqueStates.size()][uniqueStates
				.size()];
		for (Transition transition : uniqueArcs) {
			if (transition.tallNode != transition.headNode) {
				
				matrixTransit[transition.headNode][transition.tallNode] = transition.lambda
						* transition.probability;
			}
		}
		
		return matrixTransit;

	}

	public double[][] buildDuskrGraf(double[][] graf, double dt) {
		double[][] res = new double[graf.length][graf[0].length];

		for (int i = 0; i < res.length; i++) {
			for (int j = 0; j < res[0].length; j++) {
				if (graf[i][j] != 0)
					res[i][j] = 1 - exp(-1.0 * graf[i][j] * dt);
			}
		}

		return res;
	}

	public void calcPropability(double[][] balansMatrix) {
		double[] cnst = new double[balansMatrix.length];
		cnst[0]=1.0;
		prop = new double[cnst.length];
		Matrix balansSystem = new Matrix(balansMatrix);
		Matrix balansVector = new Matrix(cnst,cnst.length);
		Matrix result = balansSystem.solve(balansVector);
		double [][] res =result.getArray();
		for (int i = 0; i < res.length; i++) {
			prop[i] = res[i][0];
		}
	
	}

	public void calcLoadingDevice() {
		double[] loading = new double[6];
		for (State d : uniqueStates) {
			for (int i = 0; i < d.devices.length; i++) {
				if (d.devices[i].resource!=0){
					if (d.devices[i].resource==1){
						loading[d.devices[i].id]+=prop[d.id];						
					}else{
						if(d.devices[i].resource==2){
							loading[0]+=prop[d.id];							
						}
					}
				}
			}
		}
		double sum = 0;
		for (int i = 0; i < loading.length; i++) {
			sum +=loading[i];
			
		}
		for (int i = 0; i < loading.length; i++) {
			loading[i] = (loading[i]/sum)*100;
		}
		
		System.out.println("Одне Ядро          "+String.format("%3.15f", loading[1]));
		System.out.println("Два Ядра           "+String.format("%3.15f", loading[0]));
		System.out.println("Північний міст     "+String.format("%3.15f", loading[2]));
		System.out.println("Південний міст     "+String.format("%3.15f", loading[3]));
		System.out.println("Оперативна пам*ять "+String.format("%3.15f", loading[4]));
		System.out.println("Відео процесор     "+String.format("%3.15f", loading[5]));
		
		double max =0;
		int indexMax=0;
		for (int i = 0; i < prop.length; i++) {
			if (prop[i]>max){
				max = prop[i];
				indexMax = i;
			}
		}
		
		uniqueStates.get(indexMax).printState();
		System.out.println();
		
	}

	public double[][] buildBalansSystem(double[][] graf) {
		int n = graf.length;
		double[][] res = new double[n][n];
		for (int i = 0; i < res[0].length; i++) {
			res[0][i] = 1.0;
		}
		for (int i = 1; i < n; i++) {

			double s = 0.0;
			for (int j = 0; j < n; j++) {
				if (graf[i][j] != 0)
					s += graf[i][j];
			}
			s *= -1.0;
			res[i][i] = s;
			for (int j = 0; j < n; j++) {
				if (graf[j][i] != 0)
					res[i][j] = graf[j][i];
			}

		}
		return res;
	}
	
	
	

}
