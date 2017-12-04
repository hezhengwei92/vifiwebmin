
package net.eoutech.webmin.vsw.service;

import com.alibaba.fastjson.JSONArray;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbCDR;
import net.eoutech.webmin.commons.entity.TbCountDaily;
import net.eoutech.webmin.commons.entity.TbUUWiFiSession;
import net.eoutech.webmin.vsw.dao.UUWiFiSessionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UUWiFiSessionService extends FrameBaseService<TbUUWiFiSession> {

    @Autowired
    UUWiFiSessionDao uUWiFiSessionDao;

    @Autowired
    public void setBaseDao( UUWiFiSessionDao commonDao ) {
        this.baseDao =uUWiFiSessionDao=commonDao;
    }

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }


//    @Override//卡交换服务
//    public Page<TbUUWiFiSession> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
//        Criteria criteria = Criteria.create(TbUUWiFiSession.class);
//        // 如果没有排序参数,就使用此字段排序
//        if ( !hasOrderParam(queryParam) ){
//            criteria.desc("keySessID");//keySessID 降序排序
//        }
//
//        return super.query(pageNumber, pageSize, queryParam, criteria);
//    }

    @Override//卡交换服务
    public Page<TbUUWiFiSession> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        String likeBy="";
        List<String> likeList=new ArrayList<String>();


        String orderBy = " order by ";//排序
        String orderVal = "";

        for (String key:queryParam.keySet()) {
            if(key.startsWith("LIKE-|-")){
                likeBy=key.substring(7,key.length());
                if ("idxSimPDevID".equals(likeBy)){
                    likeBy="se.idxSimPDevID = "+"'"+queryParam.get("LIKE-|-"+likeBy)+"'";
                    likeList.add(likeBy);
                }else if ("status".equals(likeBy)){
                    likeBy="vi.online = "+queryParam.get("LIKE-|-"+likeBy);
                    likeList.add(likeBy);
                }else {
                    likeBy="vi."+likeBy+" = "+"'"+queryParam.get("LIKE-|-"+likeBy)+"'";
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
            orderBy +="c.keySessID desc";
        }
        //ws要求：通过 tbvifidevice.idxVNSID = tbuuwifisession.keySessID 判断
        List<TbUUWiFiSession> tbUUWiFiSessions= uUWiFiSessionDao.queryVSW(pageNumber, pageSize ,orderBy,likeList);
        List<TbUUWiFiSession> tbUUWiFiSessions1=uUWiFiSessionDao.countVSW();
        Pageable pageable = new PageRequest(pageNumber-1, pageSize);
        Page<TbUUWiFiSession> page = new PageImpl<TbUUWiFiSession>(tbUUWiFiSessions, pageable, tbUUWiFiSessions1.size());

        return page;
    }


    @Override
    public TbUUWiFiSession save(TbUUWiFiSession uUWiFiSession, boolean isEdit, List<String> idList) {

        uUWiFiSession.setMdfTm(new Date());
        uUWiFiSession.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            uUWiFiSession.setCrtBy(uUWiFiSession.getMdfBy());
            uUWiFiSession.setCrtTm(uUWiFiSession.getMdfTm());
        }

        return super.save(uUWiFiSession, isEdit, idList);
    }

//    public Page<TbUUWiFiSession> queryall(int pageNumber, int pageSize, Map<String, Object> queryParam) {
//        Criteria criteria = Criteria.create(TbUUWiFiSession.class);
//        // 如果没有排序参数,就使用此字段排序
//        if ( !hasOrderParam(queryParam) ){
//            criteria.desc("keySessID");//keySessID 降序排序
//        }
//        return super.query(pageNumber, pageSize, queryParam, criteria);
//    }


}

       