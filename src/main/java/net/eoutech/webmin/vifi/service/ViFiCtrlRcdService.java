
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbViFiCtrlRcd;
import net.eoutech.webmin.vifi.dao.ViFiCtrlRcdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class ViFiCtrlRcdService extends FrameBaseService<TbViFiCtrlRcd> {

    @Autowired
    ViFiCtrlRcdDao viFiCtrlRcdDao;

    @Override
    public TbViFiCtrlRcd save(TbViFiCtrlRcd viFiCtrlRcd, boolean isEdit, List<String> idList) {

//         viFiCtrlRcd.setMdfTm(new Date());
//         viFiCtrlRcd.setMdfBy(UserUtils.getUserName());
//         if (!isEdit) {
//             viFiCtrlRcd.setCrtBy(viFiCtrlRcd.getMdfBy());
//             viFiCtrlRcd.setCrtTm(viFiCtrlRcd.getMdfTm());
//         }

        return super.save(viFiCtrlRcd, isEdit, idList);
    }

}

       