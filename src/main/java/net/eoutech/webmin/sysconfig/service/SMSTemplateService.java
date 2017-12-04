
package net.eoutech.webmin.sysconfig.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbSMSTemplate;
import net.eoutech.webmin.sysconfig.dao.SMSTemplateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class SMSTemplateService extends FrameBaseService<TbSMSTemplate> {

    @Autowired
    SMSTemplateDao sMSTemplateDao;

    @Override
    public TbSMSTemplate save(TbSMSTemplate sMSTemplate, boolean isEdit, List<String> idList) {

         sMSTemplate.setMdfTm(new Date());
         sMSTemplate.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             sMSTemplate.setCrtBy(sMSTemplate.getMdfBy());
             sMSTemplate.setCrtTm(sMSTemplate.getMdfTm());
         }

        return super.save(sMSTemplate, isEdit, idList);
    }

}

       