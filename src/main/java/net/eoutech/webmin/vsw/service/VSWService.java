
package net.eoutech.webmin.vsw.service;

import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbGoIPDev;
import net.eoutech.webmin.commons.entity.TbSimPDev;
import net.eoutech.webmin.commons.entity.TbUUWiFiSession;
import net.eoutech.webmin.commons.entity.TbVSW;
import net.eoutech.webmin.commons.entity.VswStatisticInfo;
import net.eoutech.webmin.goip.service.GoIPDevService;
import net.eoutech.webmin.simp.service.SimPDevService;
import net.eoutech.webmin.vsw.dao.VSWDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class VSWService extends FrameBaseService<TbVSW> {

    @Autowired
    VSWDao vSWDao;
    @Autowired
    GoIPDevService goIPDevService;
    @Autowired
    SimPDevService simPDevService;

    @Override
    public TbVSW save(TbVSW vSW, boolean isEdit, List<String> idList) {

        vSW.setMdfTm(new Date());
        vSW.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            vSW.setCrtBy(vSW.getMdfBy());
            vSW.setCrtTm(vSW.getMdfTm());
            vSW.setLastHBTime(vSW.getMdfTm());
            vSW.setState("R");
            if(vSW.getLocation()==null){
            	vSW.setLocation("-");
            }
            vSW.setCPU("");
            vSW.setMEM(0);
            vSW.setBandwidth(0);
            vSW.setHARDDISK(0);
            vSW.setDiskUsage(0);
            vSW.setPowerDate(new Date());
        }
        return super.save(vSW, isEdit, idList);
    }


    public List<String[]> getVSWSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbVSW tbVSW : queryAll()) {
            selDatas.add(new String[]{tbVSW.getKeyVSWID(), tbVSW.getKeyVSWID()});
        }
        return selDatas;
    }

    @Override
    public void delete(List<String> idList) {
        if (jdbcDao.queryCount(Criteria.create(TbGoIPDev.class).where("idxVSWID", " in ", idList.toArray())) > 0) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete") + CommonUtils.lang("menu.goip_goIPDev");
            throw new FrameException(msg);
        } else if (jdbcDao.queryCount(Criteria.create(TbSimPDev.class).where("idxVSWID", " in ", idList.toArray())) > 0) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete") + CommonUtils.lang("menu.simp_simPDev");
            throw new FrameException(msg);
        }

        super.delete(idList);
    }
    
    public VswStatisticInfo getVswStatisticInfo(){
    	return vSWDao.getVswStatisticInfo();
    }
    
    public int getRealTimeExchangeCount(){
    	return vSWDao.getRealTimeExchangeCount();
    }
    //前面十条数据
    public List<TbUUWiFiSession> get10Record(){
    	List<TbUUWiFiSession> list = vSWDao.get10Record();
    	List<TbUUWiFiSession> result = new ArrayList<TbUUWiFiSession>();
    	for(int i=0,len=list.size();i<len;i++){
    		TbUUWiFiSession vo = list.get(i);
    		TbUUWiFiSession newVO = new TbUUWiFiSession();
    		
    		String idxvifiID = vo.getIdxVifiID();
    		int beginCur = idxvifiID.length()>8 ? idxvifiID.length()-8 : 0;
    		newVO.setIdxVifiID(idxvifiID.substring(beginCur));
    		String devName = vo.getIdxSimPDevID();
    		devName = (devName!=null && devName.length()>12) ? ".."+devName.substring(devName.length()-10) : devName;
    		newVO.setIdxSimPDevID(devName + ":" + vo.getIdxSimPPortId());
    		result.add(newVO);
    	}
    	return result;
    }
}




