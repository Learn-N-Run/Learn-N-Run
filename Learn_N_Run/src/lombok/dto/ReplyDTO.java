package lombok.dto;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReplyDTO {
	private int no;
	private String content;
	private Timestamp date;
	private int group;
	private String reply_id;
	private ClassDTO classinfo;
	private CurriculumDTO curriculum;
}
