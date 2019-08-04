package dto;

import lombok.Builder;
import lombok.Data;

@Data // getter+setter+tostring+hashcode
@Builder // new TopClassDTO(X) → TopClassDTO.bulider.bulid();
public class TopClassDTO {
	private int classNo;// primary key for class Table
	private String creator;
	private String coverImg;
	private String title;
	private String categoryNo;// primary key for category Table
	private String categoryName;
	private int TopRankCount;// count buyer(join table result)

}