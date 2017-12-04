package net.eoutech.webmin.ws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import net.eoutech.webmin.commons.entity.TbFeedback;
import net.eoutech.webmin.ws.dao.TbFeedbackDao;
import net.eoutech.webmin.ws.entity.PmsRequest;
import net.eoutech.webmin.ws.entity.PmsResponse;

@Service
public class VwsPmsService {

	@Autowired
	private TbFeedbackDao dao;
	
	public JSONObject doPmsGet (PmsRequest req) {
		
		JSONObject result = new JSONObject();
		List<TbFeedback> list = dao.getFeedbackByTypeAndState(req.getAppType());
		if (list == null || list.size() == 0) {
			result.put("code", -1);
		} else {
			JSONArray resps = new JSONArray();
			for (TbFeedback fb : list) {
				resps.add(new PmsResponse(fb));
			}
			result.put("code", 0);
			result.put("data", resps);
		}
		return result;
	}
	
	public JSONObject doPmsUpdate (PmsRequest req) {
		
		JSONObject result = new JSONObject();
		dao.updateFeedbackByKeyId(req.getIds());
		
		result.put("code", 0);
		return result;
	}
	
}
