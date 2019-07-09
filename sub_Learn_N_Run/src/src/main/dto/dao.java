package src.main.dto;

public class dao {


	private BuyerDTO Selectbuyer(BuyerDTO dto) {
		
		String sql ="dfsdfsf";
		
		try {
			con = ds.connect;
			rs = pstmt.excutet
					
			int result = dto.setLast_tuition(rs.getint("컬럼명"));
			UserDTO user = new UserDTO();
			
			dto.setUser(user.setNickname(rs.getString("")));
			
		} catch (Exception e) {
			
		}finally {
			
		}
		
		
		return dto;
	}
	
	
	
}
