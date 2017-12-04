
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGoIPPort {

  private Integer keyID;
  private String idxGoIPDevID;
  private Integer idxportNum;
  private Integer status;
  private String idxViFiID;
  private String uuIccid;
  private String uuImsi;
  private String userAct;
  private Integer usage;
  private Integer duration;
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
  
  public String getIdxGoIPDevID() {return idxGoIPDevID;}
  
  public void setIdxGoIPDevID( String idxGoIPDevID ) {this.idxGoIPDevID = idxGoIPDevID;}
  
  public Integer getIdxportNum() {return idxportNum;}
  
  public void setIdxportNum( Integer idxportNum ) {this.idxportNum = idxportNum;}
  
  public Integer getStatus() {return status;}
  
  public void setStatus( Integer status ) {this.status = status;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getUuIccid() {return uuIccid;}
  
  public void setUuIccid( String uuIccid ) {this.uuIccid = uuIccid;}
  
  public String getUuImsi() {return uuImsi;}
  
  public void setUuImsi( String uuImsi ) {this.uuImsi = uuImsi;}
  
  public String getUserAct() {return userAct;}
  
  public void setUserAct( String userAct ) {this.userAct = userAct;}
  
  public Integer getUsage() {return usage;}
  
  public void setUsage( Integer usage ) {this.usage = usage;}
  
  public Integer getDuration() {return duration;}
  
  public void setDuration( Integer duration ) {this.duration = duration;}
  
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
