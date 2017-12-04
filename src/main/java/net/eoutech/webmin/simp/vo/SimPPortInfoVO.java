package net.eoutech.webmin.simp.vo;

/**
 * Created by Administrator on 2016/1/6.
 */
public class SimPPortInfoVO {
    public String idxSimPDevID; //SimP设备ID
    public Integer idxSlotNum; // 端口号
    public Integer status; // 端口状态
    public String idxSCGroupID;//simp设备组ID
    public String cStatus;// simp卡状态
    public String cNumber;//卡号码
    public Double cBalance;//卡余额
    public String vStatus;// IeBox设备状态
    public String vCos;//服务级别

    public String getIdxSimPDevID() {
        return idxSimPDevID;
    }

    public void setIdxSimPDevID(String idxSimPDevID) {
        this.idxSimPDevID = idxSimPDevID;
    }

    public Integer getIdxSlotNum() {
        return idxSlotNum;
    }

    public void setIdxSlotNum(Integer idxSlotNum) {
        this.idxSlotNum = idxSlotNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getIdxSCGroupID() {
        return idxSCGroupID;
    }

    public void setIdxSCGroupID(String idxSCGroupID) {
        this.idxSCGroupID = idxSCGroupID;
    }

    public String getcStatus() {
        return cStatus;
    }

    public void setcStatus(String cStatus) {
        this.cStatus = cStatus;
    }

    public String getcNumber() {
        return cNumber;
    }

    public void setcNumber(String cNumber) {
        this.cNumber = cNumber;
    }

    public Double getcBalance() {
        return cBalance;
    }

    public void setcBalance(Double cBalance) {
        this.cBalance = cBalance;
    }

    public String getvStatus() {
        return vStatus;
    }

    public void setvStatus(String vStatus) {
        this.vStatus = vStatus;
    }

    public String getvCos() {
        return vCos;
    }

    public void setvCos(String vCos) {
        this.vCos = vCos;
    }
}
