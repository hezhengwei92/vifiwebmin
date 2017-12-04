
package net.eoutech.webmin.user.dao;

import java.util.List;
import java.util.Map;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbUserTopupRcd;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class UserTopupRcdDao extends FrameBaseDao {

	public List<TbUserTopupRcd> getRencentTopupRcd(){
		String sql = "select idxUserID as idxUserID, amount as amount from tbUserTopupRcd order by mdfTm desc limit 10";
		return queryList(sql, TbUserTopupRcd.class);
	}
	public List<Map<String,Object>> queryAllPayRecord(String tbHead) {
		String uerName= UserUtils.getUserName();

		if (StringUtils.isNotBlank(tbHead) && null!=uerName && !EUConst.ADMIN.equals(uerName)) {
			String sql = "select " + tbHead + " from tbUserTopupRcd where idxAgentID='"+uerName+"'";
			return jdbcTemplate.queryForList(sql);
		}else if(StringUtils.isNotBlank(tbHead)){
			String sql = "select " + tbHead + " from tbUserTopupRcd";
			return jdbcTemplate.queryForList(sql);
		}

		return null;
	}
}

       