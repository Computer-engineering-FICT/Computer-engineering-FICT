package cm_lab3;

import java.util.ArrayList;

import cm_lab3.Device;
import cm_lab3.Event;
import cm_lab3.Resource;
import static cm_lab3.Simulation.*;

public class Device {
	//������� ��� ������ � �������
	public double mean_time_solution;
	// �����
	public ArrayList<String> queue = new ArrayList<String>();
	// ������
	public ArrayList<String> resource = new ArrayList<String>();
	// ���� ����
	public ArrayList<String> free_cores = new ArrayList<String>();
	// ������� �� �� ���� �������� ������ � ������ ��������
	public ArrayList<Device> out_Devices = new ArrayList<Device>();
	// ��������� �������� ������ ������ �������
	public ArrayList<Double> out_probability = new ArrayList<>();
	
	public Resource resourceProc = new Resource();
	
	//��*� ��������
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
	 * ����� ���������� ������� �� �� ���� �������� ������ � ������ ��������
	 * @param devices �������
	 */
	public void linkDevices(Device... devices) {
		for (Device device : devices) {
			out_Devices.add(device);
		}
	}
	/**
	 * ����� ���������� ��������� ��������� ������ �� ������ �������
	 * ������ �� ���� ����������
	 * @param probability
	 */
	public void linkOutProbability(double... probability) {
		for (double p : probability) {
			out_probability.add(p);
		}
	}

	/**
	 * �o�� ������ � ����� �������
	 */
	public void taskToDevice(){
		this.queue.add("1");
	}
	/**
	 * ������� �� "�������" �������
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
	 * ���� ���� ��� ������
	 * @return ����� � ����� out_Devices (������ �������) ���� ��� ������
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
	 * ������� ���� ����, ������� ������
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
	
		System.out.print("\n"+name+"| " +"����� "+ queue.size()+"| ������ "+resource.size()+"| ³��� ���� "+free_cores.size()+"| ʳ������ ����*������ ����� "+countTask);
		
	}
	
	
	

	
}
