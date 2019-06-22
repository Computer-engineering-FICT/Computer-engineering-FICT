package lab62;


/**
 * основний клас
 * ініціалізація початкових даних
 * @author Sofi
 * 
 */
public class Lab6forSonia 
{
	public static void main(String[] args) 
	{
		Candies candies=null;
		Coockies coockies=null;
		Cackes cackes = null;
		try {
		candies = new Candies(10, 15, 10, "Canser");
		coockies = new Coockies(15, 20, 50, "Maria");
		cackes = new Cackes(20, 25, 30, "Golden Key");
		Candies candies2 = new Candies(-5, 10, 20, "");
		}catch (SweetException e) {
			e.getExceptionInfo();
		}
		CollectionSweets col = new CollectionSweets();
		col.add(candies);
		col.add(coockies);
		col.add(cackes);
		ReadWriteSwets rws = new ReadWriteSwets(col);
		rws.writeCollection();
		CollectionSweets sw = rws.readCollection();
		rws.writeMasSweets();
		rws.writeInfoSweets();
		System.out.println(rws.readInfoSweets());
		Present present = new Present(col);
		double minContent = 15, maxContent = 20;
		System.out.println("The weight of present is "
				+ present.presentWeight() + " gramms");
		System.out.println("Солодощі,що мають заданий вміст шоколаду: ");
		present.findSweet(minContent, maxContent);
		System.out.println("солодощі, відсортовані за ціною ");
		present.sortByPrice();
		for (Sweets sweets : present.getPresent()) 
		{
			System.out.println(sweets.getOtherInfo());
		}

	}

}
