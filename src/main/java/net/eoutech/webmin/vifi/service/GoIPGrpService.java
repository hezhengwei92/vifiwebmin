
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbGoIPGrp;
import net.eoutech.webmin.vifi.dao.GoIPGrpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class GoIPGrpService extends FrameBaseService<TbGoIPGrp> {

    @Autowired
    GoIPGrpDao goIPGrpDao;

    @Override
    public TbGoIPGrp save(TbGoIPGrp goIPGrp, boolean isEdit, List<String> idList) {

        goIPGrp.setMdfTm(new Date());
        goIPGrp.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            goIPGrp.setCrtBy(goIPGrp.getMdfBy());
            goIPGrp.setCrtTm(goIPGrp.getMdfTm());
        }

        return super.save(goIPGrp, isEdit, idList);
    }

}

       