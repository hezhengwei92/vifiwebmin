package com.frame.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbBlackList;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/8/6.
 */
@Service
public class BlackListService extends FrameBaseService<TbBlackList> {
    @Override
    public TbBlackList save(TbBlackList tbBlackList, boolean isEdit, List<String> idList) {
        Date nowDate = new Date();


        tbBlackList.setMdfTm(new Date());
        tbBlackList.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            tbBlackList.setCrtTm(nowDate);
            tbBlackList.setCrtBy(UserUtils.getUserName());
        }


        return super.save(tbBlackList, isEdit, idList);
    }
}
