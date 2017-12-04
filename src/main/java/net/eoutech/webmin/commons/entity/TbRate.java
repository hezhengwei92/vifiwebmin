
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbRate {

  private Integer keyRateID;
  private String rateMode;
  private Integer direction;
  private String idxAgentID;
  private String idxCallPrefix;
  private String countryCode;
  private String country;
  private Integer priceCallOnline;
  private Integer priceCallOffline;
  private Integer priceCallbackOff;
  private Integer priceCallGoIP;
  private Integer priceCallbackGoIP;
  private Integer priceSMS;
  private Integer priceNET;
  private Integer dayDataPrice;
  private Integer dayDataLimit;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyRateID() {return keyRateID;}
  
  public void setKeyRateID( Integer keyRateID ) {this.keyRateID = keyRateID;}
  
  public String getRateMode() {return rateMode;}
  
  public void setRateMode( String rateMode ) {this.rateMode = rateMode;}
  
  public Integer getDirection() {return direction;}
  
  public void setDirection( Integer direction ) {this.direction = direction;}
  
  public String getIdxCallPrefix() {return idxCallPrefix;}
  
  public void setIdxCallPrefix( String idxCallPrefix ) {this.idxCallPrefix = idxCallPrefix;}
  
  public String getCountryCode() {return countryCode;}
  
  public void setCountryCode( String countryCode ) {this.countryCode = countryCode;}
  
  public String getCountry() {return country;}
  
  public void setCountry( String country ) {this.country = country;}
  
  public Integer getPriceCallOnline() {return priceCallOnline;}
  
  public void setPriceCallOnline( Integer priceCallOnline ) {this.priceCallOnline = priceCallOnline;}
  
  public Integer getPriceCallOffline() {return priceCallOffline;}
  
  public void setPriceCallOffline( Integer priceCallOffline ) {this.priceCallOffline = priceCallOffline;}
  
  public Integer getPriceCallbackOff() {return priceCallbackOff;}
  
  public void setPriceCallbackOff( Integer priceCallbackOff ) {this.priceCallbackOff = priceCallbackOff;}
  
  public Integer getPriceCallGoIP() {return priceCallGoIP;}
  
  public void setPriceCallGoIP( Integer priceCallGoIP ) {this.priceCallGoIP = priceCallGoIP;}
  
  public Integer getPriceCallbackGoIP() {return priceCallbackGoIP;}
  
  public void setPriceCallbackGoIP( Integer priceCallbackGoIP ) {this.priceCallbackGoIP = priceCallbackGoIP;}
  
  public Integer getPriceSMS() {return priceSMS;}
  
  public void setPriceSMS( Integer priceSMS ) {this.priceSMS = priceSMS;}
  
  public Integer getPriceNET() {return priceNET;}
  
  public void setPriceNET( Integer priceNET ) {this.priceNET = priceNET;}
  
  public Integer getDayDataPrice() {return dayDataPrice;}
  
  public void setDayDataPrice( Integer dayDataPrice ) {this.dayDataPrice = dayDataPrice;}
  
  public Integer getDayDataLimit() {return dayDataLimit;}
  
  public void setDayDataLimit( Integer dayDataLimit ) {this.dayDataLimit = dayDataLimit;}
  
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

public String getIdxAgentID() {
	return idxAgentID;
}

public void setIdxAgentID(String idxAgentID) {
	this.idxAgentID = idxAgentID;
}

}
