package net.eoutech.webmin.commons.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class TbUUWiFiArea{
	private String keyAreaId;
	private String idxContinent;
	private String idxCountry;
	private String idxRegion;
	private String idxCity;
	private String idxCode;
	private String cos;
	private Integer mcc;
	private Integer timeZone;
	private String language;
	private String currency;
	private Integer totalNumber;
	private String remarks;
	  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
	  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date mdfTm;
	private String mdfBy;
	  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
	  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;
	
	
	public String getKeyAreaId() {
		return keyAreaId;
	}
	public void setKeyAreaId(String keyAreaId) {
		this.keyAreaId = keyAreaId;
	}
	public String getIdxContinent() {
		return idxContinent;
	}
	public void setIdxContinent(String idxContinent) {
		this.idxContinent = idxContinent;
	}
	public String getIdxCountry() {
		return idxCountry;
	}
	public void setIdxCountry(String idxCountry) {
		this.idxCountry = idxCountry;
	}
	public String getIdxRegion() {
		return idxRegion;
	}
	public void setIdxRegion(String idxRegion) {
		this.idxRegion = idxRegion;
	}
	public String getIdxCity() {
		return idxCity;
	}
	public void setIdxCity(String idxCity) {
		this.idxCity = idxCity;
	}
	public String getIdxCode() {
		return idxCode;
	}
	public void setIdxCode(String idxCode) {
		this.idxCode = idxCode;
	}
	public String getCos() {
		return cos;
	}
	public void setCos(String cos) {
		this.cos = cos;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
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
	public Integer getTimeZone() {
		return timeZone;
	}
	public void setTimeZone(Integer timeZone) {
		this.timeZone = timeZone;
	}
	public Integer getMcc() {
		return mcc;
	}
	public void setMcc(Integer mcc) {
		this.mcc = mcc;
	}
	public Integer getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(Integer totalNumber) {
		this.totalNumber = totalNumber;
	}
}