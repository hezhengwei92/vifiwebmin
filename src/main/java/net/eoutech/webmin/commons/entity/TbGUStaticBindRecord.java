
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGUStaticBindRecord {

	private Integer keyGUBindRecordID;
	private String keyGUBindID;
	private String idxGoIPDevID;
	private Integer idxPortNum; 
	private String idxViFiID;
	private String action; 
	private Integer result;
	private Integer useTimes;
	private String reason;
	private String crtIP; 
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;
	
	public Integer getKeyGUBindRecordID() {
		return keyGUBindRecordID;
	}
	public void setKeyGUBindRecordID(Integer keyGUBindRecordID) {
		this.keyGUBindRecordID = keyGUBindRecordID;
	}
	public String getKeyGUBindID() {
		return keyGUBindID;
	}
	public void setKeyGUBindID(String keyGUBindID) {
		this.keyGUBindID = keyGUBindID;
	}
	public String getIdxGoIPDevID() {
		return idxGoIPDevID;
	}
	public void setIdxGoIPDevID(String idxGoIPDevID) {
		this.idxGoIPDevID = idxGoIPDevID;
	}
	public Integer getIdxPortNum() {
		return idxPortNum;
	}
	public void setIdxPortNum(Integer idxPortNum) {
		this.idxPortNum = idxPortNum;
	} 
	public String getIdxViFiID() {
		return idxViFiID;
	}
	public void setIdxViFiID(String idxViFiID) {
		this.idxViFiID = idxViFiID;
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
    
	
	 

}
