package detail.service;

import java.util.List;

import detail.dto.ReviewDTO;

public interface ReviewService {
	public List<ReviewDTO> reviewListProcess(ReviewDTO dto);
//	public ReviewDTO detailreview(int rev_seq);
	
	public void insertProcess (ReviewDTO dto);
}
