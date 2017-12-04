package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/11/22.
 * 获取积分方式
 */
public class TbIntegralWay {
    private Integer keyID;
    private String idxIntegralType;//获取积分方式分类  购买BUY 注册RGT 邀请CODE 签到SIGN 签到7 赠送GIVE
    private String idxPackageType;//流量包ID 或者 转增流量阀值:买流量包 或是 超过多少流量就送积分（M）
    private String idxGoodsID;
    private String idxImgUrl;
    private String idxExplain;
    private Integer idxIsWork;//是否正常展示  0 有效  1无效
    private Integer idxValue;//奖励的数值
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;
    private String crtBy;
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date mdTM;
    private String mdBy;

    public Integer getKeyID() {
        return keyID;
    }

    public void setKeyID(Integer keyID) {
        this.keyID = keyID;
    }

    public String getIdxIntegralType() {
        return idxIntegralType;
    }

    public void setIdxIntegralType(String idxIntegralType) {
        this.idxIntegralType = idxIntegralType;
    }

    public String getIdxPackageType() {
        return idxPackageType;
    }

    public void setIdxPackageType(String idxPackageType) {
        this.idxPackageType = idxPackageType;
    }

    public String getIdxGoodsID() {
        return idxGoodsID;
    }

    public void setIdxGoodsID(String idxGoodsID) {
        this.idxGoodsID = idxGoodsID;
    }

    public String getIdxImgUrl() {
        return idxImgUrl;
    }

    public void setIdxImgUrl(String idxImgUrl) {
        this.idxImgUrl = idxImgUrl;
    }

    public String getIdxExplain() {
        return idxExplain;
    }

    public void setIdxExplain(String idxExplain) {
        this.idxExplain = idxExplain;
    }

    public Integer getIdxIsWork() {
        return idxIsWork;
    }

    public void setIdxIsWork(Integer idxIsWork) {
        this.idxIsWork = idxIsWork;
    }

    public Integer getIdxValue() {
        return idxValue;
    }

    public void setIdxValue(Integer idxValue) {
        this.idxValue = idxValue;
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

    public Date getMdTM() {
        return mdTM;
    }

    public void setMdTM(Date mdTM) {
        this.mdTM = mdTM;
    }

    public String getMdBy() {
        return mdBy;
    }

    public void setMdBy(String mdBy) {
        this.mdBy = mdBy;
    }
}
