package app.controller;
import app.controller.command.annotation.COMMAND;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import config.AppConfig;
import dao.CRUDInterface;
import dao.mysql.MySqlCRUD;
import app.controller.command.AutorisationCommand;
import app.controller.command.Command;
import app.controller.command.ConfirmedGoodsCourierCommand;
import app.controller.command.EditInfoCommand;
import app.controller.command.GetAllGoodsCommand;
import app.controller.command.GetGoodsForCourierCommand;
import app.controller.command.GetGoodsListCommand;
import app.controller.command.GetGourierCommand;
import app.controller.command.GetOrderListCommand;
import app.controller.command.IsPayCommand;
import app.controller.command.RegistrationCommand;
import app.controller.command.ResupplyCommand;
import app.controller.command.WorkerInfoCommand;
import app.controller.command.annotation.CONTEXT;


/**
 * Клас контролер
 * @author Vova
 *
 */
public class Controller {
	/**
	 * хеш-карта команд
	 */
	@SuppressWarnings("rawtypes")
	private static ConcurrentHashMap<String, Class > hashMap = new ConcurrentHashMap<>();
	/**
	 * виконавчий потік
	 */
	private static Executor executor = Executors.newSingleThreadExecutor();
	/**
	 * ДАО-обєкт - одиночка. Представляє собою базу даних, тобто модель.
	 */
	private static CRUDInterface dao;
	/**
	 * конструктор, що встановлює команди в хеш-карту
	 * та ініціалізує dao об’єкт
	 */
	public Controller() {
		setCommand();
		
		
	}
	/**
	 * метод який валідує та виконує команду
	 * @param dataView силка вигляду
	 * @param context контекст команди
	 * @param command команда
	 */
	@SuppressWarnings("unchecked")
	public static synchronized void toController(Object dataView,
			CONTEXT context, COMMAND command) {
		
		if (Validator.isValide(hashMap.get(command.key()), context)){
			try {
				Command cmnd = (Command) hashMap.get(command.key()).newInstance();
				cmnd.setDataView(dataView);
				executor.execute(cmnd);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	/**
	 * метод що записує команди в хеш-мапу
	 */
	private static void setCommand(){
		hashMap.put("AutorisationCmnd", AutorisationCommand.class);
		hashMap.put("RegistrationCommand", RegistrationCommand.class);
		hashMap.put("WorkerInfoCommand", WorkerInfoCommand.class);
		hashMap.put("editInfo", EditInfoCommand.class);
		hashMap.put("GetOrderListCommand", GetOrderListCommand.class);
		hashMap.put("getGoodsListCommand", GetGoodsListCommand.class);
		hashMap.put("isPayCommnad", IsPayCommand.class);
		hashMap.put("getAllGoods", GetAllGoodsCommand.class);
		hashMap.put("ressuplyGoods", ResupplyCommand.class);
		hashMap.put("getGourier", GetGourierCommand.class);
		hashMap.put("getGoodsForCourier", GetGoodsForCourierCommand.class);
		hashMap.put("confimerGoods", ConfirmedGoodsCourierCommand.class);
	}
	/**
	 * метод що повертає об'єкт ДАО.
	 * якщо об'єкт ДАО створений, повертає його, якщо ні, створює новий
	 * @return ДАО-об'єкт
	 */
	public static CRUDInterface getDao() {
		
		if (Controller.dao==null){
			AppConfig mainconfig = new AppConfig();
			mainconfig.SetAppConfig();
			String buf = mainconfig.getPrefix();
			buf  = buf.substring(0,  buf.length()-1);
			mainconfig.removePrefix();
			AppConfig config = mainconfig.getAppConfig();
			config.setPrefix("MySQL");
			Controller.dao = new MySqlCRUD(config);
			try {
				Controller.dao.open(config);
				mainconfig.setPrefix(buf);
				//mainconfig.setPrefix(buf);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return Controller.dao;
	}

}
