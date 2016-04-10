package com.bnpp.arph.FilesManager;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 * Servlet implementation class FileUploadHandler
 */
@WebServlet(urlPatterns = "/delete")
public class FileDeleteHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger
			.getLogger(FileDeleteHandler.class.getCanonicalName());

	private final String UPLOAD_DIRECTORY = "C:/Upload";
	private List<String> fileList = new ArrayList<String>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileDeleteHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		String paramName = "fileName";
		String paramValue = request.getParameter(paramName);

		System.out.println("Fichier � supprimer\t" + paramValue);
		RequestDispatcher rd = getServletContext()
				.getRequestDispatcher("/index.jsp");
		request.setAttribute(
				"errorMessageSupp",
				"<font color=green><strong>Success!</strong> "
						+ "Le fichier "
						+ paramValue + " a �t� correctement supprim�</font><br/>");
		rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");

		OutputStream out = null;
		final PrintWriter writer = response.getWriter();

		String destinationFolder = null;
		try {
			List<FileItem> items = new ServletFileUpload(
					new DiskFileItemFactory()).parseRequest(request);
			LOGGER.info("Multipart\t" + items.size());

			for (FileItem item : items) {
				if (item.isFormField()) {
					// Process regular form field (input
					// type="text|radio|checkbox|etc", select, etc).
					String fieldName = item.getFieldName();
					String fieldValue = item.getString();
					System.out.println("Field Name: " + fieldName
							+ "   Field value:  " + fieldValue);

					destinationFolder = fieldValue;
				} else {
					// Process form file field (input type="file").
					String fieldName = item.getFieldName();
					String fileName = FilenameUtils.getName(item.getName());
					InputStream fileContent = item.getInputStream();
					System.out.println("Field Name: " + fieldName
							+ "   Field value:  " + fileContent);
					File file = new File(UPLOAD_DIRECTORY + File.separator
							+ fileName);
					item.write(file);
					fileList.add(file.getAbsolutePath());
				}
				if (fileList.size() > 0) {
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/index.jsp");
					request.setAttribute(
							"errorMessage",
							"<font color=green><strong>Success!</strong> "
									+ fileList.size()
									+ " fichiers charg�s avec succ�s � l'emplacement "
									+ destinationFolder + "</font><br/>");
					rd.include(request, response);
				}
			}
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
		} catch (FileNotFoundException fne) {
			// TODO Auto-generated catch block
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/index.jsp");
			request.setAttribute(
					"errorMessage",
					"<font color=red><strong>Error!</strong> You either did not specify a file to upload or are "
							+ "trying to upload a file to a protected or nonexistent "
							+ "location.</font><br/>" + fne.getMessage());
			rd.include(request, response);

			// writer.println("You either did not specify a file to upload or are "
			// + "trying to upload a file to a protected or nonexistent "
			// + "location.");
			// writer.println("<br/> ERROR: " + fne.getMessage());
			LOGGER.severe(fne.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			LOGGER.severe(e.getMessage());
		} finally {
			if (out != null) {
				out.close();
			}
			if (writer != null) {
				writer.close();
			}
		}
	}

}
