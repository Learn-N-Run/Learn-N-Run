package dto;

public class Receiver_InfoDTO {
	private int no;
	private String name;
	private int number;
	private String address1;
	private String address2;
	private String address3;
	private String delievery_msg;
	

	public Receiver_InfoDTO() {
	}

	public Receiver_InfoDTO(int no, String name, int number, String address1, String address2, String address3,
			String delievery_msg) {
		super();
		this.no = no;
		this.name = name;
		this.number = number;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.delievery_msg = delievery_msg;
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

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getDelievery_msg() {
		return delievery_msg;
	}

	public void setDelievery_msg(String delievery_msg) {
		this.delievery_msg = delievery_msg;
	}


}
