
package net.eoutech.webmin.simcart.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.simcart.vo.AreaSimCardStatusCountVO;
import net.eoutech.webmin.simcart.vo.IdxSimCardIDVO;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class SimBindDao extends FrameBaseDao {

	/**
     * 查询可用的  uuwifiId
     *
     * @return [{ idxViFiID }
     * ]
     */
    public List<IdxViFiIDVO> queryIdxViFiID() {
        String sql = "SELECT tb1.idxViFiID FROM tbViFiDevice tb1 LEFT JOIN tbSUStaticBind tb2 ON tb1.idxViFiID=tb2.idxViFiID WHERE tb2.idxViFiID IS NULL ";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     *  查询可用的 SIM卡ID 
     *
     * @return [{ IdxSimCardID }
     * ]
     */
    public List<IdxSimCardIDVO> queryIdxSimCardID() {
        String sql = "SELECT tb1.keySimCardID AS idxSimCardID FROM tbSimCard tb1 LEFT JOIN tbSUStaticBind tb2 ON tb1.keySimCardID=tb2.idxSimCardID WHERE tb2.idxSimCardID IS NULL  AND tb1.bindType='S' ";
        return queryList(sql,IdxSimCardIDVO.class);
    }
    
    
    /**
     * 查询已用的 uuwifiId
     *
     * @return [{ idxViFiID }
     * ]
     */
    public List<IdxViFiIDVO> queryIdxViFiIDED() {
        String sql = "SELECT tb1.idxViFiID FROM tbSUStaticBind tb1 ";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     *  查询可用的 SIM卡ID 
     *
     * @return [{ IdxSimCardID }
     * ]
     */
    public List<IdxSimCardIDVO> queryIdxSimCardIDED() {
        String sql = "SELECT tb1.idxSimCardID FROM tbSUStaticBind tb1 ";
        return queryList(sql,IdxSimCardIDVO.class);
    }
    
    
    /**
     * 查询已用的 uuwifiId   tbSUStaticBindRecord 表中
     *
     * @return [{ idxViFiID }
     * ]
     */
    public List<IdxViFiIDVO> queryIdxViFiIDEDRecord() {
        String sql = "SELECT tb1.idxViFiID FROM tbSUStaticBindRecord tb1 ";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     *  查询可用的 SIM卡ID tbSUStaticBindRecord 表中
     *
     * @return [{ IdxSimCardID }
     * ]
     */
    public List<IdxSimCardIDVO> queryIdxSimCardIDEDRecord() {
        String sql = "SELECT tb1.idxSimCardID FROM tbSUStaticBindRecord tb1 ";
        return queryList(sql,IdxSimCardIDVO.class);
    }
    
    
    
    
 


}

       