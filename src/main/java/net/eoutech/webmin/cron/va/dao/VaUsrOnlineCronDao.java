package net.eoutech.webmin.cron.va.dao;

import com.frame.dao.FrameBaseDao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015/10/8.
 */
@Component
public class VaUsrOnlineCronDao extends FrameBaseDao {

    /**
     * 用户超时检查,并离线处理
     * @return
     */
    public int updateUsrTimeoutOffline(){
        return jdbcTemplate.update( "update tbUser set accountState='N' where accountState = 'Y' &&  TIMESTAMPDIFF(SECOND,  lastAPPOnlineDate, now()) > sipExpire" );
    }

}
