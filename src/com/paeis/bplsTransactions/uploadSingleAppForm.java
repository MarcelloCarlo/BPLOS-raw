package com.paeis.bplsTransactions;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
@WebServlet("/uploadSingleAppForm")
public class uploadSingleAppForm extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "uploads";
    private static final long serialVersionUID = 1L;
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    public uploadSingleAppForm() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Form Inputs First. F.Y.I., I will declare at least 82+ variables in here,
        // Goodluck for me KJDKJKJKS!
        String chkRenewal = String.valueOf(request.getParameter("chkRenewal"));
        String txtNSingBussName = request.getParameter("txtNSingBussName");
        String txtNSingTaxPayLName = request.getParameter("txtNSingTaxPayLName");
        String txtNSingTaxPayFName = request.getParameter("txtNSingTaxPayFName");
        String txtNSingTaxPayMName = request.getParameter("txtNSingTaxPayMName");
        String txtNSingBussOwnHsNum = request.getParameter("txtNSingBussOwnHsNum");
        String txtNSingBussOwnStrt = request.getParameter("txtNSingBussOwnStrt");
        String txtNSingBussOwnBrgy = request.getParameter("txtNSingBussOwnBrgy");
        String txtNSingBussOwnCity = request.getParameter("txtNSingBussOwnCity");
        String txtNSingBussFlrNo = request.getParameter("txtNSingBussFlrNo");
        String txtNSingBussStrtNo = request.getParameter("txtNSingBussStrtNo");
        String txtNSingBussStrtName = request.getParameter("txtNSingBussStrtName");
        String txtNSingBussBrgyName = request.getParameter("txtNSingBussBrgyName");
        String txtNSingPropIdxNo = request.getParameter("txtNSingPropIdxNo");
        String txtNSingLotBlckNo = request.getParameter("txtNSingLotBlckNo");
        String txtNSingTaxPayTINNo = request.getParameter("txtNSingTaxPayTINNo");
        String txtNSingBussDTIRegNo = request.getParameter("txtNSingBussDTIRegNo");
        String dateNSingBussDTIReg = request.getParameter("dateNSingBussDTIReg");
        String txtNSingBussTelNo = request.getParameter("txtNSingBussTelNo");
        String txtNSingBussFaxNo = request.getParameter("txtNSingBussFaxNo");
        String txtNSingEmpSSSNo = request.getParameter("txtNSingEmpSSSNo");
        String numNSingBussEmpQTY = request.getParameter("numNSingBussEmpQTY");
        String txtNSingBussRepLName = request.getParameter("txtNSingBussRepLName");
        String txtNSingBussRepFName = request.getParameter("txtNSingBussRepFName");
        String txtNSingBussRepMName = request.getParameter("txtNSingBussRepMName");
        String txtNSingBussRepAddr = request.getParameter("txtNSingBussRepAddr");
        String dateNSingBussEstRentStart = request.getParameter("dateNSingBussEstRentStart");
        String numNSingBussEstRentMonth = request.getParameter("numNSingBussEstRentMonth");
        String txtNSingBussEstRentName = request.getParameter("txtNSingBussEstRentName");
        String numNSingBussEstSignbrdArea = request.getParameter("numNSingBussEstSignbrdArea");

        String txtNSBussAct = request.getParameter("txtNSBussAct");
        String numNSingBussUnitNo = request.getParameter("numNSingBussUnitNo");
        String numNSingBussAreaSqmts = request.getParameter("numNSingBussAreaSqmts");
        String numNSingBussCapitalization = request.getParameter("numNSingBussCapitalization");
        // May not need at all
        String txtNSBussAct1 = request.getParameter("txtNSBussAct1");
        String numNSingBussUnitNo1 = request.getParameter("numNSingBussUnitNo1");
        String numNSingBussAreaSqmts1 = request.getParameter("numNSingBussAreaSqmts1");
        String numNSingBussCapitalization1 = request.getParameter("numNSingBussCapitalization1");

        String txtNSBussAct2 = request.getParameter("txtNSBussAct2");
        String numNSingBussUnitNo2 = request.getParameter("numNSingBussUnitNo2");
        String numNSingBussAreaSqmts2 = request.getParameter("numNSingBussAreaSqmts2");
        String numNSingBussCapitalization2 = request.getParameter("numNSingBussCapitalization2");

        String txtNSBussAct3 = request.getParameter("txtNSBussAct3");
        String numNSingBussUnitNo3 = request.getParameter("numNSingBussUnitNo3");
        String numNSingBussAreaSqmts3 = request.getParameter("numNSingBussAreaSqmts3");
        String numNSingBussCapitalization3 = request.getParameter("numNSingBussCapitalization3");

        String txtNSBussAct4 = request.getParameter("txtNSBussAct4");
        String numNSingBussUnitNo4 = request.getParameter("numNSingBussUnitNo4");
        String numNSingBussAreaSqmts4 = request.getParameter("numNSingBussAreaSqmts4");
        String numNSingBussCapitalization4 = request.getParameter("numNSingBussCapitalization4");

        String txtNSBussAct5 = request.getParameter("txtNSBussAct5");
        String numNSingBussUnitNo5 = request.getParameter("numNSingBussUnitNo5");
        String numNSingBussAreaSqmts5 = request.getParameter("numNSingBussAreaSqmts5");
        String numNSingBussCapitalization5 = request.getParameter("numNSingBussCapitalization5");

        String txtNSBussAct6 = request.getParameter("txtNSBussAct6");
        String numNSingBussUnitNo6 = request.getParameter("numNSingBussUnitNo6");
        String numNSingBussAreaSqmts6 = request.getParameter("numNSingBussAreaSqmts6");
        String numNSingBussCapitalization6 = request.getParameter("numNSingBussCapitalization6");

        String txtNSBussAct7 = request.getParameter("txtNSBussAct7");
        String numNSingBussUnitNo7 = request.getParameter("numNSingBussUnitNo7");
        String numNSingBussAreaSqmts7 = request.getParameter("numNSingBussAreaSqmts7");
        String numNSingBussCapitalization7 = request.getParameter("numNSingBussCapitalization7");

        Part fileNSingLocSketchEst = request.getPart("fileNSingLocSketchEst");
        Part fileNSingBrgyClear = request.getPart("fileNSingBrgyClear");
        Part fileNSingDTIreg = request.getPart("fileNSingDTIreg");
        Part fileNSingTitleProp = request.getPart("fileNSingTitleProp");
        Part fileNSingLessorBussPermit = request.getPart("fileNSingLessorBussPermit");
        Part fileNSingAuthLetterID = request.getPart("fileNSingAuthLetterID");
        // Hmmm
        // Part fileNsingOthers = request.getPart("fileNsingOthers");
        List<Part> fileNSingOthers = request.getParts().stream()
                .filter(part -> "fileNSingOthers".equals(part.getName())).collect(Collectors.toList());
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

        if (!chkRenewal.equalsIgnoreCase("1")) {
            applType = "INSERT INTO `bpls_t_bp_application`(`AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`,`AP_DIV_CODE_TO`) VALUES ((SELECT CONCAT((SELECT MAX(BU_ID)FROM bpls_t_business),(SELECT MAX(AR_ID) FROM bpls_t_authorize_rep),(SELECT MAX(TP_ID) FROM bpls_t_taxpayer),'-',(SELECT DATE_FORMAT(CURRENT_TIMESTAMP,'%y%m%d')))),CURRENT_TIMESTAMP(),'New',(SELECT MAX(BU_ID)FROM bpls_t_business),'DIV-INS')";
        } else if (chkRenewal.equalsIgnoreCase("1")) {
            applType = "INSERT INTO `bpls_t_bp_application`(`AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`,`AP_DIV_CODE_TO`) VALUES ((SELECT CONCAT((SELECT MAX(BU_ID)FROM bpls_t_business),(SELECT MAX(AR_ID) FROM bpls_t_authorize_rep),(SELECT MAX(TP_ID) FROM bpls_t_taxpayer),'-',(SELECT DATE_FORMAT(CURRENT_TIMESTAMP,'%y%m%d')))),CURRENT_TIMESTAMP(),'Renew',(SELECT MAX(BU_ID)FROM bpls_t_business),'DIV-INS')";
        } else {
            applType = "INSERT INTO `bpls_t_bp_application`(`AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`,`AP_DIV_CODE_TO`) VALUES ((SELECT CONCAT((SELECT MAX(BU_ID)FROM bpls_t_business),(SELECT MAX(AR_ID) FROM bpls_t_authorize_rep),(SELECT MAX(TP_ID) FROM bpls_t_taxpayer),'-',(SELECT DATE_FORMAT(CURRENT_TIMESTAMP,'%y%m%d')))),CURRENT_TIMESTAMP(),'New',(SELECT MAX(BU_ID)FROM bpls_t_business),'DIV-INS')";
        }

        Connection connection = null;
        response.setContentType("text/html;charset=UTF-8");
        LGUConnect conX = new LGUConnect();
        String bu_loc = txtNSingBussFlrNo + " " + txtNSingBussStrtNo + " " + txtNSingBussStrtName + " "
                + txtNSingBussBrgyName;
        String tp_addr = txtNSingBussOwnHsNum + " " + txtNSingBussOwnStrt + " " + txtNSingBussOwnBrgy + " "
                + txtNSingBussOwnCity;

        String divCode = "";
        String divName = "";
        String refNo = "", refId = "";
        try {
            connection = conX.getConnection();
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Date dtiDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussDTIReg);
            Date bussEstStartDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussEstRentStart);
            java.sql.Date _dateNSingBussDTIReg = new java.sql.Date(dtiDate.getTime());
            java.sql.Date _dateNSingBussEstRentStart = new java.sql.Date(bussEstStartDate.getTime());

            PreparedStatement authRepinfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `bpls_t_authorize_rep`( `AR_FNAME`, `AR_MNAME`, `AR_LNAME`, `AR_HOME_ADDRESS`) VALUES (?,?,?,?)");
            authRepinfo.setString(1, txtNSingBussRepFName);
            authRepinfo.setString(2, txtNSingBussRepMName);
            authRepinfo.setString(3, txtNSingBussRepLName);
            authRepinfo.setString(4, txtNSingBussRepAddr);
            authRepinfo.executeUpdate();

            PreparedStatement rentInfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `bpls_t_is_rented`(`RENT_DATE_STARTED`, `RENT_MONTHLY_RENTAL`, `RENT_LESSOR`) VALUES(?,?,?)");
            rentInfo.setDate(1, _dateNSingBussEstRentStart);
            rentInfo.setFloat(2, Float.parseFloat(numNSingBussEstRentMonth));
            rentInfo.setString(3, txtNSingBussEstRentName);
            rentInfo.executeUpdate();

            PreparedStatement taxPayerInfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `bpls_t_taxpayer`(`TP_FNAME`, `TP_MNAME`, `TP_LNAME`, `TP_HOME_ADDRESS`, `TP_TIN`,`TP_SSS_NO`) VALUES(?,?,?,?,?,?)");
            taxPayerInfo.setString(1, txtNSingTaxPayFName);
            taxPayerInfo.setString(2, txtNSingTaxPayMName);
            taxPayerInfo.setString(3, txtNSingTaxPayLName);
            taxPayerInfo.setString(4, tp_addr);
            taxPayerInfo.setString(5, txtNSingTaxPayTINNo);
            taxPayerInfo.setString(6, txtNSingEmpSSSNo);
            taxPayerInfo.executeUpdate();

            PreparedStatement businessInfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `bpls_t_business`( `BU_NAME`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_FAX_NO`, `BU_CONTACT`, `SB_AREA`, `DTI_REG_NO`, `DTI_DATE`,`BU_EMP_NO`, `BU_UNIT_NO`, `BU_AREA`, `BU_CAPITALIZATION`, `BN_ID`, `TP_ID`,`RENT_ID`, `OT_CODE`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,(SELECT MAX(`TP_ID`) FROM `bpls_t_taxpayer`),(SELECT MAX(`RENT_ID`) FROM `bpls_t_is_rented`),'OT-SIN')");
            businessInfo.setString(1, txtNSingBussName);
            businessInfo.setString(2, bu_loc);
            businessInfo.setString(3, txtNSingPropIdxNo);
            businessInfo.setString(4, txtNSingLotBlckNo);
            businessInfo.setString(5, txtNSingBussFaxNo);
            businessInfo.setString(6, txtNSingBussTelNo);
            businessInfo.setFloat(7, Float.parseFloat(numNSingBussEstSignbrdArea));
            businessInfo.setString(8, txtNSingBussDTIRegNo);
            businessInfo.setDate(9, _dateNSingBussDTIReg);
            businessInfo.setInt(10, Integer.parseInt(numNSingBussEmpQTY));
            businessInfo.setFloat(11, Float.parseFloat(numNSingBussUnitNo));
            businessInfo.setFloat(12, Float.parseFloat(numNSingBussAreaSqmts));
            businessInfo.setFloat(13, Float.parseFloat(numNSingBussCapitalization));
            businessInfo.setInt(14, Integer.parseInt(txtNSBussAct));
            businessInfo.executeUpdate();

            PreparedStatement authRep2Bus = (PreparedStatement) connection
                    .prepareStatement("INSERT INTO `bpls_r_bu_ar`(`AR_ID`, `BU_ID`) VALUES((SELECT MAX(`AR_ID`) FROM `bpls_t_authorize_rep`), (SELECT MAX(`BU_ID`) FROM `bpls_t_business`)) ");
            authRep2Bus.executeLargeUpdate();

            PreparedStatement refNoInfo = (PreparedStatement) connection.prepareStatement(applType);
            refNoInfo.executeUpdate();

            PreparedStatement fileUpload = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `bpls_t_attachments`(`AT_UNIFIED_FILE`,`AT_UNIFIED_FILE_NAME`,`AP_ID`) VALUES(?,?,(SELECT MAX(`AP_ID`) FROM `bpls_t_bp_application`))");
            fileUpload.setBlob(1, is);
            fileUpload.setString(2, fileName);
            fileUpload.executeUpdate();
//Record
            PreparedStatement getAPno = (PreparedStatement) connection.prepareStatement("SELECT MAX(AP_ID) AS REF_ID FROM bpls_t_bp_application");
            ResultSet rsAPNO = getAPno.executeQuery();
            while (rsAPNO.next()) {
                refId = rsAPNO.getString("REF_ID");
            }

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_ID = ?");
            getAPinfo.setInt(1, Integer.parseInt(refId));
            ResultSet rsAP = getAPinfo.executeQuery();
            while (rsAP.next()) {
                divCode = rsAP.getString("AP_DIV_CODE_TO");
                refNo = rsAP.getString("AP_REFERENCE_NO");
            }


            PreparedStatement getDivName = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_division WHERE DIV_CODE = ?");
            getDivName.setString(1, divCode);
            ResultSet rsDivName = getDivName.executeQuery();
            while (rsDivName.next()) {
                divName = rsDivName.getString("DIV_NAME");
            }

            PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME) VALUES (?,?,?)");
            recHist.setString(1, refNo);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.executeUpdate();

            response.getWriter().print(refNo);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeQuietly(conX);
        }
        // process only if its multipart content

        /*
         * if (ServletFileUpload.isMultipartContent(request)) { try { List<FileItem>
         * multiparts = new ServletFileUpload(new
         * DiskFileItemFactory()).parseRequest(request);
         *
         * for (FileItem item : multiparts) { if (!item.isFormField()) { String name =
         * new File(item.getName()).getName(); String currPath =
         * getServletContext().getRealPath("/uploads"); item.write(new File(currPath +
         * File.separator + name));
         *
         * } }
         *
         * // File uploaded successfully
         * request.setAttribute("message","File Uploaded Successfully"); } catch
         * (Exception ex) { request.setAttribute("message", "File Upload Failed due to "
         * + ex); }
         *
         * } else { request.setAttribute("message",
         * "Sorry this Servlet only handles file upload request"); }
         *
         * request.getRequestDispatcher("/res.jsp").forward(request, response);
         */

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