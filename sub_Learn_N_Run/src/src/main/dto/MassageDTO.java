package src.main.dto;

import java.sql.Timestamp;

public class MassageDTO {
	private int no;
	private UserDTO send_user;
	private UserDTO receiver_user;
	private String content;
	private Timestamp send_time;
	private int read_yn;
	public MassageDTO() {}
	public MassageDTO(int no, UserDTO send_user, UserDTO receiver_user, String content, Timestamp send_time,
			int read_yn) {
		super();
		this.no = no;
		this.send_user = send_user;
		this.receiver_user = receiver_user;
		this.content = content;
		this.send_time = send_time;
		this.read_yn = read_yn;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public UserDTO getSend_user() {
		return send_user;
	}
	public void setSend_user(UserDTO send_user) {
		this.send_user = send_user;
	}
	public UserDTO getReceiver_user() {
		return receiver_user;
	}
	public void setReceiver_user(UserDTO receiver_user) {
		this.receiver_user = receiver_user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getSend_time() {
		return send_time;
	}
	public void setSend_time(Timestamp send_time) {
		this.send_time = send_time;
	}
	public int getRead_yn() {
		return read_yn;
	}
	public void setRead_yn(int read_yn) {
		this.read_yn = read_yn;
	}

	
	
	
}
