package lombok.dto;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MessageDTO {
	private int no;
	private UserDTO send_user;
	private UserDTO receiver_user;
	private String content;
	private Timestamp send_time;
	private int read_yn;
}
