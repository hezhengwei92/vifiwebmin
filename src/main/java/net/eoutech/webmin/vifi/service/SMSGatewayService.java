
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbSMSGateway;
import net.eoutech.webmin.vifi.dao.SMSGatewayDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class SMSGatewayService extends FrameBaseService<TbSMSGateway> {

    @Autowired
    SMSGatewayDao sMSGatewayDao;

    @Override
    public TbSMSGateway save(TbSMSGateway sMSGateway, boolean isEdit, List<String> idList) {

         sMSGateway.setMdfTm(new Date());
         sMSGateway.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             sMSGateway.setCrtBy(sMSGateway.getMdfBy());
             sMSGateway.setCrtTm(sMSGateway.getMdfTm());
         }

        return super.save(sMSGateway, isEdit, idList);
    }

}

       