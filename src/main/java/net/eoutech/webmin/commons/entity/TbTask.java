package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
public class TbTask {
    private String taskID;
    private int taskType;
    private String taskName;
    private String image;
    private String taskDesc;
    private String taskLink;
    private String identifier;
    private String taskData;
    private String drawType;
    private String category;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date mdfTm;
    private String mdfBy;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;
    private String crtBy;

    public String getTaskID() {
        return taskID;
    }

    public void setTaskID(String taskID) {
        this.taskID = taskID;
    }

    public int getTaskType() {
        return taskType;
    }

    public void setTaskType(int taskType) {
        this.taskType = taskType;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public String getTaskLink() {
        return taskLink;
    }

    public void setTaskLink(String taskLink) {
        this.taskLink = taskLink;
    }
    public Date getMdfTm() {return mdfTm;}

    public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}

    public String getMdfBy() {return mdfBy;}

    public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}

    public Date getCrtTm() {return crtTm;}

    public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}

    public String getCrtBy() {return crtBy;}

    public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

    public String getTaskData() {
        return taskData;
    }

    public void setTaskData(String taskData) {
        this.taskData = taskData;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getDrawType() {
        return drawType;
    }

    public void setDrawType(String drawType) {
        this.drawType = drawType;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
