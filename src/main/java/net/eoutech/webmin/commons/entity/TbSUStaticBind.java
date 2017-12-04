
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSUStaticBind {

	private String keySUBindID;
	private String idxSCGroupID;
	private String idxDevGrpID;
	private String idxSimCardID;
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

	public String getKeySUBindID() {
		return keySUBindID;
	}

	public void setKeySUBindID(String keySUBindID) {
		this.keySUBindID = keySUBindID;
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

	public String getIdxSimCardID() {
		return idxSimCardID;
	}

	public void setIdxSimCardID(String idxSimCardID) {
		this.idxSimCardID = idxSimCardID;
	}

	public String getIdxViFiID() {
		return idxViFiID;
	}

	public void setIdxViFiID(String idxViFiID) {
		this.idxViFiID = idxViFiID;
	}
   

}
