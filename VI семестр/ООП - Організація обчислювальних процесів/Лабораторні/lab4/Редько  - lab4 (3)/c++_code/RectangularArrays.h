//----------------------------------------------------------------------------------------
//	Copyright � 2007 - 2013 Tangible Software Solutions Inc.
//	This class can be used by anyone provided that the copyright notice remains intact.
//
//	This class provides the logic to simulate Java rectangular arrays, which are jagged
//	arrays with inner arrays of the same length. A size of -1 indicates unknown length.
//----------------------------------------------------------------------------------------
public class RectangularArrays
{
public:
    static int** ReturnRectangularIntArray(int Size1, int Size2)
    {
        int** Array;
        if (Size1 > -1)
        {
            Array = new int*[Size1];
            if (Size2 > -1)
            {
                for (int Array1 = 0; Array1 < Size1; Array1++)
                {
                    Array[Array1] = new int[Size2];
                }
            }
        }

        return Array;
    }
};