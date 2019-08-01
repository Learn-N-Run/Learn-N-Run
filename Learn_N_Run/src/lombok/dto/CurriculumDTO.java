package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CurriculumDTO {
	private int no;
	private String thumbnail;
	private String major_topic;
	private ClassDTO classinfo;
}
