package src.main.dto;

public class BankDTO {

	private String bank_number;
	private int group;
	private ClassDTO class_info;
	private Bank_nameDTO bank_name;

	public BankDTO() {}
	public BankDTO(String bank_number, int group, Bank_nameDTO bank_name) {
		super();
		this.bank_number = bank_number;
		this.group = group;
		this.bank_name = bank_name;
	}
	public String getBank_number() {
		return bank_number;
	}
	public void setBank_number(String bank_number) {
		this.bank_number = bank_number;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public Bank_nameDTO getBank_name() {
		return bank_name;
	}
	public void setBank_name(Bank_nameDTO bank_name) {
		this.bank_name = bank_name;
	}

	
	
}
