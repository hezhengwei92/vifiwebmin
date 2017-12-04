package com.frame.service;

import com.frame.commons.vo.FrameAuthorization;
import com.frame.dao.FrameAuthorizationDao;
import com.frame.dao.FrameRecourceDao;
import com.frame.security.FrameResource;
import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FilterChainDefinitionsService {
    private String filterChainDefinitions;

    @Autowired
    private FrameRecourceDao resourceDao;

    @Autowired
    private FrameAuthorizationDao authorizationDao;

    @Autowired
    private FrameUserService frameUserService;


    @Autowired
    private ShiroFilterFactoryBean shiroFilterFactoryBean;

    public Ini.Section getObject() throws Exception {
        Ini.Section section = crtIniSection();
        // 输出下当前权限....
        for (Map.Entry<String, String> entry : section.entrySet()) {
            System.out.println(entry.getKey() + " = " + entry.getValue());
        }
        return section;
    }

    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }

    /**
     * 刷新权限,
     */
    public synchronized void reloadCreateFilterChains() {
        AbstractShiroFilter shiroFilter = null;
        try {
            shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean.getObject();
        } catch (Exception e) {
            throw new RuntimeException("get ShiroFilter from shiroFilterFactoryBean error!");
        }
        // 获取过滤管理器
        PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter.getFilterChainResolver();
        DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();

        //清空老的权限控制
        manager.getFilterChains().clear();
        shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();

        //重新构建生成
        shiroFilterFactoryBean.setFilterChainDefinitionMap(crtIniSection());
        Map<String, String> chains = shiroFilterFactoryBean.getFilterChainDefinitionMap();
        for (Map.Entry<String, String> entry : chains.entrySet()) {
            String url = entry.getKey();
            String chainDefinition = entry.getValue().trim().replace(" ", "");
            manager.createChain(url, chainDefinition);
            System.out.println(url + " = " + chainDefinition);
        }
        System.out.println("update shiro permission success...");
    }


    private Ini.Section crtIniSection() {
        Ini ini = new Ini();
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);

        Map<String, String> map = initUrlPermissions();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            section.put(entry.getKey() + "/**", entry.getValue());
        }
        //default
        section.put("/**", "roles[" + FrameUserService.FRM_ROOT + "]");
        return section;
    }

    private Map<String, String> initUrlPermissions() {
        Map<String, String> map = new HashMap<String, String>();
        Map<String, FrameResource> resources = resourceDao.getAll();            //url->res
        if (resources == null) {
            return map;
        }

        // 权限验证
        List<FrameAuthorization> authorizations = authorizationDao.getAll();
        if (authorizations == null) {
            return map;
        }

        for (FrameAuthorization auth : authorizations) {
            if (auth != null && auth.getRole() != null && auth.getAction() != null) {
                FrameResource res = resources.get(auth.getUrl());
                if (res != null) {
                    res.addPermission(auth.getRole(), auth.getAction());
                }
            }
        }

        // defautl index page
        Map<String, String> dftPages = frameUserService.getUserIndexPage();  //role->resourceId
        for (Map.Entry<String, String> entry : dftPages.entrySet()) {
            String role = entry.getKey();
            String url = entry.getValue();
            FrameResource res = resources.get(url);
            if (res != null) {
                res.addPermission(role, "*");
            } else {
                FrameResource newres = new FrameResource(url, url);
                newres.addPermission(role, "*");
                resources.put(url, newres);
            }
        }


        for (Map.Entry<String, FrameResource> entry : resources.entrySet()) {
            FrameResource res = entry.getValue();
            if (res.getUrl() != null && res.getPermission() != null) {
                map.put(res.getUrl(), res.getPermission());
            }
        }

        return map;
    }


}
