package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Administrator on 2016/10/19 0019.
 */
public class TbResidualflow {
    private String keyId;
    private String  idxUserID;
    private String  idxOrderID;
    private Integer residualflow;
    private String priority;
    private String pkgType;
    private String status;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date effectiveTm;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;
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

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }

    public Date getEffectiveTm() {
        return effectiveTm;
    }

    public void setEffectiveTm(Date effectiveTm) {
        this.effectiveTm = effectiveTm;
    }

    public String getPkgType() {
        return pkgType;
    }

    public void setPkgType(String pkgType) {
        this.pkgType = pkgType;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public Integer getResidualflow() {
        return residualflow;
    }

    public void setResidualflow(Integer residualflow) {
        this.residualflow = residualflow;
    }

    public String getIdxOrderID() {
        return idxOrderID;
    }

    public void setIdxOrderID(String idxOrderID) {
        this.idxOrderID = idxOrderID;
    }

    public String getIdxUserID() {
        return idxUserID;
    }

    public void setIdxUserID(String idxUserID) {
        this.idxUserID = idxUserID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
