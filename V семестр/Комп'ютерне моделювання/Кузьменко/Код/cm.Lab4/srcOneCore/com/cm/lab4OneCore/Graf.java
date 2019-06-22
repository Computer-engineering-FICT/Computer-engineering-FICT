package com.cm.lab4OneCore;

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
	double [][] matrixGraf;
	private double[] prop;

	public void config() {
		Device proc = new Device(1,//id
				4,//queue
				1,//resource
				0,//free cores
				"Процесор",//name 
				1.0//mean time (not lambda!!!)
				);
		Device nourthBridge = new Device(2, 0, 0, 1, "Північний міст", 1.5);
		Device southBridge = new Device(3, 0, 0, 1, "Південний міст", 2.0);
		Device ram = new Device(4, 0, 0, 1, "Ram", 4.0);
		Device videoProc = new Device(5, 0, 0, 1, "Відео процесор", 40.0);
		Device graphProc = new Device(6, 0, 0, 1, "GraphicProc", 0.5);
		Device audioProc = new Device(7, 0, 0, 1, "Audio Proc", 35.0);
		
		
		proc.linkOutDevice(proc, nourthBridge);
		proc.linkOutProbability(0.7, 0.3);

		nourthBridge.linkOutDevice(proc, southBridge, ram,graphProc);
		nourthBridge.linkOutProbability(0.15, 0.25, 0.35,0.25);


		
		southBridge.linkOutDevice(videoProc,nourthBridge,audioProc);
		southBridge.linkOutProbability(0.4,0.25,0.35);
		
		ram.linkOutDevice(nourthBridge);
		ram.linkOutProbability(1.0);

		videoProc.linkOutDevice(proc);
		videoProc.linkOutProbability(1.0);
		
		graphProc.linkOutDevice(nourthBridge);
		graphProc.linkOutProbability(1.0);
		
		audioProc.linkOutDevice(proc);
		audioProc.linkOutProbability(1.0);

		State head = new State(proc, nourthBridge, southBridge, ram, videoProc, graphProc, audioProc);
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
		
		int levelIndex=0;
		do {

			nextLevel = new Level(i + 1, this);
			previousLevel.buildNextLevel(nextLevel);
			i++;
			previousLevel = nextLevel;
			s = s + previousLevel.size();
			previousLevel.printLevel();
			levelIndex++;
		} while (previousLevel.isEnd());

		
		
		
		System.out.println("E N D");

		System.out.println("Cтанів " + uniqueStates.size());
		System.out.println("Переходів " + uniqueArcs.size());
		
		System.out.println(levelIndex);

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
		matrixGraf = res;
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
		double[] loading = new double[8];
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
		
		System.out.println("Процесор           "+String.format("%3.15f", loading[1]));
		System.out.println("Північний міст     "+String.format("%3.15f", loading[2]));
		System.out.println("Південний міст     "+String.format("%3.15f", loading[3]));
		System.out.println("Оперативна пам*ять "+String.format("%3.15f", loading[4]));
		System.out.println("Відео процесор     "+String.format("%3.15f", loading[5]));
		System.out.println("Графічний процесор "+String.format("%3.15f", loading[6]));
		System.out.println("Аудіо процесор     "+String.format("%3.15f", loading[7]));
		

		double max =0;
		int indexMax=0;
		for (int i = 0; i < prop.length; i++) {
			if (prop[i]>max){
				max = prop[i];
				indexMax = i;
			}
		}
		
		uniqueStates.get(3).printState();
		
		
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
