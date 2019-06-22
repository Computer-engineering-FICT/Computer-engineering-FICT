public class Polynoms {
    static byte[] getPolynom(int size)throws Exception{
        byte[] answer={};
        switch (size){
            case 6: answer= new byte[]{6,1};
            break;
            case 7: answer= new byte[]{7,3};
            break;
            case 8: answer= new byte[]{8,4,3,2};
            break;
            case 9: answer= new byte[]{9,4};
            break;
            case 10: answer= new byte[]{10,3};
            break;
            case 11: answer= new byte[]{11,2};
            break;
            case 12: answer= new byte[]{12,6,4,1};
            break;
            case 13: answer= new byte[]{13,4,3,1};
            break;
            case 14: answer= new byte[]{14,10,6,1};
            break;
            case 15: answer= new byte[]{15,1};
            break;
            case 16: answer= new byte[]{16,12,3,1};
            break;
            case 17: answer= new byte[]{17,3};
            break;
            default: throw new Exception();
        }
        return answer;
    }
}
