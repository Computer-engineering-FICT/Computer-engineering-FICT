package com.lab.km.SMOs;

import com.lab.km.Task;

/**
 * Created by User on 28.09.2016.
 */
public class RR_SMO extends SMO {

    private double criticalTime;

    protected void computeTask() {
        Task result = null;
        if (this.getQueue().size() != 0) {
            result = this.getQueue().get(0);

            if (result.getTime() < this.criticalTime) {
                this.setTimeToNextComputing(result.getTime());
                this.getQueue().remove(result);
                result.setTimeComputed(this.getFullTime() + result.getTime());//???????????????
                this.getArchive().add(result);
            }
            else {
                this.setTimeToNextComputing(this.criticalTime);
                this.getQueue().remove(result);
                result.setTime(result.getTime() - this.criticalTime);
                this.getQueue().add(result);
            }
//            System.out.println("Task #" + result.getId() + ", time = " + result.getTime() + ", time in system = " + result
//                    .timeInSystem());
        }
        else {
            this.setFullTime(this.getFullTime() + this.getTimeToNextGenerating());
            this.generateTask();
            this.computeTask();
        }
    }

    public RR_SMO(double mu, double lambda, double criticalTime) {
        super(mu, lambda);
        this.criticalTime = criticalTime;
    }
}
