
package net.eoutech.webmin.simcart.service;

import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.github.underscore.$;
import com.github.underscore.Function1;

import net.eoutech.webmin.commons.entity.TbGUStaticBind;
import net.eoutech.webmin.commons.entity.TbSUStaticBind;
import net.eoutech.webmin.commons.entity.TbSimCard;
import net.eoutech.webmin.simcart.dao.SimBindDao;
import net.eoutech.webmin.simcart.dao.SimCardDao;
import net.eoutech.webmin.simcart.dao.SimGuBindDao;
import net.eoutech.webmin.simcart.vo.AreaSimCardStatusCountVO;
import net.eoutech.webmin.simcart.vo.IdxGoIPDevIDVO;
import net.eoutech.webmin.simcart.vo.IdxSimCardIDVO;
import net.eoutech.webmin.simcart.vo.IdxportNumVO;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SimGuBindService extends FrameBaseService<TbGUStaticBind> {
 
    @Autowired
    SimGuBindDao simGuBindDao;

    @Override
    public TbGUStaticBind save(TbGUStaticBind simBind, boolean isEdit, List<String> idList) {
    	simBind.setMdfTm(new Date());
    	simBind.setMdfBy(UserUtils.getUserName());
        if (!isEdit) { 
        	simBind.setCrtBy(simBind.getMdfBy());
        	simBind.setCrtTm(simBind.getMdfTm()); 

        }
        return super.save(simBind, isEdit, idList);
    } 
    
    
    //查询可用的uuwifiID idxViFiID
    public List<IdxViFiIDVO> queryIdxViFiID(){
    	return simGuBindDao.queryIdxViFiID();
    }
    
    // 查询可用的 SIM卡ID 
    public List<IdxGoIPDevIDVO> queryIdxSimCardID(){
    	return simGuBindDao.queryIdxSimCardID();
    }
    
    //查询已用的uuwifiID idxViFiID
    public List<IdxViFiIDVO> queryIdxViFiIDED(){
    	return simGuBindDao.queryIdxViFiIDED();
    }
    
    // 查询已用的 SIM卡ID 
    public List<IdxGoIPDevIDVO> queryIdxSimCardIDED(){
    	return simGuBindDao.queryIdxSimCardIDED();
    }
    
    
    //查询已用的uuwifiID idxViFiID tbSUStaticBindRecord 表中
    public List<IdxViFiIDVO> queryIdxViFiIDEDRecord(){
    	return simGuBindDao.queryIdxViFiIDEDRecord();
    }
    
    // 查询已用的 SIM卡ID  tbSUStaticBindRecord 表中
    public List<IdxGoIPDevIDVO> queryIdxSimCardIDEDRecord(){
    	return simGuBindDao.queryIdxSimCardIDEDRecord();
    } 
    
    public List<IdxportNumVO> selectIdxportNum(String idxGoIPDevID){
    	return simGuBindDao.selectIdxportNum(idxGoIPDevID);
    }
  

    
}

       