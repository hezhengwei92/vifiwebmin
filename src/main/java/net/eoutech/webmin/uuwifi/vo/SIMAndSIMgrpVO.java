package net.eoutech.webmin.uuwifi.vo;

import java.util.Date;

/**
 * Created by Administrator on 2016/1/6.
 */
public class SIMAndSIMgrpVO {
	private Integer countGlobalSIM;  
    private Integer countGlobalSIMGrp; 
    
    private Integer countStatus0; 
    private Integer countStatus1; 
    
    private Integer countOverTimeCard;
    private Integer arrearageCard;//欠费卡
    private Integer chinaAreaCard;//中国卡
	private Integer internationalCard;//国际卡
	
	//充值记录
	private String idxICCID;
	private String action;
	private Date createDate;
    
    //用户账号
    private String idxUserId;
    //用户流量
    private int cntDataSum=0;

	public Integer getCountGlobalSIM() {
		return countGlobalSIM;
	}

	public void setCountGlobalSIM(Integer countGlobalSIM) {
		this.countGlobalSIM = countGlobalSIM;
	}

	public Integer getCountGlobalSIMGrp() {
		return countGlobalSIMGrp;
	}

	public void setCountGlobalSIMGrp(Integer countGlobalSIMGrp) {
		this.countGlobalSIMGrp = countGlobalSIMGrp;
	}

	public Integer getCountStatus0() {
		return countStatus0;
	}

	public void setCountStatus0(Integer countStatus0) {
		this.countStatus0 = countStatus0;
	}

	public Integer getCountStatus1() {
		return countStatus1;
	}

	public void setCountStatus1(Integer countStatus1) {
		this.countStatus1 = countStatus1;
	}

	public Integer getCountOverTimeCard() {
		return countOverTimeCard;
	}

	public void setCountOverTimeCard(Integer countOverTimeCard) {
		this.countOverTimeCard = countOverTimeCard;
	}

	public int getCntDataSum() {
		return cntDataSum;
	}

	public void setCntDataSum(int cntDataSum) {
		this.cntDataSum = cntDataSum;
	}

	public String getIdxUserId() {
		return idxUserId;
	}

	public void setIdxUserId(String idxUserId) {
		this.idxUserId = idxUserId;
	}
 
	 public Integer getArrearageCard() {
		return arrearageCard;
	}

	public void setArrearageCard(Integer arrearageCard) {
		this.arrearageCard = arrearageCard;
	}

	public Integer getChinaAreaCard() {
		return chinaAreaCard;
	}

	public void setChinaAreaCard(Integer chinaAreaCard) {
		this.chinaAreaCard = chinaAreaCard;
	}

	public Integer getInternationalCard() {
		return internationalCard;
	}

	public void setInternationalCard(Integer internationalCard) {
		this.internationalCard = internationalCard;
	}

	public String getIdxICCID() {
		return idxICCID;
	}

	public void setIdxICCID(String idxICCID) {
		this.idxICCID = idxICCID;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
