package article.one.dao;

import java.util.List;

import dto.BuyerDTO;
import dto.CouponDTO;
import dto.JjimDTO;
import dto.MessageDTO;
import dto.UserDTO;

public class UserDAIOImpl implements UserDAO{

	@Override
	public void addUser(UserDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateUser(UserDTO dto, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delUser(UserDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userCheck(String id, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO UserInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String creatorCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCreator(UserDTO bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void sendMessage(MessageDTO dto, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sendMail(String receiver, String code_check) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countReadMessage(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MessageDTO> getMessage(MessageDTO bean, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MessageDTO getMessageInfo(int MessageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delMessage(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CouponDTO myCouponInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int buyClass(int classNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CouponDTO CouponClass(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addBuy(BuyerDTO bean, String id, int classNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public JjimDTO getJjim(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
