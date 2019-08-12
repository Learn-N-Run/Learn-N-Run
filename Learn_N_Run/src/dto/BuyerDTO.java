package dto;

import java.sql.Timestamp;

public class BuyerDTO {
	private int no;
	private UserDTO user;
	private int last_tuition;
	private Timestamp order_date;
	private Timestamp expiration_date;
	private Receiver_InfoDTO receiver;

	public BuyerDTO() {
	}

	public BuyerDTO(int no, UserDTO user, int last_tuition, Timestamp order_date, Timestamp expiration_date,
			Receiver_InfoDTO receiver) {
		super();
		this.no = no;
		this.user = user;
		this.last_tuition = last_tuition;
		this.order_date = order_date;
		this.expiration_date = expiration_date;
		this.receiver = receiver;
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

	public Timestamp getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(Timestamp expiration_date) {
		this.expiration_date = expiration_date;
	}

	public Receiver_InfoDTO getReceiver() {
		return receiver;
	}

	public void setReceiver(Receiver_InfoDTO receiver) {
		this.receiver = receiver;
	}

}