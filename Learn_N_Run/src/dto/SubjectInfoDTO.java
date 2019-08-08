package dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SubjectInfoDTO {
	private String title; 
	private int classno;
	private int subjectno;
	private String topic;
	private String subject;
	private String url;
	private String coverimg;
	
}
