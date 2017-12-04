
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGUStaticBind {

	private String keyGUBindID; 
	private String idxGoIPDevID;
	private Integer idxPortNum;
	private String idxViFiID;
	private Integer status;
	private Integer useTimes;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date lastBindDate;
	private String remarks;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date mdfTm;
	private String mdfBy;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;

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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getUseTimes() {
		return useTimes;
	}

	public void setUseTimes(Integer useTimes) {
		this.useTimes = useTimes;
	}

	public Date getLastBindDate() {
		return lastBindDate;
	}

	public void setLastBindDate(Date lastBindDate) {
		this.lastBindDate = lastBindDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getMdfTm() {
		return mdfTm;
	}

	public void setMdfTm(Date mdfTm) {
		this.mdfTm = mdfTm;
	}

	public String getMdfBy() {
		return mdfBy;
	}

	public void setMdfBy(String mdfBy) {
		this.mdfBy = mdfBy;
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
