package cm_lab3.OneCore;

import cm_lab3.OneCore.Device;
import cm_lab3.OneCore.Event;

public class Event {
	//на якому пристрої відбудеться подія
	Device device;
	//коли спрацює
	double timeStart;
	
	double timeFinish;
	
	public Event(Device device, double timeStart, double timeFinish) {
		this.device = device;
		this.timeStart = timeStart;
		this.timeFinish = timeFinish;
		
	}
	
	@Override
	public boolean equals(Object obj) {
		Event e = (Event)obj;
		return e.device.equals(device) && e.timeStart== timeStart && e.timeFinish == timeFinish;
		
	}
	
}
