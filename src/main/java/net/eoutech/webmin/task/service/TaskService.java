package net.eoutech.webmin.task.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbTask;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class TaskService extends FrameBaseService<TbTask> {

    @Override
    public TbTask save(TbTask tbTask, boolean isEdit, List<String> idList) {

        tbTask.setMdfTm(new Date());
        tbTask.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            tbTask.setCrtBy(tbTask.getMdfBy());
            tbTask.setCrtTm(tbTask.getMdfTm());
        }
        return super.save(tbTask, isEdit, idList);
    }
}
