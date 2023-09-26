package edu.vandu.helper;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileHelper {

	public static void save(Part file, HttpServletRequest request) throws IOException {
		Path uploadFolder = Path.of(request.getServletContext().getRealPath("/uploads"));
		
		if(!Files.exists(uploadFolder)) {
			Files.createDirectories(uploadFolder);
		}
		
		Path destinationFile = uploadFolder.resolve(file.getSubmittedFileName());
		
		file.write(destinationFile.toString());
		
	}
	
	public static void delete(String filename,HttpServletRequest request) throws IOException {
		Path uploadFolder = Path.of(request.getServletContext().getRealPath("/uploads"));
		
		Path destinationFile = uploadFolder.resolve(filename);
		
		if(Files.exists(destinationFile)) {
			Files.delete(destinationFile);		
		}
		
	}
	
	
}
