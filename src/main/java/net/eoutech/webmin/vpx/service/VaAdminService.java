package net.eoutech.webmin.vpx.service;

/**
 * Created by Administrator on 2015/9/30.
 */

import net.eoutech.webmin.vpx.dao.VaAdminDao;
import net.eoutech.webmin.vpx.vo.OnlineUserViewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class VaAdminService {
    @Autowired
    VaAdminDao vaAdminDao;


    public Map<String, Object> statisticsAsInfo() {
        return vaAdminDao.statisticsAsInfo();
    }


    public List<OnlineUserViewVO> queryOnlineUser() {
        return vaAdminDao.queryOnlineUser();
    }


}
