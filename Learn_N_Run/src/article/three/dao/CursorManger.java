package article.three.dao;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CursorManger {

	private int currentCursorNo;//limitSelect된 마지막 레코드 넘버값
	private int prevTotalCount;//이전 총 커서(레코드) 개수
	private int lastCursorNo;//테이블 마지막 레코드 넘버값
	
	
}
