
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbViFiCtrlRcd {

  private Integer keyCtrlRcdID;
  private String idxCtrlRcdID;
  private String idxViFiID;
  private String cmdState;
  private Integer respCode;
  private String respDetail;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date reqDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date updateDate;

  
  public Integer getKeyCtrlRcdID() {return keyCtrlRcdID;}
  
  public void setKeyCtrlRcdID( Integer keyCtrlRcdID ) {this.keyCtrlRcdID = keyCtrlRcdID;}
  
  public String getIdxCtrlRcdID() {return idxCtrlRcdID;}
  
  public void setIdxCtrlRcdID( String idxCtrlRcdID ) {this.idxCtrlRcdID = idxCtrlRcdID;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getCmdState() {return cmdState;}
  
  public void setCmdState( String cmdState ) {this.cmdState = cmdState;}
  
  public Integer getRespCode() {return respCode;}
  
  public void setRespCode( Integer respCode ) {this.respCode = respCode;}
  
  public String getRespDetail() {return respDetail;}
  
  public void setRespDetail( String respDetail ) {this.respDetail = respDetail;}
  
  public Date getReqDate() {return reqDate;}
  
  public void setReqDate( Date reqDate ) {this.reqDate = reqDate;}
  
  public Date getUpdateDate() {return updateDate;}
  
  public void setUpdateDate( Date updateDate ) {this.updateDate = updateDate;}

}
