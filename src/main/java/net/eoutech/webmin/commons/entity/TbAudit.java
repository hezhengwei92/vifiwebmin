
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbAudit {

  private Integer keyAdtID;
  private String idxActionUser;
  private String userType;
  private String userIP;
  @JSONField(format = "MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date actionDate;
  private String idxTableName;
  private String tbKeyName;
  private String idxTbKeyValue;
  private String action;
  private String fields;
  private String condition;
  private Integer result;
  private String beforeValues;
  private String afterValues;

  
  public Integer getKeyAdtID() {return keyAdtID;}
  
  public void setKeyAdtID( Integer keyAdtID ) {this.keyAdtID = keyAdtID;}
  
  public String getIdxActionUser() {return idxActionUser;}
  
  public void setIdxActionUser( String idxActionUser ) {this.idxActionUser = idxActionUser;}
  
  public String getUserType() {return userType;}
  
  public void setUserType( String userType ) {this.userType = userType;}
  
  public String getUserIP() {return userIP;}
  
  public void setUserIP( String userIP ) {this.userIP = userIP;}
  
  public Date getActionDate() {return actionDate;}
  
  public void setActionDate( Date actionDate ) {this.actionDate = actionDate;}
  
  public String getIdxTableName() {return idxTableName;}
  
  public void setIdxTableName( String idxTableName ) {this.idxTableName = idxTableName;}
  
  public String getTbKeyName() {return tbKeyName;}
  
  public void setTbKeyName( String tbKeyName ) {this.tbKeyName = tbKeyName;}
  
  public String getIdxTbKeyValue() {return idxTbKeyValue;}
  
  public void setIdxTbKeyValue( String idxTbKeyValue ) {this.idxTbKeyValue = idxTbKeyValue;}
  
  public String getAction() {return action;}
  
  public void setAction( String action ) {this.action = action;}
  
  public String getFields() {return fields;}
  
  public void setFields( String fields ) {this.fields = fields;}
  
  public String getCondition() {return condition;}
  
  public void setCondition( String condition ) {this.condition = condition;}
  
  public Integer getResult() {return result;}
  
  public void setResult( Integer result ) {this.result = result;}
  
  public String getBeforeValues() {return beforeValues;}
  
  public void setBeforeValues( String beforeValues ) {this.beforeValues = beforeValues;}
  
  public String getAfterValues() {return afterValues;}
  
  public void setAfterValues( String afterValues ) {this.afterValues = afterValues;}

}
