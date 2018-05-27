package lecture1.file1;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
@WebServlet("/file1/FileUploadServlet1")
public class FileUploadServlet1 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static final String 업로드_폴더 = "/upload";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String 제목 = request.getParameter("title");

		Part filePart = request.getPart("upload1"); //input 태그의 이름이 같아야 한다
		String 파일명 = getFileName(filePart);
		long 파일크기 = filePart.getSize();

		String 폴더경로 = request.getServletContext().getRealPath(업로드_폴더);
		Path path = Paths.get(폴더경로, 파일명);
		if (파일크기 > 0)
			saveFile(filePart, path);
		String 다운로드URL = request.getContextPath() + 업로드_폴더 + "/" + 파일명;

		response.setContentType("text/html; utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		writer.write("<html>");
		writer.write("<head>");
		writer.write("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
		writer.write("<title>Servlet 3.0 File Upload Example</title>");
		writer.write("</head>");
		writer.write("<body>");
		writer.write("<h3>파일업로드 결과</h3>");
		writer.write("<div>제목: " + 제목 + "</div>");
		writer.write("<div>파일이름: " + 파일명 + "</div>");
		writer.write("<div>파일크기: " + 파일크기 + "</div>");
		if (파일크기 > 0) {
			writer.write("<div>저장된파일: " + path.toString() + "</div>");
			writer.write("<div>다운로드 링크: <a download href='" + 다운로드URL + "'>다운로드</a></div>");
		}
		writer.write("</body>");
		writer.write("</html>");
		writer.close();
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
			if (outputStream != null)
				outputStream.close();
			if (inputStream != null)
				inputStream.close();
		}
	}

}
