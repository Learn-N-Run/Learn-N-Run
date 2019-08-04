package dto;

import lombok.Builder;
import lombok.Data;

@Data // getter+setter+tostring+hashcode
@Builder // new InterestedClassDTO(X) → InterestedClassDTO.bulider.bulid();
public class InterestedClassDTO {
	private int classNo;// primary key for class Table
	private String creator;
	private String coverImg;
	private String title;
	private String categoryNo;// primary key for category Table
	private String categoryName;
	private int interestCount;// count buyer(jjim table result)
	
}