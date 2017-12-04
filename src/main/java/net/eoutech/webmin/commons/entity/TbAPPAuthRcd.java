package net.eoutech.webmin.commons.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.alibaba.fastjson.annotation.JSONField;

public class TbAPPAuthRcd {

	private Integer keyID;
	private String idxASCode;
	private String idxAppId;
	private String idxPhoneNumber;
	private String idxAreaCode;
	private String authState;
	private String authPublicIP;
	private Integer authPublicPort;
	private String devInfo;
	private String aPPName;
	private String appVer;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;
	
	
	public Integer getKeyID() {
		return keyID;
	}
	public void setKeyID(Integer keyID) {
		this.keyID = keyID;
	}
	public String getIdxASCode() {
		return idxASCode;
	}
	public void setIdxASCode(String idxASCode) {
		this.idxASCode = idxASCode;
	}
	public String getIdxAppId() {
		return idxAppId;
	}
	public void setIdxAppId(String idxAppId) {
		this.idxAppId = idxAppId;
	}
	public String getIdxPhoneNumber() {
		return idxPhoneNumber;
	}
	public void setIdxPhoneNumber(String idxPhoneNumber) {
		this.idxPhoneNumber = idxPhoneNumber;
	}
	public String getIdxAreaCode() {
		return idxAreaCode;
	}
	public void setIdxAreaCode(String idxAreaCode) {
		this.idxAreaCode = idxAreaCode;
	}
	public String getAuthState() {
		return authState;
	}
	public void setAuthState(String authState) {
		this.authState = authState;
	}
	public String getAuthPublicIP() {
		return authPublicIP;
	}
	public void setAuthPublicIP(String authPublicIP) {
		this.authPublicIP = authPublicIP;
	}
	public Integer getAuthPublicPort() {
		return authPublicPort;
	}
	public void setAuthPublicPort(Integer authPublicPort) {
		this.authPublicPort = authPublicPort;
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
	public String getDevInfo() {
		return devInfo;
	}
	public void setDevInfo(String devInfo) {
		this.devInfo = devInfo;
	}
	public String getaPPName() {
		return aPPName;
	}
	public void setaPPName(String aPPName) {
		this.aPPName = aPPName;
	}
	public String getAppVer() {
		return appVer;
	}
	public void setAppVer(String appVer) {
		this.appVer = appVer;
	}
	
	
}
