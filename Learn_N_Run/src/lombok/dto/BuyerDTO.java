package lombok.dto;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BuyerDTO {
	private int no;
	private UserDTO user;
	private int last_tuition;
	private Timestamp order_date;
	private ClassDTO classinfo;
}
