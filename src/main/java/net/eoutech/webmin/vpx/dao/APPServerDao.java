package net.eoutech.webmin.vpx.dao;

import java.util.List;

import com.frame.dao.FrameBaseDao;

import net.eoutech.webmin.commons.entity.TbAPPAuthRcd;

import org.springframework.stereotype.Component;

@Component
public class APPServerDao extends FrameBaseDao {

	public int getServerCount(){
		String sql = "select count(1) from tbAPPServer";
		return queryForInteger(sql);
	}
	
	public int getLicenseSum(){
		String sql = "select sum(licenseMaxNum) from tbAPPServer";
		return queryForInteger(sql);
	}
	
	/**
	 * 这里处理方式不合适
	 */
	public int getServerLicenseNum(String idxASCode){
		String sql = "select count(1) from tbAPPAuth where idxASCode = \""+ idxASCode +"\"";
		return queryForInteger(sql);
	}
	
	public String getCompanyBycode(String idxASCode){
		String sql = "select company from tbAPPServer where idxASCode = \""+ idxASCode +"\"";
    	try {
    		return jdbcTemplate.queryForObject(sql, String.class);
		} catch (Exception e) {
			return "unknown";
		}
	}

	public String getIdxASCodeByCompany(String company){
		String sql = "select idxASCode from tbAPPServer where company = \""+ company +"\"";
    	try {
    		return jdbcTemplate.queryForObject(sql, String.class);
		} catch (Exception e) {
			return "unknown";
		}
	}
	//已用授权总数(并非剩余的，方法名起的有歧义) + 授权总量配置
    public int getAuthRemain(){
    	String sql = "select sum(licenseMaxNum) from tbAPPServer";
    	return queryForInteger(sql);
    }
    
    public int getAuthSum(){
    	String sql = "select value from tbConfigure where name = \"SEALION_APP_LICENSE_NUM\"";
    	try {
    		return Integer.parseInt(jdbcTemplate.queryForObject(sql, String.class));
		} catch (Exception e) {
			return 0;
		}
    }
    
    public List<TbAPPAuthRcd> getRecentAuthAccount(){
    	String sql = "select rcd.idxPhoneNumber as idxPhoneNumber, rcd.idxASCode as idxASCode, server.company as idxAppId from " +
    			" tbAPPAuthRcd rcd left join tbAPPServer server on rcd.idxASCode = server.idxASCode " +
    			" order by rcd.crtTm desc limit 10";
    	return queryList(sql, TbAPPAuthRcd.class);
    }
    
    
}



