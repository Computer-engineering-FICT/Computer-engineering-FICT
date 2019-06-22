/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 11/11/12
 * Time: 11:39 AM
 * To change this template use File | Settings | File Templates.
 */
public class RecordAboutVirtualPage {
    private String ownerName;

    private int virtualAddress;
    /**
     * 0, if never loaded
     * 1, if is presented
     * 2, if in swap
     */
    private int presentsFlag;
    /**
     * 0, if not presented
     */
    private int physicalAddress;
    private int referenceFlag;
    private int modifyFlag;
    private long timeOfLastUsage;

    public RecordAboutVirtualPage(int virtualAdr, int physicalAdr, String owner){

        ownerName = owner;
        virtualAddress = virtualAdr;
        physicalAddress = physicalAdr;
        if (physicalAddress != 0)
            presentsFlag = 1;
        else presentsFlag = 0;

        referenceFlag = 0;
        modifyFlag = 0;
        timeOfLastUsage = System.currentTimeMillis();

    }

    public int getVirtualAddress() {
        return virtualAddress;
    }

    public void setVirtualAddress(int virtualAddress) {
        this.virtualAddress = virtualAddress;
    }

    public void setPresentsFlag(int presentsFlag) {
        this.presentsFlag = presentsFlag;
    }

    public void setPhysicalAddress(int physicalAddress) {
        this.physicalAddress = physicalAddress;
    }

    public void setReferenceFlag(int referenceFlag) {
        this.referenceFlag = referenceFlag;
    }

    public void setModifyFlag(int modifyFlag) {
        this.modifyFlag = modifyFlag;
    }

    public void setTimeOfLastUsage(long timeOfLastUsage) {
        this.timeOfLastUsage = timeOfLastUsage;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public int getPresentsFlag() {
        return presentsFlag;
    }

    public int getPhysicalAddress() {
        return physicalAddress;
    }

    public int getReferenceFlag() {
        return referenceFlag;
    }

    public int getModifyFlag() {
        return modifyFlag;
    }

    public long getTimeOfLastUsage() {
        return timeOfLastUsage;
    }

    @Override
    public String toString() {
        return "RecordAboutVirtualPage{" +
                "ownerName='" + ownerName + '\'' +
                ", virtualAddress=" + virtualAddress +
                ", presentsFlag=" + presentsFlag +
                ", physicalAddress=" + physicalAddress +
                ", referenceFlag=" + referenceFlag +
                ", modifyFlag=" + modifyFlag +
                ", timeOfLastUsage=" + timeOfLastUsage +
                '}';
    }
}
