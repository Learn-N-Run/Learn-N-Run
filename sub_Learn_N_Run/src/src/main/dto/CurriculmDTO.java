package src.main.dto;

public class CurriculmDTO {

	private int no;
	private String thumbnail;
	private String major_topic;
	private String subject;
	private String subject2;
	private String subject3;
	private ClassDTO class_info;

	public CurriculmDTO() {}
	public CurriculmDTO(int no, String thumbnail, String major_topic, String subject, String subject2, String subject3,
			ClassDTO class_info) {
		super();
		this.no = no;
		this.thumbnail = thumbnail;
		this.major_topic = major_topic;
		this.subject = subject;
		this.subject2 = subject2;
		this.subject3 = subject3;
		this.class_info = class_info;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getMajor_topic() {
		return major_topic;
	}
	public void setMajor_topic(String major_topic) {
		this.major_topic = major_topic;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSubject2() {
		return subject2;
	}
	public void setSubject2(String subject2) {
		this.subject2 = subject2;
	}
	public String getSubject3() {
		return subject3;
	}
	public void setSubject3(String subject3) {
		this.subject3 = subject3;
	}
	public ClassDTO getClass_info() {
		return class_info;
	}
	public void setClass_info(ClassDTO class_info) {
		this.class_info = class_info;
	}

	
	
}
