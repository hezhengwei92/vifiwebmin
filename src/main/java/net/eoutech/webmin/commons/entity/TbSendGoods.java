package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/11/22.
 * 发货记录
 */
public class TbSendGoods {
    private Integer keyID;
    private String idxOrderID;//商品订单号
    private String idxExplain;//描述说明
    private String idxUserName;//姓名
    private String idxPhoneNumber;//电话
    private String idxAddress;//地址
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;//发货时间
    private String idxCourier;//快递公司
    private String idxTracking;//
    private String idxProcessor;//处理人
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;//
    private String idxReceiver;// 0：到  1：未到
    private String remark;//

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

    public String getIdxExplain() {
        return idxExplain;
    }

    public void setIdxExplain(String idxExplain) {
        this.idxExplain = idxExplain;
    }

    public String getIdxUserName() {
        return idxUserName;
    }

    public void setIdxUserName(String idxUserName) {
        this.idxUserName = idxUserName;
    }

    public String getIdxPhoneNumber() {
        return idxPhoneNumber;
    }

    public void setIdxPhoneNumber(String idxPhoneNumber) {
        this.idxPhoneNumber = idxPhoneNumber;
    }

    public String getIdxAddress() {
        return idxAddress;
    }

    public void setIdxAddress(String idxAddress) {
        this.idxAddress = idxAddress;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getIdxCourier() {
        return idxCourier;
    }

    public void setIdxCourier(String idxCourier) {
        this.idxCourier = idxCourier;
    }

    public String getIdxTracking() {
        return idxTracking;
    }

    public void setIdxTracking(String idxTracking) {
        this.idxTracking = idxTracking;
    }

    public String getIdxProcessor() {
        return idxProcessor;
    }

    public void setIdxProcessor(String idxProcessor) {
        this.idxProcessor = idxProcessor;
    }

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }

    public String getIdxReceiver() {
        return idxReceiver;
    }

    public void setIdxReceiver(String idxReceiver) {
        this.idxReceiver = idxReceiver;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
