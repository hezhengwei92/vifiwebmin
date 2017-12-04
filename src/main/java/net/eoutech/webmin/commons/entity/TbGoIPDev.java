
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGoIPDev {

  private String keyGoIPDevID;
  private String devName;
  private String idxGoIPDevGrpID;
  private String typeName;
  private String username;
  private String password;
  private Integer expire;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastUpdate;
  private String sipAccount;
  private String ipaddr;
  private Integer port;
  private Integer status;
  private String ports;
  private String idxVSWID;
  private Integer sipPort;
  private Integer sipRegExp;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date sipRegDate;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;
  private Integer sipOnline;

  
  public String getKeyGoIPDevID() {return keyGoIPDevID;}
  
  public void setKeyGoIPDevID( String keyGoIPDevID ) {this.keyGoIPDevID = keyGoIPDevID;}
  
  public String getDevName() {return devName;}
  
  public void setDevName( String devName ) {this.devName = devName;}
  
  
  public String getIdxGoIPDevGrpID() {
	return idxGoIPDevGrpID;
}

public void setIdxGoIPDevGrpID(String idxGoIPDevGrpID) {
	this.idxGoIPDevGrpID = idxGoIPDevGrpID;
}

public String getTypeName() {return typeName;}
  
  public void setTypeName( String typeName ) {this.typeName = typeName;}
  
  public String getUsername() {return username;}
  
  public void setUsername( String username ) {this.username = username;}
  
  public String getPassword() {return password;}
  
  public void setPassword( String password ) {this.password = password;}
  
  public Integer getExpire() {return expire;}
  
  public void setExpire( Integer expire ) {this.expire = expire;}
  
  public Date getLastUpdate() {return lastUpdate;}
  
  public void setLastUpdate( Date lastUpdate ) {this.lastUpdate = lastUpdate;}
  
  public String getSipAccount() {return sipAccount;}
  
  public void setSipAccount( String sipAccount ) {this.sipAccount = sipAccount;}
  
  public String getIpaddr() {return ipaddr;}
  
  public void setIpaddr( String ipaddr ) {this.ipaddr = ipaddr;}
  
  public Integer getPort() {return port;}
  
  public void setPort( Integer port ) {this.port = port;}
  
  public Integer getStatus() {return status;}
  
  public void setStatus( Integer status ) {this.status = status;}
  
  public String getPorts() {return ports;}
  
  public void setPorts( String ports ) {this.ports = ports;}
  
  public String getIdxVSWID() {return idxVSWID;}
  
  public void setIdxVSWID( String idxVSWID ) {this.idxVSWID = idxVSWID;}
  
  public Integer getSipPort() {return sipPort;}
  
  public void setSipPort( Integer sipPort ) {this.sipPort = sipPort;}
  
  public Integer getSipRegExp() {return sipRegExp;}
  
  public void setSipRegExp( Integer sipRegExp ) {this.sipRegExp = sipRegExp;}
  
  public Date getSipRegDate() {return sipRegDate;}
  
  public void setSipRegDate( Date sipRegDate ) {this.sipRegDate = sipRegDate;}
  
  public String getRemarks() {return remarks;}
  
  public void setRemarks( String remarks ) {this.remarks = remarks;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

public Integer getSipOnline() {
	return sipOnline;
}

public void setSipOnline(Integer sipOnline) {
	this.sipOnline = sipOnline;
}

}
