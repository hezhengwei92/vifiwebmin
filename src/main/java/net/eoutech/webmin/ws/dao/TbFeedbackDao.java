package net.eoutech.webmin.ws.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.frame.dao.FrameBaseDao;

import net.eoutech.webmin.commons.entity.TbFeedback;

@Component
public class TbFeedbackDao extends FrameBaseDao {
	
	public List<TbFeedback> getFeedbackByTypeAndState (String appType) {
		
		String sql = "select * from tbFeedback where type = '"+appType+"' and state = 'W' ";
		
		return queryList(sql, TbFeedback.class);
		
	}
	
	public int updateFeedbackByKeyId (String ids) {
		String sql = "update tbFeedback set state = 'C' where keyFeedbackId in ("+ ids +") ";
		return jdbcTemplate.update(sql);
	}
	
}
