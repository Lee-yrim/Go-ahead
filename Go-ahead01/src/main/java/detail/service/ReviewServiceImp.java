package detail.service;

import java.io.File;
import java.util.List;

import detail.dao.ReviewDAO;
import detail.dto.ReviewDTO;

public class ReviewServiceImp implements ReviewService {
	private ReviewDAO reviewDao;
	
	public ReviewServiceImp() {}
	
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}
	
//	@Override
//	public ReviewDTO detailReviewInsert(ReviewDTO dto) {
//		return null;
//	}
	
	@Override
	public List<ReviewDTO> reviewListProcess(ReviewDTO dto) {
		return reviewDao.reviewlist(dto);
	}
	
	@Override
	public ReviewDTO detailreview(int rev_seq) {
		return reviewDao.detailreview(rev_seq);
	}

//	@Override
//	public void insertProcess(ReviewDTO dto, String urlpath) {
//		
//		String filename=dto.getUpload();
//		
//	      if(filename != null) {
//	        
//	         String path = reviewDao.getFile(dto.getRev_seq());
//	         
//	         if(path != null) {
//	            File file = new File(urlpath, path);
//	            file.delete();   
//	         }
//	      }
//		reviewDao.save(dto);		
//	}
	
	@Override
	public void insertProcess(ReviewDTO dto) {
		
		reviewDao.save(dto);		
	}

	@Override
	public String fileSelectprocess(int rev_seq) {

		return null;
	}


}
