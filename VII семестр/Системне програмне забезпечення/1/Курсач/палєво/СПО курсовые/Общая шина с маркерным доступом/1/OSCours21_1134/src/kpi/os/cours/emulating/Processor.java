package kpi.os.cours.emulating;

import java.util.ArrayList;
import java.util.HashSet;

import kpi.os.cours.forms.Interval;
import kpi.os.cours.forms.IntervalType;
import kpi.os.cours.graph.Edge;
import kpi.os.cours.graph.Task;

public class Processor {
	private int num;					//Номер процессора
	
	//Очередь вычислений
	private ArrayList<Task> procQueue;	//Очередь выполнения заданий
	private Task currentTask;			//Текущее задание
	private int remainProcTime = 0;		//Время до конца текущего задания
	
	//Очередь передач
	private ArrayList<Edge> transQueue;	//Очередь выполнения пересылок
	private Edge currentTrans;			//Текущая пересылка
	private int remainTransTime = 0;		//Время до конца текущей пересылки
	
	private int curTime = 0;			//Время моделирования
	
	private boolean marker = false;		//Наличие маркера
	private Edge markerTrans = null;	//Ребро передачи
	
	private boolean transferable = true;//Может ли участвовать в пересылке
	
	private HashSet<Task> receivedData;
	
	ArrayList<Interval> history;		//История всех событий
	
	public Processor(int num, ArrayList<Task> tasks) {
		this.num = num;
		this.procQueue = tasks;
		
		history = new ArrayList<Interval>();
		curTime = 0;
		receivedData = new HashSet<Task>();
	}
	
	public void makeStep() {
		curTime++;
		
		manageProc();
		manageTrans();
	}
	
	/**
	 * Обслуживание вычислительных задач
	 */
	public void manageProc() {
		//if processor is free
		if (remainProcTime == 0) {
			tryScheduleTask();
		}

		if (remainProcTime > 0){
			remainProcTime--;
			
			//if task is finished in this moment
			if (remainProcTime == 0) {
				transQueue.addAll(currentTask.getOutEdges());
			}
		}
		
	}
	
	/**
	 * Обслуживание передач
	 */
	public void manageTrans() {
		//not transfers in this moment
		if (remainTransTime == 0) {
			tryScheduleTrans();
		}
	}

	//===========Task service=============
	private void tryScheduleTask() {
		//if we have some tasks in queue
		if (procQueue.size() > 0) {
			Task tempT = procQueue.get(0);
			
			if (isTaskReady(tempT)) {
				setTask(tempT);
				procQueue.remove(0);
			}
		}
	}
	
	/**
	 * Task is ready if all required data is received
	 * @param task	exemined task
	 * @return	ready of task
	 */
	private boolean isTaskReady(Task task) {
		for (Edge t : task.getInEdges()) {
			if (!receivedData.contains(t.getEnd())) {
				return false;
			}
		}
		
		return true;
	} 
	
	/**
	 * Start of task processing
	 * @param task processing task
	 */
	private void setTask(Task task) {
		remainProcTime = task.getWeight();
		currentTask = task;
		
		history.add(new Interval(curTime, curTime + task.getWeight(), 
				IntervalType.PROCESSING, Integer.toString(task.getNum())));
	}	
	//======================================
	
	//=============Trans service============
	private void tryScheduleTrans() {
		if (transQueue.size() > 0) {
			remainTransTime--;
		}
	}
	
	private void setSend(Edge edge) {
		remainTransTime = edge.getWeight();
		
		
	}
	
	public void sendReceive(Edge edge) {
		currentTrans = edge;
		
		
	}
	//======================================
	
	public void giveMarker() {
		marker = true;
	}
	
	public Edge takeMarker() {
		return markerTrans;
	}
	
	/**
	 * @return Может ли процессор участвовать в пересылке
	 */
	public boolean isTransferable() {
		return transferable;
	}
	
	public String toString() {
		String str = "Processor #" + num + "\n";
		str += "Cur time = " + curTime + "\n";
		str += "Cur task: " + ((currentTask == null)?"-":currentTask.getNum()) + "\n";
		str += "Queue: ";
		
		for (Task t : procQueue) {
			str += t.getNum() + " ";
		}
		
		return str;
	}
}
