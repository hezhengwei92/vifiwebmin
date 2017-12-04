package net.eoutech.webmin.uuwifi.vo;

public class DeviceAndGroupVO {
	public Integer countViFiDev;
	public Integer countViFiDevGrp;
	public Integer countStatus0; //N:初始 (导入时的状态，初始状态为不可用状态)
	public Integer countStatus1; //E:正常 (已分配到相应的VNS节点)
	public Integer countStatus2; //W:异常 (提示管理员需介入检查)
	public Integer countStatus3; //D:禁用 (监控进程和管理员认定此设备异常等，可暂停此设备的使用)
	public Integer countStatus4; //R:删除 (不可逆操作，已删除设备不可再恢复到其它状态)
	
	public Integer getCountViFiDev() {
		return countViFiDev;
	}
	public void setCountViFiDev(Integer countViFiDev) {
		this.countViFiDev = countViFiDev;
	}
	public Integer getCountViFiDevGrp() {
		return countViFiDevGrp;
	}
	public void setCountViFiDevGrp(Integer countViFiDevGrp) {
		this.countViFiDevGrp = countViFiDevGrp;
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
	public Integer getCountStatus2() {
		return countStatus2;
	}
	public void setCountStatus2(Integer countStatus2) {
		this.countStatus2 = countStatus2;
	}
	public Integer getCountStatus3() {
		return countStatus3;
	}
	public void setCountStatus3(Integer countStatus3) {
		this.countStatus3 = countStatus3;
	}
	public Integer getCountStatus4() {
		return countStatus4;
	}
	public void setCountStatus4(Integer countStatus4) {
		this.countStatus4 = countStatus4;
	}
	
}
