
/**
 * 
 * Тестує абстрактний клас Sportsmen
 * @author RED
 *
 */
public class TestLab6 {//виконавчий клас
	public static void main(String[] args) {
		Sportsmen[] array = new Sportsmen[3];	//Створення масиву батьківського класу
		//Створюємо об'єкти дочерного класу Trainer
		Trainer trainer1 = new Trainer("Валерій", "Лобановський", 63, "чол", "Чемпіон СРСП", "футбол", "Україна", "футбол", 34);
		Trainer trainer2 = new Trainer("Маcсимо", "Бузакка", 41, "чол", "звання", "футбол", "Швейцарія", "забезпечувати дотримання правил гри", 20);
		Trainer trainer3 = new Trainer("Пєр-Генріх", "Линг", 64, "чол", "звання", "кунг-фу", "Швеція", "не мав освіти" ,20);
		//заповнення масиву
		array[0] = trainer1;
		array[1] = trainer2;
		array[2] = trainer3;
		//Інформація про спортсменів
		System.out.println(" ");
		System.out.println("Тренер1:");
		System.out.println("Ім'я: " + trainer1.getFName());
		System.out.println("Прізвище: " + trainer1.getLName());
		System.out.println("Вік: " + trainer1.getAge());
		System.out.println("Стать: " + trainer1.getSex());
		System.out.println("Досягнення: " + trainer1.getRank());
		System.out.println("Вид спорту: " + trainer1.getSport());
		System.out.println("Країна: " + trainer1.getCountry());
		System.out.println("Тренує спортсменів: " + trainer1.getSportsTrain());
		System.out.println("Стаж роботи: " + trainer1.getExperience());
		System.out.println(" ");
		System.out.println("Тренер2:");
		System.out.println("Ім'я: " + trainer2.getFName());
		System.out.println("Прізвище: " + trainer2.getLName());
		System.out.println("Вік: " + trainer2.getAge());
		System.out.println("Стать: " + trainer2.getSex());
		System.out.println("Досягнення: " + trainer2.getRank());
		System.out.println("Вид спорту: " + trainer2.getSport());
		System.out.println("Країна: " + trainer2.getCountry());
		System.out.println("Тренує спортсменів: " + trainer2.getSportsTrain());
		System.out.println("Стаж роботи: " + trainer2.getExperience());
		System.out.println(" ");
		System.out.println("Тренер3:");
		System.out.println("Ім'я: " + trainer3.getFName());
		System.out.println("Прізвище: " + trainer3.getLName());
		System.out.println("Вік: " + trainer3.getAge());
		System.out.println("Стать: " + trainer3.getSex());
		System.out.println("Досягнення: " + trainer3.getRank());
		System.out.println("Вид спорту: " + trainer3.getSport());
		System.out.println("Країна: " + trainer3.getCountry());
		System.out.println("Тренує спортсменів: " + trainer3.getSportsTrain());
		System.out.println("Стаж роботи: " + trainer3.getExperience());
		System.out.println(" ");
		//Сортуємо за полем "прізвище"
		trainer1.sortByLName(array);
		System.out.println("Сортування по алфавіту прізвищ: ");
		for(int i = 0; i < array.length; i++){//Вивід відсортованого масиву
			System.out.println(array[i].getLName());
		}
		System.out.println(" ");
		//Сортуємо об'єкти за віком
		trainer1.sortByAge(array);
		System.out.println("Сортування за віком: ");
		for(int i = 0; i < array.length; i++){ //Вивід відсортованого масиву
			System.out.println(array[i].getAge());
		}
		System.out.println(" ");
	}

}
