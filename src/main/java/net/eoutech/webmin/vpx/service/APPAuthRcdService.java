package net.eoutech.webmin.vpx.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import net.eoutech.webmin.commons.entity.TbAPPAuthRcd;

import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.AutoField;
import com.spring.jdbc.assistants.persistence.Criteria;

@Service
public class APPAuthRcdService   extends FrameBaseService<TbAPPAuthRcd>{
	

	@Override
	protected Page<TbAPPAuthRcd> query(int pageNumber, int pageSize,
			Map<String, Object> queryParam, Criteria criteria) {
		
        FrameBaseService.parseQueryCriteria(queryParam, criteria);
        
        List<AutoField> orderByFields = criteria.getOrderByFields();
        if (orderByFields == null || orderByFields.isEmpty()) {
        	//自动生成：默认降序
            criteria.desc("keyID");
        }
        return jdbcDao.queryPage(getEntityClass(), criteria, pageNumber, pageSize);
	}

	
}
