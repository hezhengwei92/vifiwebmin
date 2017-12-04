
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;


public class TbUUWiFiCountDaily {

  private String  keyUUWiFiCDID;
  private String  idxViFiID;
  private String  aliasName;
  private Integer numTotalMTGoip;
  private Integer numTotalMOGoip;
  private Integer numTotalMOGoipCb;
  private Integer numFailedMTGoip;
  private Integer numFailedMOGoip;
  private Integer numFailedMOGoipCb;
  private Integer numShortMTGoip;
  private Integer numShortMOGoip;
  private Integer numShortMOGoipCb;
  private Integer durMTGoip;
  private Integer durMOGoip;
  private Integer durMOGoipCb;
  private Integer numSMSRecv;
  private Integer numSMSSend;
  private Integer cntDataDown;
  private Integer cntDataUp;
  private Integer cntDataSum;
  private Integer cost;
  private Integer deviceDur;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd")
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date crtTm;
  private String crtBy;
public String getKeyUUWiFiCDID() {
	return keyUUWiFiCDID;
}
public void setKeyUUWiFiCDID(String keyUUWiFiCDID) {
	this.keyUUWiFiCDID = keyUUWiFiCDID;
}
 
public String getIdxViFiID() {
	return idxViFiID;
}
public void setIdxViFiID(String idxViFiID) {
	this.idxViFiID = idxViFiID;
}

public String getAliasName() {
	return aliasName;
}
public void setAliasName(String aliasName) {
	this.aliasName = aliasName;
}
public Integer getNumTotalMTGoip() {
	return numTotalMTGoip;
}
public void setNumTotalMTGoip(Integer numTotalMTGoip) {
	this.numTotalMTGoip = numTotalMTGoip;
}
public Integer getNumTotalMOGoip() {
	return numTotalMOGoip;
}
public void setNumTotalMOGoip(Integer numTotalMOGoip) {
	this.numTotalMOGoip = numTotalMOGoip;
}
public Integer getNumTotalMOGoipCb() {
	return numTotalMOGoipCb;
}
public void setNumTotalMOGoipCb(Integer numTotalMOGoipCb) {
	this.numTotalMOGoipCb = numTotalMOGoipCb;
}
public Integer getNumFailedMTGoip() {
	return numFailedMTGoip;
}
public void setNumFailedMTGoip(Integer numFailedMTGoip) {
	this.numFailedMTGoip = numFailedMTGoip;
}
public Integer getNumFailedMOGoip() {
	return numFailedMOGoip;
}
public void setNumFailedMOGoip(Integer numFailedMOGoip) {
	this.numFailedMOGoip = numFailedMOGoip;
}
public Integer getNumFailedMOGoipCb() {
	return numFailedMOGoipCb;
}
public void setNumFailedMOGoipCb(Integer numFailedMOGoipCb) {
	this.numFailedMOGoipCb = numFailedMOGoipCb;
}
public Integer getNumShortMTGoip() {
	return numShortMTGoip;
}
public void setNumShortMTGoip(Integer numShortMTGoip) {
	this.numShortMTGoip = numShortMTGoip;
}
public Integer getNumShortMOGoip() {
	return numShortMOGoip;
}
public void setNumShortMOGoip(Integer numShortMOGoip) {
	this.numShortMOGoip = numShortMOGoip;
}
public Integer getNumShortMOGoipCb() {
	return numShortMOGoipCb;
}
public void setNumShortMOGoipCb(Integer numShortMOGoipCb) {
	this.numShortMOGoipCb = numShortMOGoipCb;
}
public Integer getDurMTGoip() {
	return durMTGoip;
}
public void setDurMTGoip(Integer durMTGoip) {
	this.durMTGoip = durMTGoip;
}
public Integer getDurMOGoip() {
	return durMOGoip;
}
public void setDurMOGoip(Integer durMOGoip) {
	this.durMOGoip = durMOGoip;
}
public Integer getDurMOGoipCb() {
	return durMOGoipCb;
}
public void setDurMOGoipCb(Integer durMOGoipCb) {
	this.durMOGoipCb = durMOGoipCb;
}
public Integer getNumSMSRecv() {
	return numSMSRecv;
}
public void setNumSMSRecv(Integer numSMSRecv) {
	this.numSMSRecv = numSMSRecv;
}
public Integer getNumSMSSend() {
	return numSMSSend;
}
public void setNumSMSSend(Integer numSMSSend) {
	this.numSMSSend = numSMSSend;
}
public Integer getCntDataDown() {
	return cntDataDown;
}
public void setCntDataDown(Integer cntDataDown) {
	this.cntDataDown = cntDataDown;
}
public Integer getCntDataUp() {
	return cntDataUp;
}
public void setCntDataUp(Integer cntDataUp) {
	this.cntDataUp = cntDataUp;
}
public Integer getCntDataSum() {
	return cntDataSum;
}
public void setCntDataSum(Integer cntDataSum) {
	this.cntDataSum = cntDataSum;
}
public Integer getCost() {
	return cost;
}
public void setCost(Integer cost) {
	this.cost = cost;
}
public Integer getDeviceDur() {
	return deviceDur;
}
public void setDeviceDur(Integer deviceDur) {
	this.deviceDur = deviceDur;
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

  

}
