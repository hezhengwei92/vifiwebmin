
package net.eoutech.webmin.user.dao;

import java.util.List;
import java.util.Map;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.constant.EUConst;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class UserDao extends FrameBaseDao {

	/**
	 * 代理商名下 ：用户总数/ 在线用户
	 * @param userName
	 * @return
	 */
	public int getAgentUserCount(String userName, boolean online ){
		String sql = "select count(1) from tbUser user left join tbAgent agent on user.idxAgentId = agent.idxAgentId "+
				" where agent.name = \""+ userName +"\"";
		if(online)
			sql += " and user.appState != '10'";
		return queryForInteger(sql);
	}
	
	/**
	 * 用户总数/ 在线用户
	 * @return
	 */
	public int getUserCount( boolean online ){
		String sql = "select count(1) from tbUser user";
		if(online)
			sql += " where appState != '10'";
		return queryForInteger(sql);
	}
	
    /**
     * 查询最近10天的新增用户
     * @return
     */
    public List< Map< String, Object > > recentRegisterUser() {
        String sql = "select DATE_FORMAT( crtTm,\'%Y-%m-%d\' ) as myDate, count(1) as registerUserSum from tbUser " +
        		" group by DATE_FORMAT( crtTm,\'%Y-%m-%d\' ) order by crtTm desc limit 20";
        return jdbcTemplate.queryForList( sql );
    }
	public List<Map<String,Object>> queryAllUserRecord(String tbHead) {
		String uerName= UserUtils.getUserName();
		if (StringUtils.isNotBlank(tbHead) &&  null != uerName && !EUConst.ADMIN.equals(uerName)) {
			String sql = "select " + tbHead + " from tbUser where idxAgentID='"+uerName+"'";
			return jdbcTemplate.queryForList(sql);
		}else if(StringUtils.isNotBlank(tbHead)){
			String sql = "select " + tbHead + " from tbUser";
			return jdbcTemplate.queryForList(sql);
		}
		return null;
	}
}

       