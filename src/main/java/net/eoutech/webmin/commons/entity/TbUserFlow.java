package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/10/31.
 *
 */
public class TbUserFlow {
    private String keyUserID;//编号
    private String idxAppId;//用户ID
    private String nickname;//别名
    private String idxPhoneNumber;//手机号
    private String idxOrderID;//订单号
    private Double residualflow;//剩余流量
//    private Integer totalFlow;//总流量
    private String priority;//使用级别
    private String pkgType;//流量类型
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date effectiveTm;//有效时间
    private String status;//状态
    private String idxAgentID;//代理商
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;//创建时间

//    public Integer getTotalFlow() {
//        return totalFlow;
//    }
//
//    public void setTotalFlow(Integer totalFlow) {
//        this.totalFlow = totalFlow;
//    }

    public String getKeyUserID() {
        return keyUserID;
    }

    public void setKeyUserID(String keyUserID) {
        this.keyUserID = keyUserID;
    }

    public String getIdxAppId() {
        return idxAppId;
    }

    public void setIdxAppId(String idxAppId) {
        this.idxAppId = idxAppId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getIdxPhoneNumber() {
        return idxPhoneNumber;
    }

    public void setIdxPhoneNumber(String idxPhoneNumber) {
        this.idxPhoneNumber = idxPhoneNumber;
    }

    public String getIdxOrderID() {
        return idxOrderID;
    }

    public void setIdxOrderID(String idxOrderID) {
        this.idxOrderID = idxOrderID;
    }

    public Double getResidualflow() {
        return residualflow;
    }

    public void setResidualflow(Double residualflow) {
        this.residualflow = residualflow;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getPkgType() {
        return pkgType;
    }

    public void setPkgType(String pkgType) {
        this.pkgType = pkgType;
    }

    public Date getEffectiveTm() {
        return effectiveTm;
    }

    public void setEffectiveTm(Date effectiveTm) {
        this.effectiveTm = effectiveTm;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIdxAgentID() {
        return idxAgentID;
    }

    public void setIdxAgentID(String idxAgentID) {
        this.idxAgentID = idxAgentID;
    }

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }
}
