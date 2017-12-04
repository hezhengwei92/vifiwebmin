
package net.eoutech.webmin.simcart.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbSCGroup;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class SCGroupDao extends FrameBaseDao {
    public List<StatusCountVO> querySingleDetails(String id) {
        String sql = "select `status` status,count(*) count \n" +
                "from tbSimCard where idxSCGroupID = ? group by `status`";
        return queryList(sql, new Object[]{id}, StatusCountVO.class);
    }

    public List<TbSCGroup> queryMultiDetails(List<Integer> idList) {

        StringBuilder ids = new StringBuilder();
        for (Integer id : idList) {
            ids.append(id).append(",");
        }
        ids.deleteCharAt(ids.length() - 1);

        String sql = "select g.keySCGroupID,g.groupName,ifnull(s.number,0) number from tbSCGroup g left join \n" +
                "(select idxSCGroupID,count(*) number from tbSimCard group by idxSCGroupID) s on g.keySCGroupID=s.idxSCGroupID\n" +
                "where g.keySCGroupID in (" + ids + ")";
        return queryList(sql, TbSCGroup.class);
//        Object[] args = new Object[]{idList};
//        return queryList(sql,args, TbSCGroup.class);
    }




}

       