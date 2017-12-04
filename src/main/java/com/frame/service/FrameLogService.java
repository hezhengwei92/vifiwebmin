package com.frame.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.DateUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.LineIterator;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.*;


@Service
public class FrameLogService extends FrameBaseService {

    // 日志目录下的回收站目录
    private static final String RECYCLE_DIR = "tmp/";
    // 实时查询的字符长度
    private static final int REAL_LEN = 8000;

    public Page<JSONObject> query(int pageNumber, int pageSize, String modelName, Map<String, Object> queryParam) {
        String logDirPath = getLogPath(modelName);
        return getFilesPage(logDirPath, pageNumber, pageSize);
    }


    /**
     * @param files 文件组
     * @return {JSONArray} 文件信息集合:信息对象 {
     * name:文件名,mdfTime:修改时间,size:文件大小(kb)
     * path:路径
     * }
     */
    private List<JSONObject> toFileInfo(File[] files, long lastMdfTime) {
        List<JSONObject> fileInfos = new ArrayList<JSONObject>(files.length);
        for (File file : files) {
            JSONObject fileInfo = new JSONObject();
            fileInfo.put("name", file.getName());
            long lastModified = file.lastModified();
            fileInfo.put("lastMdfFile", lastMdfTime == lastModified);
            fileInfo.put("mdfTime", DateUtils.formatDate(new Date(lastModified)));
            fileInfo.put("path", file.getPath());
            System.out.println("---------path--------------"+file.getPath());
            fileInfo.put("size", file.length() / 1048576f);
            fileInfos.add(fileInfo);
        }
        return fileInfos;
    }

    /**
     * 文件信息分页
     *
     * @param dir         指定的路径文件分页 /opt/uuwifi/log/vifiWebmin/ 目录 这个目录下有多个文件
     * @param currentPage 当前页吗
     */
    Page<JSONObject> getFilesPage(String dir, int currentPage, int pageSize) {
        File f = null;
        try {
            f = new File(dir);
        } catch (NullPointerException e) {
            throw new FrameException("log path not find!!404");
        }

        final long[] lastMdfTime = {0};
        File[] allFiles = f.listFiles(new FileFilter() {//过滤掉目录 留下文件
            @Override
            public boolean accept(File f) {
                long cLastMdf = f.lastModified();
                lastMdfTime[0] = cLastMdf > lastMdfTime[0] ? cLastMdf : lastMdfTime[0];
                return f.isFile();
            }
        });
        Arrays.sort(allFiles, new Comparator<File>() {
            @Override
            public int compare(File o1, File o2) {
                return (int) (o2.lastModified() / 1000 - o1.lastModified() / 1000);
            }
        });

        int init = (currentPage - 1) * pageSize;
        if (init > allFiles.length) {//页数太大
            throw new RuntimeException("页数太大");
        }
        File[] output = Arrays.copyOfRange(allFiles, init, init + pageSize);
        if (init + pageSize > allFiles.length) {//不足一页的情况 去掉null
            int size = allFiles.length - init;
            output = Arrays.copyOf(output, size);
        }

        List<JSONObject> fileInfos = toFileInfo(output, lastMdfTime[0]);
        Pageable pageable = new PageRequest(currentPage - 1, pageSize);
        return new PageImpl<JSONObject>(fileInfos, pageable, allFiles.length);
    }


    /**
     * 日志文件回收站操作
     */
    public void logRecycle(String modelName, String fileName) throws IOException {
        String logDirPath = getLogPath(modelName);
        File logFile = new File(logDirPath + fileName);
        File recycleDir = new File(logDirPath + RECYCLE_DIR);
        //判断文件夹是否存在
        if (!recycleDir.exists()) {
            recycleDir.mkdirs();
        }
        File recycleFile = new File(logDirPath + RECYCLE_DIR + fileName);
        FileUtils.moveFile(logFile, recycleFile);
    }


    /**
     * 查看日志详情
     */
    public Page<String> queryLogDetails(int pageNumber, int pageSize, String modelName, String fileName, Map<String, Object> queryParam) {
        String logDirPath = getLogPath(modelName);
        String filePath = logDirPath + fileName;

        String keyword = (String) queryParam.get("LIKE-|-keyword");
        StringBuilder strContent = new StringBuilder();
        File file = new File(filePath);
        LineIterator it = null;
        long lineCount = 0;
        int startRow = (pageNumber - 1) * pageSize;
        int endRow = pageNumber * pageSize;
        try {
            it = FileUtils.lineIterator(file, "UTF-8");
            while (it.hasNext()) {
                String line = it.nextLine();
                if (StringUtils.isBlank(keyword) || line.contains(keyword)) {
                    if (lineCount >= startRow && lineCount < endRow) {
                        strContent.append(line).append("\n\r");
                    }
                    lineCount++;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            LineIterator.closeQuietly(it);
        }
        Pageable pageable = new PageRequest(pageNumber - 1, pageSize);
        List<String> content = new ArrayList<String>(1);
        content.add(strContent.toString());
        return new PageImpl<String>(content, pageable, lineCount);
    }


    /**
     * 日志下载
     */
    public File logDown(String modelName, String fileName) {
        String logDirPath = getLogPath(modelName);
        return new File(logDirPath + fileName);
    }

    /**
     * 日志实时查看
     */
    public String realTimeQuery(String modelName, String fileName) {
        String logDirPath = getLogPath(modelName);

        RandomAccessFile ra = null;
        try {
            ra = new RandomAccessFile(logDirPath + fileName, "r");
            ra.seek(ra.length() - REAL_LEN);
            byte[] readByte = new byte[REAL_LEN];
            ra.read(readByte);
            return new String(readByte);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ra.close();
            } catch (IOException e) {
            }
        }

        return "";
    }

    private String getLogPath(String modelName) {
        return CommonUtils.getRsAppCfg("frame.log.path." + modelName);
    }


}
