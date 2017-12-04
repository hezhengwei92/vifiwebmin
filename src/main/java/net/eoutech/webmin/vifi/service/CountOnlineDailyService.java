
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbCountOnlineDaily;
import net.eoutech.webmin.vifi.dao.CountOnlineDailyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class CountOnlineDailyService extends FrameBaseService<TbCountOnlineDaily> {

    @Autowired
    CountOnlineDailyDao countOnlineDailyDao;

    @Override
    public TbCountOnlineDaily save(TbCountOnlineDaily countOnlineDaily, boolean isEdit, List<String> idList) {

//         countOnlineDaily.setMdfTm(new Date());
//         countOnlineDaily.setMdfBy(UserUtils.getUserName());
//         if (!isEdit) {
//             countOnlineDaily.setCrtBy(countOnlineDaily.getMdfBy());
//             countOnlineDaily.setCrtTm(countOnlineDaily.getMdfTm());
//         }

        return super.save(countOnlineDaily, isEdit, idList);
    }

}

       