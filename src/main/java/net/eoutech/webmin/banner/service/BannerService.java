package net.eoutech.webmin.banner.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbBanner;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by wei on 2017/9/20.
 */
@Service
public class BannerService extends FrameBaseService<TbBanner> {


    public TbBanner save(TbBanner tbBanner, boolean isEdit, List<String> idList) {

        if (!isEdit) {
            tbBanner.setCrtTm(new Date());
        }
        return super.save(tbBanner, isEdit, idList);
    }

}
