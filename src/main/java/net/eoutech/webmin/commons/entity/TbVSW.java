
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbVSW {

  private String keyVSWID;
  private String hostname;
  private String vswpwd;
  private Integer expire;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastHBTime;
  private String state;
  private String vswProtocol;
  private String publicIP;
  private Integer publicPort;
  private String idxUUWiFiAreaId;
  private String location;
  private String countryCode;
  private String ISPName;
  private Integer bandwidth;
  private Integer star;
  private String esxiHost;
  private String CPU;
  private Integer MEM;
  private Integer HARDDISK;
  private Integer diskUsage;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date powerDate;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  private String idxAgentID;

  public String getIdxAgentID() {
    return idxAgentID;
  }

  public void setIdxAgentID(String idxAgentID) {
    this.idxAgentID = idxAgentID;
  }
  
  public String getKeyVSWID() {return keyVSWID;}
  
  public void setKeyVSWID( String keyVSWID ) {this.keyVSWID = keyVSWID;}
  
  public String getHostname() {return hostname;}
  
  public void setHostname( String hostname ) {this.hostname = hostname;}
  
  public String getVswpwd() {return vswpwd;}
  
  public void setVswpwd( String vswpwd ) {this.vswpwd = vswpwd;}
  
  public Integer getExpire() {return expire;}
  
  public void setExpire( Integer expire ) {this.expire = expire;}
  
  public Date getLastHBTime() {return lastHBTime;}
  
  public void setLastHBTime( Date lastHBTime ) {this.lastHBTime = lastHBTime;}
  
  public String getState() {return state;}
  
  public void setState( String state ) {this.state = state;}
  
  public String getPublicIP() {return publicIP;}
  
  public void setPublicIP( String publicIP ) {this.publicIP = publicIP;}
  
  public Integer getPublicPort() {return publicPort;}
  
  public void setPublicPort( Integer publicPort ) {this.publicPort = publicPort;}
  
  public String getLocation() {return location;}
  
  public void setLocation( String location ) {this.location = location;}
  
  public String getCountryCode() {return countryCode;}
  
  public void setCountryCode( String countryCode ) {this.countryCode = countryCode;}
  @JSONField(name = "ISPName")
  public String getISPName() {return ISPName;}
  @JSONField(name = "ISPName")
  public void setISPName( String ISPName ) {this.ISPName = ISPName;}
  
  public Integer getBandwidth() {return bandwidth;}
  
  public void setBandwidth( Integer bandwidth ) {this.bandwidth = bandwidth;}
  
  public Integer getStar() {return star;}
  
  public void setStar( Integer star ) {this.star = star;}
  
  public String getEsxiHost() {return esxiHost;}
  
  public void setEsxiHost( String esxiHost ) {this.esxiHost = esxiHost;}
  @JSONField(name = "CPU")
  public String getCPU() {return CPU;}
  @JSONField(name = "CPU")
  public void setCPU( String CPU ) {this.CPU = CPU;}
  @JSONField(name = "MEM")
  public Integer getMEM() {return MEM;}
  @JSONField(name = "MEM")
  public void setMEM( Integer MEM ) {this.MEM = MEM;}
  @JSONField(name = "HARDDISK")
  public Integer getHARDDISK() {return HARDDISK;}
  @JSONField(name = "HARDDISK")
  public void setHARDDISK( Integer HARDDISK ) {this.HARDDISK = HARDDISK;}
  
  public Integer getDiskUsage() {return diskUsage;}
  
  public void setDiskUsage( Integer diskUsage ) {this.diskUsage = diskUsage;}
  
  public Date getPowerDate() {return powerDate;}
  
  public void setPowerDate( Date powerDate ) {this.powerDate = powerDate;}
  
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

public String getIdxUUWiFiAreaId() {
	return idxUUWiFiAreaId;
}

public void setIdxUUWiFiAreaId(String idxUUWiFiAreaId) {
	this.idxUUWiFiAreaId = idxUUWiFiAreaId;
}

public String getVswProtocol() {
	return vswProtocol;
}

public void setVswProtocol(String vswProtocol) {
	this.vswProtocol = vswProtocol;
}

}
