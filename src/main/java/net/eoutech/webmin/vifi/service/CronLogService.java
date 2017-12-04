
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbCronLog;
import net.eoutech.webmin.vifi.dao.CronLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class CronLogService extends FrameBaseService<TbCronLog> {

    @Autowired
    CronLogDao cronLogDao;

    @Override
    public TbCronLog save(TbCronLog cronLog, boolean isEdit, List<String> idList) {

//         cronLog.setMdfTm(new Date());
//         cronLog.setMdfBy(UserUtils.getUserName());
//         if (!isEdit) {
//             cronLog.setCrtBy(cronLog.getMdfBy());
//             cronLog.setCrtTm(cronLog.getMdfTm());
//         }

        return super.save(cronLog, isEdit, idList);
    }

}

       