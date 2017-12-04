package net.eoutech.webmin.commons.entity;

public class TbAPPAuth2 extends TbAPPAuth{
	private String company;
	
	public TbAPPAuth2(){
	}
	
	public TbAPPAuth2(TbAPPAuth vo, String company){
		super();
		this.company = company;
		this.setKeyID(vo.getKeyID());
		this.setIdxAppId(vo.getIdxAppId());
		this.setIdxAreaCode(vo.getIdxAreaCode());
		this.setIdxPhoneNumber(vo.getIdxPhoneNumber());
		this.setIdxASCode(vo.getIdxASCode());
		this.setLanguage(vo.getLanguage());
		this.setAuthDate(vo.getAuthDate());
		this.setAuthState(vo.getAuthState());
		this.setAuthTimes(vo.getAuthTimes());
		this.setDevInfo(vo.getDevInfo());
		this.setaPPName(vo.getaPPName());
		this.setaPPVer(vo.getaPPVer());
		this.setRemarks(vo.getRemarks());
		this.setMdfBy(vo.getMdfBy());
		this.setMdfTm(vo.getMdfTm());
		this.setCrtBy(vo.getCrtBy());
		this.setCrtTm(vo.getCrtTm());
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
}
