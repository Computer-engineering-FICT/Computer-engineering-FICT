public class Lab5
{
    public static void main(String[] args)
    {
        String str = "IIIIiiiii, РРРррррегістр. GoogleG ООП.";
        Text text = new Text(str);

        text.registerFunction();
        System.out.println("З урахуванням регістру: " + text);

        text.noRegisterFunction();
        System.out.println("Без урахування регістру: " + text);
    }
}