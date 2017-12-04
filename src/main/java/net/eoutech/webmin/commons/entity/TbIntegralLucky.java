package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/11/22.
 * 中奖 商品类型
 */
public class TbIntegralLucky {
    private Integer keyID;
    private String idxGoodsType;//中奖物品类型  0：积分 1：流量 2：实物
    private String idxGoodsID;//奖品ID
    private String idxExplain;//
    private String idxImgUrl;//
    private Integer idxProb;//中奖概率
    private Integer idxStore;//库存
    private Integer idxIsWork;//是否展示  0 有效  1无效
    private Integer idxValue;//奖励的数值  当是积分或流量时 就是数值
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;
    private String crtBy;
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date mdTm;
    private String mdBy;

    public Integer getKeyID() {
        return keyID;
    }

    public void setKeyID(Integer keyID) {
        this.keyID = keyID;
    }

    public String getIdxGoodsType() {
        return idxGoodsType;
    }

    public void setIdxGoodsType(String idxGoodsType) {
        this.idxGoodsType = idxGoodsType;
    }

    public String getIdxGoodsID() {
        return idxGoodsID;
    }

    public void setIdxGoodsID(String idxGoodsID) {
        this.idxGoodsID = idxGoodsID;
    }

    public String getIdxExplain() {
        return idxExplain;
    }

    public void setIdxExplain(String idxExplain) {
        this.idxExplain = idxExplain;
    }

    public String getIdxImgUrl() {
        return idxImgUrl;
    }

    public void setIdxImgUrl(String idxImgUrl) {
        this.idxImgUrl = idxImgUrl;
    }

    public Integer getIdxProb() {
        return idxProb;
    }

    public void setIdxProb(Integer idxProb) {
        this.idxProb = idxProb;
    }

    public Integer getIdxStore() {
        return idxStore;
    }

    public void setIdxStore(Integer idxStore) {
        this.idxStore = idxStore;
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

    public Date getMdTm() {
        return mdTm;
    }

    public void setMdTm(Date mdTm) {
        this.mdTm = mdTm;
    }

    public String getMdBy() {
        return mdBy;
    }

    public void setMdBy(String mdBy) {
        this.mdBy = mdBy;
    }
}
