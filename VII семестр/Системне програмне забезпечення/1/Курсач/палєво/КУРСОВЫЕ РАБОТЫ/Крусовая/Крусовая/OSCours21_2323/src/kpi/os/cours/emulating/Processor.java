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
	private ArrayList<Pair> sendQueue;	//Очередь выполнения пересылок
	private Pair currentTrans;			//Текущая пересылка
	private int remainTransTime = 0;		//Время до конца текущей пересылки
	
	private int curTime = 0;			//Время моделирования
	
	private boolean marker = false;		//Наличие маркера
	private Pair markerTo = null;	//Ребро передачи
	
	private boolean transferable = true;//Может ли участвовать в пересылке
	
	private HashSet<Task> receivedData;
	
	ArrayList<Interval> history;		//История всех событий
	
	private HashSet<Task> allTasks;
	private boolean started = false;
	
	public Processor(int num, ArrayList<Task> tasks) {
		this.num = num;
		this.procQueue = tasks;
		
		sendQueue = new ArrayList<Pair>();
		
		history = new ArrayList<Interval>();
		curTime = 0;
		receivedData = new HashSet<Task>();
		
		allTasks = new HashSet<Task>(tasks);
	}
	
	public void makeStep() {
		started = true;
		
		manageTrans();
		manageProc();
		
		if (markerTo != null) {
			history.add(new Interval(curTime, 0, IntervalType.MARKER, ""));
		}
		
		curTime++;
	}
	
	//===========Task service=============	
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
				for (Edge e : currentTask.getOutEdges()) {
					if (!allTasks.contains(e.getEnd())) {
						sendQueue.add(new Pair(e, currentTask));
					} else {
						receivedData.add(currentTask);
					}
				}
				
				currentTask = null;
			}
		}
		
	}
	

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
	/**
	 * Обслуживание передач
	 */
	public void manageTrans() {
		if (remainTransTime > 0) {
			remainTransTime--;
			
			if (remainTransTime == 0) {
				markerTo = null;				
				
				//if it was receive
				if (allTasks.contains(currentTrans.edge.getEnd())) {
					receivedData.add(currentTrans.task);
				} else {
				//if it was send
					sendQueue.remove(currentTrans);
				}
				
				currentTrans = null;
			}
		}
		
		//not transfers in this moment
		if (remainTransTime == 0 && marker) {
			tryScheduleSend();
			marker = false;
			//history.add(new Interval(curTime, 0, IntervalType.MARKER, ""));
		}		
	}
	
	private void tryScheduleSend() {
		if (sendQueue.size() > 0) {
			Edge edge = sendQueue.get(0).edge;
		
			remainTransTime = edge.getWeight();
			markerTo = sendQueue.get(0);
			
			history.add(new Interval(
					curTime, curTime + edge.getWeight(), 
					IntervalType.SENDING, 
					Integer.toString(edge.getEnd().getNum())));
			
			currentTrans = sendQueue.get(0);
		}
	}
	
	public void forceReceive(Pair transition) {
		remainTransTime = transition.edge.getWeight();
		
		history.add(new Interval(
				curTime - 1, curTime + transition.edge.getWeight() - 1, 
				IntervalType.RECEIVING, 
				Integer.toString(transition.task.getNum())));
		
		currentTrans = transition;
	}
	//======================================
	
	public void giveMarker() {
		marker = true;
	}
	
	public Pair takeMarker() {
		return markerTo;
	}
	
	public boolean isFinished() {
		if (procQueue.size() == 0 
				&& sendQueue.size() == 0 
				&& started 
				&& currentTask == null) 
		{
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @return Может ли процессор участвовать в пересылке
	 */
	public boolean isTransferable() {
		return transferable;
	}
	
	public int getNum() {
		return num;
	}
	
	public ArrayList<Interval> getHistory() {
		return history;
	}
	
	public String toString() {
		String str = "Processor #" + num + (isFinished()?" FINISHED":" WORK") + "\n";
		str += "Time = " + curTime + "\n";
		str += "Cur task: " + ((currentTask == null)?"-":currentTask.getNum()) + "\n";
		str += "Remain proc time: " + remainProcTime +  "\n";
		str += "Proc queue: ";
		for (Task t : procQueue) {
			str += t.getNum() + " ";
		}

		str += "\nCur trans: " + 
		((currentTrans == null)?"-":currentTrans.edge.getEnd().getNum()) + "\n";
		str += "Remain trans time: " + remainTransTime +  "\n";
		str += "Trans queue: ";
		for (Pair t : sendQueue) {
			str += t.edge.getEnd().getNum() + " ";
		}
		
		return str;
	}
}
