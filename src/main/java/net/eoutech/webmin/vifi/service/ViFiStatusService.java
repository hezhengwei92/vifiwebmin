
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbViFiStatus;
import net.eoutech.webmin.vifi.dao.ViFiStatusDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class ViFiStatusService extends FrameBaseService<TbViFiStatus> {

    @Autowired
    ViFiStatusDao viFiStatusDao;

    @Override
    public TbViFiStatus save(TbViFiStatus viFiStatus, boolean isEdit, List<String> idList) {

//         viFiStatus.setMdfTm(new Date());
//         viFiStatus.setMdfBy(UserUtils.getUserName());
//         if (!isEdit) {
//             viFiStatus.setCrtBy(viFiStatus.getMdfBy());
//             viFiStatus.setCrtTm(viFiStatus.getMdfTm());
//         }

        return super.save(viFiStatus, isEdit, idList);
    }

}

       