
package net.eoutech.webmin.simp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.*;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.simp.dao.SimPPortDao;
import net.eoutech.webmin.simp.vo.SimPPortInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.QueryLookupStrategy;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import com.spring.jdbc.assistants.persistence.JdbcDao;

@Service
public class SimPPortService extends FrameBaseService<TbSimPPort> {
    @Autowired
    protected JdbcTemplate jdbcTemplate;
    @Autowired
    SimPPortDao simPPortDao;
    @Autowired
    JdbcDao jdbcDao;

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }

    @Override
    public TbSimPPort save(TbSimPPort simPPort, boolean isEdit, List<String> idList) {

        simPPort.setMdfTm(new Date());
        simPPort.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            simPPort.setCrtBy(simPPort.getMdfBy());
            simPPort.setCrtTm(simPPort.getMdfTm());
        }

        return super.save(simPPort, isEdit, idList);
    }

    public void updatePort(TbSimPDev tbSimPDev){


        String sql="select * from tbsimpport where idxsimPDevID='"+tbSimPDev.getDevName()+"'";
        BeanPropertyRowMapper rowMapper = BeanPropertyRowMapper.newInstance(TbSimPPort.class);
        List<TbSimPPort> simPPorts=jdbcTemplate.query(sql, rowMapper);
        for (TbSimPPort tbsimPPort:simPPorts) {
            tbsimPPort.setIdxAgentID(tbSimPDev.getIdxAgentID());
            jdbcDao.update(tbsimPPort);
        }
        sql="select * from tbsimpport where idxsimPDevID='"+tbSimPDev.getDevName()+"' and idxIccid!=''";
        simPPorts=jdbcTemplate.query(sql, rowMapper);

        for(TbSimPPort tbSimPPort2:simPPorts){
            sql="update tbsimcard set idxAgentID='"+tbSimPDev.getIdxAgentID()+"' where idxIccid='"+tbSimPPort2.getIdxIccid()+"'";
            jdbcTemplate.update(sql);
            sql="update tbsimcardcopy set idxAgentID='"+tbSimPDev.getIdxAgentID()+"' where idxIccid='"+tbSimPPort2.getIdxIccid()+"'";
            jdbcTemplate.update(sql);
        }
    }
    public void insertPort(TbSimPDev tbSimPDev){
       /* TbSimPPort tbSimPPort=new TbSimPPort();
        if(null != tbSimPDev.getIdxAgentID() && null != tbSimPDev.getPorts()){
            tbSimPPort.setIdxAgentID(tbSimPDev.getIdxAgentID());
            for (int i=1;i<=tbSimPDev.getPorts();i++){
                tbSimPPort.setIdxSlotNum(i);
                jdbcDao.insert(tbSimPPort);
            }
        }*/
    }


    public int queryCountByDevID(List<String> idList) {
        Criteria criteria = Criteria.create(TbSimPPort.class);
        criteria.where("idxSimPDevID", "in", idList.toArray());
        return jdbcDao.queryCount(criteria);
    }


    @Override
    public JSONObject queryTbDetails() {
        JSONObject result = new JSONObject();
        result.put("statusCount", queryStatusCountByDevID(null));
        result.put("portStatus", simPPortDao.querySimPPortInfoByPortID(null));
        return result;
    }

    @Override
    public JSONObject querySingleDetails(String id) {
        return super.querySingleDetails(id);
    }

    @Override
    public JSONObject queryMultiDetails(List<String> idList) {
        JSONObject result = new JSONObject();
        List<SimPPortInfoVO> portList = simPPortDao.querySimPPortInfoByPortID(idList);

        // 状态数量统计
        Map<String, JSONObject> statusCount = new HashMap<String, JSONObject>();
        for (SimPPortInfoVO portInfoVO : portList) {
            String staStr = portInfoVO.getStatus() + "";
            JSONObject staObj = statusCount.get(staStr);
            if (staObj == null) {
                staObj = new JSONObject();
                staObj.put("count", 1);
                statusCount.put(staStr, staObj);
            }
            staObj.put("count", (Integer) staObj.get("count") + 1);
        }

        result.put("portStatus", portList);
        result.put("statusCount", statusCount);
        return result;
    }


    public List<StatusCountVO> queryStatusCountByDevID(List devIdList) {
        return simPPortDao.querySimPPortStatusCountByDevID(devIdList);
    }


    public List<SimPPortInfoVO> queryStatusDtlByDevID(String idxSimPDevID) {
        return simPPortDao.querySimPPortInfoByDevID(idxSimPDevID);
    }
    public Page<TbSimPPort> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(TbSimPPort.class);
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	List<TbSimPDev> list = simPPortDao.queryList2(agent.getIdxAgentId());
        	if(list.size()>0){
	        	Object[] obj = new Object[list.size()];
	        	for (int i = 0; i < list.size(); i++) {
	        		TbSimPDev spd = list.get(i);
					obj[i] = spd.getKeySimPDevID();
				}
	        	queryParam.put("IN-|-idxSimPDevID",obj);
        	}else{
        		queryParam.put("EQ-|-idxSimPDevID", "ERROR");
        	}
        }
        return query(pageNumber, pageSize, queryParam, criteria);
    }
    
    public int getUsingCardsCount(){
    	return simPPortDao.getUsingCardsCount();
    }

    public CommonOutlineInfoVO getSimCardData(){
    	CommonOutlineInfoVO vo = simPPortDao.getSimCardData();
    	return vo;
    }
}

       