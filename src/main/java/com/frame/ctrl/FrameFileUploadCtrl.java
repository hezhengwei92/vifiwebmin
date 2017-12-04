package com.frame.ctrl;

import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.FTPUtils;
import com.frame.commons.utils.FileUtils;
import com.frame.commons.utils.LogUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "fileUpload")
public class FrameFileUploadCtrl {


    @RequestMapping(value = "{dirKey}.ajax", method = RequestMethod.POST)
    @ResponseBody
    public RestObject indexView(@PathVariable String dirKey, HttpServletRequest request) throws IOException {
//      上传到FTP上的指定目录下
        String hostname = FileUtils.getDispositionValue("FTP_ADDRESS");
        Integer port = Integer.valueOf(FileUtils.getDispositionValue("FTP_PORT"));
        String username = FileUtils.getDispositionValue("FTP_USERNAME");
        String password = FileUtils.getDispositionValue("FTP_PASSWORD");
        String appImageUrl = FileUtils.getDispositionValue("IMAGE_BASE_URL");
        String fileName="";
        List<String> fileUriList = new ArrayList<String>();
        for(MultipartFile file:ActionUtils.getUploadFiles(request)){
            try{
                InputStream in=file.getInputStream();
                fileName=file.getOriginalFilename();
                boolean flag=FTPUtils.uploadFile(hostname,port,username,password,"appImage/"+dirKey,fileName,in);
                if(flag==true){
                    appImageUrl=appImageUrl+"/appImage/"+dirKey+"/"+fileName;
                    fileUriList.add(appImageUrl);
                    System.out.println("--------  "+appImageUrl);
                    return RestObject.newOk("", fileUriList);
                }else{
                    return RestObject.newOk("上传失败");
                }
            }catch (Exception e){
                LogUtils.info("FrameFileUploadCtrl:upload failed "+e.getMessage());
            }
        }

//      上传到本地项目目录下
//        String rootPath=FrameFileUploadCtrl.class.getClassLoader().getResource("").getPath();
//        String fileUri="/assets/images/uploadImage/"+dirKey+"/";
//        String uploadPath=rootPath.substring(0,rootPath.indexOf("/WEB-INF/"))+fileUri;
//        List<String> fileUriList = new ArrayList<String>();
//        for (MultipartFile multipartFile : ActionUtils.getUploadFiles(request)) {
//            try{
//                String fileName=multipartFile.getOriginalFilename();
//                File file=new File(uploadPath+fileName);
//                if(!file.exists()){
//                    file.mkdirs();
//                }
//                multipartFile.transferTo(file);
//                System.out.println(" 把地址存在数据库中："+"/vifiwebmin"+fileUri+fileName);
//                fileUriList.add("/vifiwebmin"+fileUri+fileName);
//            }catch (Exception e){
//                LogUtils.info("FrameFileUploadCtrl:upload failed "+e.getMessage());
//            }
//        }
        return RestObject.newOk("", fileUriList);
    }

    public enum FileUploadPath {
        VERSION_APP("/opt/tomcat/webapps/download/", "/");

        FileUploadPath(String path, String uri) {
            this.path = path;
            this.uri = uri;
        }

        // 存储文件的物理路径
        String path;
        // 网络路径,uri
        String uri;
    }

}
