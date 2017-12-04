
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbCountOnlineDaily {

  private String keyCODID;
  private Integer appOnline;
  private Integer newRegister;
  private Integer UUWiFiOnline;
  private Integer VNSOnline;
  private Integer VPXOnline;
  private Integer VSWOnline;
  private Integer TrunkOnline;
  private Integer GoIPOnline;
  private Integer SimPOnline;
  private Integer SIMOnline;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyCODID() {return keyCODID;}
  
  public void setKeyCODID( String keyCODID ) {this.keyCODID = keyCODID;}
  
  public Integer getAppOnline() {return appOnline;}
  
  public void setAppOnline( Integer appOnline ) {this.appOnline = appOnline;}
  
  public Integer getNewRegister() {return newRegister;}
  
  public void setNewRegister( Integer newRegister ) {this.newRegister = newRegister;}
  @JSONField(name = "UUWiFiOnline")
  public Integer getUUWiFiOnline() {return UUWiFiOnline;}
  @JSONField(name = "UUWiFiOnline")
  public void setUUWiFiOnline( Integer UUWiFiOnline ) {this.UUWiFiOnline = UUWiFiOnline;}
  @JSONField(name = "VNSOnline")
  public Integer getVNSOnline() {return VNSOnline;}
  @JSONField(name = "VNSOnline")
  public void setVNSOnline( Integer VNSOnline ) {this.VNSOnline = VNSOnline;}
  @JSONField(name = "VPXOnline")
  public Integer getVPXOnline() {return VPXOnline;}
  @JSONField(name = "VPXOnline")
  public void setVPXOnline( Integer VPXOnline ) {this.VPXOnline = VPXOnline;}
  @JSONField(name = "VSWOnline")
  public Integer getVSWOnline() {return VSWOnline;}
  @JSONField(name = "VSWOnline")
  public void setVSWOnline( Integer VSWOnline ) {this.VSWOnline = VSWOnline;}
  @JSONField(name = "TrunkOnline")
  public Integer getTrunkOnline() {return TrunkOnline;}
  @JSONField(name = "TrunkOnline")
  public void setTrunkOnline( Integer TrunkOnline ) {this.TrunkOnline = TrunkOnline;}
  @JSONField(name = "GoIPOnline")
  public Integer getGoIPOnline() {return GoIPOnline;}
  @JSONField(name = "GoIPOnline")
  public void setGoIPOnline( Integer GoIPOnline ) {this.GoIPOnline = GoIPOnline;}
  @JSONField(name = "SimPOnline")
  public Integer getSimPOnline() {return SimPOnline;}
  @JSONField(name = "SimPOnline")
  public void setSimPOnline( Integer SimPOnline ) {this.SimPOnline = SimPOnline;}
  @JSONField(name = "SIMOnline")
  public Integer getSIMOnline() {return SIMOnline;}
  @JSONField(name = "SIMOnline")
  public void setSIMOnline( Integer SIMOnline ) {this.SIMOnline = SIMOnline;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
