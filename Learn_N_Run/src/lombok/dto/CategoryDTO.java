package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CategoryDTO {
	private int no;
	private String name;
}
