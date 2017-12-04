package net.eoutech.webmin.vifi.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbRoute;
import net.eoutech.webmin.cdr.dao.CdrDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015/8/6.
 */
@Service
public class RouteService extends FrameBaseService< TbRoute > {

    @Autowired
    CdrDao cdrDao;

}
