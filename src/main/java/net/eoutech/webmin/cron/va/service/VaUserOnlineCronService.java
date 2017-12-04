package net.eoutech.webmin.cron.va.service;

import com.frame.commons.utils.LogUtils;
import net.eoutech.webmin.commons.entity.TbCronLog;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.cron.enums.CronTypeEnum;
import net.eoutech.webmin.cron.va.dao.VaUsrOnlineCronDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class VaUserOnlineCronService {
    @Autowired
    VaUsrOnlineCronDao vaUsrOnlineCronDao;

    @Autowired
    protected JdbcDao jdbcDao;

    Logger logger = LoggerFactory.getLogger( VaUserOnlineCronService.class );


    /**
     * 更新用户在线状态,如果用户超时则下线处理!!!!!!
     */
    public void updateUsrTimeoutOffline() {
        CronTypeEnum cronType = CronTypeEnum.USER_TIMEOUT_OFFLINE_MANAGE;
        TbCronLog tbCronLog = new TbCronLog();
        int resultNum = 0;
        try {
            resultNum = vaUsrOnlineCronDao.updateUsrTimeoutOffline();
            tbCronLog.setState( 0 );
        } catch ( Exception e ) {
            tbCronLog.setState( 500 );
            e.printStackTrace();
        } finally {
            tbCronLog.setInfluenceRow( resultNum );
            tbCronLog.setCronType( cronType.name() );
            tbCronLog.setCreateTime( new Date() );
            tbCronLog.setRunCycle( cronType.getRunCycle() );
            tbCronLog.setRemarks( String.format( "check user timeout ` update offline state ` count:%d", resultNum ) );
            jdbcDao.insert( tbCronLog );
        }

        try {
            LogUtils.info( "check user timeout ` update offline state, cronState={0},InfluenceRow={1} ` ", tbCronLog.getState(), tbCronLog.getInfluenceRow() );
        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }


}
