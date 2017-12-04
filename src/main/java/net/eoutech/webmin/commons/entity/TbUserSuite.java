
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbUserSuite {

  private Integer keyID;
  private String idxPhoneNumber;
  private String suiteType;
  private Integer remainValue;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date effectDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date invalidDate;
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
  
  public String getIdxPhoneNumber() {return idxPhoneNumber;}
  
  public void setIdxPhoneNumber( String idxPhoneNumber ) {this.idxPhoneNumber = idxPhoneNumber;}
  
  public String getSuiteType() {return suiteType;}
  
  public void setSuiteType( String suiteType ) {this.suiteType = suiteType;}
  
  public Integer getRemainValue() {return remainValue;}
  
  public void setRemainValue( Integer remainValue ) {this.remainValue = remainValue;}
  
  public Date getEffectDate() {return effectDate;}
  
  public void setEffectDate( Date effectDate ) {this.effectDate = effectDate;}
  
  public Date getInvalidDate() {return invalidDate;}
  
  public void setInvalidDate( Date invalidDate ) {this.invalidDate = invalidDate;}
  
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
