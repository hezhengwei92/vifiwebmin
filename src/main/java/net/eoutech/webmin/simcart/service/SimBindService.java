
package net.eoutech.webmin.simcart.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbSUStaticBind;
import net.eoutech.webmin.simcart.dao.SimBindDao;
import net.eoutech.webmin.simcart.vo.IdxSimCardIDVO;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SimBindService extends FrameBaseService<TbSUStaticBind> {
 
    @Autowired
    SimBindDao simBindDao;

    @Override
    public TbSUStaticBind save(TbSUStaticBind simBind, boolean isEdit, List<String> idList) {
    	simBind.setMdfTm(new Date());
    	simBind.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	simBind.setCrtBy(simBind.getMdfBy());
        	simBind.setCrtTm(simBind.getMdfTm()); 
        	simBind.setIdxSimCardID("");
        	simBind.setIdxViFiID("");
        }
        return super.save(simBind, isEdit, idList);
    } 
    
    
    //查询可用的uuwifiID idxViFiID
    public List<IdxViFiIDVO> queryIdxViFiID(){
    	return simBindDao.queryIdxViFiID();
    }
    
    // 查询可用的 SIM卡ID 
    public List<IdxSimCardIDVO> queryIdxSimCardID(){
    	return simBindDao.queryIdxSimCardID();
    }
    
    //查询已用的uuwifiID idxViFiID
//    public List<IdxViFiIDVO> queryIdxViFiIDED(){
//    	return simBindDao.queryIdxViFiIDED();
//    }
    public List<String[]> getIdxViFiIDEDList() {
    	List<IdxViFiIDVO> list = simBindDao.queryIdxViFiIDED();
        List<String[]> selDatas = new ArrayList<String[]>();
        for (IdxViFiIDVO idxViFiIDVO : list) {
            selDatas.add(new String[]{idxViFiIDVO.getIdxViFiID(), idxViFiIDVO.getIdxViFiID()});
        }
        return selDatas;
    }
    
    // 查询已用的 SIM卡ID 
//    public List<IdxSimCardIDVO> queryIdxSimCardIDED(){
//    	return simBindDao.queryIdxSimCardIDED();
//    }
    public List<String[]> getIdxSimCardIDEDList() {
    	List<IdxSimCardIDVO> list = simBindDao.queryIdxSimCardIDED();
        List<String[]> selDatas = new ArrayList<String[]>();
        for (IdxSimCardIDVO idxSimCardIDVO : list) {
            selDatas.add(new String[]{idxSimCardIDVO.getIdxSimCardID(), idxSimCardIDVO.getIdxSimCardID()});
        }
        return selDatas;
    }
    
    
    //查询已用的uuwifiID idxViFiID tbSUStaticBindRecord 表中
    public List<IdxViFiIDVO> queryIdxViFiIDEDRecord(){
    	return simBindDao.queryIdxViFiIDEDRecord();
    }
    
    // 查询已用的 SIM卡ID  tbSUStaticBindRecord 表中
    public List<IdxSimCardIDVO> queryIdxSimCardIDEDRecord(){
    	return simBindDao.queryIdxSimCardIDEDRecord();
    } 
  

    
}

       