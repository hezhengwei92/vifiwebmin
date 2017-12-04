
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbCDR {

  private Integer keyCDRID;
  private String idxUserId;
  private String idxDeductUserId;
  private String cdrType;
  private String direction;
  private String distance;
  private Integer idxRateId;
  private String suiteRateIds;
  private String dailyRentalID;
  private String dnis;
  private String caller;
  private String callee;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date StartTime;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date AnswerTime;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date StopTime;
  private Integer callDuration;
  private Integer dataTraffic;
  private Integer uuwifiDataUp;
  private Integer uuwifiDataDown;
  private String uuwifiSessId;
  private Integer costCash;
  private Integer costReward;
  private Integer bonus;
  private String idxSupplierId;
  private Integer supplierDiscount;
  private String idxAgentID;
  private Integer agentDiscount;
  private String idxCallID;
  private String idxVPXID;
  private String idxTrunkID;
  private Integer hangupPart;
  private String hangupReason;
  private String idxVSWID;
  private String idxGoIPID;
  private String idxSimPID;
  private String idxSimCardID;
  private String idxSMSGate;
  private String idxVAPPID;
  private String idxViFiID;
  private String ispID;
  private String countryCode;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  
  public String getSuiteRateIds() {
	return suiteRateIds;
}

public void setSuiteRateIds(String suiteRateIds) {
	this.suiteRateIds = suiteRateIds;
}

public String getDailyRentalID() {
	return dailyRentalID;
}

public void setDailyRentalID(String dailyRentalID) {
	this.dailyRentalID = dailyRentalID;
}

public Integer getKeyCDRID() {return keyCDRID;}
  
  public void setKeyCDRID( Integer keyCDRID ) {this.keyCDRID = keyCDRID;}
  
  public String getIdxUserId() {return idxUserId;}
  
  public void setIdxUserId( String idxUserId ) {this.idxUserId = idxUserId;}
  
  public String getIdxDeductUserId() {return idxDeductUserId;}
  
  public void setIdxDeductUserId( String idxDeductUserId ) {this.idxDeductUserId = idxDeductUserId;}
  
  public String getCdrType() {return cdrType;}
  
  public void setCdrType( String cdrType ) {this.cdrType = cdrType;}
  
  public String getDirection() {return direction;}
  
  public void setDirection( String direction ) {this.direction = direction;}
  
  public String getDistance() {return distance;}
  
  public void setDistance( String distance ) {this.distance = distance;}
  
  public Integer getIdxRateId() {return idxRateId;}
  
  public void setIdxRateId( Integer idxRateId ) {this.idxRateId = idxRateId;}
  
  public String getDnis() {return dnis;}
  
  public void setDnis( String dnis ) {this.dnis = dnis;}
  
  public String getCaller() {return caller;}
  
  public void setCaller( String caller ) {this.caller = caller;}
  
  public String getCallee() {return callee;}
  
  public void setCallee( String callee ) {this.callee = callee;}
  @JSONField(name = "StartTime", format = "yyyy-MM-dd HH:mm:ss")
  public Date getStartTime() {return StartTime;}
  @JSONField(name = "StartTime", format = "yyyy-MM-dd HH:mm:ss")
  public void setStartTime( Date StartTime ) {this.StartTime = StartTime;}
  @JSONField(name = "AnswerTime", format = "yyyy-MM-dd HH:mm:ss")
  public Date getAnswerTime() {return AnswerTime;}
  @JSONField(name = "AnswerTime", format = "yyyy-MM-dd HH:mm:ss")
  public void setAnswerTime( Date AnswerTime ) {this.AnswerTime = AnswerTime;}
  @JSONField(name = "StopTime", format = "yyyy-MM-dd HH:mm:ss")
  public Date getStopTime() {return StopTime;}
  @JSONField(name = "StopTime", format = "yyyy-MM-dd HH:mm:ss")
  public void setStopTime( Date StopTime ) {this.StopTime = StopTime;}
  
  public Integer getCallDuration() {return callDuration;}
  
  public void setCallDuration( Integer callDuration ) {this.callDuration = callDuration;}
  
  public Integer getDataTraffic() {return dataTraffic;}
  
  public void setDataTraffic( Integer dataTraffic ) {this.dataTraffic = dataTraffic;}
  
  public Integer getUuwifiDataUp() {return uuwifiDataUp;}
  
  public void setUuwifiDataUp( Integer uuwifiDataUp ) {this.uuwifiDataUp = uuwifiDataUp;}
  
  public Integer getUuwifiDataDown() {return uuwifiDataDown;}
  
  public void setUuwifiDataDown( Integer uuwifiDataDown ) {this.uuwifiDataDown = uuwifiDataDown;}
  
  public String getUuwifiSessId() {return uuwifiSessId;}
  
  public void setUuwifiSessId( String uuwifiSessId ) {this.uuwifiSessId = uuwifiSessId;}
  
  public Integer getCostCash() {return costCash;}
  
  public void setCostCash( Integer costCash ) {this.costCash = costCash;}
  
  public Integer getCostReward() {return costReward;}
  
  public void setCostReward( Integer costReward ) {this.costReward = costReward;}
  
  public Integer getBonus() {return bonus;}
  
  public void setBonus( Integer bonus ) {this.bonus = bonus;}
  
  public String getIdxSupplierId() {return idxSupplierId;}
  
  public void setIdxSupplierId( String idxSupplierId ) {this.idxSupplierId = idxSupplierId;}
  
  public Integer getSupplierDiscount() {return supplierDiscount;}
  
  public void setSupplierDiscount( Integer supplierDiscount ) {this.supplierDiscount = supplierDiscount;}
  
  public String getIdxAgentID() {return idxAgentID;}
  
  public void setIdxAgentID( String idxAgentID ) {this.idxAgentID = idxAgentID;}
  
  public Integer getAgentDiscount() {return agentDiscount;}
  
  public void setAgentDiscount( Integer agentDiscount ) {this.agentDiscount = agentDiscount;}
  
  public String getIdxCallID() {return idxCallID;}
  
  public void setIdxCallID( String idxCallID ) {this.idxCallID = idxCallID;}
  
  public String getIdxVPXID() {return idxVPXID;}
  
  public void setIdxVPXID( String idxVPXID ) {this.idxVPXID = idxVPXID;}
  
  public String getIdxTrunkID() {return idxTrunkID;}
  
  public void setIdxTrunkID( String idxTrunkID ) {this.idxTrunkID = idxTrunkID;}
  
  public Integer getHangupPart() {return hangupPart;}
  
  public void setHangupPart( Integer hangupPart ) {this.hangupPart = hangupPart;}
  
  public String getHangupReason() {return hangupReason;}
  
  public void setHangupReason( String hangupReason ) {this.hangupReason = hangupReason;}
  
  public String getIdxVSWID() {return idxVSWID;}
  
  public void setIdxVSWID( String idxVSWID ) {this.idxVSWID = idxVSWID;}
  
  public String getIdxGoIPID() {return idxGoIPID;}
  
  public void setIdxGoIPID( String idxGoIPID ) {this.idxGoIPID = idxGoIPID;}
  
  public String getIdxSimPID() {return idxSimPID;}
  
  public void setIdxSimPID( String idxSimPID ) {this.idxSimPID = idxSimPID;}
  
  public String getIdxSimCardID() {return idxSimCardID;}
  
  public void setIdxSimCardID( String idxSimCardID ) {this.idxSimCardID = idxSimCardID;}
  
  public String getIdxSMSGate() {return idxSMSGate;}
  
  public void setIdxSMSGate( String idxSMSGate ) {this.idxSMSGate = idxSMSGate;}
  
  public String getIdxVAPPID() {return idxVAPPID;}
  
  public void setIdxVAPPID( String idxVAPPID ) {this.idxVAPPID = idxVAPPID;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getIspID() {return ispID;}
  
  public void setIspID( String ispID ) {this.ispID = ispID;}
  
  public String getCountryCode() {return countryCode;}
  
  public void setCountryCode( String countryCode ) {this.countryCode = countryCode;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
