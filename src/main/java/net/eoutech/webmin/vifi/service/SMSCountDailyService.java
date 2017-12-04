
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbSMSCountDaily;
import net.eoutech.webmin.vifi.dao.SMSCountDailyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class SMSCountDailyService extends FrameBaseService<TbSMSCountDaily> {

    @Autowired
    SMSCountDailyDao sMSCountDailyDao;

    @Override
    public TbSMSCountDaily save(TbSMSCountDaily sMSCountDaily, boolean isEdit, List<String> idList) {

         sMSCountDaily.setMdfTm(new Date());
         sMSCountDaily.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             sMSCountDaily.setCrtBy(sMSCountDaily.getMdfBy());
             sMSCountDaily.setCrtTm(sMSCountDaily.getMdfTm());
         }

        return super.save(sMSCountDaily, isEdit, idList);
    }

}

       