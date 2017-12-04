package net.eoutech.webmin.user.dao;

import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.entity.TbFreeFlow;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.commons.entity.TbUserFlow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by wei on 2017/10/31.
 */
@Component
public class UserFlowDao extends FrameBaseDao {
    @Autowired
    protected JdbcDao jdbcDao;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<TbUserFlow> queryFlow(int pageNumber, int pageSize , String orderBy, List<String> likeList) {//
        String sql="select u.keyUserID,u.idxAppId,u.nickname,u.idxPhoneNumber,f.idxOrderID,SUM(f.residualflow) residualflow,f.priority,f.pkgType,f.effectiveTm,f.crtTm,u.idxAgentID " +
                "from tbuser u LEFT JOIN tbresidualflow f " +
                "on u.idxAppId = f.idxUserID where f.`status`=0 and f.effectiveTm>NOW()";

        if (likeList!=null && likeList.size()>0){
            for (int i=0;i<likeList.size();i++){
                sql=sql+" and "+likeList.get(i);
            }
        }
        sql=sql+" GROUP BY f.idxUserID,f.pkgType,f.effectiveTm ";
        sql="select c.* from ("+sql+") as c"+orderBy+" limit "+(pageNumber-1)*pageSize+","+pageSize;
        return queryList(sql, TbUserFlow.class);
    }
    public List<TbUserFlow> countFlow(List<String> likeList) {
        String sql="select u.keyUserID,u.idxAppId,u.nickname,u.idxPhoneNumber,f.idxOrderID,SUM(f.residualflow) residualflow,f.priority,f.pkgType,f.effectiveTm,f.crtTm,u.idxAgentID " +
                "from tbuser u LEFT JOIN tbresidualflow f " +
                "on u.idxAppId = f.idxUserID where f.`status`=0 and f.effectiveTm>NOW()";

        if (likeList!=null && likeList.size()>0){
            for (int i=0;i<likeList.size();i++){
                sql=sql+" and "+likeList.get(i);
            }
        }
        sql=sql+" GROUP BY f.idxUserID,f.pkgType,f.effectiveTm ";
        return queryList(sql, TbUserFlow.class);
    }
}
