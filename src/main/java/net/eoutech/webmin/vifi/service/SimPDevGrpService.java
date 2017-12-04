
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbSimPDevGrp;
import net.eoutech.webmin.vifi.dao.SimPDevGrpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SimPDevGrpService extends FrameBaseService<TbSimPDevGrp> {

    @Autowired
    SimPDevGrpDao simPDevGrpDao;

    @Override
    public TbSimPDevGrp save(TbSimPDevGrp simPDevGrp, boolean isEdit, List<String> idList) {

        simPDevGrp.setMdfTm(new Date());
        simPDevGrp.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            simPDevGrp.setCrtBy(simPDevGrp.getMdfBy());
            simPDevGrp.setCrtTm(simPDevGrp.getMdfTm());
        }

        return super.save(simPDevGrp, isEdit, idList);
    }

}

       