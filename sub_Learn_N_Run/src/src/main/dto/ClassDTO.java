package src.main.dto;

public class ClassDTO {
	private int no;
	private UserDTO cre_user;
	private String cover_img;
	private String title;
	private String detail_category;
	private String content;
	private String material_img;
	private String material_content;
	private int expiration;
	private int tuition;				
	private CategoryDTO category;     

	public ClassDTO() {}
	public ClassDTO(int no, UserDTO cre_user, String cover_img, String title, String detail_category, String content,
			String material_img, String material_content, int expiration, int tuition, CategoryDTO category) {
		super();
		this.no = no;
		this.cre_user = cre_user;
		this.cover_img = cover_img;
		this.title = title;
		this.detail_category = detail_category;
		this.content = content;
		this.material_img = material_img;
		this.material_content = material_content;
		this.expiration = expiration;
		this.tuition = tuition;
		this.category = category;
	}

	
	
}
