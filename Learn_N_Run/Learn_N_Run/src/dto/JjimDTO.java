package dto;

public class JjimDTO {
	private int no;
	private UserDTO user;
	private ClassDTO classinfo;

	public JjimDTO() {
	}

	public JjimDTO(int no, UserDTO user, ClassDTO classinfo) {
		super();
		this.no = no;
		this.user = user;
		this.classinfo = classinfo;
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

	public ClassDTO getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(ClassDTO classinfo) {
		this.classinfo = classinfo;
	}

}
