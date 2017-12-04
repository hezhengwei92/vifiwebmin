package com.frame.security;

import com.frame.service.FrameUserService;
import com.mysql.jdbc.StringUtils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class FrameResource {
    private String id;
    private String directory;
    private String url;
    private String name;
    private Map<String, String> permissions = new HashMap<String, String>();

    private static final String ORROLES_STRING = "orroles[\"%s\"]";
    //private static final String PERMS_STRING="perms[\"{0}\"]";


    public FrameResource(String resourceId, String resourceName) {
        id = resourceId;
        name = resourceName;
        url = id;
        directory = id;
    }


    public int addPermission(String role, String action) {
        if (StringUtils.isNullOrEmpty(role) || StringUtils.isNullOrEmpty(action)) {
            return 1;
        }

        if (permissions.containsKey(role)) {
            String myact = permissions.get(role);
            if (!myact.equals("*")) {
                permissions.put(role, (action.equals("*") ? "*" : myact + "," + action));
            }
        } else {
            permissions.put(role, action);
        }

        return 0;
    }

    public String getPermission() {
        StringBuilder orroles = new StringBuilder(FrameUserService.FRM_ROOT);
        for (Iterator<Entry<String, String>> it = permissions.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<String, String> entry = it.next();
            if (entry.getValue().equals("*")) {
                orroles.append(",").append(entry.getKey());
            }
        }
        return String.format(ORROLES_STRING, orroles);
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDirectory() {
        return directory;
    }

    public void setDirectory(String directory) {
        this.directory = directory;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
