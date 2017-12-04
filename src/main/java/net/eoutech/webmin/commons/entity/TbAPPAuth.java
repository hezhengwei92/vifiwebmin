package net.eoutech.webmin.commons.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.alibaba.fastjson.annotation.JSONField;

public class TbAPPAuth {

	private Integer KeyID;
	private String idxASCode;
	private String idxAppId;
	private String idxPhoneNumber;
	private String idxAreaCode;
	private String language;
	private String authState;
	private Integer authTimes;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date authDate;
	private String devInfo;
	private String aPPName;
	private String aPPVer;
	private String remarks;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date mdfTm;
	private String mdfBy;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;
	public Integer getKeyID() {
		return KeyID;
	}
	public void setKeyID(Integer keyID) {
		KeyID = keyID;
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

	public String getIdxAreaCode() {
		return idxAreaCode;
	}
	public void setIdxAreaCode(String idxAreaCode) {
		this.idxAreaCode = idxAreaCode;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getAuthState() {
		return authState;
	}
	public void setAuthState(String authState) {
		this.authState = authState;
	}
	public Integer getAuthTimes() {
		return authTimes;
	}
	public void setAuthTimes(Integer authTimes) {
		this.authTimes = authTimes;
	}
	public Date getAuthDate() {
		return authDate;
	}
	public void setAuthDate(Date authDate) {
		this.authDate = authDate;
	}
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
	public String getIdxPhoneNumber() {
		return idxPhoneNumber;
	}
	public void setIdxPhoneNumber(String idxPhoneNumber) {
		this.idxPhoneNumber = idxPhoneNumber;
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
	public String getaPPVer() {
		return aPPVer;
	}
	public void setaPPVer(String aPPVer) {
		this.aPPVer = aPPVer;
	}


}
