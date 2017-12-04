package com.frame.commons.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * Created by Administrator on 2015/8/5.
 */
public class DateUtils {

    public static Date parseDate( String strDate ) {
        SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        try {
            return sdf.parse( strDate );
        } catch ( ParseException e ) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * ת��Date  ���ַ��� "yyyy-MM-dd HH:mm:ss"
     */
    public static String formatDate( Date date ) {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        return formatter.format( date );
    }

    /**
     * ת����ǰʱ��  ���ַ��� "yyyy-MM-dd HH:mm:ss"
     */
    public static String formatDate() {
        return formatDate( new Date() );
    }

    public static String thisDayFormat ( Date date ) {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd" );
        return formatter.format( date );
    }

    public static String thisMonthFormat ( Date date ) {
        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM" );
        return formatter.format( date );
    }

    /**
     * 查询前N天的日期
     */
    public static String[] beforeDaysFormat ( int n ) {
        SimpleDateFormat sf = new SimpleDateFormat( "yyyy-MM-dd" );
        String[] result = new String[ n ];

        Calendar cl = Calendar.getInstance();
        cl.setTime( new Date() );
        cl.add( Calendar.DATE, 0 - n );

        for ( int i = 0; i < n; i ++ ) {
            cl.add( Calendar.DATE, 1 );
            result[i] = sf.format( cl.getTime() );
        }
        return result;
    }

}
