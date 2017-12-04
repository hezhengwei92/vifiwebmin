package com.frame.service;

import com.frame.commons.constant.FrameConst;
import com.frame.commons.entity.TbCfrmUser;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.commons.vo.FrameUserAuthVO;
import com.frame.commons.vo.FrameUserMenuVO;
import com.frame.dao.FrameRoleDao;
import com.frame.dao.FrameUserDao;
import com.spring.jdbc.assistants.persistence.Criteria;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class FrameUserService extends FrameBaseService<TbCfrmUser> {
    @Autowired
    private FrameRoleDao cfrmRoleDao;

    @Autowired
    private FrameUserDao cfrmUserDao;


    public static final String FRM_ROOT = "_EUROOT";
    public static final String LOGIN_PAGE = "/login";


    public int updatePassword(String userName, String oldPsw, String newPsw) {
        oldPsw = DigestUtils.md5DigestAsHex(oldPsw.getBytes());
        newPsw = DigestUtils.md5DigestAsHex(newPsw.getBytes());

        Criteria criteria = Criteria.create(TbCfrmUser.class);
        criteria.where("keyUserId", new Object[]{userName}).and("password", new Object[]{oldPsw});
        TbCfrmUser frmUser = jdbcDao.querySingleResult(criteria);
        if (frmUser == null) {
            throw new FrameException(CommonUtils.lang("frame.password.old_psw_error"));
        }
        frmUser.setPassword(newPsw);
        frmUser.setCreatedTime(null);
        frmUser.setCreatedBy(null);
        return jdbcDao.update(frmUser);
    }

    // 获得角色备选.select 控件  配置...
    public String[][] getRoleNgSelect() {
        String[][] ngSelectRole = null;
        List<String> roles = cfrmRoleDao.queryRoleIds();
        ngSelectRole = new String[roles.size()][2];
        int inx = 0;
        for (String role : roles) {
            ngSelectRole[inx++] = new String[]{role, role};
        }
        return ngSelectRole;
    }

    @Override
    public Page<TbCfrmUser> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
//        Criteria criteria = Criteria.create(getEntityClass());
//        // 解析查询参数到
//        FrameBaseService.parseQueryCriteria(queryParam, criteria);
//        Page<TbCfrmUser> users = jdbcDao.queryPage(getEntityClass(), criteria, pageNumber, pageSize);
        return super.query(pageNumber, pageSize, queryParam);
    }

    @Override
    public TbCfrmUser save(TbCfrmUser user, boolean isEdit, List<String> idList) {
        if (StringUtils.isNotBlank(user.getPassword())) {
            String pswMd5 = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            user.setPassword(pswMd5);
        }

        Date nowDate = new Date();
        if (!isEdit) {
            user.setCreatedBy(UserUtils.getUserName());
            user.setCreatedTime(nowDate);
            user.setLastLoginTime(nowDate);
        }
        user.setModifiedBy(UserUtils.getUserName());
        user.setModifiedTime(nowDate);

        return super.save(user, isEdit, idList);
    }


    public int addFrameUser(TbCfrmUser user) {
        String pswMd5 = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(pswMd5);

        int result = jdbcDao.insert(user);

        return result;
    }


    public FrameUserAuthVO getUserAuthVO(String username) {
        if (StringUtils.isBlank(username)) {
            return null;
        }

        if (username.equals(FRM_ROOT)) {

            String pwd = CommonUtils.getRsAppCfg("root.password");

            if (StringUtils.isNotBlank(pwd)) {
                FrameUserAuthVO root = new FrameUserAuthVO();
                root.setName(FRM_ROOT);
                root.setRole(FRM_ROOT);
                root.setPassword(pwd);
                return root;
            }
        } else {
            return cfrmUserDao.getUser(username);
        }

        return null;
    }


    public List<FrameUserMenuVO> getUserMenu(String username) {
        if (StringUtils.isBlank(username)) {
            return null;
        }

        if (username.equals(FRM_ROOT)) {
            return cfrmUserDao.getUserMenu(null);
        } else {
            return cfrmUserDao.getUserMenu(username);
        }
    }


    public Map<String, String> getUserIndexPage() {
        return cfrmUserDao.getUserIndexPage();
    }


    public TbCfrmUser getUserByName(String userName) {
        Criteria crt = Criteria.create(TbCfrmUser.class);
        return jdbcDao.get(crt, userName);
    }


    public int updateLoginTime(String userName, String ip, boolean isUpdate) {
        return cfrmUserDao.updateLoginTime(userName, ip, isUpdate);
    }

    @Override
    public void delete(List<String> idList) throws FrameException {

        for (Object id : idList) {

            TbCfrmUser user = jdbcDao.get(TbCfrmUser.class, id);
            if (user.getState() == FrameConst.USER_STATE_NOT_DEL) {
                throw new FrameException(user.getKeyUserId() + " unable delete, because state = " + FrameConst.USER_STATE_NOT_DEL);
            }

            jdbcDao.delete(TbCfrmUser.class, id);
        }

    }
}
