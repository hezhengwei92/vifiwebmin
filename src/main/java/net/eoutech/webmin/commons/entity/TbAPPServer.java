package net.eoutech.webmin.commons.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.alibaba.fastjson.annotation.JSONField;

public class TbAPPServer {

	private String keyAppServerID;
	private String idxASCode;
	private String asAddrIP;
	private Integer asAddrPort;
	private String asProtocol;
	private String uRL;
	private String company;
	private String appName;
	private String appVersion;
	private Integer licenseMaxNum;
	private Integer authEffectDays;
	private String remarks;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date mdfTm;
	private String mdfBy;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;
	
	
	public String getKeyAppServerID() {
		return keyAppServerID;
	}
	public void setKeyAppServerID(String keyAppServerID) {
		this.keyAppServerID = keyAppServerID;
	}
	public String getIdxASCode() {
		return idxASCode;
	}
	public void setIdxASCode(String idxASCode) {
		this.idxASCode = idxASCode;
	}
	public String getAsAddrIP() {
		return asAddrIP;
	}
	public void setAsAddrIP(String asAddrIP) {
		this.asAddrIP = asAddrIP;
	}
	public Integer getAsAddrPort() {
		return asAddrPort;
	}
	public void setAsAddrPort(Integer asAddrPort) {
		this.asAddrPort = asAddrPort;
	}
	public String getAsProtocol() {
		return asProtocol;
	}
	public void setAsProtocol(String asProtocol) {
		this.asProtocol = asProtocol;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getAppVersion() {
		return appVersion;
	}
	public void setAppVersion(String appVersion) {
		this.appVersion = appVersion;
	}
	public Integer getLicenseMaxNum() {
		return licenseMaxNum;
	}
	public void setLicenseMaxNum(Integer licenseMaxNum) {
		this.licenseMaxNum = licenseMaxNum;
	}
	public Integer getAuthEffectDays() {
		return authEffectDays;
	}
	public void setAuthEffectDays(Integer authEffectDays) {
		this.authEffectDays = authEffectDays;
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
	public String getuRL() {
		return uRL;
	}
	public void setuRL(String uRL) {
		this.uRL = uRL;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
}
