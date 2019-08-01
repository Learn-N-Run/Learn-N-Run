package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ClassDTO {
	private int no;
	private UserDTO creator;
	private String cover_img;
	private String title;
	private String detail_category;
	private String content;
	private String material_img;
	private String material_content;
	private int expiration;
	private int tuition;
	private CategoryDTO category;
}
