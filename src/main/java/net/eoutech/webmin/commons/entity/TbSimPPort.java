
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSimPPort {

  private Integer keyID;
  private String idxSimPDevID;
  private Integer idxSlotNum;
  private Integer status;
  private String idxIccid;
  private String idxViFiId;
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
  private String idxAgentID;

  public String getIdxAgentID() {
    return idxAgentID;
  }

  public void setIdxAgentID(String idxAgentID) {
    this.idxAgentID = idxAgentID;
  }

  
  public Integer getKeyID() {return keyID;}
  
  public void setKeyID( Integer keyID ) {this.keyID = keyID;}
  
  public String getIdxSimPDevID() {return idxSimPDevID;}
  
  public void setIdxSimPDevID( String idxSimPDevID ) {this.idxSimPDevID = idxSimPDevID;}
  
  public Integer getIdxSlotNum() {return idxSlotNum;}
  
  public void setIdxSlotNum( Integer idxSlotNum ) {this.idxSlotNum = idxSlotNum;}
  
  public Integer getStatus() {return status;}
  
  public void setStatus( Integer status ) {this.status = status;}
  
  public String getIdxIccid() {return idxIccid;}
  
  public void setIdxIccid( String idxIccid ) {this.idxIccid = idxIccid;}
  
  public String getIdxViFiId() {return idxViFiId;}
  
  public void setIdxViFiId( String idxViFiId ) {this.idxViFiId = idxViFiId;}
  
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
