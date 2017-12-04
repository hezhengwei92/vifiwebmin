
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSMSCountDaily {

  private Integer keyID;
  private String idxSMSGWId;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date idxCountDate;
  private Integer cntSend;
  private Integer cntSucc;
  private Integer cntFail;
  private Integer cntRecv;
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
  
  public String getIdxSMSGWId() {return idxSMSGWId;}
  
  public void setIdxSMSGWId( String idxSMSGWId ) {this.idxSMSGWId = idxSMSGWId;}
  
  public Date getIdxCountDate() {return idxCountDate;}
  
  public void setIdxCountDate( Date idxCountDate ) {this.idxCountDate = idxCountDate;}
  
  public Integer getCntSend() {return cntSend;}
  
  public void setCntSend( Integer cntSend ) {this.cntSend = cntSend;}
  
  public Integer getCntSucc() {return cntSucc;}
  
  public void setCntSucc( Integer cntSucc ) {this.cntSucc = cntSucc;}
  
  public Integer getCntFail() {return cntFail;}
  
  public void setCntFail( Integer cntFail ) {this.cntFail = cntFail;}
  
  public Integer getCntRecv() {return cntRecv;}
  
  public void setCntRecv( Integer cntRecv ) {this.cntRecv = cntRecv;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
