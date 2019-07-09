package src.main.dto;

public class User_groupDTO {
	
	private int no;
	private String name;
	
	
	public User_groupDTO() {}
	public User_groupDTO(int no, String name) {
		super();
		this.no = no;
		this.name = name;
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
