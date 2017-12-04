
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGlobalSIMGrp {

  private Integer keyGlobalSIMGrpID;
  private String groupName;
  private String idxSalerID;
  private String areaName;
  private String areaCode;
  private String ispId;
  private String ispName;
  private Integer cardType;
  private Integer cardSize;
  private String monthlyRental;
  private Integer dataPrice;
  private Integer roamDataPrice;
  private Integer number;
  private String qryBalanceType;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;
  private String idxAgentID;

  public String getIdxAgentID() {
    return idxAgentID;
  }

  public void setIdxAgentID(String idxAgentID) {
    this.idxAgentID = idxAgentID;
  }

  
  public Integer getKeyGlobalSIMGrpID() {return keyGlobalSIMGrpID;}
  
  public void setKeyGlobalSIMGrpID( Integer keyGlobalSIMGrpID ) {this.keyGlobalSIMGrpID = keyGlobalSIMGrpID;}
  
  public String getGroupName() {return groupName;}
  
  public void setGroupName( String groupName ) {this.groupName = groupName;}
  
  public String getIdxSalerID() {return idxSalerID;}
  
  public void setIdxSalerID( String idxSalerID ) {this.idxSalerID = idxSalerID;}
  
  public String getAreaName() {return areaName;}
  
  public void setAreaName( String areaName ) {this.areaName = areaName;}
  
  public String getAreaCode() {return areaCode;}
  
  public void setAreaCode( String areaCode ) {this.areaCode = areaCode;}
  
  public String getIspId() {return ispId;}
  
  public void setIspId( String ispId ) {this.ispId = ispId;}
  
  public String getIspName() {return ispName;}
  
  public void setIspName( String ispName ) {this.ispName = ispName;}
  
  public Integer getCardType() {return cardType;}
  
  public void setCardType( Integer cardType ) {this.cardType = cardType;}
  
  public Integer getCardSize() {return cardSize;}
  
  public void setCardSize( Integer cardSize ) {this.cardSize = cardSize;}
  
  public String getMonthlyRental() {return monthlyRental;}
  
  public void setMonthlyRental( String monthlyRental ) {this.monthlyRental = monthlyRental;}
  
  public Integer getDataPrice() {return dataPrice;}
  
  public void setDataPrice( Integer dataPrice ) {this.dataPrice = dataPrice;}
  
  public Integer getRoamDataPrice() {return roamDataPrice;}
  
  public void setRoamDataPrice( Integer roamDataPrice ) {this.roamDataPrice = roamDataPrice;}
  
  public Integer getNumber() {return number;}
  
  public void setNumber( Integer number ) {this.number = number;}
  
  public String getQryBalanceType() {return qryBalanceType;}
  
  public void setQryBalanceType( String qryBalanceType ) {this.qryBalanceType = qryBalanceType;}
  
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
