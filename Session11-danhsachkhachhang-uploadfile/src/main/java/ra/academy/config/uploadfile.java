package ra.academy.config;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet(name = "uploadfile", value = "/uploadfile")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 10 * 1024 *1024,
        fileSizeThreshold = 1024 * 1024
)

public class uploadfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("UPLOAD")) {
            String uploadPath = getServletContext().getRealPath("/uploads");
            File file = new File(uploadPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            List<String> filenames = new ArrayList<>();
            Collection<Part> listFile = request.getParts();
            for (Part p : listFile) {
                if (p.getName().equals("image")) {
                    String nameFile = p.getSubmittedFileName();
                    p.write(uploadPath + File.separator + nameFile);
                    filenames.add(nameFile);
                } else if (p.getName().equals("avatar")) {
                    String nameFile = p.getSubmittedFileName();
                    p.write(uploadPath + File.separator + nameFile);
                    filenames.add(nameFile);
                }
            }
            request.setAttribute("action","uploadfile");
            request.setAttribute("filenames", filenames);
            request.getRequestDispatcher("WEB-INF/views/imageupload.jsp").forward(request,response);

        }
    }
}
