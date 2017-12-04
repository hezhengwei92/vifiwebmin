
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSMS {

  private Integer keySMSId;
  private String idxPhoneNumber;
  private String message;
  private String state;
  private String idxSMSGWID;
  private String messageId;
  private String responseCode;
  private String responseMessage;
  private Integer repeatNum;
  private Integer maxRepeatNum;
  private Integer pri;
  private String idxExternalID;
  private String ipaddr;
  private String exValue1;
  private String exValue2;
  private String exValue3;
  private String createdBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date createdTime;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date sendTime;
  private Integer timeused;

  
  public Integer getKeySMSId() {return keySMSId;}
  
  public void setKeySMSId( Integer keySMSId ) {this.keySMSId = keySMSId;}
  
  public String getIdxPhoneNumber() {return idxPhoneNumber;}
  
  public void setIdxPhoneNumber( String idxPhoneNumber ) {this.idxPhoneNumber = idxPhoneNumber;}
  
  public String getMessage() {return message;}
  
  public void setMessage( String message ) {this.message = message;}
  
  public String getState() {return state;}
  
  public void setState( String state ) {this.state = state;}
  
  public String getIdxSMSGWID() {return idxSMSGWID;}
  
  public void setIdxSMSGWID( String idxSMSGWID ) {this.idxSMSGWID = idxSMSGWID;}
  
  public String getMessageId() {return messageId;}
  
  public void setMessageId( String messageId ) {this.messageId = messageId;}
  
  public String getResponseCode() {return responseCode;}
  
  public void setResponseCode( String responseCode ) {this.responseCode = responseCode;}
  
  public String getResponseMessage() {return responseMessage;}
  
  public void setResponseMessage( String responseMessage ) {this.responseMessage = responseMessage;}
  
  public Integer getRepeatNum() {return repeatNum;}
  
  public void setRepeatNum( Integer repeatNum ) {this.repeatNum = repeatNum;}
  
  public Integer getMaxRepeatNum() {return maxRepeatNum;}
  
  public void setMaxRepeatNum( Integer maxRepeatNum ) {this.maxRepeatNum = maxRepeatNum;}
  
  public Integer getPri() {return pri;}
  
  public void setPri( Integer pri ) {this.pri = pri;}
  
  public String getIdxExternalID() {return idxExternalID;}
  
  public void setIdxExternalID( String idxExternalID ) {this.idxExternalID = idxExternalID;}
  
  public String getIpaddr() {return ipaddr;}
  
  public void setIpaddr( String ipaddr ) {this.ipaddr = ipaddr;}
  
  public String getExValue1() {return exValue1;}
  
  public void setExValue1( String exValue1 ) {this.exValue1 = exValue1;}
  
  public String getExValue2() {return exValue2;}
  
  public void setExValue2( String exValue2 ) {this.exValue2 = exValue2;}
  
  public String getExValue3() {return exValue3;}
  
  public void setExValue3( String exValue3 ) {this.exValue3 = exValue3;}
  
  public String getCreatedBy() {return createdBy;}
  
  public void setCreatedBy( String createdBy ) {this.createdBy = createdBy;}
  
  public Date getCreatedTime() {return createdTime;}
  
  public void setCreatedTime( Date createdTime ) {this.createdTime = createdTime;}
  
  public Date getSendTime() {return sendTime;}
  
  public void setSendTime( Date sendTime ) {this.sendTime = sendTime;}
  
  public Integer getTimeused() {return timeused;}
  
  public void setTimeused( Integer timeused ) {this.timeused = timeused;}

}
