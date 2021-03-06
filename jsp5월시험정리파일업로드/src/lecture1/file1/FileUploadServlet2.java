package lecture1.file1;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/file1/FileUploadServlet2")
public class FileUploadServlet2 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static final String 업로드_폴더 = "/upload";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String 제목 = request.getParameter("title");

		Part filePart = request.getPart("upload1");
		String 파일명 = getFileName(filePart);
		long 파일크기 = filePart.getSize();

		String 폴더경로 = request.getServletContext().getRealPath(업로드_폴더);
		Path path = Paths.get(폴더경로, 파일명);
		if (파일크기 > 0)
			saveFile(filePart, path);
		String 다운로드URL = request.getContextPath() + 업로드_폴더 + "/" + 파일명;

		request.setAttribute("제목", 제목);
		request.setAttribute("파일명", 파일명);
		request.setAttribute("파일크기", 파일크기);
		request.setAttribute("저장된파일", 파일명);
		if (파일크기 > 0) {
			request.setAttribute("파일명", path.toString());
			request.setAttribute("다운로드URL", 다운로드URL);
		}
		request.getRequestDispatcher("/file1/download2.jsp").forward(request, response);
	}

	private String getFileName(Part filePart) {
		for (String content : filePart.getHeader("content-disposition").split(";"))
			if (content.trim().startsWith("filename")) {
				String path = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
				return new File(path).getName();
			}
		return null;
	}

	private void saveFile(Part filePart, Path path) throws IOException {
        InputStream inputStream = filePart.getInputStream();
        OutputStream outputStream = new FileOutputStream(path.toFile());
        try {
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1)
                outputStream.write(bytes, 0, read);
        } finally {
            if (outputStream != null) outputStream.close();
            if (inputStream != null) inputStream.close();
        }
	}
}
