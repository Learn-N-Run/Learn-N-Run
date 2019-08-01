package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Receiver_InfoDTO {
	private int no;
	private String name;
	private int number;
	private String address1;
	private String address2;
	private String address3;
	private String delievery_msg;
	private BuyerDTO buyer;
}
