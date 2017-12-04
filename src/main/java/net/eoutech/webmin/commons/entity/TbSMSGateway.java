
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSMSGateway {

  private String keySMSGWID;
  private String smsGwName;
  private String countryCode;
  private String routePrefix;
  private String gwUID;
  private String gwPwd;
  private Integer priority;
  private Integer state;
  private Integer totalSucc;
  private Integer totalFail;
  private Integer errors;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastSuccDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastFailDate;
  private Integer remSMS;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeySMSGWID() {return keySMSGWID;}
  
  public void setKeySMSGWID( String keySMSGWID ) {this.keySMSGWID = keySMSGWID;}
  
  public String getSmsGwName() {return smsGwName;}
  
  public void setSmsGwName( String smsGwName ) {this.smsGwName = smsGwName;}
  
  public String getCountryCode() {return countryCode;}
  
  public void setCountryCode( String countryCode ) {this.countryCode = countryCode;}
  
  public String getRoutePrefix() {return routePrefix;}
  
  public void setRoutePrefix( String routePrefix ) {this.routePrefix = routePrefix;}
  
  public String getGwUID() {return gwUID;}
  
  public void setGwUID( String gwUID ) {this.gwUID = gwUID;}
  
  public String getGwPwd() {return gwPwd;}
  
  public void setGwPwd( String gwPwd ) {this.gwPwd = gwPwd;}

  public Integer getPriority() {
    return priority;
  }

  public void setPriority( Integer priority ) {
    this.priority = priority;
  }

  public Integer getState() {
    return state;
  }

  public void setState( Integer state ) {
    this.state = state;
  }

  public Integer getTotalSucc() {
    return totalSucc;
  }

  public void setTotalSucc( Integer totalSucc ) {
    this.totalSucc = totalSucc;
  }

  public Integer getTotalFail() {
    return totalFail;
  }

  public void setTotalFail( Integer totalFail ) {
    this.totalFail = totalFail;
  }

  public Integer getErrors() {
    return errors;
  }

  public void setErrors( Integer errors ) {
    this.errors = errors;
  }

  public Date getLastSuccDate() {
    return lastSuccDate;
  }

  public void setLastSuccDate( Date lastSuccDate ) {
    this.lastSuccDate = lastSuccDate;
  }

  public Date getLastFailDate() {
    return lastFailDate;
  }

  public void setLastFailDate( Date lastFailDate ) {
    this.lastFailDate = lastFailDate;
  }

  public Integer getRemSMS() {
    return remSMS;
  }

  public void setRemSMS( Integer remSMS ) {
    this.remSMS = remSMS;
  }

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
