package dto;

public class SubjectInfoDTO {
	private String title; 
	private int classno;
	private int subjectno;
	private String topic;
	private String subject;
	private String url;
	private String coverimg;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getClassno() {
		return classno;
	}
	public void setClassno(int classno) {
		this.classno = classno;
	}
	public int getSubjectno() {
		return subjectno;
	}
	public void setSubjectno(int subjectno) {
		this.subjectno = subjectno;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCoverimg() {
		return coverimg;
	}
	public void setCoverimg(String coverimg) {
		this.coverimg = coverimg;
	}
	public SubjectInfoDTO() {}
	public SubjectInfoDTO(String title, int classno, int subjectno, String topic, String subject, String url,
			String coverimg) {
		super();
		this.title = title;
		this.classno = classno;
		this.subjectno = subjectno;
		this.topic = topic;
		this.subject = subject;
		this.url = url;
		this.coverimg = coverimg;
	}
	
	
	
}
