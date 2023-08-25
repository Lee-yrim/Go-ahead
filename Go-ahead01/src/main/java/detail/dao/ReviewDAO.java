package detail.dao;

import java.util.List;

import detail.dto.ReviewDTO;

public interface ReviewDAO {
	public List<ReviewDTO> reviewlist(ReviewDTO dto);
	public int detailreviewinsert(ReviewDTO dto);
	public ReviewDTO detailreview(int rev_seq);
	public String getFile(int rev_seq);
	public void save(ReviewDTO dto);
}
