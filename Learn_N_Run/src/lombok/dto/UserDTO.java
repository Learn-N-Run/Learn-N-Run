package lombok.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDTO {
	private String id;
	private String pass;
	private String name;
	private String email;
	private String creator_url;
	private String profile_img;
	private String nickname;
	private int number;
	private Timestamp joinDate;
	private User_GroupDTO user_group;

}
