
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSUStaticBindRecord {

	private Integer keySUBindRecordID;
	private String idxSUBindID;
	private String idxSCGroupID;
	private String idxDevGrpID;
	//private String idxSimCardID;
	//private String idxViFiID;
	private String action; 
	private Integer result;
	private Integer useTimes;
	private String reason;
	private String crtIP; 
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;
	
	public Integer getKeySUBindRecordID() {
		return keySUBindRecordID;
	}
	public void setKeySUBindRecordID(Integer keySUBindRecordID) {
		this.keySUBindRecordID = keySUBindRecordID;
	}
	public String getIdxSUBindID() {
		return idxSUBindID;
	}
	public void setIdxSUBindID(String idxSUBindID) {
		this.idxSUBindID = idxSUBindID;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public Integer getUseTimes() {
		return useTimes;
	}
	public void setUseTimes(Integer useTimes) {
		this.useTimes = useTimes;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCrtIP() {
		return crtIP;
	}
	public void setCrtIP(String crtIP) {
		this.crtIP = crtIP;
	}
	public Date getCrtTm() {
		return crtTm;
	}
	public void setCrtTm(Date crtTm) {
		this.crtTm = crtTm;
	}
	public String getCrtBy() {
		return crtBy;
	}
	public void setCrtBy(String crtBy) {
		this.crtBy = crtBy;
	}
	public String getIdxSCGroupID() {
		return idxSCGroupID;
	}
	public void setIdxSCGroupID(String idxSCGroupID) {
		this.idxSCGroupID = idxSCGroupID;
	}
	public String getIdxDevGrpID() {
		return idxDevGrpID;
	}
	public void setIdxDevGrpID(String idxDevGrpID) {
		this.idxDevGrpID = idxDevGrpID;
	}
    
	
	 

}
