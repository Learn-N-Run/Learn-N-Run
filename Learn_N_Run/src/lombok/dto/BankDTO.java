package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BankDTO {
	private String bank_number;
	private int group;
	private ClassDTO classinfo;
	private Bank_NameDTO bankname;
}
