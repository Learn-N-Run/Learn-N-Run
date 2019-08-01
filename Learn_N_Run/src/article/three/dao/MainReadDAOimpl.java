package article.three.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.dto.BuyerDTO;
import lombok.dto.ClassDTO;
import lombok.dto.CurriculumDTO;

public class MainReadDAOimpl implements MainReadDAO {

	private SqlSession sqlSession;
	
	@Override
	public List<BuyerDTO> top5Info(BuyerDTO bean) {
		return null;
	}

	@Override
	public List<ClassDTO> getCategoryClass(ClassDTO bean) {
		return null;
	}

	@Override
	public List<CurriculumDTO> getCurriculum(CurriculumDTO dto) {
		return null;
	}

	@Override
	public CurriculumDTO getVideo(CurriculumDTO dto, int subjectNo) {
		return null;
	}

}
