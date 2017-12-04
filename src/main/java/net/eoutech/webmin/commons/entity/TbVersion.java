
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbVersion {

  private String keyVerID;
  private Integer svn;
  private String idxModule;
  private String state;
  private String nextVer;
  private String downloadURL;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date releaseDate;
  private String releaseLog;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date effectDate;
  private Integer devCntNum;
  @JSONField(format = "yyyy-MM-dd")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date devCntDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyVerID() {return keyVerID;}
  
  public void setKeyVerID( String keyVerID ) {this.keyVerID = keyVerID;}
  
  public Integer getSvn() {return svn;}
  
  public void setSvn( Integer svn ) {this.svn = svn;}
  
  public String getIdxModule() {return idxModule;}
  
  public void setIdxModule( String idxModule ) {this.idxModule = idxModule;}
  
  public String getState() {return state;}
  
  public void setState( String state ) {this.state = state;}
  
  public String getNextVer() {return nextVer;}
  
  public void setNextVer( String nextVer ) {this.nextVer = nextVer;}
  
  public String getDownloadURL() {return downloadURL;}
  
  public void setDownloadURL( String downloadURL ) {this.downloadURL = downloadURL;}
  
  public Date getReleaseDate() {return releaseDate;}
  
  public void setReleaseDate( Date releaseDate ) {this.releaseDate = releaseDate;}
  
  public String getReleaseLog() {return releaseLog;}
  
  public void setReleaseLog( String releaseLog ) {this.releaseLog = releaseLog;}
  
  public Date getEffectDate() {return effectDate;}
  
  public void setEffectDate( Date effectDate ) {this.effectDate = effectDate;}
  
  public Integer getDevCntNum() {return devCntNum;}
  
  public void setDevCntNum( Integer devCntNum ) {this.devCntNum = devCntNum;}
  
  public Date getDevCntDate() {return devCntDate;}
  
  public void setDevCntDate( Date devCntDate ) {this.devCntDate = devCntDate;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
