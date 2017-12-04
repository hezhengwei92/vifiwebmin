package net.eoutech.webmin.commons.utils;

import com.frame.commons.utils.JsonUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * CSV操作
 */
public class CSVUtils {

    /**
     * csv字符串转List
     */
    public static List< List< String > > csvToData( String strCSV ) {
        String[] csvArr = strCSV.split( "\\r\\n|\\r|\\n" );
        List< List< String > > csvData = new ArrayList<List< String >>();
        for ( String csvRow : csvArr ) {
            csvData.add( Arrays.asList( csvRow.split( "," ) ) );
        }
        return csvData;
    }

    /**
     * List字符串转csv
     */
    public static String dataToCsv( List< List< Object > > csvData ) {
        StringBuilder strCSV = new StringBuilder();
        for ( List< Object > csvRow : csvData ) {
            int colInx = 0;
            for ( Object col : csvRow ) {
                if ( colInx++ > 0 ) {
                    strCSV.append( "," );
                }
                strCSV.append( col );
            }
            strCSV.append( "\r\n" );
        }
        return strCSV.toString();
    }


    public static void main( String[] args ) {
        String data =
                "year,age,status,sex,population\r\n" +
                        "1850,20,0,1,1017281\r\n" +
                        "1850,20,0,2,1003841\r\n";

        List< List< Object > > obj = (List)csvToData( data );


        JsonUtils.toStringPrint( obj );

        String csvStr = dataToCsv( obj );
        System.out.println( csvStr );
    }
}