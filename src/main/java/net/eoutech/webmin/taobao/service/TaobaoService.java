package net.eoutech.webmin.taobao.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbTaobao;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class TaobaoService extends FrameBaseService<TbTaobao> {

    @Override
    public TbTaobao save(TbTaobao tbTaobao, boolean isEdit, List<String> idList) {

        tbTaobao.setCrtTm(new Date());
        if (!isEdit) {
            tbTaobao.setCrtTm(tbTaobao.getCrtTm());
        }
        return super.save(tbTaobao, isEdit, idList);
    }
}
