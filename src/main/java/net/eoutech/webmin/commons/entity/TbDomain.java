
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbDomain {

  private String keyDomain;
  private String idxParentsDomain;
  private String state;
  private String vnsAddrList;
  private String countryCode;
  private String lang;
  private String currency;
  private Integer timezone;
  private String authToken;
  private Integer devNumber;
  private Integer actNumber;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyDomain() {return keyDomain;}
  
  public void setKeyDomain( String keyDomain ) {this.keyDomain = keyDomain;}
  
  public String getIdxParentsDomain() {return idxParentsDomain;}
  
  public void setIdxParentsDomain( String idxParentsDomain ) {this.idxParentsDomain = idxParentsDomain;}
  
  public String getState() {return state;}
  
  public void setState( String state ) {this.state = state;}
  
  public String getVnsAddrList() {return vnsAddrList;}
  
  public void setVnsAddrList( String vnsAddrList ) {this.vnsAddrList = vnsAddrList;}
  
  public String getCountryCode() {return countryCode;}
  
  public void setCountryCode( String countryCode ) {this.countryCode = countryCode;}
  
  public String getLang() {return lang;}
  
  public void setLang( String lang ) {this.lang = lang;}
  
  public String getCurrency() {return currency;}
  
  public void setCurrency( String currency ) {this.currency = currency;}
  
  public Integer getTimezone() {return timezone;}
  
  public void setTimezone( Integer timezone ) {this.timezone = timezone;}
  
  public String getAuthToken() {return authToken;}
  
  public void setAuthToken( String authToken ) {this.authToken = authToken;}
  
  public Integer getDevNumber() {return devNumber;}
  
  public void setDevNumber( Integer devNumber ) {this.devNumber = devNumber;}
  
  public Integer getActNumber() {return actNumber;}
  
  public void setActNumber( Integer actNumber ) {this.actNumber = actNumber;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
