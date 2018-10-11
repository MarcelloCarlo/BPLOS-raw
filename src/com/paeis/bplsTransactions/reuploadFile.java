package com.paeis.bplsTransactions;

import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PipedReader;
import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/reuploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
public class reuploadFile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public reuploadFile() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int AP_ID = Integer.parseInt(request.getParameter("apID"));
        InputStream is = null;
        String fileName = null;
        // Part list (multi files).
        for (Part part : request.getParts()) {
            fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                // File data

                is = part.getInputStream();
                // Write to file
                // this.writeToDB(conn, fileName, is, description);
            }
        }
        LGUConnect lguConnect = new LGUConnect();
        try {
            Connection connection = lguConnect.getConnection();
            PreparedStatement reUpFile = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_attachments SET AT_UNIFIED_FILE_NAME = ?, AT_UNIFIED_FILE = ? WHERE AP_ID = ?");
            reUpFile.setString(1,fileName);
            reUpFile.setBlob(2,is);
            reUpFile.setInt(3,AP_ID);
            reUpFile.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
}
