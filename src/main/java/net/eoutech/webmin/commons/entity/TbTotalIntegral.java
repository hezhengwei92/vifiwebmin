package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/11/22.
 * 用户 积分记录表
 */
public class TbTotalIntegral {
    private Integer keyID;
    private String idxOrderID;//商品订单号
    private String idxUserID;
    private Integer idxScores;//本次积分情况  本次（-使用+获得）
    private Integer idxPayORGet;//获取或者使用积分  0 使用  1获取
    private String idxType;//实际兑换/抽奖/获取
    private String idxGoodsID;//
    private Integer idxWin;//是否中奖 0：中       1：未中
    private Integer idxHandle;//发放成功 0：yes     1：no
    private Integer idxAwardType;//中奖类型 0：积分    1：流量     2：实物
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;

    public Integer getKeyID() {
        return keyID;
    }

    public void setKeyID(Integer keyID) {
        this.keyID = keyID;
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

    public Integer getIdxScores() {
        return idxScores;
    }

    public void setIdxScores(Integer idxScores) {
        this.idxScores = idxScores;
    }

    public Integer getIdxPayORGet() {
        return idxPayORGet;
    }

    public void setIdxPayORGet(Integer idxPayORGet) {
        this.idxPayORGet = idxPayORGet;
    }

    public String getIdxType() {
        return idxType;
    }

    public void setIdxType(String idxType) {
        this.idxType = idxType;
    }

    public String getIdxGoodsID() {
        return idxGoodsID;
    }

    public void setIdxGoodsID(String idxGoodsID) {
        this.idxGoodsID = idxGoodsID;
    }

    public Integer getIdxWin() {
        return idxWin;
    }

    public void setIdxWin(Integer idxWin) {
        this.idxWin = idxWin;
    }

    public Integer getIdxHandle() {
        return idxHandle;
    }

    public void setIdxHandle(Integer idxHandle) {
        this.idxHandle = idxHandle;
    }

    public Integer getIdxAwardType() {
        return idxAwardType;
    }

    public void setIdxAwardType(Integer idxAwardType) {
        this.idxAwardType = idxAwardType;
    }

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }
}
