package dto;

import java.sql.Timestamp;

public class UserDTO {
	private String id;
	private String pass;
	private String name;
	private String email;
	private String creator_url;
	private String profile_img;
	private String nickname;
	private int number;
	private Timestamp joinDate;
	private User_GroupDTO user_group;

	public UserDTO() {
	}

	public UserDTO(String id, String pass, String name, String email, String creator_url, String profile_img,
			String nickname, int number, Timestamp joinDate, User_GroupDTO user_group) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.creator_url = creator_url;
		this.profile_img = profile_img;
		this.nickname = nickname;
		this.number = number;
		this.joinDate = joinDate;
		this.user_group = user_group;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreator_url() {
		return creator_url;
	}

	public void setCreator_url(String creator_url) {
		this.creator_url = creator_url;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	public User_GroupDTO getUser_group() {
		return user_group;
	}

	public void setUser_group(User_GroupDTO user_group) {
		this.user_group = user_group;
	}

}
