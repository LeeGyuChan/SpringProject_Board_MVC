package com.spring.spring_project_board_svc;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class Upload {
	
	public boolean fileIUpload(MultipartHttpServletRequest request){
		boolean isUploadSuccess = false;
		
		String uploadPath = "C:/Users/Administrator/Desktop/upload/";
		Iterator<String> iterator = request.getFileNames();
		
		while(iterator.hasNext()){
			String uploadFileName = iterator.next();
			
			//톰캣에서 실제파일 임시경로에서 받아오기(톰캣에 있으나 물리적인 저장이 필요함.)
			MultipartFile mFile = request.getFile(uploadFileName);
			//임시로 불러와 저장했다가 saveFileNmae에 저장함 중복처리를 위함.
			String originFileName = mFile.getOriginalFilename();
			String saveFileName = originFileName;
			
			if(saveFileName!=null && !saveFileName.equals("")){
				if(new File(uploadPath + saveFileName).exists()){
					saveFileName = saveFileName+"_"+System.currentTimeMillis();
				}
				
				try{
					mFile.transferTo(new File(uploadPath+saveFileName));
					isUploadSuccess=true;
				}catch(IllegalStateException e){
					e.printStackTrace();
					isUploadSuccess=false;
				} catch(IOException e2){
					e2.printStackTrace();
					isUploadSuccess=false;
				}
			}
		}
		return isUploadSuccess;
	}
}
