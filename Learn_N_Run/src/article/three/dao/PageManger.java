package article.three.dao;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PageManger {

	private int totalCount;
	private int pageNum;
	private int contentNum;//컨텐츠 페이지 갯수
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int currentBlock;//현재 페이지 블록
	private int lastBlock;//마지막 페이지 블록
	
	public int calcpage(int totalCount, int contentNum) {

		int totalPage = totalCount/contentNum;
		if(totalCount%contentNum>0)totalPage++;
		
		return totalPage; 
	}
	
	public int setStartPage(int currentBlock, int lastBlock) {
		
		this.startPage = (currentBlock*5)-4;
//		this.startPage = (currentBlock*this.contentNum)-4;
		return 0;
	}
	
}
