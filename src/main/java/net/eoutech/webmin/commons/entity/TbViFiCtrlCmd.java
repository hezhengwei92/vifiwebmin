
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbViFiCtrlCmd {

  private String keyCtrlCmdID;
  private String ViFiDomain;
  private String idxViFiID;
  private String cmd;
  private String params;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date effectDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date ineffectDate;
  private Integer duration;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyCtrlCmdID() {return keyCtrlCmdID;}
  
  public void setKeyCtrlCmdID( String keyCtrlCmdID ) {this.keyCtrlCmdID = keyCtrlCmdID;}
  @JSONField(name = "ViFiDomain")
  public String getViFiDomain() {return ViFiDomain;}
  @JSONField(name = "ViFiDomain")
  public void setViFiDomain( String ViFiDomain ) {this.ViFiDomain = ViFiDomain;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getCmd() {return cmd;}
  
  public void setCmd( String cmd ) {this.cmd = cmd;}
  
  public String getParams() {return params;}
  
  public void setParams( String params ) {this.params = params;}
  
  public Date getEffectDate() {return effectDate;}
  
  public void setEffectDate( Date effectDate ) {this.effectDate = effectDate;}
  
  public Date getIneffectDate() {return ineffectDate;}
  
  public void setIneffectDate( Date ineffectDate ) {this.ineffectDate = ineffectDate;}
  
  public Integer getDuration() {return duration;}
  
  public void setDuration( Integer duration ) {this.duration = duration;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
