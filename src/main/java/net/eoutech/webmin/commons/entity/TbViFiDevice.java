
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbViFiDevice {

  private String keyDevID;//编号
  private String idxViFiID;//设备编号
  private String pwd;//密码
  private String alaisName;;//别名
  private String idxDevGrpID;
  private String idxVNSID;

  private String devState;
  private String cos;
  private String idxUserID;
  private String idxAgentID;
  private Integer redirectTimes;
//  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
//  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//  private Date lastRedirectDate;
  private Integer expire;
  private String lastDomain;
  private Integer debugIdt;
  private Integer updateIdt;
  private String hardwareVer;
  private String firmwareVer;
  private String softwareVer;
//  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
//  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//  private Date lastUpdateDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastConnectTime;
  private String lastConnectIP;
  private String remark;
  private Integer online;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;




  public String getKeyDevID() {return keyDevID;}
  
  public void setKeyDevID( String keyDevID ) {this.keyDevID = keyDevID;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getPwd() {return pwd;}
  
  public void setPwd( String pwd ) {this.pwd = pwd;}
  
  public String getIdxDevGrpID() {return idxDevGrpID;}

  public void setIdxDevGrpID( String idxDevGrpID ) {this.idxDevGrpID = idxDevGrpID;}

  public String getIdxVNSID() {return idxVNSID;}

  public void setIdxVNSID( String idxVNSID ) {this.idxVNSID = idxVNSID;}

  public String getDevState() {return devState;}

  public void setDevState( String devState ) {this.devState = devState;}

  public String getCos() {return cos;}

  public void setCos( String cos ) {this.cos = cos;}

  public String getIdxUserID() {return idxUserID;}

  public void setIdxUserID( String idxUserID ) {this.idxUserID = idxUserID;}

  public String getIdxAgentID() {return idxAgentID;}

  public void setIdxAgentID( String idxAgentID ) {this.idxAgentID = idxAgentID;}

  public Integer getRedirectTimes() {return redirectTimes;}

  public void setRedirectTimes( Integer redirectTimes ) {this.redirectTimes = redirectTimes;}
//
//  public Date getLastRedirectDate() {return lastRedirectDate;}
//
//  public void setLastRedirectDate( Date lastRedirectDate ) {this.lastRedirectDate = lastRedirectDate;}

  public Integer getExpire() {return expire;}

  public void setExpire( Integer expire ) {this.expire = expire;}

  public String getLastDomain() {return lastDomain;}

  public void setLastDomain( String lastDomain ) {this.lastDomain = lastDomain;}

  public Integer getDebugIdt() {return debugIdt;}

  public void setDebugIdt( Integer debugIdt ) {this.debugIdt = debugIdt;}

  public Integer getUpdateIdt() {return updateIdt;}

  public void setUpdateIdt( Integer updateIdt ) {this.updateIdt = updateIdt;}

  public String getHardwareVer() {return hardwareVer;}

  public void setHardwareVer( String hardwareVer ) {this.hardwareVer = hardwareVer;}

  public String getFirmwareVer() {return firmwareVer;}

  public void setFirmwareVer( String firmwareVer ) {this.firmwareVer = firmwareVer;}

  public String getSoftwareVer() {return softwareVer;}

  public void setSoftwareVer( String softwareVer ) {this.softwareVer = softwareVer;}

//  public Date getLastUpdateDate() {return lastUpdateDate;}
//
//  public void setLastUpdateDate( Date lastUpdateDate ) {this.lastUpdateDate = lastUpdateDate;}
//
  public Date getLastConnectTime() {return lastConnectTime;}
  
  public void setLastConnectTime( Date lastConnectTime ) {this.lastConnectTime = lastConnectTime;}
  
  public String getLastConnectIP() {return lastConnectIP;}
  
  public void setLastConnectIP( String lastConnectIP ) {this.lastConnectIP = lastConnectIP;}
  
  public String getRemark() {return remark;}

  public void setRemark( String remark ) {this.remark = remark;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

public String getAlaisName() {
	return alaisName;
}

public void setAlaisName(String alaisName) {
	this.alaisName = alaisName;
}

public Integer getOnline() {
	return online;
}

public void setOnline(Integer online) {
	this.online = online;
}

}
