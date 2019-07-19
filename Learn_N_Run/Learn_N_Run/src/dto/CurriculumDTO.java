package dto;

public class CurriculumDTO {
	private int no;
	private String thumbnail;
	private String major_topic;
	private ClassDTO classinfo;

	public CurriculumDTO() {
	}

	public CurriculumDTO(int no, String thumbnail, String major_topic, ClassDTO classinfo) {
		super();
		this.no = no;
		this.thumbnail = thumbnail;
		this.major_topic = major_topic;
		this.classinfo = classinfo;
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

	public ClassDTO getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(ClassDTO classinfo) {
		this.classinfo = classinfo;
	}

}
