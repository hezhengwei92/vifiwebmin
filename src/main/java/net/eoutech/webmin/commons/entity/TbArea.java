
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbArea {

  private String keyAreaCode;
  private String name;
  private String countryName;
  private String localName;
  private Integer timeZone;
  private String language;
  private String continent;
  private String domain;
  private String currency;
  private Integer totalNumber;
  private String support;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyAreaCode() {return keyAreaCode;}
  
  public void setKeyAreaCode( String keyAreaCode ) {this.keyAreaCode = keyAreaCode;}
  
  public String getName() {return name;}
  
  public void setName( String name ) {this.name = name;}
  
  public String getCountryName() {return countryName;}
  
  public void setCountryName( String countryName ) {this.countryName = countryName;}
  
  public String getLocalName() {return localName;}
  
  public void setLocalName( String localName ) {this.localName = localName;}
  
  public Integer getTimeZone() {return timeZone;}
  
  public void setTimeZone( Integer timeZone ) {this.timeZone = timeZone;}
  
  public String getLanguage() {return language;}
  
  public void setLanguage( String language ) {this.language = language;}
  
  public String getContinent() {return continent;}
  
  public void setContinent( String continent ) {this.continent = continent;}
  
  public String getDomain() {return domain;}
  
  public void setDomain( String domain ) {this.domain = domain;}
  
  public String getCurrency() {return currency;}
  
  public void setCurrency( String currency ) {this.currency = currency;}
  
  public Integer getTotalNumber() {return totalNumber;}
  
  public void setTotalNumber( Integer totalNumber ) {this.totalNumber = totalNumber;}
  
  public String getSupport() {return support;}
  
  public void setSupport( String support ) {this.support = support;}
  
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
