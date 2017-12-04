
package net.eoutech.webmin.sysconfig.service;

import com.frame.commons.entity.TbCfrmRole;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbArea;
import net.eoutech.webmin.commons.entity.TbSimCard;
import net.eoutech.webmin.commons.entity.TbVNS;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.sysconfig.dao.VNSDao;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class VNSService extends FrameBaseService<TbVNS> {

    @Autowired
    VNSDao vNSDao;
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    AreaService areaService;

    @Override
    public TbVNS save(TbVNS vns, boolean isEdit, List<String> idList) {

        vns.setMdfTm(new Date());
        vns.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            vns.setCrtBy(vns.getMdfBy());
            vns.setCrtTm(vns.getMdfTm());
        }

        if (StringUtils.isNotBlank(vns.getAreaName())) {
            TbArea tbArea = areaService.get(vns.getAreaName());
            vns.setCountryCode(tbArea.getKeyAreaCode());
            vns.setCountryName(tbArea.getCountryName());
        }
        return super.save(vns, isEdit, idList);
    }

    public List<String[]> getVNSSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        String agentName=UserUtils.getUserName();
        for (TbVNS tbVNS : queryAll()) {
            if("admin".equals(agentName)){
                selDatas.add(new String[]{tbVNS.getKeyVNSID(), tbVNS.getVnsname()});
            }else if(!"admin".equals(agentName) && (tbVNS.getVnsname()).equals(agentName)){
                selDatas.add(new String[]{tbVNS.getKeyVNSID(), tbVNS.getVnsname()});
            }
        }
        return selDatas;
    }

    @Override
    public void delete(List<String> idList) {

        if (jdbcDao.queryCount(Criteria.create(TbViFiDevice.class).where("idxVNSID", "in", idList.toArray())) > 0) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete");
            throw new FrameException(msg + CommonUtils.lang("menu.uuwifi_viFiDevice"));
        }

        super.delete(idList);
    }

}

       