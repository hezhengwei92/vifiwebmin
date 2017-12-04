package com.frame.service;

import com.frame.commons.entity.TbCfrmAuthorization;
import com.frame.commons.entity.TbCfrmRole;
import com.frame.commons.utils.UserUtils;
import com.frame.commons.vo.FrameResourceViewVO;
import com.frame.dao.FrameRoleDao;
import com.spring.jdbc.assistants.persistence.Criteria;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class FrameRoleService extends FrameBaseService<TbCfrmRole> {
    @Autowired
    JdbcDao jdbcDao;
    @Autowired
    FrameResourceService frameResourceService;
    @Autowired
    FrameRoleDao frameRoleDao;
    @Autowired
    FilterChainDefinitionsService filterChainDefinitionsService;

    @Override
    public Page<TbCfrmRole> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {

        Criteria criteria = Criteria.create(TbCfrmRole.class).include("keyRoleId", "cfrmAuthorizations").asc("keyRoleId");
        // 解析查询参数到
        FrameBaseService.parseQueryCriteria(queryParam, criteria);
        Page<TbCfrmRole> page = jdbcDao.queryPage(getEntityClass(), criteria, pageNumber, 9999);

        // 角色的权限
        for (TbCfrmRole tbCfrmRole : page.getContent()) {
            List<TbCfrmAuthorization> tbCfrmAuthorizations = jdbcDao.queryList(Criteria.create(TbCfrmAuthorization.class).where("idxRoleId_tbRole", new Object[]{tbCfrmRole.getKeyRoleId()}));
            tbCfrmRole.setTbCfrmAuthorizations(tbCfrmAuthorizations);
        }
        return page;
    }

    // 所有资源
    public List<FrameResourceViewVO> queryAllResource() {
        List<FrameResourceViewVO> resources = frameResourceService.queryAllResource();
        return resources;
    }

    public List< TbCfrmRole> queryRoles(){
    	return frameRoleDao.queryRoles();
    }

    private TbCfrmRole inserteRole(TbCfrmRole tbCfrmRole) {
        Date nowDate = new Date();

        List<TbCfrmAuthorization> authorizations = tbCfrmRole.getTbCfrmAuthorizations();

        tbCfrmRole.setTbCfrmAuthorizations(null);
        tbCfrmRole.setCreatedBy(UserUtils.getUserName());
        tbCfrmRole.setModifiedBy(UserUtils.getUserName());
        tbCfrmRole.setCreatedTime(nowDate);
        tbCfrmRole.setModifiedTime(nowDate);
        tbCfrmRole.setRemarks("remarks");
        tbCfrmRole.setIndexPageResourceId("/index");

        jdbcDao.insert(tbCfrmRole);
        if (authorizations != null) {
            TbCfrmAuthorization insertAuthEntity = new TbCfrmAuthorization();
            insertAuthEntity.setIdxRoleId_tbRole(tbCfrmRole.getKeyRoleId());
            insertAuthEntity.setCreatedTime(nowDate);
            insertAuthEntity.setModifiedTime(nowDate);
            insertAuthEntity.setCreatedBy(UserUtils.getUserName());
            insertAuthEntity.setModifiedBy(UserUtils.getUserName());

            for (TbCfrmAuthorization tbCfrmAuthorization : authorizations) {
                insertAuthEntity.setResourceName(tbCfrmAuthorization.getResourceName());
                insertAuthEntity.setRemarks(tbCfrmAuthorization.getRemarks());

                jdbcDao.insert(insertAuthEntity);
            }
        }
        return tbCfrmRole;
    }

    private TbCfrmAuthorization findAuthsByResName(String resourceName, List<TbCfrmAuthorization> auths) {
        for (TbCfrmAuthorization auth : auths) {
            if (resourceName.equals(auth.getResourceName())) {
                return auth;
            }
        }
        return null;
    }

    private TbCfrmRole updateRole(TbCfrmRole tbCfrmRole) {
        Date nowDate = new Date();
        List<TbCfrmAuthorization> newAuths = tbCfrmRole.getTbCfrmAuthorizations();
        // 收集所有旧权限,用作比对修改权限表
        TbCfrmAuthorization queryAuthorization = new TbCfrmAuthorization();
        queryAuthorization.setIdxRoleId_tbRole(tbCfrmRole.getKeyRoleId());
        List<TbCfrmAuthorization> oldAuths = jdbcDao.queryList(queryAuthorization);
        // 修改角色表
        TbCfrmRole updateCfrmRole = jdbcDao.get(TbCfrmRole.class, tbCfrmRole.getKeyRoleId());
        updateCfrmRole.setModifiedBy(UserUtils.getUserName());
        updateCfrmRole.setModifiedTime(nowDate);
        if(tbCfrmRole.getHomePage()!=null&& !"".equals(tbCfrmRole.getHomePage())){
        	updateCfrmRole.setHomePage(tbCfrmRole.getHomePage());
        }
        jdbcDao.update(updateCfrmRole);

        // 循环对比是否在旧权限中
        for (TbCfrmAuthorization newAuth : newAuths) {
            TbCfrmAuthorization findAuth = findAuthsByResName(newAuth.getResourceName(), oldAuths);
            //存在修改权限
            if (findAuth != null) {
                findAuth.setRemarks(newAuth.getRemarks());
                jdbcDao.update(findAuth);
            } else { // 不存在在则新增权限
                TbCfrmAuthorization insertAuthEntity = new TbCfrmAuthorization();
                insertAuthEntity.setIdxRoleId_tbRole(tbCfrmRole.getKeyRoleId());
                insertAuthEntity.setCreatedTime(nowDate);
                insertAuthEntity.setModifiedTime(nowDate);
                insertAuthEntity.setCreatedBy(UserUtils.getUserName());
                insertAuthEntity.setModifiedBy(UserUtils.getUserName());
                insertAuthEntity.setResourceName(newAuth.getResourceName());
                insertAuthEntity.setRemarks(newAuth.getRemarks());
                jdbcDao.insert(insertAuthEntity);
            }
        }

        // 循环对比旧权限是否在新权限中,不存在新权限集中的删除旧权限
        for (TbCfrmAuthorization oldAuth : oldAuths) {
            TbCfrmAuthorization findAuth = findAuthsByResName(oldAuth.getResourceName(), newAuths);
            if (findAuth == null) {
                jdbcDao.delete(TbCfrmAuthorization.class, oldAuth.getKeyAuthId());
            }
        }

        return tbCfrmRole;
    }


    @Override
    public TbCfrmRole save(TbCfrmRole tbCfrmRole, boolean isEdit, List<String> idList) {
        TbCfrmRole result = isEdit ? updateRole(tbCfrmRole) : inserteRole(tbCfrmRole);
        filterChainDefinitionsService.reloadCreateFilterChains();
        return result;
    }

    @Override
    public void delete(List<String> idList) {
        jdbcDao.delete(Criteria.create(TbCfrmAuthorization.class).where("idxRoleId_tbRole", idList.toArray()));
        jdbcDao.delete(Criteria.create(TbCfrmRole.class).where("keyRoleId", idList.toArray()));
    }
    
    public int queryUserWithRole(List<String> idxList){
    	List<String> result = frameRoleDao.queryUserCountWithRole(idxList);
    	return result.size();
    }


}
