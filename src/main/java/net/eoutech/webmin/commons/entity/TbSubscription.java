
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSubscription {

  private Integer keySubscriptionId;
  private String idxPhoneNumber;
  private String deviceId;
  private String checkCode;
  private String state;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date subscribeTime;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date checkTime;
  private Integer subscribeNum;
  private String ipaddress;
  private String deviceInfo;
  private String osInfo;
  private String mappVersion;
  private String recommendByCode;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeySubscriptionId() {return keySubscriptionId;}
  
  public void setKeySubscriptionId( Integer keySubscriptionId ) {this.keySubscriptionId = keySubscriptionId;}
  
  public String getIdxPhoneNumber() {return idxPhoneNumber;}
  
  public void setIdxPhoneNumber( String idxPhoneNumber ) {this.idxPhoneNumber = idxPhoneNumber;}
  
  public String getDeviceId() {return deviceId;}
  
  public void setDeviceId( String deviceId ) {this.deviceId = deviceId;}
  
  public String getCheckCode() {return checkCode;}
  
  public void setCheckCode( String checkCode ) {this.checkCode = checkCode;}
  
  public String getState() {return state;}
  
  public void setState( String state ) {this.state = state;}
  
  public Date getSubscribeTime() {return subscribeTime;}
  
  public void setSubscribeTime( Date subscribeTime ) {this.subscribeTime = subscribeTime;}
  
  public Date getCheckTime() {return checkTime;}
  
  public void setCheckTime( Date checkTime ) {this.checkTime = checkTime;}
  
  public Integer getSubscribeNum() {return subscribeNum;}
  
  public void setSubscribeNum( Integer subscribeNum ) {this.subscribeNum = subscribeNum;}
  
  public String getIpaddress() {return ipaddress;}
  
  public void setIpaddress( String ipaddress ) {this.ipaddress = ipaddress;}
  
  public String getDeviceInfo() {return deviceInfo;}
  
  public void setDeviceInfo( String deviceInfo ) {this.deviceInfo = deviceInfo;}
  
  public String getOsInfo() {return osInfo;}
  
  public void setOsInfo( String osInfo ) {this.osInfo = osInfo;}
  
  public String getMappVersion() {return mappVersion;}
  
  public void setMappVersion( String mappVersion ) {this.mappVersion = mappVersion;}
  
  public String getRecommendByCode() {return recommendByCode;}
  
  public void setRecommendByCode( String recommendByCode ) {this.recommendByCode = recommendByCode;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
