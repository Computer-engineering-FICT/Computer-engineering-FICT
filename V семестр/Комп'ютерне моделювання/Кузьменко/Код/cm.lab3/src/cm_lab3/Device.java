package cm_lab3;

import java.util.ArrayList;

import cm_lab3.Device;
import cm_lab3.Event;
import cm_lab3.Resource;
import static cm_lab3.Simulation.*;

public class Device {
	//середній час задачі в пристрої
	public double mean_time_solution;
	// черга
	public ArrayList<String> queue = new ArrayList<String>();
	// ресурс
	public ArrayList<String> resource = new ArrayList<String>();
	// вільні ядра
	public ArrayList<String> free_cores = new ArrayList<String>();
	// пристрої на які буде виходити задача з даного пристрою
	public ArrayList<Device> out_Devices = new ArrayList<Device>();
	// ймовірність переходу задачі вихідні пристрої
	public ArrayList<Double> out_probability = new ArrayList<>();
	
	public Resource resourceProc = new Resource();
	
	//ім*я пристрою
	public String name;
	
	public int id;
	
	public int countTask =0;

	public Device(double mean_time_solution, int number_cores, int start_task_queue, String name, int id) {
		this.mean_time_solution = mean_time_solution;
		for (int i = 0; i < number_cores; i++) {
			free_cores.add("1");
		}
		
		for (int i = 0; i < start_task_queue; i++) {
			queue.add("1");
		}
		this.name = name;
		this.id = id;
	}

	/**
	 * метод встановлює пристрої на які буде виходити задача з даного пристрою
	 * @param devices пристрої
	 */
	public void linkDevices(Device... devices) {
		for (Device device : devices) {
			out_Devices.add(device);
		}
	}
	/**
	 * метод встановлює імовірності попадання задачі на вихідні пристрої
	 * список має бути зростаючим
	 * @param probability
	 */
	public void linkOutProbability(double... probability) {
		for (double p : probability) {
			out_probability.add(p);
		}
	}

	/**
	 * дoдає задачу в чергу ресурсу
	 */
	public void taskToDevice(){
		this.queue.add("1");
	}
	/**
	 * відповідає за "часовий" перехід
	 */
	public void transaction(Event event) {
		countTask++;
		eventList.remove(event); 
		free_cores.add("1");
		Device dev = out_Devices.get(findNextDevice());
		time=event.timeFinish;
		if (id ==1){
			resourceProc.remove(event);
		}else{
			resource.remove(0);			
		}
		if (this.queue.size()!=0){
			this.calcNextTime(time);
		}
		dev.taskToDevice();
		dev.calcNextTime(time);
		
	}
	/**
	 * шукає куда піде задача
	 * @return ідекс у масиві out_Devices (вихідні пристрої) куди піде задача
	 */
	public int findNextDevice(){
		double p = r.nextDouble();
		int i;
		Double [] pi  = new Double [out_probability.size()];
		pi = out_probability.toArray(pi);
		double s=0;
		for (i = 0; i < pi.length; i++) {
			s+=pi[i];
			if (s>p)break;
		}
		return i;
	}
	/**
	 * створює нову подію, решення задачі
	 */
	public void calcNextTime(double time){
		while (free_cores.size()!=0 && queue.size()!=0){
			free_cores.remove(0);
			queue.remove(0);
			Event newEvent = new Event(this, time, time +mean_time_solution);
			if (id ==1){
				resourceProc.add(newEvent);
			}else{
				resource.add("1");				
			}
			eventList.add(newEvent);			
		}
	}
	public void pr (){
	
		System.out.print("\n"+name+"| " +"Черга "+ queue.size()+"| Ресурс "+resource.size()+"| Вільні ядра "+free_cores.size()+"| Кількість розв*язаних задач "+countTask);
		
	}
	
	
	

	
}
