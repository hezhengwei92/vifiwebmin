package net.eoutech.webmin.commons.entity;

import com.frame.commons.utils.UserUtils;

public class TbCountDailyInfo {
	private String idxUserId;
	private int countUser=0;//所有用户
	private int countOnLineUser=0;//在线用户
	private int cntDataSum=0;
	private int cost=0;
	private String months;
	private String hours;
	private String years;
	private int profitSum=0;
	private int idxRateId=0;
	private int countDevice=0;//所有用户
	private int countOnLineDevice=0;//在线设备
	private int calls=0;
	private int goIPNum=0;
	/////历史话单
	private int durM=0;
	private int numTotal=0;
	public int getGoIPNum() {
		return goIPNum;
	}


	public void setGoIPNum(int goIPNum) {
		this.goIPNum = goIPNum;
	}
	public int getCalls() {
		return calls;
	}
	public void setCalls(int calls) {
		this.calls = calls;
	}
	
	public int getNumTotal() {
		return numTotal;
	}
	public void setNumTotal(int numTotal) {
		this.numTotal = numTotal;
	}
	public int getDurM() {
		return durM;
	}
	public void setDurM(int durM) {
		this.durM = durM;
	}
	public int getCountOnLineUser() {
		return countOnLineUser;
	}
	public void setCountOnLineUser(int countOnLineUser) {
		this.countOnLineUser = countOnLineUser;
	}
	public int getCountOnLineDevice() {
		return countOnLineDevice;
	}
	public void setCountOnLineDevice(int countOnLineDevice) {
		this.countOnLineDevice = countOnLineDevice;
	}
	public int getCountDevice() {
		return countDevice;
	}
	public void setCountDevice(int countDevice) {
		this.countDevice = countDevice;
	}
	public int getIdxRateId() {
		return idxRateId;
	}
	public void setIdxRateId(int idxRateId) {
		this.idxRateId = idxRateId;
	}
	public int getProfitSum() {
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
        	profitSum = cost *agent.getDiscount()/100;
        	//profitSum = cost ;
        }else{
        	profitSum = cost;
        }
		
		return profitSum;
	}
	public void setProfitSum(int profitSum) {
		this.profitSum = profitSum;
	}
	public String getIdxUserId() {
		return idxUserId;
	}
	public void setIdxUserId(String idxUserId) {
		this.idxUserId = idxUserId;
	}
	public int getCountUser() {
		return countUser;
	}
	public void setCountUser(int countUser) {
		this.countUser = countUser;
	}
	public int getCntDataSum() {
		return cntDataSum;
	}
	
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	public void setCntDataSum(int cntDataSum) {
		this.cntDataSum = cntDataSum;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
	
}
