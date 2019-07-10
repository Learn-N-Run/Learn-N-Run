package dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int no;
	private String content;
	private Timestamp date;
	private int group;
	private String reply_id;
	private ClassDTO classinfo;
	private CurriculumDTO curriculum;

	public ReplyDTO() {
	}

	public ReplyDTO(int no, String content, Timestamp date, int group, String reply_id, ClassDTO classinfo,
			CurriculumDTO curriculum) {
		super();
		this.no = no;
		this.content = content;
		this.date = date;
		this.group = group;
		this.reply_id = reply_id;
		this.classinfo = classinfo;
		this.curriculum = curriculum;
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

	public ClassDTO getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(ClassDTO classinfo) {
		this.classinfo = classinfo;
	}

	public CurriculumDTO getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(CurriculumDTO curriculum) {
		this.curriculum = curriculum;
	}

}
