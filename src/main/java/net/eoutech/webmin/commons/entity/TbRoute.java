
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbRoute {

  private Integer keyRouteId;
  private String srcNodeIds;
  private String protocol;
  private String callerId;
  private String srcNumber;
  private String srcDomain;
  private String dstNumber;
  private String dstDomain;
  private String destNodeIds;
  private Integer multiTrunk;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyRouteId() {return keyRouteId;}
  
  public void setKeyRouteId( Integer keyRouteId ) {this.keyRouteId = keyRouteId;}
  
  public String getSrcNodeIds() {return srcNodeIds;}
  
  public void setSrcNodeIds( String srcNodeIds ) {this.srcNodeIds = srcNodeIds;}
  
  public String getProtocol() {return protocol;}
  
  public void setProtocol( String protocol ) {this.protocol = protocol;}
  
  public String getCallerId() {return callerId;}
  
  public void setCallerId( String callerId ) {this.callerId = callerId;}
  
  public String getSrcNumber() {return srcNumber;}
  
  public void setSrcNumber( String srcNumber ) {this.srcNumber = srcNumber;}
  
  public String getSrcDomain() {return srcDomain;}
  
  public void setSrcDomain( String srcDomain ) {this.srcDomain = srcDomain;}
  
  public String getDstNumber() {return dstNumber;}
  
  public void setDstNumber( String dstNumber ) {this.dstNumber = dstNumber;}
  
  public String getDstDomain() {return dstDomain;}
  
  public void setDstDomain( String dstDomain ) {this.dstDomain = dstDomain;}
  
  public String getDestNodeIds() {return destNodeIds;}
  
  public void setDestNodeIds( String destNodeIds ) {this.destNodeIds = destNodeIds;}
  
  public Integer getMultiTrunk() {return multiTrunk;}
  
  public void setMultiTrunk( Integer multiTrunk ) {this.multiTrunk = multiTrunk;}
  
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
