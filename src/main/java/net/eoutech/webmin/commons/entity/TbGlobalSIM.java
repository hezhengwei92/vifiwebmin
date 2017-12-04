
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGlobalSIM {

  private String keyGlobalSIMID;
  private String idxGlobalSIMGrpID;
  private String iccid;
  private String imsi;
  private String imei;
  private Integer status;
  private String number;
  private Integer balance;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastQryDate;
  private Integer netData;
  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;
  
  private String  idxViFiID;
  private Integer billingDate;
  private Integer qryType;
  private String  qryResult;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastTopupDate;
  private Integer lastTopupValue;
    private String idxAgentID;

    public String getIdxAgentID() {
        return idxAgentID;
    }

    public void setIdxAgentID(String idxAgentID) {
        this.idxAgentID = idxAgentID;
    }

	public String getIdxViFiID() {
		return idxViFiID;
	}

	public void setIdxViFiID(String idxViFiID) {
		this.idxViFiID = idxViFiID;
	}

	public Integer getBillingDate() {
		return billingDate;
	}

	public void setBillingDate(Integer billingDate) {
		this.billingDate = billingDate;
	}

	public Integer getQryType() {
		return qryType;
	}

	public void setQryType(Integer qryType) {
		this.qryType = qryType;
	}

	public String getQryResult() {
		return qryResult;
	}

	public void setQryResult(String qryResult) {
		this.qryResult = qryResult;
	}

	public Date getLastTopupDate() {
		return lastTopupDate;
	}

	public void setLastTopupDate(Date lastTopupDate) {
		this.lastTopupDate = lastTopupDate;
	}

	public Integer getLastTopupValue() {
		return lastTopupValue;
	}

	public void setLastTopupValue(Integer lastTopupValue) {
		this.lastTopupValue = lastTopupValue;
	}

  public String getKeyGlobalSIMID() {return keyGlobalSIMID;}
  
  public void setKeyGlobalSIMID( String keyGlobalSIMID ) {this.keyGlobalSIMID = keyGlobalSIMID;}
  
  public String getIdxGlobalSIMGrpID() {return idxGlobalSIMGrpID;}
  
  public void setIdxGlobalSIMGrpID( String idxGlobalSIMGrpID ) {this.idxGlobalSIMGrpID = idxGlobalSIMGrpID;}
  
  public String getIccid() {return iccid;}
  
  public void setIccid( String iccid ) {this.iccid = iccid;}
  
  public String getImsi() {return imsi;}
  
  public void setImsi( String imsi ) {this.imsi = imsi;}
  
  public String getImei() {return imei;}
  
  public void setImei( String imei ) {this.imei = imei;}
  
  public Integer getStatus() {return status;}
  
  public void setStatus( Integer status ) {this.status = status;}
  
  public String getNumber() {return number;}
  
  public void setNumber( String number ) {this.number = number;}
  
  public Integer getBalance() {return balance;}
  
  public void setBalance( Integer balance ) {this.balance = balance;}
  
  public Date getLastQryDate() {return lastQryDate;}
  
  public void setLastQryDate( Date lastQryDate ) {this.lastQryDate = lastQryDate;}
  
  public Integer getNetData() {return netData;}
  
  public void setNetData( Integer netData ) {this.netData = netData;}
  
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
