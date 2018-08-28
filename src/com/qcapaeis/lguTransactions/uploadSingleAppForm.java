package com.qcapaeis.lguTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.qcapaeis.dbConnection.LGUConnect;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.sql.*;
import java.text.*;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

@MultipartConfig(maxFileSize = 20971520) // File up to 20MB
@WebServlet("/uploadSingleAppForm")
public class uploadSingleAppForm extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "uploads";
    private static final long serialVersionUID = 1L;
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    public uploadSingleAppForm(){
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // Form Inputs First. F.Y.I., I will declare at least 82+ variables in here,
        // Goodluck for me KJDKJKJKS!
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

        String txtNSingExBuss = request.getParameter("txtNSingExBuss");
        String txtNSingExBussNo = request.getParameter("txtNSingExBussNo");
        String txtNSingExBussLoc = request.getParameter("txtNSingExBussLoc");

        String txtNSingExBuss1 = request.getParameter("txtNSingExBuss1");
        String txtNSingExBussNo1 = request.getParameter("txtNSingExBussNo1");
        String txtNSingExBussLoc1 = request.getParameter("txtNSingExBussLoc1");

        String txtNSingExBuss2 = request.getParameter("txtNSingExBuss2");
        String txtNSingExBussNo2 = request.getParameter("txtNSingExBussNo2");
        String txtNSingExBussLoc2 = request.getParameter("txtNSingExBussLoc2");

        String txtNSingExBuss3 = request.getParameter("txtNSingExBuss3");
        String txtNSingExBussNo3 = request.getParameter("txtNSingExBussNo3");
        String txtNSingExBussLoc3 = request.getParameter("txtNSingExBussLoc3");

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
        DateFormat defaultDateF = new SimpleDateFormat("dd-MM-yyyy");
        Connection connection = null;
        PreparedStatement pStmt = null;
        com.mysql.jdbc.CallableStatement callProc = null;
        response.setContentType("text/plain");
        PrintWriter echo = response.getWriter();
        LGUConnect conX = new LGUConnect();

        try {

            // Class.forName("com.mysql.jdbc.Driver").newInstance();
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            int updateQuery = 0;
            Date dtiDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussDTIReg);
            Date bussEstStartDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussEstRentStart);
            java.sql.Date _dateNSingBussDTIReg = new java.sql.Date(dtiDate.getTime());
            java.sql.Date _dateNSingBussEstRentStart = new java.sql.Date(bussEstStartDate.getTime());
            /*
             * java.sql.Date _dateNSingBussDTIReg = (Date)
             * defaultDateF.parse(dateNSingBussDTIReg); java.sql.Date
             * _dateNSingBussEstRentStart = (Date)
             * defaultDateF.parse(dateNSingBussEstRentStart);
             */
            connection = conX.getConnection();

            PreparedStatement authRepinfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `lgu_r_authorize_rep`( `AR_FNAME`, `AR_MNAME`, `AR_LNAME`, `AR_HOME_ADDRESS`) VALUES ('"
                            + txtNSingBussRepLName + "','" + txtNSingBussRepMName + "','" + txtNSingBussRepLName + "','"
                            + txtNSingBussRepAddr + "')");
            authRepinfo.executeUpdate();
            PreparedStatement rentInfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `lgu_r_is_rented`(`RENT_DATE_STARTED`, `RENT_MONTHLY_RENTAL`, `RENT_LESSOR`) VALUES('"
                            + _dateNSingBussEstRentStart + "','" + Double.parseDouble(numNSingBussEstRentMonth) + "','"
                            + txtNSingBussEstRentName + "')");
            rentInfo.executeUpdate();
            PreparedStatement taxPayerInfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `lgu_r_taxpayer`(`TP_FNAME`, `TP_MNAME`, `TP_LNAME`, `TP_HOME_ADDRESS`, `TP_TIN`,`TP_SSS_NO`) VALUES('"
                            + txtNSingTaxPayFName + "','" + txtNSingTaxPayMName + "','" + txtNSingTaxPayLName + "','"
                            + txtNSingTaxPayTINNo + "','" + txtNSingEmpSSSNo + "')");
            taxPayerInfo.executeUpdate();
            PreparedStatement businessInfo = (PreparedStatement) connection
                    .prepareStatement("DECLARE bu_loc VARCHAR (300); SET bu_loc=(SELECT CONCAT('" + txtNSingBussFlrNo
                            + "',' ','" + txtNSingBussStrtNo + "',' ','" + txtNSingBussStrtName + "'))"
                            + "INSERT INTO `lgu_r_business`( `BU_NAME`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_FAX_NO`, `BU_CONTACT`, `SB_AREA`, `DTI_REG_NO`, `DTI_DATE`,`BU_EMP_NO`, `BU_UNIT_NO`, `BU_AREA`, `BU_CAPITALIZATION`, `BN_ID`, `TP_ID`, `OT_ID`) VALUES('"
                            + txtNSingBussName + "','bu_loc','" + txtNSingPropIdxNo + "','" + txtNSingLotBlckNo + "','"
                            + txtNSingBussFaxNo + "','" + txtNSingBussTelNo + "','"
                            + Double.parseDouble(numNSingBussEstSignbrdArea) + "','"
                            + Integer.parseInt(txtNSingBussDTIRegNo) + "','" + _dateNSingBussDTIReg + "','"
                            + Integer.parseInt(numNSingBussEmpQTY) + "','" + Integer.parseInt(numNSingBussUnitNo)
                            + "','" + Double.parseDouble(numNSingBussEstSignbrdArea) + "','"
                            + Double.parseDouble(numNSingBussCapitalization)
                            + "','"+Integer.parseInt(txtNSBussAct)+"',(SELECT MAX (TP_ID) FROM `lgu_r_taxpayer`),1)");
            businessInfo.executeUpdate();
            PreparedStatement authRep2Bus = (PreparedStatement) connection
                    .prepareStatement("INSERT INTO `lgu_r_bu_ar`(`AR_ID`, `BU_ID`)\n"
                            + "VALUES((SELECT MAX(`AR_ID`) FROM `lgu_r_authorize_rep`), (SELECT MAX(`BU_ID`) FROM `lgu_r_business`)) ");
            authRep2Bus.executeLargeUpdate();
            PreparedStatement refNoInfo = (PreparedStatement) connection.prepareStatement("INSERT INTO `lgu_r_bp_application`(`AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`) VALUES ((SELECT CONCAT((SELECT MAX(BU_ID)FROM lgu_r_business),(SELECT MAX(AR_ID) FROM lgu_r_authorize_rep),(SELECT MAX(TP_ID) FROM lgu_r_taxpayer),'-',(SELECT DATE_FORMAT(CURRENT_TIMESTAMP,'%y%m%d')))),CURRENT_TIMESTAMP(),'N',(SELECT MAX(BU_ID)FROM lgu_r_business)) ");
            refNoInfo.executeUpdate();
            Statement ss3 = connection.createStatement();
            ResultSet gg3 = ss3.executeQuery("SELECT MAX(AP_REFERENCE_NO) FROM lgu_r_bp_application");
            while (gg3 != null)
            {
                String _refNo = gg3.getString("AP_REFERENCE_NO");
                echo.write(_refNo);
            }
            /*
             * callProc = (com.mysql.jdbc.CallableStatement) connection.
             * prepareCall("{ call lgu_application_sp(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
             * ); // callProc.registerOutParameter(1,java.sql.Types.VARCHAR);
             * callProc.setString(1, txtNSingBussName); callProc.setString(2,
             * txtNSingTaxPayLName); callProc.setString(3, txtNSingTaxPayFName);
             * callProc.setString(4, txtNSingTaxPayMName); callProc.setString(5,
             * txtNSingBussOwnHsNum); callProc.setString(6, txtNSingBussOwnStrt);
             * callProc.setString(7, txtNSingBussOwnBrgy); callProc.setString(8,
             * txtNSingBussOwnCity); callProc.setString(9, txtNSingBussFlrNo);
             * callProc.setString(10, txtNSingBussStrtNo); callProc.setString(11,
             * txtNSingBussStrtName); callProc.setString(12, txtNSingBussBrgyName);
             * callProc.setString(13, txtNSingPropIdxNo); callProc.setString(14,
             * txtNSingLotBlckNo); callProc.setString(15, txtNSingTaxPayTINNo);
             * callProc.setInt(16, Integer.parseInt(txtNSingBussDTIRegNo));
             * callProc.setDate(17, _dateNSingBussDTIReg); callProc.setString(18,
             * txtNSingBussTelNo); callProc.setString(19, txtNSingBussFaxNo);
             * callProc.setString(20, txtNSingEmpSSSNo); callProc.setInt(21,
             * Integer.parseInt(numNSingBussEmpQTY)); callProc.setString(22,
             * txtNSingBussRepLName); callProc.setString(23, txtNSingBussRepFName);
             * callProc.setString(24, txtNSingBussRepMName); callProc.setString(25,
             * txtNSingBussRepAddr); callProc.setDate(26, _dateNSingBussEstRentStart);
             * callProc.setDouble(27, Double.parseDouble(numNSingBussEstRentMonth));
             * callProc.setString(28, txtNSingBussEstRentName); callProc.setDouble(29,
             * Double.parseDouble(numNSingBussEstSignbrdArea)); // Business nature ID
             * callProc.setInt(30, Integer.parseInt("1")); callProc.setInt(31,
             * Integer.parseInt(numNSingBussUnitNo)); callProc.setDouble(32,
             * Double.parseDouble(numNSingBussAreaSqmts)); callProc.setDouble(33,
             * Double.parseDouble(numNSingBussCapitalization)); callProc.execute();
             */
            // String txtApplicationRefNo = callProc.getString(1);
            // echo.write(txtApplicationRefNo);*/

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }  catch (Exception e) {
            e.printStackTrace();
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
         * // File uploaded successfully request.setAttribute("message",
         * "File Uploaded Successfully"); } catch (Exception ex) {
         * request.setAttribute("message", "File Upload Failed due to " + ex); }
         *
         * } else { request.setAttribute("message",
         * "Sorry this Servlet only handles file upload request"); }
         *
         * request.getRequestDispatcher("/res.jsp").forward(request, response);
         */

    }

}