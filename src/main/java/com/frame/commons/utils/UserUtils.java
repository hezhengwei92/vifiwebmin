package com.frame.commons.utils;

import com.frame.commons.web.UserProfile;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;


public class UserUtils {


    /**
     * @return UserProfile
     */
    public static UserProfile getUserProfile() {
        Subject subject = SecurityUtils.getSubject();

        UserProfile prof = ( UserProfile ) subject.getPrincipal();
        if ( prof == null ) {
            subject.logout();
        }
        return prof;
    }


    /**
     * @return userName
     */
    public static String getUserName() {
        try {
            return getUserProfile().getUserName();
        } catch ( Exception e ) {
            return "-";
        }

    }


}
