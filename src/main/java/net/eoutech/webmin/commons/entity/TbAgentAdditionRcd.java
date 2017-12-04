
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbAgentAdditionRcd {

  private Integer keyID;
  private String idxAgentID;
  private String idxUserTopupId;
  private Integer discount;
  private Integer amount;
  private Integer beforeValue;
  private Integer afterValue;
  private String remark;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyID() {return keyID;}
  
  public void setKeyID( Integer keyID ) {this.keyID = keyID;}
  
  public String getIdxAgentID() {return idxAgentID;}
  
  public void setIdxAgentID( String idxAgentID ) {this.idxAgentID = idxAgentID;}
  
  public String getIdxUserTopupId() {return idxUserTopupId;}
  
  public void setIdxUserTopupId( String idxUserTopupId ) {this.idxUserTopupId = idxUserTopupId;}
  
  public Integer getDiscount() {return discount;}
  
  public void setDiscount( Integer discount ) {this.discount = discount;}
  
  public Integer getAmount() {return amount;}
  
  public void setAmount( Integer amount ) {this.amount = amount;}
  
  public Integer getBeforeValue() {return beforeValue;}
  
  public void setBeforeValue( Integer beforeValue ) {this.beforeValue = beforeValue;}
  
  public Integer getAfterValue() {return afterValue;}
  
  public void setAfterValue( Integer afterValue ) {this.afterValue = afterValue;}
  
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
