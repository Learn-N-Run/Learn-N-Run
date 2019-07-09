package src.main.dto;

public class Bank_nameDTO {

	private int no;
	private String name;
	
	public Bank_nameDTO() {}
	public Bank_nameDTO(int no, String name) {
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
