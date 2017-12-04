package net.eoutech.webmin.bindcode.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.bindcode.dao.BindcodeDao;
import net.eoutech.webmin.commons.entity.TbBindcode;
import net.eoutech.webmin.commons.utils.ToolRandoms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class BindcodeService extends FrameBaseService<TbBindcode> {

    @Autowired
    BindcodeDao bindcodeDao;
    @Override
    public TbBindcode save(TbBindcode tbBindcode, boolean isEdit, List<String> idList) {
        List<TbBindcode> list = new ArrayList<>();
        TbBindcode tb = null;
        tbBindcode.setUpdateTime(new Date());
        if (!isEdit ) {
            if (tbBindcode.getNum() > 0) {
                for (int i = 0; i < tbBindcode.getNum() ; i++) {
                    tb = new TbBindcode();
                    tb.setDataSize(tbBindcode.getDataSize());
                    tb.setCode(ToolRandoms.getAuthCode(8));
                    tb.setMonth(tbBindcode.getMonth());
                    tb.setStatus(tbBindcode.getStatus());
                    tb.setRespType(tbBindcode.getRespType());
                    list.add(tb);
                }
                bindcodeDao.saveOrUpdateAll(list);
            }
        } else {
            tb = super.save(tbBindcode, isEdit, idList);
        }
        return tb;
    }
}
