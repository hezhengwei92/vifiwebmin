package net.eoutech.webmin.commons.entity;

public class DateVO {
	private String key;
	private String value;

	private int status;
	private int countSuccess;
	private int countFailure;
	
	private int count;
	private int countA;
	private int countB;
	
	private String hms;
	private long times;
	private String act;
	private String desc;
	
	//计数
	private int getSuccess;
	private int getFailure;
	private int openSuccess;
	private int openFailure;
	private int update;
	private int close;
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCountSuccess() {
		return countSuccess;
	}
	public void setCountSuccess(int countSuccess) {
		this.countSuccess = countSuccess;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCountA() {
		return countA;
	}
	public void setCountA(int countA) {
		this.countA = countA;
	}
	public int getCountB() {
		return countB;
	}
	public void setCountB(int countB) {
		this.countB = countB;
	}
	public long getTimes() {
		return times;
	}
	public void setTimes(long times) {
		this.times = times;
	}
	public String getHms() {
		return hms;
	}
	public void setHms(String hms) {
		this.hms = hms;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getCountFailure() {
		return countFailure;
	}
	public void setCountFailure(int countFailure) {
		this.countFailure = countFailure;
	}
	public int getGetSuccess() {
		return getSuccess;
	}
	public void setGetSuccess(int getSuccess) {
		this.getSuccess = getSuccess;
	}
	public int getGetFailure() {
		return getFailure;
	}
	public void setGetFailure(int getFailure) {
		this.getFailure = getFailure;
	}
	public int getOpenSuccess() {
		return openSuccess;
	}
	public void setOpenSuccess(int openSuccess) {
		this.openSuccess = openSuccess;
	}
	public int getOpenFailure() {
		return openFailure;
	}
	public void setOpenFailure(int openFailure) {
		this.openFailure = openFailure;
	}
	public int getUpdate() {
		return update;
	}
	public void setUpdate(int update) {
		this.update = update;
	}
	public int getClose() {
		return close;
	}
	public void setClose(int close) {
		this.close = close;
	}
	
	
	
	
}
