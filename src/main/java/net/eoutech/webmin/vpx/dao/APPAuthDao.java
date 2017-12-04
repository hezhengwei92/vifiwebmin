package net.eoutech.webmin.vpx.dao;

import com.frame.dao.FrameBaseDao;
import org.springframework.stereotype.Component;

@Component
public class APPAuthDao extends FrameBaseDao {

	public int getAuthCount(){
		String sql = "select count(1) from tbAPPAuth";
		return queryForInteger(sql);
	}
	
}