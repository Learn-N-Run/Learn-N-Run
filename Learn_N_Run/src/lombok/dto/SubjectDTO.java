package lombok.dto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SubjectDTO {
	private int no;
	private String subject;
	private String url;
	private CurriculumDTO curriculum;

}
