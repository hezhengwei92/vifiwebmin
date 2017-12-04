
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbCountSrcIP;
import net.eoutech.webmin.vifi.dao.CountSrcIPDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class CountSrcIPService extends FrameBaseService<TbCountSrcIP> {

    @Autowired
    CountSrcIPDao countSrcIPDao;

    @Override
    public TbCountSrcIP save(TbCountSrcIP countSrcIP, boolean isEdit, List<String> idList) {

         countSrcIP.setMdfTm(new Date());
         countSrcIP.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             countSrcIP.setCrtBy(countSrcIP.getMdfBy());
             countSrcIP.setCrtTm(countSrcIP.getMdfTm());
         }

        return super.save(countSrcIP, isEdit, idList);
    }

}

       