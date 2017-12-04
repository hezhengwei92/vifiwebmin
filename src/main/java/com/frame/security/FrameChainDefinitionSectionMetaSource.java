package com.frame.security;

import com.frame.service.FilterChainDefinitionsService;
import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

public class FrameChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

    @Autowired
    private FilterChainDefinitionsService filterChainDefinitionsService;


    @Override
    public Section getObject() throws Exception {
        return filterChainDefinitionsService.getObject();
    }

    @Override
    public Class<?> getObjectType() {
        return this.getClass();
    }

    @Override
    public boolean isSingleton() {
        return false;
    }

    public void setFilterChainDefinitions(String filterChainDefinitions) {
        filterChainDefinitionsService.setFilterChainDefinitions(filterChainDefinitions);
    }

}
