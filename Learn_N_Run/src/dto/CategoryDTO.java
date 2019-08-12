package dto;

public class CategoryDTO {
	private int no;
	private String name;
	private String image;
	
	public CategoryDTO() {
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public CategoryDTO(int no, String name, String image) {
		super();
		this.no = no;
		this.name = name;
		this.image = image;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
