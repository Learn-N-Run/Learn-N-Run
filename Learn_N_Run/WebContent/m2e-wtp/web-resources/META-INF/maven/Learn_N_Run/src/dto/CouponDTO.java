package dto;

public class CouponDTO {
	private String user_id;
	private int sale1;
	private int sale2;
	private int sale3;

	public CouponDTO() {
	}

	public CouponDTO(String user_id, int sale1, int sale2, int sale3) {
		super();
		this.user_id = user_id;
		this.sale1 = sale1;
		this.sale2 = sale2;
		this.sale3 = sale3;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
