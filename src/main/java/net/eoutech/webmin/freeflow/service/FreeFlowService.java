package net.eoutech.webmin.freeflow.service;

import com.alibaba.fastjson.JSONArray;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.*;
import net.eoutech.webmin.freeflow.dao.FreeFlowDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wei on 2017/9/20.
 */
@Service
public class FreeFlowService extends FrameBaseService<TbFreeFlow> {


    @Autowired
    FreeFlowDao freeFlowDao;

    @Autowired
    public void setBaseDao( FreeFlowDao commonDao ) {
        this.baseDao =freeFlowDao=commonDao;
    }

    @Override
    public Page<TbFreeFlow> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        String likeBy="";
        List<String> likeList=new ArrayList<String>();
        String orderBy = " order by ";//排序
        String orderVal = "";

        String agentName=UserUtils.getUserName();
        if(!"admin".equals(agentName)){
            likeBy="`user`.idxAgentID= '"+agentName+"'";
            likeList.add(likeBy);
        }
        for (String key:queryParam.keySet()) {
            if(key.startsWith("LIKE-|-")){
                likeBy=key.substring(7,key.length());
                if ("idxAgentID".equals(likeBy) && "admin".equals(agentName)){
                    likeBy="`user`.idxAgentID = "+"'"+queryParam.get("LIKE-|-"+likeBy)+"'";
                    likeList.add(likeBy);
                }else if("idxAgentID".equals(likeBy) && !"admin".equals(agentName)){

                } else{
                    likeBy="`user`."+likeBy+" = "+"'"+queryParam.get("LIKE-|-"+likeBy)+"'";
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
        List<TbFreeFlow> tbFreeFlows= freeFlowDao.queryFree(pageNumber, pageSize ,orderBy,likeList);
        List<TbFreeFlow> tbFreeFlows1=freeFlowDao.countFree(likeList);
        Pageable pageable = new PageRequest(pageNumber-1, pageSize);
        Page<TbFreeFlow> page = new PageImpl<TbFreeFlow>(tbFreeFlows, pageable, tbFreeFlows1.size());

        return page;
    }
    public void save(TbFreeFlow tbFreeFlow,TbUser tbUser){
        String agentName=UserUtils.getUserName();
        String address="";
        try {
            address=InetAddress.getLocalHost().toString();
            address=address.substring(address.indexOf("/")+1,address.length());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        try {
            Date date=new Date();
            String orderID=FreeFlowService.createOrderID();
            TbUserTopupRcd topupRcd = new TbUserTopupRcd();
            //充值记录表
            topupRcd.setIdxOrderID(orderID);
            topupRcd.setIdxUserID(tbUser.getIdxAppId());
            topupRcd.setTopupType("SYSTEM");
            topupRcd.setIdxAgentID(tbUser.getIdxAgentID());
            topupRcd.setPkgType("INIT");//"INIT"
            topupRcd.setPkgInfo("系统赠送");
            topupRcd.setAmount(0);
            topupRcd.setFlow(tbFreeFlow.getFlow());
            topupRcd.setIpAddr(address);
            topupRcd.setStatus("0");
            topupRcd.setMdfTm(date);
            topupRcd.setMdfBy(agentName);
            topupRcd.setEffectiveTm(tbFreeFlow.getEffectiveTm());
            topupRcd.setCrtTm(date);
            topupRcd.setCrtBy(agentName);
            topupRcd.setIdxAgentID(tbUser.getIdxAgentID());

            TbResidualflow residualFlow = new TbResidualflow();
            //剩余流量表
            residualFlow.setIdxOrderID(orderID);
            residualFlow.setIdxUserID(tbUser.getIdxAppId());
            residualFlow.setPkgType("INIT");//"INIT"
            residualFlow.setResidualflow(tbFreeFlow.getFlow());
            residualFlow.setPriority("1");
            residualFlow.setEffectiveTm(tbFreeFlow.getEffectiveTm());
            residualFlow.setCrtTm(date);
            residualFlow.setStatus("0");
            residualFlow.setIdxAgentID(tbUser.getIdxAgentID());
            insetTopAndResidual(topupRcd,residualFlow);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    public void delete(List<String> idList){
        freeFlowDao.delete(idList);
    }
    public void insetTopAndResidual(TbUserTopupRcd tbUserTopupRcd,TbResidualflow tbResidualflow){
        try{
            jdbcDao.insert(tbUserTopupRcd);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        jdbcDao.insert(tbResidualflow);
    }
    public TbUser queryUser(TbFreeFlow tbFreeFlow,String agentName) {
        String idxAppId=tbFreeFlow.getIdxAppId();
        TbUser tbUser=freeFlowDao.getUser(idxAppId,agentName);
        return tbUser;
    }

    public static String createOrderID() {
        StringBuffer buffer = new StringBuffer("AYB");
        SimpleDateFormat sf = new SimpleDateFormat("yyMMddHHmmssSSS");
        Date date = new Date();
        buffer.append(sf.format(date));
        buffer.append(FreeFlowService.buildRandomStr(4));
        return buffer.toString();
    }
    public static String buildRandomStr(int length) {
        String base = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
}
