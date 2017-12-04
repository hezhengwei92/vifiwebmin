
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbOutboundRoute {

  private Integer keyOutboundRouteId;
  private String dnisPrefix;
  private String dnisDomain;
  private Integer idxTrunkID;
  private Integer delDnisPrefixNum;
  private String addDnisPrefixStr;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyOutboundRouteId() {return keyOutboundRouteId;}
  
  public void setKeyOutboundRouteId( Integer keyOutboundRouteId ) {this.keyOutboundRouteId = keyOutboundRouteId;}
  
  public String getDnisPrefix() {return dnisPrefix;}
  
  public void setDnisPrefix( String dnisPrefix ) {this.dnisPrefix = dnisPrefix;}
  
  public String getDnisDomain() {return dnisDomain;}
  
  public void setDnisDomain( String dnisDomain ) {this.dnisDomain = dnisDomain;}
  
  public Integer getIdxTrunkID() {return idxTrunkID;}
  
  public void setIdxTrunkID( Integer idxTrunkID ) {this.idxTrunkID = idxTrunkID;}
  
  public Integer getDelDnisPrefixNum() {return delDnisPrefixNum;}
  
  public void setDelDnisPrefixNum( Integer delDnisPrefixNum ) {this.delDnisPrefixNum = delDnisPrefixNum;}
  
  public String getAddDnisPrefixStr() {return addDnisPrefixStr;}
  
  public void setAddDnisPrefixStr( String addDnisPrefixStr ) {this.addDnisPrefixStr = addDnisPrefixStr;}
  
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
