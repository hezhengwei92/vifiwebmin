
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbFireWall;
import net.eoutech.webmin.vifi.dao.FireWallDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class FireWallService extends FrameBaseService<TbFireWall> {

    @Autowired
    FireWallDao fireWallDao;

    @Override
    public TbFireWall save(TbFireWall fireWall, boolean isEdit, List<String> idList) {

//         fireWall.setMdfTm(new Date());
//         fireWall.setMdfBy(UserUtils.getUserName());
//         if (!isEdit) {
//             fireWall.setCrtBy(fireWall.getMdfBy());
//             fireWall.setCrtTm(fireWall.getMdfTm());
//         }

        return super.save(fireWall, isEdit, idList);
    }

}

       