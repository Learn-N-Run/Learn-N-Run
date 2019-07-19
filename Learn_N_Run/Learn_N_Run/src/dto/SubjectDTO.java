package dto;

public class SubjectDTO {
	private int no;
	private String subject;
	private String url;
	private CurriculumDTO curriculum;

	public SubjectDTO() {
	}

	public SubjectDTO(int no, String subject, String url, CurriculumDTO curriculum) {
		super();
		this.no = no;
		this.subject = subject;
		this.url = url;
		this.curriculum = curriculum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public CurriculumDTO getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(CurriculumDTO curriculum) {
		this.curriculum = curriculum;
	}

}
