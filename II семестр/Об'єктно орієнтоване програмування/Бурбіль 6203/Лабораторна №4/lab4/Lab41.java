package lab4;
//Імпорт модулів
import java.util.*;

public class Lab41 {
    static List <Student> StudentList = new ArrayList<Student>();
    static Scanner in = new Scanner (System.in);
    protected  static  void getStud(){
        System.out.println("How many students would you like to add?");
        int t = in.nextInt();
        in.nextLine();
        for(int i =0;i<t;i++){
            System.out.print("Name: ");
            String name =  in.nextLine();
            System.out.print("Surname: ");
            String surname =  in.nextLine();
            System.out.print("Age: ");
            String age =  in.nextLine();
            System.out.print("High School: ");
            String school =  in.nextLine();
            System.out.print("Weight: ");
            String weight =  in.nextLine();
            Student st1 = new Student(name, surname, age, school, weight);

            StudentList.add(st1);

        }

    }
    public static void main(String[] args) {
        while (true){
            System.out.print("Input :" + "\n"
                    + "1.Set Student" + "\n"
                    + "2.Sort Student" + "\n"
                    +"Choose or write 0 to exit: ");
            int input = (in.nextInt());
            if (input == 1){
                getStud();
            }
            else if (input ==2){
                System.out.print("Input a parameter to sort:" + "\n"
                        + "1.Name" + "\n"
                        + "2.Surname" + "\n"
                        + "3.Age" + "\n"
                        + "4.High School in reversed order" + "\n"
                        + "5.Weight in reversed order "+ "\n"
                        +"Choose or write 0 to exit: ");
                int intput = in.nextInt();
                if ( intput == 1){
                    Collections.sort(StudentList, Student.getCompByName());

                    for(Student student:StudentList){
                        System.out.println(student.toString());
                    }
                }
                else if (intput == 2){
                    Collections.sort(StudentList, Student.getCompBySurname());

                    for(Student student:StudentList){
                        System.out.println(student.toString());
                    }
                }
                else if (intput == 3){
                    Collections.sort(StudentList, Student.getCompByAge());

                    for(Student student:StudentList){
                        System.out.println(student.toString());
                    }
                }
                else if (intput == 4){
                    Collections.sort(StudentList, Student.getCompByVyz());

                    for(Student student:StudentList){
                        System.out.println(student.toString());
                    }
                }
                else if (intput == 5){
                    Collections.sort(StudentList, Student.getCompByWeight());

                    for(Student student:StudentList){
                        System.out.println(student.toString());
                    }
                }
                else if (intput == 0){
                    break;
                }
                else{
                    System.out.println("Index out of range!!!!!!!!!");
                }
            }
            else if (input == 0){
                break;
            }

        }
    }
}