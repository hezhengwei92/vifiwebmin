package net.eoutech.webmin.vpx.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.vpx.vo.OnlineUserViewVO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/9/30.
 */
@Component
public class VaAdminDao extends FrameBaseDao {

    public Map<String, Object> statisticsAsInfo() {
        String sql =
                "select \n" +
                        " -- user info\n" +
                        "(select count(*) from tbUser)                                         registUserNum , -- 注册用户数\n" +
                        "(select count(*) from tbUser where accountState='Y')                  onlineUserNum,  -- 在线用户数\n" +
                        " -- call Info\n" +
                        " todayCdr.todayCallNum todayCallNum,             -- 今天call 数量\n" +
                        " todayCdr.todayCallDuration todayCallDuration,   -- 今天call 通话时长\n" +
                        " monthCdr.monthCallNum monthCallNum,                 -- 本月call 数量\n" +
                        " monthCdr.monthCallDuration monthCallDuration   -- 本月call 通话时长\n" +
                        "\n" +
                        "from \n" +
                        " -- user info\n" +
                        "(select count(*) todayCallNum,sum(callDuration) todayCallDuration from tbCDR where  to_days(crtTm) = to_days(now())  ) todayCdr,\n" +
                        " -- call Info\n" +
                        "(select count(*) monthCallNum,sum(callDuration) monthCallDuration from tbCDR where  DATE_FORMAT( crtTm, '%Y%m' ) = DATE_FORMAT(CURDATE(),'%Y%m')  ) monthCdr\n" +
                        "\n";

        return jdbcTemplate.queryForMap(sql);
    }


    public List<OnlineUserViewVO> queryOnlineUser() {
        String sql = "SELECT\n" +
                "\tCount(u.lastAPPPublicIP) AS count,\n" +
                "\tip.country\n" +
                "FROM\n" +
                "\ttbUser u\n" +
                "JOIN tbIPAddress ip ON INET_ATON(u.lastAPPPublicIP) BETWEEN ip.startIp AND ip.endIP\n" +
                "WHERE\n" +
                "\tu.accountState = 'Y'\n" +
                "AND u.appState > 10\n" +
                "GROUP BY\n" +
                "\tcountry";
        return queryList(sql, OnlineUserViewVO.class);
    }


}
