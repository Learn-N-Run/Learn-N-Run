package src.main.dto;

public class JjimDTO {
	private int no;
	private UserDTO user;
	private ClassDTO class_info;
	public JjimDTO() {}
	public JjimDTO(int no, UserDTO user, ClassDTO class_info) {
		super();
		this.no = no;
		this.user = user;
		this.class_info = class_info;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public ClassDTO getClass_info() {
		return class_info;
	}
	public void setClass_info(ClassDTO class_info) {
		this.class_info = class_info;
	}

	
}
