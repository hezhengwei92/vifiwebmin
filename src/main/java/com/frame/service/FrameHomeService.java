package com.frame.service;

import com.frame.commons.entity.TbCfrmRole;
import com.frame.dao.FrameHomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FrameHomeService {
	
	@Autowired
	FrameHomeDao frameHomeDao;

	public TbCfrmRole getRoleByUserName(String userName){
		return frameHomeDao.getRoleByUserName(userName);
	}
	
}
