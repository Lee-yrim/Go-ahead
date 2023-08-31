package detail.service;

import java.util.List;

import detail.dao.ReviewDAO;
import detail.dto.ReviewDTO;

public class ReviewServiceImp implements ReviewService {
	private ReviewDAO reviewDao;
	
	public ReviewServiceImp() {}
	
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	
	@Override
	public List<ReviewDTO> reviewListProcess(ReviewDTO dto) {
		return reviewDao.reviewlist(dto);
	}
	
	@Override
	public void insertProcess(ReviewDTO dto) {
		reviewDao.save(dto);	
	}
}
