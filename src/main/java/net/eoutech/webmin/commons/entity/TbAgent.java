
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbAgent {

  private String idxAgentId;
  private String idxParentsId;
  private String idxAgentName;
  private Integer agentLevel;
  private String name;
  private String phoneNumber;
  private Integer balance;
  private Integer credit;
  private Integer discount;
  private String remark;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getIdxAgentId() {return idxAgentId;}
  
  public void setIdxAgentId( String idxAgentId ) {this.idxAgentId = idxAgentId;}
  
  public String getIdxParentsId() {return idxParentsId;}
  
  public void setIdxParentsId( String idxParentsId ) {this.idxParentsId = idxParentsId;}
  
  public String getIdxAgentName() {return idxAgentName;}
  
  public void setIdxAgentName( String idxAgentName ) {this.idxAgentName = idxAgentName;}
  
  public Integer getAgentLevel() {return agentLevel;}
  
  public void setAgentLevel( Integer agentLevel ) {this.agentLevel = agentLevel;}
  
  public String getName() {return name;}
  
  public void setName( String name ) {this.name = name;}
  
  public String getPhoneNumber() {return phoneNumber;}
  
  public void setPhoneNumber( String phoneNumber ) {this.phoneNumber = phoneNumber;}
  
  public Integer getBalance() {return balance;}
  
  public void setBalance( Integer balance ) {this.balance = balance;}
  
  public Integer getCredit() {return credit;}
  
  public void setCredit( Integer credit ) {this.credit = credit;}
  
  public Integer getDiscount() {return discount;}
  
  public void setDiscount( Integer discount ) {this.discount = discount;}
  
  public String getRemark() {return remark;}
  
  public void setRemark( String remark ) {this.remark = remark;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
