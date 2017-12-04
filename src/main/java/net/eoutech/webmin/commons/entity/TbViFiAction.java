package net.eoutech.webmin.commons.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class TbViFiAction {

	private Integer keyActionID;
	private Integer actionType;
	private String idxViFiID;
	private String idxAppId;
	private String idxUserId;
	private String reqAct;
	private String reqIP;
	private Integer respCode;
	private String respReason;
	private String sessionId;
	private String version;
	@JSONField(format = "yyyy-MM-dd hh:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date reqDate;
	private Integer handTime;
	
	public Integer getKeyActionID() {
		return keyActionID;
	}
	public void setKeyActionID(Integer keyActionID) {
		this.keyActionID = keyActionID;
	}
	public Integer getActionType() {
		return actionType;
	}
	public void setActionType(Integer actionType) {
		this.actionType = actionType;
	}
	public String getIdxViFiID() {
		return idxViFiID;
	}
	public void setIdxViFiID(String idxViFiID) {
		this.idxViFiID = idxViFiID;
	}
	public String getIdxAppId() {
		return idxAppId;
	}
	public void setIdxAppId(String idxAppId) {
		this.idxAppId = idxAppId;
	}
	public String getIdxUserId() {
		return idxUserId;
	}
	public void setIdxUserId(String idxUserId) {
		this.idxUserId = idxUserId;
	}
	public String getReqAct() {
		return reqAct;
	}
	public void setReqAct(String reqAct) {
		this.reqAct = reqAct;
	}
	public String getReqIP() {
		return reqIP;
	}
	public void setReqIP(String reqIP) {
		this.reqIP = reqIP;
	}
	public Integer getRespCode() {
		return respCode;
	}
	public void setRespCode(Integer respCode) {
		this.respCode = respCode;
	}
	public String getRespReason() {
		return respReason;
	}
	public void setRespReason(String respReason) {
		this.respReason = respReason;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	public Integer getHandTime() {
		return handTime;
	}
	public void setHandTime(Integer handTime) {
		this.handTime = handTime;
	}
	
}
