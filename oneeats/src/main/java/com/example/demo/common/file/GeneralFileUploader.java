package com.example.demo.common.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public class GeneralFileUploader {
	public static String CURR_IMAGE_REPO_PATH;
	
	
	public GeneralFileUploader(String repopath) {
		super();
		CURR_IMAGE_REPO_PATH = "c:/oneeats/file_repo"+repopath;
	}
	
	
	public static Map getParameterMap(MultipartHttpServletRequest request) {
		Map map = new HashMap();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			map.put(name, value);
		}
		return map;
		
	}
	

	public static List upload(MultipartHttpServletRequest multipartHttpServletRequest) throws IllegalStateException, IOException{
		multipartHttpServletRequest.setCharacterEncoding("utf-8");
		List fileList = fileProcess(multipartHttpServletRequest);
		return fileList;
	}
	
	public static List upload(MultipartHttpServletRequest multipartHttpServletRequest,String repopath) throws IllegalStateException, IOException{
		CURR_IMAGE_REPO_PATH = "c:/oneeats/file_repo"+repopath;
		File directory = new File(CURR_IMAGE_REPO_PATH);
        if (!directory.exists()) {
            boolean created = directory.mkdirs();
            if (created) {
                System.out.println("Directory created successfully.");
            } else {
                System.out.println("Failed to create directory.");
            }
        }
		return upload(multipartHttpServletRequest);
	}
	
	private static List fileProcess(MultipartHttpServletRequest multipartHttpServletRequest) throws IllegalStateException, IOException {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartHttpServletRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = (String) fileNames.next();
			MultipartFile mFile = multipartHttpServletRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
			if (mFile.getSize()!=0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+originalFileName));
			}
			
		}
		return fileList;
		
	}
}
