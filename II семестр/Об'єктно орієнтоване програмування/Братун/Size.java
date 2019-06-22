package main.java.com.yUvOsIl.lab4;

public enum Size
{
    S, M, L, XL;

    public String getSize()
    {
        switch (this)
        {
            case S:
                return "Small";
            case M:
                return "Medium";
            case L:
                return "Large";
            case XL:
                return "Extra Large";
            default: return null;
        }
    }
}
