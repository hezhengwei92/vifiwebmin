package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/9/13.
 */
public class TbUseFlowRcd {
    private String keyId;
    private String idxUserId;
    private String idxVifiId;
    private String idxIccid;
    private Double idxSlotNum;
    private String idxSimPDevID;
    private String mac;
    private Double upFlow;
    private Double downFlow;
    private String online;
    private Double lastUpFlow;
    private Double lastDownFlow;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;
    private String crtBy;
    private String idxAgentID;

    public String getIdxAgentID() {
        return idxAgentID;
    }

    public void setIdxAgentID(String idxAgentID) {
        this.idxAgentID = idxAgentID;
    }




    public String getKeyId() {
        return keyId;
    }

    public void setKeyId(String keyId) {
        this.keyId = keyId;
    }

    public String getIdxUserId() {
        return idxUserId;
    }

    public void setIdxUserId(String idxUserId) {
        this.idxUserId = idxUserId;
    }

    public String getIdxVifiId() {
        return idxVifiId;
    }

    public void setIdxVifiId(String idxVifiId) {
        this.idxVifiId = idxVifiId;
    }

    public String getIdxIccid() {
        return idxIccid;
    }

    public void setIdxIccid(String idxIccid) {
        this.idxIccid = idxIccid;
    }

    public Double getIdxSlotNum() {
        return idxSlotNum;
    }

    public void setIdxSlotNum(Double idxSlotNum) {
        this.idxSlotNum = idxSlotNum;
    }

    public String getIdxSimPDevID() {
        return idxSimPDevID;
    }

    public void setIdxSimPDevID(String idxSimPDevID) {
        this.idxSimPDevID = idxSimPDevID;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public Double getUpFlow() {
        return upFlow;
    }

    public void setUpFlow(Double upFlow) {
        this.upFlow = upFlow;
    }

    public Double getDownFlow() {
        return downFlow;
    }

    public void setDownFlow(Double downFlow) {
        this.downFlow = downFlow;
    }

    public String getOnline() {
        return online;
    }

    public void setOnline(String online) {
        this.online = online;
    }

    public Double getLastUpFlow() {
        return lastUpFlow;
    }

    public void setLastUpFlow(Double lastUpFlow) {
        this.lastUpFlow = lastUpFlow;
    }

    public Double getLastDownFlow() {
        return lastDownFlow;
    }

    public void setLastDownFlow(Double lastDownFlow) {
        this.lastDownFlow = lastDownFlow;
    }

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }

    public String getCrtBy() {
        return crtBy;
    }

    public void setCrtBy(String crtBy) {
        this.crtBy = crtBy;
    }
}
