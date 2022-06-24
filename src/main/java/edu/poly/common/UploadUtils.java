package edu.poly.common;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class UploadUtils {
	public static String processUploadField(String fieldName, HttpServletRequest req,
			String storedFolder, String storedFilename) throws IOException, ServletException {
		
		//Lấy thông tin trường được upload
		Part filePart = req.getPart(fieldName);
		
		//Nếu có dữ liệu upload
		if (filePart == null || filePart.getSize() ==0) {
			return "";
		}
		
		if (storedFolder == null) {
			storedFolder = "/uploads";
		}
		
		//nếu storeFilename rỗng ->> Lấy tên file được upload
		if (storedFilename == null) {
			storedFilename = Path.of(filePart.getSubmittedFileName()).getFileName().toString();
		
		}else { //Lấy tên + phần mở rộng của file được upload đến server
			storedFilename += "." + FilenameUtils.getExtension(Path.of
					(filePart.getSubmittedFileName()).toString());
		}
		
		//lấy đường dẫn thực tế của thư mục lưu trữ
		String uploadFolder = req.getServletContext().getRealPath(storedFolder);
		
		//Lấy đối tượng path
		Path uploadPath = Paths.get(uploadFolder);
		
		//Nếu không tồn tại --> tạo ra thư mục
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		
		//ghi nội dung ra thư mục uploadPath
		filePart.write(Paths.get(uploadPath.toString(), storedFilename).toString());
		
		return storedFilename;
	}
}
