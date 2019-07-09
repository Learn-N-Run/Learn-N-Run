package src.main.dto;

import java.sql.Timestamp;

public class BuyerDTO {

	private int no;
	private UserDTO user;
	
	private Receiver_infoDTO receiver_info;
	private int last_tuition;
	private Timestamp order_date;
	private ClassDTO class_no;
	
	public BuyerDTO() {}
	public BuyerDTO(int no, UserDTO user, Receiver_infoDTO receiver_info, int last_tuition, Timestamp order_date,
			ClassDTO class_no) {
		super();
		this.no = no;
		this.user = user;
		this.receiver_info = receiver_info;
		this.last_tuition = last_tuition;
		this.order_date = order_date;
		this.class_no = class_no;
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
	public Receiver_infoDTO getReceiver_info() {
		return receiver_info;
	}
	public void setReceiver_info(Receiver_infoDTO receiver_info) {
		this.receiver_info = receiver_info;
	}
	public int getLast_tuition() {
		return last_tuition;
	}
	public void setLast_tuition(int last_tuition) {
		this.last_tuition = last_tuition;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public ClassDTO getClass_no() {
		return class_no;
	}
	public void setClass_no(ClassDTO class_no) {
		this.class_no = class_no;
	}

	
	
}
