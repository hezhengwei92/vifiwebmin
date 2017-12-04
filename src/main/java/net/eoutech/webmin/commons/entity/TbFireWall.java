
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbFireWall {

  private Integer keyFireWallId;
  private Integer reqType;
  private String idxPhoneNumber;
  private String fromIp;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyFireWallId() {return keyFireWallId;}
  
  public void setKeyFireWallId( Integer keyFireWallId ) {this.keyFireWallId = keyFireWallId;}
  
  public Integer getReqType() {return reqType;}
  
  public void setReqType( Integer reqType ) {this.reqType = reqType;}
  
  public String getIdxPhoneNumber() {return idxPhoneNumber;}
  
  public void setIdxPhoneNumber( String idxPhoneNumber ) {this.idxPhoneNumber = idxPhoneNumber;}
  
  public String getFromIp() {return fromIp;}
  
  public void setFromIp( String fromIp ) {this.fromIp = fromIp;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
