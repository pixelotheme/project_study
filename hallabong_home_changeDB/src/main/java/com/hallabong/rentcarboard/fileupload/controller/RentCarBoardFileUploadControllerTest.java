package com.hallabong.rentcarboard.fileupload.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
public class RentCarBoardFileUploadControllerTest {

	public List<CarFileUploadVO> uploadFormPost(MultipartFile[] uploadFile, HttpServletRequest request,
			long carInfoNo) throws Exception {

		List<CarFileUploadVO> list = null;
		// 저장할 상대 위치 정하기 /webapp/upload - servlet-context.xml에서 허용되어진 폴더이여야 한다.
		// 실제적으로 폴더도 만들어 놔야 한다. 파일 한개를 넣어 두면 반드시 폴더를 만든다. 자원이 없으면 폴더를 안 만들
//		String path = "/upload"; //기존 서버에 넣을떄
		String path = "c://upload//image"; // 다른폴더로 하면 됨
//		String path = "c:\\upload\\image"; // 파일 구분자가 \\ 인데 왜 안될까

		// request.getServletContext().realpath() -> DS에서 ServletContext는 주지 않는다.
		// request를 받아서 쓴다.
		log.info(request);
		// 업로드 경로에 날짜를 추가시킴
		File uploadPath = new File(path, getFolder());
		log.info("upload path : " + uploadPath.getPath());

		// 기본 슬레시로 db에 저장 upload에서 파일 꺼내올수있게, 구분자를 \ -> / 로 바꿔줌
		String dbUploadPath = (uploadPath.toString()).replace(File.separator, "/") + "/";
		log.info("DB upload path : " + dbUploadPath);

		// 실제적으로 저장되느 절대 위치 찾기
//		String realPath = request.getServletContext().getRealPath(path);
		//uploadPath 에 C:\\ 으로 실제 저장위치 쓰니까 null 이 되어버림
//		String realPath = request.getServletContext().getRealPath(uploadPath.toString()); 원래쓰던것
		String realPath = uploadPath.toString(); //서버 외부로 저장위치변경
		log.info("실제적인 저장 위치 : " + realPath);

//		폴더 생성
		File folder = new File(realPath);
		boolean isExist = folder.exists();
		if (!isExist)
			folder.mkdirs();
		
		for (MultipartFile mf : uploadFile) {
			log.info("-------------------------------------------");

			log.info("Upload file name : " + mf.getOriginalFilename());

			log.info("Upload file size : " + mf.getSize());

			String orgFileName = mf.getOriginalFilename();
			// IE 는 file path 가 추가적으로 필요(모든 파일 경로가 다나와서 ), \\인덱스 다음에서 끝까지(파일이름만) 잘라오기
			String onlyFileName = orgFileName.substring(orgFileName.lastIndexOf("\\") + 1);
			log.info("only file name :" + onlyFileName);

			UUID uuid = UUID.randomUUID();
			String uuidOrgFileName = uuid.toString().replace("-", "") + "_" + onlyFileName;

			// c:\\upload+업로드 되는 파일이름
			File saveFile = new File(realPath, uuidOrgFileName);

			if (saveFile.exists())
				log.info("저장할 파일이 존재합니다");
			// 저장
			mf.transferTo(saveFile);
			log.info("실제 저장 경로 : " + saveFile.toString());

			
			// 이미지 리스트를 위해서 작은 이미지 처리가 필요하다. - 섬네일 처리
			if(checkImageType(saveFile)) {
				//바이트 단위 파일 저장을 위한 객체로 만들어 준다 , file(saveFile) 로 만들어버리면 덮어씌우기가 되어 이름에 변형을 준다
				// new File() 로 파일을 새로 만들어준다, 현재 realPath 가  file타입으로 정확인 위치 반환해서 변수로 만들어놨다 - 서버안에 upload 안에 들어가게 된다
				FileOutputStream thumbnail = new FileOutputStream(new File(realPath , "s_"+uuidOrgFileName));
				
				//원본 이미지파일을 사용해서 섬네일 저장 파일로 넣는다
				//파일을 일정크기로 만들어 저장시킨다, multipart에서 바이트 단위로 꺼내서 잘라준다
				Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail,100,100);
				
				//사용한 객체를 닫자.
				thumbnail.close();
				
			}
			
			// null 이면 에러나서 생성해준다
			if (list == null)
				list = new ArrayList<CarFileUploadVO>();
			CarFileUploadVO vo = new CarFileUploadVO();
			vo.setOrgFileName(orgFileName);
			vo.setFileName(dbUploadPath + uuidOrgFileName);
			vo.setFileSize(mf.getSize());
			vo.setRealSavePath(saveFile.toString());
			vo.setCarInfoNo(carInfoNo);

			list.add(vo);
			log.info("vo 에 저장된 fileName : " + vo.getFileName());

		}

		// jsp에 첨부파일을 보낸다 , 의미 없는듯
//		model.addAttribute("uploadFile", uploadFile);

		
		return list;
	}

	// 연 월 일 폴더 생성하기 위한 날짜 -> 2022-07-13 의 "-" 를 운영체제에 맞는 구분자로 바꿈
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		log.info("날짜 : " + sdf);
		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);

	}

	public void delete(CarFileUploadVO fileNameList) throws Exception {

		// 파일정보 foreach 로 돌려 삭제 - realpath.delete 쓰면 될듯?
		
			if (fileNameList.getRealSavePath() != null && !fileNameList.equals("")) {
				new File(fileNameList.getRealSavePath()).delete();
//					delFile = new File(request.getServletContext().getRealPath(del));
		}
		return;

	}
	//다중파일 이면 쓴다
	public void deletemulti(List<CarFileUploadVO> fileNameList) throws Exception {
		
		// 파일정보 foreach 로 돌려 삭제 - realpath.delete 쓰면 될듯?
		for (CarFileUploadVO fileVO : fileNameList) {
			if (fileVO.getRealSavePath() != null && !fileVO.equals("")) {
				new File(fileVO.getRealSavePath()).delete();
//					delFile = new File(request.getServletContext().getRealPath(del));
			}
			
		}
		return;
		
	}
	
	//이미지 파일에 대한 판다
	private boolean checkImageType(File file) throws Exception {
		
		//
		String contentType = Files.probeContentType(file.toPath());
		
		log.info("checkImageType().contentType"+contentType);
		// 시작이 이미지인 경우 리턴값 true, 아닌경우 false
		return contentType.startsWith("image"); // contentType.indexOf("image") == 0 - 처음 인덱스에 image 시작인가?
	}
	
	
}
