package net.eoutech.webmin.vpx.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAPPAuth;
import net.eoutech.webmin.vpx.dao.APPAuthDao;
import net.eoutech.webmin.vpx.dao.APPServerDao;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.AutoField;
import com.spring.jdbc.assistants.persistence.Criteria;

@Service
public class APPAuthService  extends FrameBaseService<TbAPPAuth> {
	
	@Autowired
	private APPAuthDao appAuthDao;
	@Autowired
	private APPServerDao appServerDao;

	@Override
	public TbAPPAuth save(TbAPPAuth entity, boolean isEdit, List<String> idList) {

		entity.setMdfTm(new Date());
		entity.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	entity.setCrtBy(entity.getMdfBy());
        	entity.setCrtTm(entity.getMdfTm());
        }

		return super.save(entity, isEdit, idList);
	}
	
    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }
    
    public int getAuthCount(){
    	return appAuthDao.getAuthCount();
    }

	@Override
	protected Page<TbAPPAuth> query(int pageNumber, int pageSize,
			Map<String, Object> queryParam, Criteria criteria) {
        //从公司名称到公司编号
        if(queryParam.containsKey("LIKE-|-company")){
        	String company = (String) queryParam.get("LIKE-|-company");
        	String idxASCode = appServerDao.getIdxASCodeByCompany(company);
        	queryParam.remove("LIKE-|-company");
        	queryParam.put("LIKE-|-idxASCode", idxASCode);
        }
        FrameBaseService.parseQueryCriteria(queryParam, criteria);
        List<AutoField> orderByFields = criteria.getOrderByFields();
        if (orderByFields == null || orderByFields.isEmpty()) {
        	//自动生成：默认降序
            criteria.desc("keyID");
        }
        return jdbcDao.queryPage(getEntityClass(), criteria, pageNumber, pageSize);
	}

}