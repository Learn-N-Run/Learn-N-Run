package src.main.dto;

import java.sql.Timestamp;

public class ReplyDTO {
	
	private int no;
	private String content;
	private Timestamp date;
	private int group;
	private String reply_id;
	private ClassDTO class_info;
	private CurriculmDTO curriculm;

	public ReplyDTO() {}
	public ReplyDTO(int no, String content, Timestamp date, int group, String reply_id, ClassDTO class_info,
			CurriculmDTO curriculm) {
		super();
		this.no = no;
		this.content = content;
		this.date = date;
		this.group = group;
		this.reply_id = reply_id;
		this.class_info = class_info;
		this.curriculm = curriculm;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public ClassDTO getClass_info() {
		return class_info;
	}
	public void setClass_info(ClassDTO class_info) {
		this.class_info = class_info;
	}
	public CurriculmDTO getCurriculm() {
		return curriculm;
	}
	public void setCurriculm(CurriculmDTO curriculm) {
		this.curriculm = curriculm;
	}

	
	
}
