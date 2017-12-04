
package net.eoutech.webmin.vsw.dao;

import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.entity.TbUUWiFiSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class UUWiFiSessionDao extends FrameBaseDao {

    @Autowired
    protected JdbcDao jdbcDao;
    public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//    orderBy ==> order by c.crtTm
    public List<TbUUWiFiSession> queryVSW(int pageNumber, int pageSize , String orderBy,List<String> likeList) {
        String sql="SELECT vi.keyDevID keySessID,vi.idxVifiID idxVifiID,vi.pwd pwd,vi.alaisName alaisName,se.mdfby userAct,vi.online status,vi.lastConnectTime lastConnectTime,vi.lastConnectIP lastConnectIP,se.idxSimCIccId idxSimCIccId,se.idxSimPDevID idxSimPDevID,se.idxSimPPortId idxSimPPortId,se.crtBy crtBy,vi.crtTm crtTm  from tbvifidevice vi LEFT JOIN tbuuwifisession se ON vi.idxVNSID = se.keySessID ";
        if (likeList!=null && likeList.size()>1){
            sql=sql+"where "+likeList.get(0);
            for (int i=1;i<likeList.size();i++){
                sql=sql+" and "+likeList.get(i);
            }
        }else if (likeList!=null && likeList.size()==1){
            sql=sql+"where "+likeList.get(0);
        }
        sql="select c.* from ("+sql+") as c"+orderBy+" limit "+(pageNumber-1)*pageSize+","+pageSize;

        return queryList(sql, TbUUWiFiSession.class);
    }
    public List<TbUUWiFiSession> countVSW() {
        String sql="SELECT * from tbvifidevice vi LEFT JOIN tbuuwifisession se ON vi.idxVNSID = se.keySessID order by vi.lastConnectTime";
        return queryList(sql, TbUUWiFiSession.class);
    }

    @Override
    public List<Map<String,Object>> queryAllRecord(String tbHead) {
        if (StringUtils.isNotBlank(tbHead)) {
            String sql = "select " + tbHead + " from tbUUWiFiSession";
            return jdbcTemplate.queryForList(sql);
        }
        return null;
    }
}

       