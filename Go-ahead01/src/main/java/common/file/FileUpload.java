package common.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
   
   public static UUID saveCopyFile(MultipartFile file, HttpServletRequest request) {
      String fileName = file.getOriginalFilename();
      
      //중복 파일명을 처리하기 위한 난수 발생
      UUID random = UUID.randomUUID();
      File ff = new File(urlPath(request), random + "_" + fileName);
   
      //임시 기억장치에 있는 첨부파일의 내용을 복사
      try {
         FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      
      return random;
   }//end saveCopyFile()
   
   public static String urlPath(HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("/");
      System.out.println("root:" + root);//경로 확인
      
      //temp라는 폴더에 넘어온 파일을 저장
      String saveDirectory = root + "temp" + File.separator; //File.separator는 구분자(/)를 뜻함
      
      File fe = new File(saveDirectory);
      
      if(!fe.exists()) //존재하지 않으면
         fe.mkdir();
      
      return saveDirectory;
   }//end urlPath()
   
   
}//end class