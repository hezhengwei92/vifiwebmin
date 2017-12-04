package com.frame.commons.vo;

import java.io.Serializable;


public class FrameUserMenuVO implements Serializable {
    private String uri;
    private String menu;//菜单id
    private String name;//菜单资源名
    private String iconClass; // 菜单图标

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }
}
