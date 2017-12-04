
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbCountSrcIP {

  private Integer keyCountSrcIPId;
  private String idxSrcIP;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date idxCountDate;
  private Integer idxServType;
  private Integer cntNumber;
  private Integer lastCntNumber;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyCountSrcIPId() {return keyCountSrcIPId;}
  
  public void setKeyCountSrcIPId( Integer keyCountSrcIPId ) {this.keyCountSrcIPId = keyCountSrcIPId;}
  
  public String getIdxSrcIP() {return idxSrcIP;}
  
  public void setIdxSrcIP( String idxSrcIP ) {this.idxSrcIP = idxSrcIP;}
  
  public Date getIdxCountDate() {return idxCountDate;}
  
  public void setIdxCountDate( Date idxCountDate ) {this.idxCountDate = idxCountDate;}
  
  public Integer getIdxServType() {return idxServType;}
  
  public void setIdxServType( Integer idxServType ) {this.idxServType = idxServType;}
  
  public Integer getCntNumber() {return cntNumber;}
  
  public void setCntNumber( Integer cntNumber ) {this.cntNumber = cntNumber;}
  
  public Integer getLastCntNumber() {return lastCntNumber;}
  
  public void setLastCntNumber( Integer lastCntNumber ) {this.lastCntNumber = lastCntNumber;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
