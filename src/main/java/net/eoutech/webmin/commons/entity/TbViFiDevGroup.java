
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbViFiDevGroup {

  private String keyDevGrpID;
  private String name;
  @JSONField(format = "yyyy-MM-dd")
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date productionDate;
  private String productionNo;
  private String productionVer;
  private String hardwareVer;
  private String firmwareVer;
  private String softwareVer;
  private Integer initNumber;
  private Integer currentNumber;
  private Integer normalNumber;
  private Integer repairTimes;
  private String remark;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyDevGrpID() {return keyDevGrpID;}
  
  public void setKeyDevGrpID( String keyDevGrpID ) {this.keyDevGrpID = keyDevGrpID;}
  
  public String getName() {return name;}
  
  public void setName( String name ) {this.name = name;}
  
  public Date getProductionDate() {return productionDate;}
  
  public void setProductionDate( Date productionDate ) {this.productionDate = productionDate;}
  
  public String getProductionNo() {return productionNo;}
  
  public void setProductionNo( String productionNo ) {this.productionNo = productionNo;}
  
  public String getProductionVer() {return productionVer;}
  
  public void setProductionVer( String productionVer ) {this.productionVer = productionVer;}
  
  public String getHardwareVer() {return hardwareVer;}
  
  public void setHardwareVer( String hardwareVer ) {this.hardwareVer = hardwareVer;}
  
  public String getFirmwareVer() {return firmwareVer;}
  
  public void setFirmwareVer( String firmwareVer ) {this.firmwareVer = firmwareVer;}
  
  public String getSoftwareVer() {return softwareVer;}
  
  public void setSoftwareVer( String softwareVer ) {this.softwareVer = softwareVer;}
  
  public Integer getInitNumber() {return initNumber;}
  
  public void setInitNumber( Integer initNumber ) {this.initNumber = initNumber;}
  
  public Integer getCurrentNumber() {return currentNumber;}
  
  public void setCurrentNumber( Integer currentNumber ) {this.currentNumber = currentNumber;}
  
  public Integer getNormalNumber() {return normalNumber;}
  
  public void setNormalNumber( Integer normalNumber ) {this.normalNumber = normalNumber;}
  
  public Integer getRepairTimes() {return repairTimes;}
  
  public void setRepairTimes( Integer repairTimes ) {this.repairTimes = repairTimes;}
  
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
