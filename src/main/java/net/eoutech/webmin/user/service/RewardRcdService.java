
package net.eoutech.webmin.user.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbRewardRcd;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.user.dao.RewardRcdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class RewardRcdService extends FrameBaseService<TbRewardRcd> {

    @Autowired
    RewardRcdDao rewardRcdDao;

    /**
     * 操作许可
     * 0|0|0|0 对应,details|add|edit|delete , 0=许可,1=禁止
     *
     * @param userName
     * @param resources
     */
    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }

    @Override
    public Page<TbRewardRcd> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(getEntityClass());
        // 如果没有排序参数,就使用默认排序
        if ( !hasOrderParam(queryParam) ){
            criteria.asc("idxPhoneNumber");
        }
        return super.query(pageNumber, pageSize, queryParam, criteria);
    }


    @Override
    public TbRewardRcd save(TbRewardRcd rewardRcd, boolean isEdit, List<String> idList) {

        rewardRcd.setMdfTm(new Date());
        rewardRcd.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            rewardRcd.setCrtBy(rewardRcd.getMdfBy());
            rewardRcd.setCrtTm(rewardRcd.getMdfTm());
        }

        return super.save(rewardRcd, isEdit, idList);
    }

}

       