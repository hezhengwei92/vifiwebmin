
package net.eoutech.webmin.simcart.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.simcart.vo.AreaSimCardStatusCountVO;
import net.eoutech.webmin.simcart.vo.IdxGoIPDevIDVO;
import net.eoutech.webmin.simcart.vo.IdxSimCardIDVO;
import net.eoutech.webmin.simcart.vo.IdxportNumVO;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class SimGuBindDao extends FrameBaseDao {

	/**
     * 查询可用的  uuwifiId
     *
     * @return [{ idxViFiID }
     * ]
     */
    public List<IdxViFiIDVO> queryIdxViFiID() {
        String sql = "SELECT tb1.idxViFiID FROM tbViFiDevice tb1 LEFT JOIN tbGUStaticBind tb2 ON tb1.idxViFiID=tb2.idxViFiID WHERE tb2.idxViFiID IS NULL or tb2.idxViFiID = ''";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     *  查询可用的 SIM卡ID 
     *
     * @return [{ IdxSimCardID }
     * ]
     */
    public List<IdxGoIPDevIDVO> queryIdxSimCardID() {
        String sql = "SELECT DISTINCT(tb1.idxGoIPDevID) AS idxGoIPDevID FROM tbGoIPPort tb1 WHERE tb1.bindType = 'S'";
        return queryList(sql,IdxGoIPDevIDVO.class);
    }
    
    
    /**
     * 查询已用的 uuwifiId
     *
     * @return [{ idxViFiID }
     * ]
     */
    public List<IdxViFiIDVO> queryIdxViFiIDED() {
        String sql = "SELECT tb1.idxViFiID FROM tbGUStaticBind tb1 ";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     *  查询可用的 SIM卡ID 
     *
     * @return [{ IdxSimCardID }
     * ]
     */
    public List<IdxGoIPDevIDVO> queryIdxSimCardIDED() {
        String sql = "SELECT DISTINCT(tb1.idxGoIPDevID) FROM tbGUStaticBind tb1 ";
        return queryList(sql,IdxGoIPDevIDVO.class);
    }
    
    
    /**
     * 查询已用的 uuwifiId   tbSUStaticBindRecord 表中
     *
     * @return [{ idxViFiID }
     * ]
     */
    public List<IdxViFiIDVO> queryIdxViFiIDEDRecord() {
        String sql = "SELECT tb1.idxViFiID FROM tbGUStaticBindRecord tb1 ";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     *  查询可用的 SIM卡ID tbSUStaticBindRecord 表中
     *
     * @return [{ IdxSimCardID }
     * ]
     */
    public List<IdxGoIPDevIDVO> queryIdxSimCardIDEDRecord() {
        String sql = "SELECT DISTINCT(tb1.idxGoIPDevID) FROM tbGUStaticBindRecord tb1 ";
        return queryList(sql,IdxGoIPDevIDVO.class);
    }
     
    
    public List<IdxportNumVO> selectIdxportNum(String idxGoIPDevID) {
        String sql = "SELECT tb1.`idxportNum` FROM tbGoIPPort tb1 WHERE  tb1.`idxGoIPDevID`='"+idxGoIPDevID+"' AND tb1.`idxportNum` NOT IN (SELECT tb2.`idxportNum` FROM tbGUStaticBind tb2 WHERE  tb2.`idxGoIPDevID`='"+idxGoIPDevID+"') ";
        return queryList(sql,IdxportNumVO.class);
    } 
    
 


}

       