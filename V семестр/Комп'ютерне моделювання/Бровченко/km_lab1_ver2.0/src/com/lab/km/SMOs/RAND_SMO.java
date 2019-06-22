package com.lab.km.SMOs;

import com.lab.km.Task;


public class RAND_SMO extends SMO {

    protected void computeTask() {
        Task result = null;
        if (this.getQueue().size() != 0) {
            result = this.getQueue().get((int)(Math.random() * this.getQueue().size()));

            this.setTimeToNextComputing(result.getTime());
            this.getQueue().remove(result);
            result.setTimeComputed(this.getFullTime()  + result.getTime());//???????????????????????/
            this.getArchive().add(result);
//            System.out.println("Task #" + result.getId() + ", time = " + result.getTime() + ", time in system = " + result
//                    .timeInSystem());
        }
        else {
            this.setFullTime(this.getFullTime() + this.getTimeToNextGenerating());
            this.generateTask();
            this.computeTask();
        }
    }

    public RAND_SMO(double mu, double lambda) {
        super(mu, lambda);
    }
}
