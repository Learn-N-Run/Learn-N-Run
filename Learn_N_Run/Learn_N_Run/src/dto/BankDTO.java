package dto;

public class BankDTO {
	private String bank_number;
	private int group;
	private ClassDTO classinfo;
	private Bank_NameDTO bankname;

	public BankDTO() {
	}

	public BankDTO(String bank_number, int group, ClassDTO classinfo, Bank_NameDTO bankname) {
		super();
		this.bank_number = bank_number;
		this.group = group;
		this.classinfo = classinfo;
		this.bankname = bankname;
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

	public ClassDTO getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(ClassDTO classinfo) {
		this.classinfo = classinfo;
	}

	public Bank_NameDTO getBankname() {
		return bankname;
	}

	public void setBankname(Bank_NameDTO bankname) {
		this.bankname = bankname;
	}

}
