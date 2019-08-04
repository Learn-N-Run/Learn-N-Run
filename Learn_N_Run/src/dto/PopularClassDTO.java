package dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data // getter+setter+tostring+hashcode
@AllArgsConstructor
public class PopularClassDTO {
	private int classNo;// primary key for class Table
	private String creator;
	private String coverImg;
	private String title;
	private String categoryNo;// primary key for category Table
	private String categoryName;
	private int TopRankCount;// count buyer(join table result)

	public PopularClassDTO (){}
}