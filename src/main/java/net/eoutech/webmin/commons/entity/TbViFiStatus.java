
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbViFiStatus {

  private Integer keyStatusID;
  private String idxViFiID;
  private String vnsDomain;
  private String cos;
  private Integer uptime;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastChargingTime;
  private Integer battery;
  private Integer wifiSignal;
  private Integer gsmSignal;
  private Integer gsmRate;
  private Integer wifiDevNum;
  private Integer gsmRxBytes;
  private Integer gsmTxBytes;
  private Integer wifiRxBytes;
  private Integer wifiTxBytes;
  private Integer timezone;
  private String ispID;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date updateDate;
  private String updateIP;

  
  public Integer getKeyStatusID() {return keyStatusID;}
  
  public void setKeyStatusID( Integer keyStatusID ) {this.keyStatusID = keyStatusID;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getVnsDomain() {return vnsDomain;}
  
  public void setVnsDomain( String vnsDomain ) {this.vnsDomain = vnsDomain;}
  
  public String getCos() {return cos;}
  
  public void setCos( String cos ) {this.cos = cos;}
  
  public Integer getUptime() {return uptime;}
  
  public void setUptime( Integer uptime ) {this.uptime = uptime;}
  
  public Date getLastChargingTime() {return lastChargingTime;}
  
  public void setLastChargingTime( Date lastChargingTime ) {this.lastChargingTime = lastChargingTime;}
  
  public Integer getBattery() {return battery;}
  
  public void setBattery( Integer battery ) {this.battery = battery;}
  
  public Integer getWifiSignal() {return wifiSignal;}
  
  public void setWifiSignal( Integer wifiSignal ) {this.wifiSignal = wifiSignal;}
  
  public Integer getGsmSignal() {return gsmSignal;}
  
  public void setGsmSignal( Integer gsmSignal ) {this.gsmSignal = gsmSignal;}
  
  public Integer getGsmRate() {return gsmRate;}
  
  public void setGsmRate( Integer gsmRate ) {this.gsmRate = gsmRate;}
  
  public Integer getWifiDevNum() {return wifiDevNum;}
  
  public void setWifiDevNum( Integer wifiDevNum ) {this.wifiDevNum = wifiDevNum;}
  
  public Integer getGsmRxBytes() {return gsmRxBytes;}
  
  public void setGsmRxBytes( Integer gsmRxBytes ) {this.gsmRxBytes = gsmRxBytes;}
  
  public Integer getGsmTxBytes() {return gsmTxBytes;}
  
  public void setGsmTxBytes( Integer gsmTxBytes ) {this.gsmTxBytes = gsmTxBytes;}
  
  public Integer getWifiRxBytes() {return wifiRxBytes;}
  
  public void setWifiRxBytes( Integer wifiRxBytes ) {this.wifiRxBytes = wifiRxBytes;}
  
  public Integer getWifiTxBytes() {return wifiTxBytes;}
  
  public void setWifiTxBytes( Integer wifiTxBytes ) {this.wifiTxBytes = wifiTxBytes;}
  
  public Integer getTimezone() {return timezone;}
  
  public void setTimezone( Integer timezone ) {this.timezone = timezone;}
  
  public String getIspID() {return ispID;}
  
  public void setIspID( String ispID ) {this.ispID = ispID;}
  
  public Date getUpdateDate() {return updateDate;}
  
  public void setUpdateDate( Date updateDate ) {this.updateDate = updateDate;}
  
  public String getUpdateIP() {return updateIP;}
  
  public void setUpdateIP( String updateIP ) {this.updateIP = updateIP;}

}
