
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbFeedback {

  private Integer keyFeedbackId;
  private String idxAccountId_tbAccount;
  private String type;
  private String verID;
  private String title;
  private String content;
  private String attachFile;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date feedbackTime;
  private String ipaddress;
  private String state;
  private String reply;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date replyTime;
  private String extid;
  private String extSt;
  private String remarks;

  
  public Integer getKeyFeedbackId() {return keyFeedbackId;}
  
  public void setKeyFeedbackId( Integer keyFeedbackId ) {this.keyFeedbackId = keyFeedbackId;}
  
  public String getIdxAccountId_tbAccount() {return idxAccountId_tbAccount;}
  
  public void setIdxAccountId_tbAccount( String idxAccountId_tbAccount ) {this.idxAccountId_tbAccount = idxAccountId_tbAccount;}
  
  public String getType() {return type;}
  
  public void setType( String type ) {this.type = type;}
  
  public String getVerID() {return verID;}
  
  public void setVerID( String verID ) {this.verID = verID;}
  
  public String getTitle() {return title;}
  
  public void setTitle( String title ) {this.title = title;}
  
  public String getContent() {return content;}
  
  public void setContent( String content ) {this.content = content;}
  
  public String getAttachFile() {return attachFile;}
  
  public void setAttachFile( String attachFile ) {this.attachFile = attachFile;}
  
  public Date getFeedbackTime() {return feedbackTime;}
  
  public void setFeedbackTime( Date feedbackTime ) {this.feedbackTime = feedbackTime;}
  
  public String getIpaddress() {return ipaddress;}
  
  public void setIpaddress( String ipaddress ) {this.ipaddress = ipaddress;}
  
  public String getState() {return state;}
  
  public void setState( String state ) {this.state = state;}
  
  public String getReply() {return reply;}
  
  public void setReply( String reply ) {this.reply = reply;}
  
  public Date getReplyTime() {return replyTime;}
  
  public void setReplyTime( Date replyTime ) {this.replyTime = replyTime;}
  
  public String getExtid() {return extid;}
  
  public void setExtid( String extid ) {this.extid = extid;}
  
  public String getExtSt() {return extSt;}
  
  public void setExtSt( String extSt ) {this.extSt = extSt;}
  
  public String getRemarks() {return remarks;}
  
  public void setRemarks( String remarks ) {this.remarks = remarks;}

}
