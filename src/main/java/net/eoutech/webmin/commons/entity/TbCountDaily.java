
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbCountDaily {

  private String keyCDID;
  private String idxUserId;
  private Integer numTotalMMIn;
  private Integer numTotalMMOut;
  private Integer numTotalMO;
  private Integer numTotalMOCb;
  private Integer numTotalMTGoip;
  private Integer numTotalMOGoip;
  private Integer numTotalMOGoipCb;
  private Integer cntDataSum;
  private Integer numFailedMMIn;
  private Integer numFailedMMOut;
  private Integer numFailedMO;
  private Integer numFailedMOCb;
  private Integer numFailedMTGoip;
  private Integer numFailedMOGoip;
  private Integer numFailedMOGoipCb;
  private Integer numShortMMIn;
  private Integer numShortMMOut;
  private Integer numShortMO;
  private Integer numShortMOCb;
  private Integer numShortMTGoip;
  private Integer numShortMOGoip;
  private Integer numShortMOGoipCb;
  private Integer numSMSRecv;
  private Integer numSMSSend;
  //private Integer durMMIn;
  private Integer durMMOut;
  private Integer durMO;
  private Integer durMOCb;
  private Integer durMTGoip;
  private Integer durMOGoip;
  private Integer durMOGoipCb;
  private Integer cost;
  private Integer callCost;
  private Integer dataCost;
  private Integer smsCost;
  private Integer cntDataDown;
  private Integer cntDataUp;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd")
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date crtTm;
  private String crtBy;
  public Integer getCost() {
		return cost;
	 }
	
	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public Integer getCallCost() {
		return callCost;
	}

	public void setCallCost(Integer callCost) {
		this.callCost = callCost;
	}

	public Integer getDataCost() {
		return dataCost;
	}

	public void setDataCost(Integer dataCost) {
		this.dataCost = dataCost;
	}

	public Integer getSmsCost() {
		return smsCost;
	}

	public void setSmsCost(Integer smsCost) {
		this.smsCost = smsCost;
	}

  public String getKeyCDID() {return keyCDID;}
  
  public void setKeyCDID( String keyCDID ) {this.keyCDID = keyCDID;}
  
  public Integer getNumTotalMMIn() {return numTotalMMIn;}
  
  public void setNumTotalMMIn( Integer numTotalMMIn ) {this.numTotalMMIn = numTotalMMIn;}
  
  public String getIdxUserId() {
	return idxUserId;
  }

  public Integer getDurMMOut() {
	return durMMOut;
}

public void setDurMMOut(Integer durMMOut) {
	this.durMMOut = durMMOut;
}

public Integer getDurMO() {
	return durMO;
}

public void setDurMO(Integer durMO) {
	this.durMO = durMO;
}

public Integer getDurMOCb() {
	return durMOCb;
}

public void setDurMOCb(Integer durMOCb) {
	this.durMOCb = durMOCb;
}

public Integer getDurMTGoip() {
	return durMTGoip;
}

public void setDurMTGoip(Integer durMTGoip) {
	this.durMTGoip = durMTGoip;
}

public Integer getDurMOGoip() {
	return durMOGoip;
}

public void setDurMOGoip(Integer durMOGoip) {
	this.durMOGoip = durMOGoip;
}

public Integer getDurMOGoipCb() {
	return durMOGoipCb;
}

public void setDurMOGoipCb(Integer durMOGoipCb) {
	this.durMOGoipCb = durMOGoipCb;
}

public void setIdxUserId(String idxUserId) {
		this.idxUserId = idxUserId;
	}

  public Integer getNumTotalMMOut() {return numTotalMMOut;}
  
  public void setNumTotalMMOut( Integer numTotalMMOut ) {this.numTotalMMOut = numTotalMMOut;}
  
  public Integer getNumTotalMO() {return numTotalMO;}
  
  public void setNumTotalMO( Integer numTotalMO ) {this.numTotalMO = numTotalMO;}
  
  public Integer getNumTotalMOCb() {return numTotalMOCb;}
  public void setCntDataSum( Integer cntDataSum ) {this.cntDataSum = cntDataSum;}
  public Integer getCntDataSum() {return cntDataSum;}
  
  public void setNumTotalMOCb( Integer numTotalMOCb ) {this.numTotalMOCb = numTotalMOCb;}
  
  public Integer getNumTotalMTGoip() {return numTotalMTGoip;}
  
  public void setNumTotalMTGoip( Integer numTotalMTGoip ) {this.numTotalMTGoip = numTotalMTGoip;}
  
  public Integer getNumTotalMOGoip() {return numTotalMOGoip;}
  
  public void setNumTotalMOGoip( Integer numTotalMOGoip ) {this.numTotalMOGoip = numTotalMOGoip;}
  
  public Integer getNumTotalMOGoipCb() {return numTotalMOGoipCb;}
  
  public void setNumTotalMOGoipCb( Integer numTotalMOGoipCb ) {this.numTotalMOGoipCb = numTotalMOGoipCb;}
  
  public Integer getNumFailedMMIn() {return numFailedMMIn;}
  
  public void setNumFailedMMIn( Integer numFailedMMIn ) {this.numFailedMMIn = numFailedMMIn;}
  
  public Integer getNumFailedMMOut() {return numFailedMMOut;}
  
  public void setNumFailedMMOut( Integer numFailedMMOut ) {this.numFailedMMOut = numFailedMMOut;}
  
  public Integer getNumFailedMO() {return numFailedMO;}
  
  public void setNumFailedMO( Integer numFailedMO ) {this.numFailedMO = numFailedMO;}
  
  public Integer getNumFailedMOCb() {return numFailedMOCb;}
  
  public void setNumFailedMOCb( Integer numFailedMOCb ) {this.numFailedMOCb = numFailedMOCb;}
  
  public Integer getNumFailedMTGoip() {return numFailedMTGoip;}
  
  public void setNumFailedMTGoip( Integer numFailedMTGoip ) {this.numFailedMTGoip = numFailedMTGoip;}
  
  public Integer getNumFailedMOGoip() {return numFailedMOGoip;}
  
  public void setNumFailedMOGoip( Integer numFailedMOGoip ) {this.numFailedMOGoip = numFailedMOGoip;}
  
  public Integer getNumFailedMOGoipCb() {return numFailedMOGoipCb;}
  
  public void setNumFailedMOGoipCb( Integer numFailedMOGoipCb ) {this.numFailedMOGoipCb = numFailedMOGoipCb;}
  
  public Integer getNumShortMMIn() {return numShortMMIn;}
  
  public void setNumShortMMIn( Integer numShortMMIn ) {this.numShortMMIn = numShortMMIn;}
  
  public Integer getNumShortMMOut() {return numShortMMOut;}
  
  public void setNumShortMMOut( Integer numShortMMOut ) {this.numShortMMOut = numShortMMOut;}
  
  public Integer getNumShortMO() {return numShortMO;}
  
  public void setNumShortMO( Integer numShortMO ) {this.numShortMO = numShortMO;}
  
  public Integer getNumShortMOCb() {return numShortMOCb;}
  
  public void setNumShortMOCb( Integer numShortMOCb ) {this.numShortMOCb = numShortMOCb;}
  
  public Integer getNumShortMTGoip() {return numShortMTGoip;}
  
  public void setNumShortMTGoip( Integer numShortMTGoip ) {this.numShortMTGoip = numShortMTGoip;}
  
  public Integer getNumShortMOGoip() {return numShortMOGoip;}
  
  public void setNumShortMOGoip( Integer numShortMOGoip ) {this.numShortMOGoip = numShortMOGoip;}
  
  public Integer getNumShortMOGoipCb() {return numShortMOGoipCb;}
  
  public void setNumShortMOGoipCb( Integer numShortMOGoipCb ) {this.numShortMOGoipCb = numShortMOGoipCb;}
  
  public Integer getNumSMSRecv() {return numSMSRecv;}
  
  public void setNumSMSRecv( Integer numSMSRecv ) {this.numSMSRecv = numSMSRecv;}
  
  public Integer getNumSMSSend() {return numSMSSend;}
  
  public void setNumSMSSend( Integer numSMSSend ) {this.numSMSSend = numSMSSend;}
  
  public Integer getCntDataDown() {return cntDataDown;}
  
  public void setCntDataDown( Integer cntDataDown ) {this.cntDataDown = cntDataDown;}
  
  public Integer getCntDataUp() {return cntDataUp;}
  
  public void setCntDataUp( Integer cntDataUp ) {this.cntDataUp = cntDataUp;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
