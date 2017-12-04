package net.eoutech.webmin.commons.entity;

public class TbAPPServer2 extends TbAPPServer{

	private Integer authNum;
	
	public TbAPPServer2(){
	}
	
	public TbAPPServer2(TbAPPServer en,Integer authNum) {
		super();
		this.authNum = authNum;
		this.setKeyAppServerID(en.getKeyAppServerID());
		this.setIdxASCode(en.getIdxASCode());
		this.setAsAddrIP(en.getAsAddrIP());
		this.setAsAddrPort(en.getAsAddrPort());
		this.setAsProtocol(en.getAsProtocol());
		this.setuRL(en.getuRL());
		this.setCompany(en.getCompany());
		this.setAppName(en.getAppName());
		this.setAppVersion(en.getAppVersion());
		this.setLicenseMaxNum(en.getLicenseMaxNum());
		this.setAuthEffectDays(en.getAuthEffectDays());
		this.setRemarks(en.getRemarks());
		this.setMdfTm(en.getMdfTm());
		this.setMdfBy(en.getMdfBy());
		this.setCrtBy(en.getCrtBy());
		this.setCrtTm(en.getCrtTm());
	}

	public Integer getAuthNum() {
		return authNum;
	}

	public void setAuthNum(Integer authNum) {
		this.authNum = authNum;
	}
	
	
}
