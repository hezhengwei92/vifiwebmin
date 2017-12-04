package net.eoutech.webmin.goip.vo;

/**
 * Created by Administrator on 2016/1/6.
 */
public class GoIPDevOfPortInfoVO {
    public String idxSimPDevID; //SimP设备ID
    public Integer idxportNum; // 端口号
    public Integer status; // 端口状态
    public String vStatus;// UUWIFI设备状态
    public String vCos;//服务级别

    public String getIdxSimPDevID() {
        return idxSimPDevID;
    }

    public void setIdxSimPDevID(String idxSimPDevID) {
        this.idxSimPDevID = idxSimPDevID;
    }

    public Integer getIdxportNum() {
        return idxportNum;
    }

    public void setIdxportNum(Integer idxportNum) {
        this.idxportNum = idxportNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
