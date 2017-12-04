
package net.eoutech.webmin.agent.dao;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbAgent;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class AgentDao extends FrameBaseDao {
    /**
     * 查询当前用户旗下的五个代理商
     *
     * @return [{
     * agentName:String, //代理商名称
     * balance : Long,  //余额
     * discount:Long,  //折扣
     * state:String    //余额状体
     * }]
     */
    public List<Map<String, Object>> queryUserFiveChildAgent() {

        // 当前用户是代理的话只有自己...
        TbAgent userAgent = UserUtils.getUserProfile().getTbAgent();
        String where = "";
        if (userAgent != null) {
        }


        String sql = "select\n" +
                "  idxAgentName agentName,\n" +
                "  balance balance,\n" +
                "  discount discount,\n" +
                "  case\n" +
                "  when balance<=0  then 0\n" +
                "  when balance>0 and balance<100 then 1\n" +
                "  when balance>=100 then 2\n" +
                "  else null end  balState\n" +
                "from tbAgent\n" +
                "where idxParentsId like 'eu.%'\n" +
                "limit 0,5\n";
        return jdbcTemplate.queryForList(sql);
    }
}

       