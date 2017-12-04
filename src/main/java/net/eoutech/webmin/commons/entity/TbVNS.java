
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbVNS {

  private String keyVNSID;
  private String vnsname;
  private String vnsAddrDomin;
  private String vnsProtocol;
  private String vnsAddrIP;
  private Integer wsPort;
  //private Integer udpPort;
  private Integer vnsAddrPort;
  private String domain;
  private Integer ViFiNumber;
  private Integer onlineViFiNum;
  private String countryCode;
  private String countryName;
  private String areaName;
  private String lng;
  private String lat;
  private String lang;
  private String currency;
  private Integer timezone;
  private String wsAddr;
  private String wsUID;
  private String wsPwd;
  private String remark;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyVNSID() {return keyVNSID;}
  
  public void setKeyVNSID( String keyVNSID ) {this.keyVNSID = keyVNSID;}
  
  public String getVnsname() {return vnsname;}
  
  public void setVnsname( String vnsname ) {this.vnsname = vnsname;}
  
  public String getVnsAddrDomin() {return vnsAddrDomin;}
  
  public void setVnsAddrDomin( String vnsAddrDomin ) {this.vnsAddrDomin = vnsAddrDomin;}
  
  public String getVnsAddrIP() {return vnsAddrIP;}
  
  public void setVnsAddrIP( String vnsAddrIP ) {this.vnsAddrIP = vnsAddrIP;}
  
  public Integer getWsPort() {return wsPort;}
  
  public void setWsPort( Integer wsPort ) {this.wsPort = wsPort;}
  
  public String getDomain() {return domain;}
  
  public void setDomain( String domain ) {this.domain = domain;}
  @JSONField(name = "ViFiNumber")
  public Integer getViFiNumber() {return ViFiNumber;}
  @JSONField(name = "ViFiNumber")
  public void setViFiNumber( Integer ViFiNumber ) {this.ViFiNumber = ViFiNumber;}
  
  public Integer getOnlineViFiNum() {return onlineViFiNum;}
  
  public void setOnlineViFiNum( Integer onlineViFiNum ) {this.onlineViFiNum = onlineViFiNum;}
  
  public String getCountryCode() {return countryCode;}
  
  public void setCountryCode( String countryCode ) {this.countryCode = countryCode;}
  
  public String getCountryName() {return countryName;}
  
  public void setCountryName( String countryName ) {this.countryName = countryName;}
  
  public String getAreaName() {return areaName;}
  
  public void setAreaName( String areaName ) {this.areaName = areaName;}
  
  public String getLng() {return lng;}
  
  public void setLng( String lng ) {this.lng = lng;}
  
  public String getLat() {return lat;}
  
  public void setLat( String lat ) {this.lat = lat;}
  
  public String getLang() {return lang;}
  
  public void setLang( String lang ) {this.lang = lang;}
  
  public String getCurrency() {return currency;}
  
  public void setCurrency( String currency ) {this.currency = currency;}
  
  public Integer getTimezone() {return timezone;}
  
  public void setTimezone( Integer timezone ) {this.timezone = timezone;}
  
  public String getWsAddr() {return wsAddr;}
  
  public void setWsAddr( String wsAddr ) {this.wsAddr = wsAddr;}
  
  public String getWsUID() {return wsUID;}
  
  public void setWsUID( String wsUID ) {this.wsUID = wsUID;}
  
  public String getWsPwd() {return wsPwd;}
  
  public void setWsPwd( String wsPwd ) {this.wsPwd = wsPwd;}
  
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

public String getVnsProtocol() {
	return vnsProtocol;
}

public void setVnsProtocol(String vnsProtocol) {
	this.vnsProtocol = vnsProtocol;
}

public Integer getVnsAddrPort() {
	return vnsAddrPort;
}

public void setVnsAddrPort(Integer vnsAddrPort) {
	this.vnsAddrPort = vnsAddrPort;
}

}
