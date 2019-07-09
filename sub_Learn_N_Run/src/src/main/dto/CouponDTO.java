package src.main.dto;

public class CouponDTO {
	private UserDTO user;
	private int sale1;
	private int sale2;
	private int sale3;
	public CouponDTO() {}
	public CouponDTO(UserDTO user, int sale1, int sale2, int sale3) {
		super();
		this.user = user;
		this.sale1 = sale1;
		this.sale2 = sale2;
		this.sale3 = sale3;
	}
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public int getSale1() {
		return sale1;
	}
	public void setSale1(int sale1) {
		this.sale1 = sale1;
	}
	public int getSale2() {
		return sale2;
	}
	public void setSale2(int sale2) {
		this.sale2 = sale2;
	}
	public int getSale3() {
		return sale3;
	}
	public void setSale3(int sale3) {
		this.sale3 = sale3;
	}

	
	
}
