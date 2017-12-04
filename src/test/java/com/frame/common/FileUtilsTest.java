package com.frame.common;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.utils.DateUtils;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.testng.annotations.Test;

import java.io.*;
import java.util.*;

public class FileUtilsTest {

    @Test
    public void testFileUtils() {
        File logPath = new File( "/log/ViFiWebmin" );
//        Collection< File > files = FileUtils.listFiles( logPath, null, false );


        File[] files = logPath.isDirectory() ? logPath.listFiles( new FileFilter() {
            @Override
            public boolean accept( File pathname ) {
                return pathname.getName().contains( "2015-09" );
            }
        } ) : null;


        toFileInfo( files );

    }

    /**
     *
     * @param files
     * @return {JSONArray} 文件信息集合:信息对象 {name:文件名,mdfTime:修改时间,size:文件大小(kb)}
     */
    private  List< JSONObject > toFileInfo( File[] files ) {
        List< JSONObject > fileInfos = new ArrayList< JSONObject >( files.length );
        for ( File file : files ) {
            JSONObject fileInfo = new JSONObject();
            fileInfo.put( "name", file.getName() );
            fileInfo.put( "mdfTime", DateUtils.formatDate( new Date( file.lastModified() ) ) );
            fileInfo.put( "size", file.length() / 1024f );
            fileInfos.add( fileInfo );
        }

        Collections.sort( fileInfos, new Comparator< Object >() {
            @Override
            public int compare( Object o1, Object o2 ) {
                return ( ( JSONObject ) o2 ).getString( "mdfTime" ).compareTo( ( ( JSONObject ) o1 ).getString( "mdfTime" ) );
            }
        } );
        return fileInfos;
    }

    /**
     * 文件信息分页
     *
     * @param dir         指定的路径
     * @param currentPage 类似于分页
     * @return
     */
    Page< JSONObject > getFilesPage( String dir, int currentPage, int pageSize ) {
        File f = new File( dir );
        File[] allFiles = f.listFiles( new FileFilter() {//过滤掉目录
            @Override
            public boolean accept( File f ) {
                return f.isFile();
            }
        } );
        int init = ( currentPage - 1 ) * pageSize;
        if ( init > allFiles.length ) {//页数太大
            throw new RuntimeException( "页数太大" );
        }
        File[] output = Arrays.copyOfRange( allFiles, init, init + pageSize );
        if ( init + pageSize > allFiles.length ) {//不足一页的情况 去掉null
            int size = allFiles.length - init;
            output = Arrays.copyOf( output, size );
        }
        List< JSONObject > fileInfos =  toFileInfo( output );
        Pageable pageable = new PageRequest( currentPage, pageSize );
        return new PageImpl< JSONObject >( fileInfos, pageable, allFiles.length );
    }


    @Test
    public void filePageTest() {
        Page< JSONObject > filePage = getFilesPage( "C:\\Windows\\System32", 2, 10 );

        for ( JSONObject file : filePage.getContent() ) {
            System.out.println( file );
        }
//        toFileInfo( (File[])filePage.getContent().toArray() );
    }

    @Test
    public void pageReadFile() {
        String strPath = "D:\\log\\ViFiWebmin\\logViFiWebmin.log";
        int pageNumber = 24;

        // 每页字符数量
        int pageCharSize = 10 * 300;
        RandomAccessFile myFile = null;
        try{
            myFile = new RandomAccessFile(strPath, "r");
            long fileLen = myFile.length();
            // 计算跳过多少
            long seek = (pageNumber - 1) * pageCharSize;
            seek = seek < 0 ? 0 : seek;
            myFile.seek( seek );
            byte str[] = new byte[ pageCharSize ];
            myFile.read( str );

            String s = new String( str );

            System.out.println(  s );

            long tPage = (int)(fileLen / pageCharSize + ( fileLen % pageCharSize > 0 ? 1 : 0 ));
            System.out.println( tPage );
        } catch(Exception e){
        }
    }


    @Test
    public  void testFilePage2() throws Exception{
        int pageNo = 2,pageSize = 10;

        File sourceFile = new File( "D:\\log\\ViFiWebmin\\logViFiWebmin.log" );
        FileReader in = new FileReader( sourceFile );
        LineNumberReader reader = new LineNumberReader( in );
        String s = "";
        /*if (lineNumber <= 0 || lineNumber > getTotalLines(sourceFile)) {
            System.exit(0);
        }  */
        int startRow = ( pageNo - 1 ) * pageSize + 1;
        int endRow = pageNo * pageSize;
        int lines = 0;
        System.out.println( "startRow:" + startRow );
        System.out.println( "endRow:" + endRow );
        while ( s != null ) {
            lines++;
            s = reader.readLine();
            if ( lines >= startRow && lines <= endRow ) {
                System.out.println( "line:" + lines + ":" + s );
                //System.exit(0);
            }
        }
        reader.close();
        in.close();
    }
}
