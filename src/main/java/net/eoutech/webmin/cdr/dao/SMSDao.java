
package net.eoutech.webmin.cdr.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbSMS;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class SMSDao extends FrameBaseDao {

    public List< TbSMS > queryByDate ( String beginTime, String endTime ) {
        String sql = "select * from tbSMS where createdTime between ? and ?";
        return queryList( sql, new Object[]{ beginTime, endTime }, TbSMS.class );
    }

    /**
     * 模糊查询,根据时间查询
     * @param date 当日:"2016-04-28" 当月:"2016-04"
     * @return
     */
    public Integer countByDate ( String date ) {
        String sql = "select count(keySMSId) from tbSMS where createdTime like '" + date + "%'";
        return jdbcTemplate.queryForObject( sql, Integer.class );
    }

    public Map< String, Object > smsCount () {
        String sql = "select count(keySMSId) as total, sum(timeused) as timeused from tbSMS";
        return jdbcTemplate.queryForMap( sql );
    }

    public List< Map< String, Object > > querySMSCountByType () {
        String sql = "select b.`name` as name, b.lang as lang, count(a.keySMSId) as num " +
                "from tbSMS a LEFT JOIN tbSMSTemplate b on a.smsTemplateId = b.keySmsTemplateId\n" +
                "group by a.smsTemplateId";
        return jdbcTemplate.queryForList( sql );
    }

    public List< Map< String, Object > > smsCountMonthInfo () {
        String sql = "select DATE_FORMAT( createdTime,\'%Y-%m-%d\' ) as myDate, count(1) as num from tbSMS group by DATE_FORMAT( createdTime,\'%Y-%m-%d\' ) order by DATE_FORMAT( createdTime,\'%Y-%m-%d\' ) desc limit 30";
        return jdbcTemplate.queryForList( sql );
    }

    public List< Map< String, Object > > queryDetails ( int length ) {
        String sql = "select * from tbSMS order by createdTime desc limit " + length;
        return jdbcTemplate.queryForList( sql );
    }

}

       