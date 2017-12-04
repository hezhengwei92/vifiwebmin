package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import javax.lang.model.element.NestingKind;
import java.util.Date;

/**
 * Created by wei on 2017/11/22.
 * 互赠流量记录
 */
public class TbTransfer {
    private Integer transferId;
    private String idxOrderId;//订单ID
    private String sendUid;//
    private String sendAvatar;
    private String sendNickname;
    private String recAvatar;//接收者头像地址
    private String recNickname;//别名
    private String receiveUid;//UID
    private Integer flow;//
    private String message;
    private String flowType;
    private Integer status;
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date effectiveTm;
    @JSONField(format = "MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;

    public Integer getTransferId() {
        return transferId;
    }

    public void setTransferId(Integer transferId) {
        this.transferId = transferId;
    }

    public String getIdxOrderId() {
        return idxOrderId;
    }

    public void setIdxOrderId(String idxOrderId) {
        this.idxOrderId = idxOrderId;
    }

    public String getSendUid() {
        return sendUid;
    }

    public void setSendUid(String sendUid) {
        this.sendUid = sendUid;
    }

    public String getSendAvatar() {
        return sendAvatar;
    }

    public void setSendAvatar(String sendAvatar) {
        this.sendAvatar = sendAvatar;
    }

    public String getSendNickname() {
        return sendNickname;
    }

    public void setSendNickname(String sendNickname) {
        this.sendNickname = sendNickname;
    }

    public String getRecAvatar() {
        return recAvatar;
    }

    public void setRecAvatar(String recAvatar) {
        this.recAvatar = recAvatar;
    }

    public String getRecNickname() {
        return recNickname;
    }

    public void setRecNickname(String recNickname) {
        this.recNickname = recNickname;
    }

    public String getReceiveUid() {
        return receiveUid;
    }

    public void setReceiveUid(String receiveUid) {
        this.receiveUid = receiveUid;
    }

    public Integer getFlow() {
        return flow;
    }

    public void setFlow(Integer flow) {
        this.flow = flow;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFlowType() {
        return flowType;
    }

    public void setFlowType(String flowType) {
        this.flowType = flowType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getEffectiveTm() {
        return effectiveTm;
    }

    public void setEffectiveTm(Date effectiveTm) {
        this.effectiveTm = effectiveTm;
    }

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }
}
