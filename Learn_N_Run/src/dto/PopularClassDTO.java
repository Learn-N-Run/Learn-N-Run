package dto;

public class PopularClassDTO {
	private int classNo;// primary key for class Table
	private String creator;
	private String coverImg;
	private String title;
	private String categoryNo;// primary key for category Table
	private String categoryName;
	private int topRankCount;// count buyer(join table result)

	public PopularClassDTO() {}
	
	public PopularClassDTO(int classNo, String creator, String coverImg, String title, String categoryNo,
			String categoryName, int topRankCount) {
		super();
		this.classNo = classNo;
		this.creator = creator;
		this.coverImg = coverImg;
		this.title = title;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.topRankCount = topRankCount;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getTopRankCount() {
		return topRankCount;
	}
	public void setTopRankCount(int topRankCount) {
		this.topRankCount = topRankCount;
	}
	
	
	
}