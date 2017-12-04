package net.eoutech.webmin.user.service;

import com.frame.commons.utils.DateUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.commons.utils.CSVUtils;
import net.eoutech.webmin.user.dao.UserDao;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService extends FrameBaseService<TbUser> {

	@Autowired
	UserDao userDao;

    @Override
    public Page<TbUser> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(getEntityClass());
        // 当前代理商用户ID前缀,查询条件
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
        }
        // 如果没有排序参数,就使用默认排序
        if ( !hasOrderParam(queryParam) ){
            criteria.asc("idxPhoneNumber");
        }

        return super.query(pageNumber, pageSize, queryParam, criteria);
    }


    @Override
    public TbUser save(TbUser viFiUser, boolean isEdit, List<String> idList) {
        viFiUser.setMdfTm(new Date());
        viFiUser.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            viFiUser.setCrtBy(viFiUser.getMdfBy());
            viFiUser.setCrtTm(viFiUser.getMdfTm());
            viFiUser.setIdxAreaCode("86");
            viFiUser.setIdxViFiID("");
            viFiUser.setIdxVPXID("");
            viFiUser.setIdxVSWID("");
            viFiUser.setIdxGoIPPortID("");
            viFiUser.setIdxSimpPortID("");
            viFiUser.setIdxSimCardID("");
            viFiUser.setSipExpire(600);
            viFiUser.setLastAPPOnlineDate(new Date());
            viFiUser.setLastAPPPublicIP("");
            viFiUser.setLastAPPDevInfo("");
            viFiUser.setLastAPPVer("");
            viFiUser.setLastViFiDate(new Date());
            viFiUser.setLastViFiID("");
            viFiUser.setLastViFiPublicIP("");
            viFiUser.setLastAPPPublicPort(0);
            viFiUser.setAccountState("N");
            viFiUser.setPassword(DigestUtils.md5Hex(viFiUser.getPassword()));
        }

        return super.save(viFiUser, isEdit, idList);
    }

    /**
     * 获得组,select 控件数据
     */
    public List<String[]> getphoneNumSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbUser tbUser : queryAll()) {
            selDatas.add(new String[]{tbUser.getKeyUserID(), tbUser.getIdxPhoneNumber()});
        }
        return selDatas;
    }
    
    /**
     * 代理商名下: 用户数/在线用户比例
     * @return
     */
    public int getAgentUserCount(String userName){
    	return userDao.getAgentUserCount(userName, false);
    }
    // [0] 正常状态数量,[1]非正常其他状态数量
    public List<Integer> getAgentOnlineUserPercent(String userName) {
        int online = userDao.getAgentUserCount(userName, true), 
        	offline = userDao.getAgentUserCount(userName, false) - online;
        return Arrays.asList(online, offline);
    }
    
    /**
     * 总用户数/在线用户比例
     * @return
     */
    public int getUserCount( ){
    	return userDao.getUserCount(false);
    }
    public List<Integer> queryOnlineUserPercent() {
        int online = userDao.getUserCount(true), 
        	offline = userDao.getUserCount(false) - online;
        return Arrays.asList(online, offline);
    }
    
    /**
     * 查询最近10天注册的用户
     * @return
     */
    public List< Map< String, Object > > recentRegisterUser () {
        List< Map< String, Object > > result = new ArrayList< Map< String, Object > >();
        List< Map< String, Object > > queryList = userDao.recentRegisterUser();

        String myDates[] = DateUtils.beforeDaysFormat( 20 );
        for ( String date : myDates ) {
            Map< String, Object > one = new HashMap< String, Object >();
            Object value = 0;

            for ( Map< String, Object > map : queryList ) {
                String myDate = String.valueOf( map.get( "myDate" ) );
                if ( date.equals( myDate )) {
                    value = map.get( "registerUserSum" );
                    break;
                }
            }
            one.put( "myDate", date );
            one.put( "registerUserSum", value );
            result.add( one );

        }
        return result;
    }
    public String exportUserCsvByDb(String tbHead) {
        List<Map<String, Object>> payRecord = userDao.queryAllUserRecord(tbHead);
        List<List<Object>> csvRateData = new ArrayList<List<Object>>();
        for (Map<String, Object> rate : payRecord) {
            List<Object> rateData = new ArrayList<Object>();
            for (Object o : rate.values()) {
                o = o instanceof Date ? DateUtils.formatDate((Date) o) : o;
                rateData.add(o);
            }
            csvRateData.add(rateData);
        }
        return CSVUtils.dataToCsv(csvRateData);
    }
}
