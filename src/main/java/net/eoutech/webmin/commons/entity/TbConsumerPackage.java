package net.eoutech.webmin.commons.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class TbConsumerPackage{
	
	private String keyPackageID;
	private String idxAgentID;
	private String idxCountryCode;
	private String pkgName;//套餐名称
	//[["VIP","超值包"],["MONTH","包月套餐"],["THREE","三天包"],["DAY","日包"],["SEASON","季包"],["SYSTEM","系统赠送"],["DEPOSIT","押金"]]
	private String pkgType;//套餐类型
	private String pkgDesc;//套餐描述
	private Integer price;//价格
	private Integer flow;//流量
	private Integer validPeriod;//有效期
	private String validType;//有效类型 月：MONTH 天：DAY
	private Integer duration;//持续时间
	private Integer activity;//1：活动  0：没有活动

	private String currency;//货币单位
	private String remarks;//备注
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date mdfTm;
	private String mdfBy;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date crtTm;
	private String crtBy;

	public Integer getFlow() {
		return flow;
	}

	public void setFlow(Integer flow) {
		this.flow = flow;
	}

	public Integer getValidPeriod() {
		return validPeriod;
	}

	public void setValidPeriod(Integer validPeriod) {
		this.validPeriod = validPeriod;
	}

	public String getValidType() {
		return validType;
	}

	public void setValidType(String validType) {
		this.validType = validType;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getActivity() {
		return activity;
	}

	public void setActivity(Integer activity) {
		this.activity = activity;
	}

	public String getKeyPackageID() {
		return keyPackageID;
	}
	public void setKeyPackageID(String keyPackageID) {
		this.keyPackageID = keyPackageID;
	}
	public String getIdxAgentID() {
		return idxAgentID;
	}
	public void setIdxAgentID(String idxAgentID) {
		this.idxAgentID = idxAgentID;
	}
	public String getIdxCountryCode() {
		return idxCountryCode;
	}
	public void setIdxCountryCode(String idxCountryCode) {
		this.idxCountryCode = idxCountryCode;
	}
	public String getPkgName() {
		return pkgName;
	}
	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}
	public String getPkgDesc() {
		return pkgDesc;
	}
	public void setPkgDesc(String pkgDesc) {
		this.pkgDesc = pkgDesc;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
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
	public String getPkgType() {
		return pkgType;
	}
	public void setPkgType(String pkgType) {
		this.pkgType = pkgType;
	}
	
}