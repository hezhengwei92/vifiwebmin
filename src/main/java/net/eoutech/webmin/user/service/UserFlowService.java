package net.eoutech.webmin.user.service;

import com.alibaba.fastjson.JSONArray;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.entity.TbFreeFlow;
import net.eoutech.webmin.commons.entity.TbUserFlow;
import net.eoutech.webmin.user.dao.UserFlowDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wei on 2017/10/31.
 */
@Service
public class UserFlowService extends FrameBaseService<TbUserFlow>{
    @Autowired
    UserFlowDao userFlowDao;


    @Override
    public Page<TbUserFlow> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        String likeBy="";
        List<String> likeList=new ArrayList<String>();
        String orderBy = " order by ";//排序
        String orderVal = "";

        String agentName= UserUtils.getUserName();
        if(!"admin".equals(agentName)){
            likeBy="u.idxAgentID= '"+agentName+"'";
            likeList.add(likeBy);
        }
        for (String key:queryParam.keySet()) {
            if(key.startsWith("LIKE-|-")){
                likeBy=key.substring(7,key.length());
                if ("idxAgentID".equals(likeBy) && "admin".equals(agentName)){
                    likeBy="u.idxAgentID = "+"'"+queryParam.get("LIKE-|-"+likeBy)+"'";
                    likeList.add(likeBy);
                }else if("idxAgentID".equals(likeBy) && !"admin".equals(agentName)){

                } else{
                    likeBy="u."+likeBy+" = "+"'"+queryParam.get("LIKE-|-"+likeBy)+"'";
                    likeList.add(likeBy);
                }
            }
        }
        String orderListJSON = (String) queryParam.get("ORDER_LIST");
        if (hasOrderParam(queryParam)) {
            JSONArray orderList = JsonUtils.parseArray(orderListJSON);
            for (Object orderObj : orderList) {
                JSONArray orderArr = (JSONArray) orderObj;
                if ("1".equals(orderArr.get(1).toString())) {
                    orderVal += "c."+orderArr.get(0)+",";
                } else if ("2".equals(orderArr.get(1).toString())) {
                    orderVal += "c."+orderArr.get(0) +" desc,";
                }
            }
        }
        if(orderVal.length()>1){
            if(orderVal.endsWith(",")){
                orderVal = orderVal.substring(0,orderVal.length()-1);
            }
            orderBy += orderVal;
        }else{
            orderBy +="c.idxAppId desc";
        }
        List<TbUserFlow> tbFreeFlows= userFlowDao.queryFlow(pageNumber, pageSize ,orderBy,likeList);
        List<TbUserFlow> tbFreeFlows1=userFlowDao.countFlow(likeList);
        Pageable pageable = new PageRequest(pageNumber-1, pageSize);
        Page<TbUserFlow> page = new PageImpl<TbUserFlow>(tbFreeFlows, pageable, tbFreeFlows1.size());

        return page;
    }

}
