package net.eoutech.webmin.sysconfig.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbConsumerPackage;
import net.eoutech.webmin.commons.entity.TbDevicever;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by wei on 2017/10/27.
 */
@Service
public class DeviceverService extends FrameBaseService<TbDevicever>{
    @Override
    public TbDevicever save(TbDevicever tbDevicever, boolean isEdit, List<String> idList) {
        if (!isEdit) {
            tbDevicever.setCrtTm(new Date());
        }
        return super.save(tbDevicever, isEdit, idList);
    }
}
