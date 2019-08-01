package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CouponDTO {
	private String user_id;
	private int sale1;
	private int sale2;
	private int sale3;
}
