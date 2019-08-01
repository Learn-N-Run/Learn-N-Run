package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class JjimDTO {
	private int no;
	private UserDTO user;
	private ClassDTO classinfo;
}
