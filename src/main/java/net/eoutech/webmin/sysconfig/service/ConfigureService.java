
package net.eoutech.webmin.sysconfig.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbConfigure;
import net.eoutech.webmin.sysconfig.dao.ConfigureDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class ConfigureService extends FrameBaseService<TbConfigure> {

    @Autowired
    ConfigureDao configureDao;

    @Override
    public TbConfigure save(TbConfigure configure, boolean isEdit, List<String> idList) {

         configure.setMdfTm(new Date());
         configure.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             configure.setCrtBy(configure.getMdfBy());
             configure.setCrtTm(configure.getMdfTm());
         }

        return super.save(configure, isEdit, idList);
    }

}

       