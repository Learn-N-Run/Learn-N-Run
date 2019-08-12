package dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int no;
	private int target_no;
	private String user_id;
	private String content;
	private Timestamp date;
	private int class_no;
	private int curriculum_no;
	private int count;

	public ReplyDTO() {
	}

	public ReplyDTO(int no, int target_no, String user_id, String content, Timestamp date, int class_no,
			int curriculum_no) {
		super();
		this.no = no;
		this.target_no = target_no;
		this.user_id = user_id;
		this.content = content;
		this.date = date;
		this.class_no = class_no;
		this.curriculum_no = curriculum_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTarget_no() {
		return target_no;
	}

	public void setTarget_no(int target_no) {
		this.target_no = target_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getCurriculum_no() {
		return curriculum_no;
	}

	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}

}