package net.eoutech.webmin.help.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbHelp;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class HelpService extends FrameBaseService<TbHelp> {

    @Override
    public TbHelp save(TbHelp tbHelp, boolean isEdit, List<String> idList) {

        tbHelp.setMdfTm(new Date());
        tbHelp.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            tbHelp.setCrtBy(tbHelp.getMdfBy());
            tbHelp.setCrtTm(tbHelp.getMdfTm());
        }
        return super.save(tbHelp, isEdit, idList);
    }
}
