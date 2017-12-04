
package net.eoutech.webmin.sysconfig.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbVersion;
import net.eoutech.webmin.sysconfig.dao.VersionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class VersionService extends FrameBaseService<TbVersion> {

    @Autowired
    VersionDao versionDao;

    @Override
    public TbVersion save(TbVersion version, boolean isEdit, List<String> idList) {

         version.setMdfTm(new Date());
         version.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             version.setCrtBy(version.getMdfBy());
             version.setCrtTm(version.getMdfTm());
             version.setDevCntDate(new Date());
             version.setDevCntNum(0);
         }

        return super.save(version, isEdit, idList);
    }

}

       