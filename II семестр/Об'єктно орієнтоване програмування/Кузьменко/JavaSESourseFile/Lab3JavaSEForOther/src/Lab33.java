
public class Lab33 {
//��� ������� ��� �������� ������� � ����� ������� 
	//�� Lab33
	public static void main(String[] args) {
		StringBuffer text = new StringBuffer("wdfngps - dfg, hgdhsd hhh sdhdh hhh. whdsfn! dfl ooo ppp ppp ooo wsdhgd? dfgsdf.");
		System.out.println(text);
		String str = new String(" ");
		if (!(text.substring(0).trim().equals(str.trim()))) {
			//��������� ��������� �����
		String text1 = text.toString().replaceAll(",", "");
		text1= text1.replaceAll("!", ".");
		text1= text1.replaceAll(" - ", ".");
		text1= text1.replaceAll("\\?", ".");
		text1= text1.replaceAll(":", "");
		text1= text1.replaceAll(";", "");
		text1= text1.replaceAll("- ", "");
		text1= text1.replaceAll(" -", "");
		
		String[] Text = text1.split("\\. ");
		int k=0;
		for (int i = 0; i < Text.length; i++) {
			if (wordsequals(Text[i]))k++;
		}
		System.out.println(k);
		}
		else System.out.println("������ �����");
		}
		//����� ������� true ���� ������ sent �� � ���
		//��� ��� ����� ��������� ���
		public static boolean wordsequals(String sent){
			boolean q= false;
			String [] sen = sent.split("\\ ");
			for (int i = 0; i < sen.length; i++) {
				for (int j = 0; j < sen.length; j++) {
					if (sen[i].equals(sen[j])&(i!=j)){
						q=true; break;
					}
				}
				if (q==true)break;
			}
			return q;
		}
	}


