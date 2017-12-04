package net.eoutech.webmin.ws.entity;

import net.eoutech.webmin.commons.entity.TbFeedback;

public class PmsResponse {

	private int feedbackId;
	private String uid;
	private String title;
	private String content;
	private String attachFile;
	
	public PmsResponse (TbFeedback fb) {
		this.feedbackId = fb.getKeyFeedbackId();
		this.uid = fb.getIdxAccountId_tbAccount();
		this.title = fb.getTitle();
		this.content = fb.getContent();
		this.attachFile = fb.getAttachFile();
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}

}
