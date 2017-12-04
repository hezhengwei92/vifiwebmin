
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbDailyRental {

  private Integer keyID;
  private String idxViFiID;
  private String idxPhoneNumber;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date startDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date endDate;
  private Integer maxData;
  private Integer rateLimit;
  private Integer price;
  private String areaCodes;
  private Integer todayUsage;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyID() {return keyID;}
  
  public void setKeyID( Integer keyID ) {this.keyID = keyID;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getIdxPhoneNumber() {return idxPhoneNumber;}
  
  public void setIdxPhoneNumber( String idxPhoneNumber ) {this.idxPhoneNumber = idxPhoneNumber;}
  
  public Date getStartDate() {return startDate;}
  
  public void setStartDate( Date startDate ) {this.startDate = startDate;}
  
  public Date getEndDate() {return endDate;}
  
  public void setEndDate( Date endDate ) {this.endDate = endDate;}
  
  public Integer getMaxData() {return maxData;}
  
  public void setMaxData( Integer maxData ) {this.maxData = maxData;}
  
  public Integer getRateLimit() {return rateLimit;}
  
  public void setRateLimit( Integer rateLimit ) {this.rateLimit = rateLimit;}
  
  public Integer getPrice() {return price;}
  
  public void setPrice( Integer price ) {this.price = price;}
  
  public String getAreaCodes() {return areaCodes;}
  
  public void setAreaCodes( String areaCodes ) {this.areaCodes = areaCodes;}
  
  public Integer getTodayUsage() {return todayUsage;}
  
  public void setTodayUsage( Integer todayUsage ) {this.todayUsage = todayUsage;}
  
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

}
