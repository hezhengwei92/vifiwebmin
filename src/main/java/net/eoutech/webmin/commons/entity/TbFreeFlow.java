package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/10/25.
 */
public class TbFreeFlow {
    private String idxAppId;//用户ID
    private String idxOrderID;
    private String nickname;//昵称
    private String idxPhoneNumber;//电话号码
    private String idxAgentID;//代理商
    private String pkgType;//流量类型
    private Integer flow;//赠送流量 M
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date effectiveTm;//有效期
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date  mdfTm;//修改时间
    private String mdfBy;//修改人
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;//创建时间
    private String crtBy;//创建人

    public String getIdxOrderID() {
        return idxOrderID;
    }

    public void setIdxOrderID(String idxOrderID) {
        this.idxOrderID = idxOrderID;
    }

    public String getIdxAppId() {
        return idxAppId;
    }

    public void setIdxAppId(String idxAppId) {
        this.idxAppId = idxAppId;
    }

    public String getIdxAgentID() {
        return idxAgentID;
    }

    public void setIdxAgentID(String idxAgentID) {
        this.idxAgentID = idxAgentID;
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

    public String getPkgType() {
        return pkgType;
    }

    public void setPkgType(String pkgType) {
        this.pkgType = pkgType;
    }

    public Integer getFlow() {
        return flow;
    }

    public void setFlow(Integer flow) {
        this.flow = flow;
    }

    public Date getEffectiveTm() {
        return effectiveTm;
    }

    public void setEffectiveTm(Date effectiveTm) {
        this.effectiveTm = effectiveTm;
    }

    public Date getMdfTm() {
        return mdfTm;
    }

    public void setMdfTm(Date mdfTm) {
        this.mdfTm = mdfTm;
    }

    public String getMdfBy() {
        return mdfBy;
    }

    public void setMdfBy(String mdfBy) {
        this.mdfBy = mdfBy;
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
