package com.paeis.mtopsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
@WebServlet("/uploadMtopsApplForm")
public class uploadMtopsApplForm extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "uploads";
    private static final long serialVersionUID = 1L;
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    public uploadMtopsApplForm() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String txtApplicantLName = request.getParameter("txtApplicantLName");
        String txtApplicantFName = request.getParameter("txtApplicantFName");
        String txtApplicantMName = request.getParameter("txtApplicantMName");
        String BDateApplicant = request.getParameter("BDateApplicant");
        String genderApplicant = request.getParameter("genderApplicant");
        String txtApplicantOwnHsNum = request.getParameter("txtApplicantOwnHsNum");
        String txtApplicantOwnStrt = request.getParameter("txtApplicantOwnStrt");
        String txtApplicantOwnBrgy = request.getParameter("txtApplicantOwnBrgy");
        String txtApplicantOwnCity = request.getParameter("txtApplicantOwnCity");
        String txtApplicantTelNo = request.getParameter("txtApplicantTelNo");
        String txtApplicantMailAdd = request.getParameter("txtApplicantMailAdd");
        String txtApplicantEmail = request.getParameter("txtApplicantEmail");
        String txtApplicantPlateNo = request.getParameter("txtApplicantPlateNo");
        String txtApplicantTODA = request.getParameter("txtApplicantTODA");
        String txtApplicantTINNo = request.getParameter("txtApplicantTINNo");
        String txtApplicantDriverLic = request.getParameter("txtApplicantDriverLic");
        String txtApplicantRepLName = request.getParameter("txtApplicantRepLName");
        String txtApplicantRepFName = request.getParameter("txtApplicantRepFName");
        String txtApplicantRepMName = request.getParameter("txtApplicantRepMName");
        String txtApplicantRepAddr = request.getParameter("txtApplicantRepAddr");
        String ApplicantRepBDate = request.getParameter("ApplicantRepBDate");
        String ApplicantRepgender = request.getParameter("ApplicantRepgender");
        String ApplicantRepEmail = request.getParameter("ApplicantRepEmail");
        String ApplicantRepPhoneNo = request.getParameter("ApplicantRepPhoneNo");

        List<Part> ApplicantfileUnifiedRequirements = request.getParts().stream()
                .filter(part -> "ApplicantfileUnifiedRequirements".equals(part.getName())).collect(Collectors.toList());
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

        String applType = "";

        response.setContentType("text/html;charset=UTF-8");
        LGUConnect conX = new LGUConnect();

        String divCode = "";
        String divName = "";
        String refNo = "";
        try {
            Connection connection = conX.getConnection();
            Date bDateApplicante = new SimpleDateFormat("dd-MM-yyyy").parse(BDateApplicant);
            Date applicantRepBDate = new SimpleDateFormat("dd-MM-yyyy").parse(ApplicantRepBDate);

            PreparedStatement insrtRepr = (PreparedStatement) connection.prepareStatement("INSERT INTO mtops_t_representative(REPRE_FNAME, REPRE_MNAME, REPRE__LNAME, REPRE_ADDRESS, REPRE_BDAY, REPRE_SEX, REPRE_EMAIL, REPRE_CONTACT_NO) VALUES (?,?,?,?,?,?,?,?)");
            insrtRepr.setString(1, txtApplicantRepFName);
            insrtRepr.setString(2, txtApplicantRepMName);
            insrtRepr.setString(3, txtApplicantRepLName);
            insrtRepr.setString(4, txtApplicantRepAddr);
            insrtRepr.setDate(5, (java.sql.Date) applicantRepBDate);
            insrtRepr.setString(6, ApplicantRepgender);
            insrtRepr.setString(7, ApplicantRepEmail);
            insrtRepr.setString(8, ApplicantRepPhoneNo);
            insrtRepr.executeUpdate();

            PreparedStatement insrtAppl = (PreparedStatement) connection.prepareStatement("INSERT INTO mtops_t_application_frm(APF_FNAME, APF_MNAME, APF_LNAME, APF_BDATE, APF_SEX, APF_HOUSE_NO, APF_STREET, APF_BRGY, APF_CITY, APF_CONTACT_NO, APF_MAILING_ADR, APF_EMAIL, APF_PLATE_NO, APF_TIN_NO, APF_DRIVERS_LICENSE_NO, TODA_NAME, APF_FILE, APF_FILENAME, APF_DATEACCESSED,REPRE_ID) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,(SELECT MAX(mtops_t_representative.REPRE_ID) FROM mtops_t_representative))");
            insrtAppl.setString(1, txtApplicantFName);
            insrtAppl.setString(2, txtApplicantMName);
            insrtAppl.setString(2, txtApplicantLName);
            insrtAppl.setDate(2, (java.sql.Date) bDateApplicante);
            insrtAppl.setString(3, genderApplicant);
            insrtAppl.setString(4, txtApplicantOwnHsNum);
            insrtAppl.setString(5, txtApplicantOwnStrt);
            insrtAppl.setString(6, txtApplicantOwnBrgy);
            insrtAppl.setString(6, txtApplicantOwnCity);
            insrtAppl.setString(7, txtApplicantTelNo);
            insrtAppl.setString(8, txtApplicantMailAdd);
            insrtAppl.setString(9, txtApplicantEmail);
            insrtAppl.setString(10, txtApplicantPlateNo);
            insrtAppl.setString(11, txtApplicantTINNo);
            insrtAppl.setString(12, txtApplicantDriverLic);
            insrtAppl.setString(13, txtApplicantTODA);
            insrtAppl.setBlob(14, is);
            insrtAppl.setString(13, fileName);
            insrtAppl.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeQuietly(conX);
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

    private void closeQuietly(LGUConnect conX) {
        try {
            if (conX != null) {
                ((Closeable) conX).close();
            }
        } catch (Exception e) {
        }
    }

}
