package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.BuyerDTO;
import dto.CouponDTO;
import dto.Receiver_InfoDTO;

public class InsertbuyClassService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		String receiver_name = request.getParameter("receiver_name_h");
		int receiver_number = Integer.parseInt(request.getParameter("receiver_number_h"));
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String content = request.getParameter("content");
		int last_tuition = Integer.parseInt(request.getParameter("last_tuition"));
		
		Receiver_InfoDTO rdto = new Receiver_InfoDTO();
		rdto.setAddress1(address1);
		rdto.setAddress2(address2);
		rdto.setAddress3(address3);
		rdto.setDelievery_msg(content);
		rdto.setNumber(receiver_number);
		rdto.setName(receiver_name);
		
		BuyerDTO bdto = new BuyerDTO();
		bdto.setLast_tuition(last_tuition);
		bdto.setReceiver(rdto);
		
		UserDAIOImpl dao = null;
		
		if(request.getParameter("couponNo").equals("")) {
			dao = new UserDAIOImpl();
			dao.addBuy(bdto, id, classNo);
		}else {
			CouponDTO cdto = new CouponDTO();
			int couponNo = Integer.parseInt(request.getParameter("couponNo"));
			if(couponNo==5000) {
				cdto.setSale1(1);
			}else if(couponNo==7000) {
				cdto.setSale2(1);
			}else if(couponNo==10000) {
				cdto.setSale3(1);
			}
			dao = new UserDAIOImpl();
			dao.addBuy(bdto, cdto, id, classNo);
		}
		
	}
}
