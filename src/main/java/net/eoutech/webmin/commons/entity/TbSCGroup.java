
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSCGroup {

  private String keySCGroupID;
  private String groupName;
  private String idxSalerId;
  private String areaName;
  private String areaCode;
  private Integer ispID;
  private String apn;
  private String dialnumber;
  private String dialuid;
  private String dialpwd;
  private String ispName;
  private Integer cardType;
  private String idxAgentID;
  private Integer cardSize;
  private Integer monthlyRental;
  private Integer dataUsage;
  private Integer dataPrice;
  private Integer roamSupport;
  private String roamAreaCodes;
  private Integer roamDataPrice;
  private Integer priority;
  private Integer number;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
	  public String getIdxAgentID() {
		return idxAgentID;
	}
	
	public void setIdxAgentID(String idxAgentID) {
		this.idxAgentID = idxAgentID;
	}

  public String getGroupName() {return groupName;}
  
  public void setGroupName( String groupName ) {this.groupName = groupName;}
  
  public String getIdxSalerId() {return idxSalerId;}
  
  public void setIdxSalerId( String idxSalerId ) {this.idxSalerId = idxSalerId;}
  
  public String getAreaName() {return areaName;}
  
  public void setAreaName( String areaName ) {this.areaName = areaName;}
  
  public String getAreaCode() {return areaCode;}
  
  public void setAreaCode( String areaCode ) {this.areaCode = areaCode;}
  
  public Integer getIspID() {return ispID;}
  
  public void setIspID( Integer ispID ) {this.ispID = ispID;}
  
  public String getApn() {return apn;}
  
  public void setApn( String apn ) {this.apn = apn;}
  
  public String getDialnumber() {return dialnumber;}
  
  public void setDialnumber( String dialnumber ) {this.dialnumber = dialnumber;}
  
  public String getDialuid() {return dialuid;}
  
  public void setDialuid( String dialuid ) {this.dialuid = dialuid;}
  
  public String getDialpwd() {return dialpwd;}
  
  public void setDialpwd( String dialpwd ) {this.dialpwd = dialpwd;}
  
  public String getIspName() {return ispName;}
  
  public void setIspName( String ispName ) {this.ispName = ispName;}
  
  public Integer getCardType() {return cardType;}
  
  public void setCardType( Integer cardType ) {this.cardType = cardType;}
  
  public Integer getCardSize() {return cardSize;}
  
  public void setCardSize( Integer cardSize ) {this.cardSize = cardSize;}
  
  public Integer getMonthlyRental() {return monthlyRental;}
  
  public void setMonthlyRental( Integer monthlyRental ) {this.monthlyRental = monthlyRental;}
  
  public Integer getDataUsage() {return dataUsage;}
  
  public void setDataUsage( Integer dataUsage ) {this.dataUsage = dataUsage;}
  
  public Integer getDataPrice() {return dataPrice;}
  
  public void setDataPrice( Integer dataPrice ) {this.dataPrice = dataPrice;}
  
  public Integer getRoamSupport() {return roamSupport;}
  
  public void setRoamSupport( Integer roamSupport ) {this.roamSupport = roamSupport;}
  
  public String getRoamAreaCodes() {return roamAreaCodes;}
  
  public void setRoamAreaCodes( String roamAreaCodes ) {this.roamAreaCodes = roamAreaCodes;}
  
  public Integer getRoamDataPrice() {return roamDataPrice;}
  
  public void setRoamDataPrice( Integer roamDataPrice ) {this.roamDataPrice = roamDataPrice;}
  
  public Integer getPriority() {return priority;}
  
  public void setPriority( Integer priority ) {this.priority = priority;}
  
  public Integer getNumber() {return number;}
  
  public void setNumber( Integer number ) {this.number = number;}
  
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

public String getKeySCGroupID() {
	return keySCGroupID;
}

public void setKeySCGroupID(String keySCGroupID) {
	this.keySCGroupID = keySCGroupID;
}

}
