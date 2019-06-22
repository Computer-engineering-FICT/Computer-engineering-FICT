package PRO6;

import java.util.concurrent.RecursiveAction;

public class ForkSum extends RecursiveAction {
    private int start, end;
    private Vector left, right;
    GeneralResourseMonitor generalResourseMonitor;

    ForkSum(int s, int e, Vector l, Vector r, GeneralResourseMonitor generalResourseMonitor) {
        this.start = s;
        this.end = e;
        this.left = l;
        this.right = r;
        this.generalResourseMonitor = generalResourseMonitor;
    }

    @Override
    protected void compute() {
        int vi = scalVec(left, right);
        generalResourseMonitor.addV(vi);
    }

    private int scalVec(Vector left, Vector right) {
        int result = 0;
        for (int i=start; i<end; i++) {
            result += left.get(i) * right.get(i);
        }
        return result;
    }

}
