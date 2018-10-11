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
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.mysql.jdbc.PreparedStatement;

@MultipartConfig
@WebServlet("/uploadCorpAppForm")
public class uploadCorpAppForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public uploadCorpAppForm() {
        super();// TODO Auto-generated constructor stub
    }

    @Override
    protected void doPost(HttpServletRequest reqX, HttpServletResponse respX) throws ServletException, IOException {


        String txtNCorpBussName = reqX.getParameter("txtNCorpBussName");
        String txtNCorpTaxPayName = reqX.getParameter("txtNCorpTaxPayName");
        String txtNCorpPresidentName = reqX.getParameter("txtNCorpPresidentName");
        String txtNCorpBussFlrNo = reqX.getParameter("txtNCorpBussFlrNo");
        String txtNCorpBussStrtNo = reqX.getParameter("txtNCorpBussStrtNo");
        String txtNCorpBussStrtName = reqX.getParameter("txtNCorpBussStrtName");
        String txtNCorpBussBrgyName = reqX.getParameter("txtNCorpBussBrgyName");
        String txtNCorpPropIdxNo = reqX.getParameter("txtNCorpPropIdxNo");
        String txtNCorpLotBlckNo = reqX.getParameter("txtNCorpLotBlckNo");
        String txtNCorpAuthRepName = reqX.getParameter("txtNCorpAuthRepName");
        String txtNCorpAuthRepPos = reqX.getParameter("txtNCorpAuthRepPos");
        String txtNCorpAuthRepStrtNo = reqX.getParameter("txtNCorpAuthRepStrtNo");
        String txtNCorpAuthRepStrtName = reqX.getParameter("txtNCorpAuthRepStrtName");
        String txtNCorpAuthRepBrgyName = reqX.getParameter("txtNCorpAuthRepBrgyName");
        String txtNCorpAuthRepCity = reqX.getParameter("txtNCorpAuthRepCity");
        String txtNCorpBussSECRegNo = reqX.getParameter("txtNCorpBussSECRegNo");
        String dateNCorpBussSECReg = reqX.getParameter("dateNCorpBussSECReg");
        String txtNCorpTaxPayTINNo = reqX.getParameter("txtNCorpTaxPayTINNo");
        String txtNCorpTelNo = reqX.getParameter("txtNCorpTelNo");
        String txtNCorpFaxNo = reqX.getParameter("txtNCorpFaxNo");
        String txtNCorpEmpSSSNo = reqX.getParameter("txtNCorpEmpSSSNo");
        String numNCorpEmpQTY = reqX.getParameter("numNCorpEmpQTY");
        String dateNCorpBussEstRentStart = reqX.getParameter("dateNCorpBussEstRentStart");
        String numNCorpBussEstRentMonth = reqX.getParameter("numNCorpBussEstRentMonth");
        String txtNCorpBussEstRentName = reqX.getParameter("txtNCorpBussEstRentName");
        String numNCorpBussEstSignbrdArea = reqX.getParameter("numNCorpBussEstSignbrdArea");

        String txtNCorpExBuss = reqX.getParameter("txtNCorpExBuss");
        String txtNCorpExBussNo = reqX.getParameter("txtNCorpExBussNo");
        String txtNCorpExBussLoc = reqX.getParameter("txtNCorpExBussLoc");

        String txtNCorpExBuss1 = reqX.getParameter("txtNCorpExBuss1");
        String txtNCorpExBussNo1 = reqX.getParameter("txtNCorpExBussNo1");
        String txtNCorpExBussLoc1 = reqX.getParameter("txtNCorpExBussLoc1");

        String txtNCorpExBuss2 = reqX.getParameter("txtNCorpExBuss2");
        String txtNCorpExBussNo2 = reqX.getParameter("txtNCorpExBussNo2");
        String txtNCorpExBussLoc2 = reqX.getParameter("txtNCorpExBussLoc2");

        String txtNCorpExBuss3 = reqX.getParameter("txtNCorpExBuss3");
        String txtNCorpExBussNo3 = reqX.getParameter("txtNCorpExBussNo3");
        String txtNCorpExBussLoc3 = reqX.getParameter("txtNCorpExBussLoc3");

        String txtNCBussAct = reqX.getParameter("txtNCBussAct");
        String numNCorpBussUnitNo = reqX.getParameter("numNCorpBussUnitNo");
        String numNCorpBussAreaSqmts = reqX.getParameter("numNCorpBussAreaSqmts");
        String numNCorpBussCapitalization = reqX.getParameter("numNCorpBussCapitalization");

        String txtNCorpAct1 = reqX.getParameter("txtNCorpAct1");
        String numNCorpBussUnitNo1 = reqX.getParameter("numNCorpBussUnitNo1");
        String numNCorpBussAreaSqmts1 = reqX.getParameter("numNCorpBussAreaSqmts1");
        String numNCorpBussCapitalization1 = reqX.getParameter("numNCorpBussCapitalization1");

        String txtNCorpAct2 = reqX.getParameter("txtNCorpAct2");
        String numNCorpBussUnitNo2 = reqX.getParameter("numNCorpBussUnitNo2");
        String numNCorpBussAreaSqmts2 = reqX.getParameter("numNCorpBussAreaSqmts2");
        String numNCorpBussCapitalization2 = reqX.getParameter("numNCorpBussCapitalization2");

        String txtNCorpAct3 = reqX.getParameter("txtNCorpAct3");
        String numNCorpBussUnitNo3 = reqX.getParameter("numNCorpBussUnitNo3");
        String numNCorpBussAreaSqmts3 = reqX.getParameter("numNCorpBussAreaSqmts3");
        String numNCorpBussCapitalization3 = reqX.getParameter("numNCorpBussCapitalization3");

        String txtNCorpAct4 = reqX.getParameter("txtNCorpAct4");
        String numNCorpBussUnitNo4 = reqX.getParameter("numNCorpBussUnitNo4");
        String numNCorpBussAreaSqmts4 = reqX.getParameter("numNCorpBussAreaSqmts4");
        String numNCorpBussCapitalization4 = reqX.getParameter("numNCorpBussCapitalization4");

        String txtNCorpAct5 = reqX.getParameter("txtNCorpAct5");
        String numNCorpBussUnitNo5 = reqX.getParameter("numNCorpBussUnitNo5");
        String numNCorpBussAreaSqmts5 = reqX.getParameter("numNCorpBussAreaSqmts5");
        String numNCorpBussCapitalization5 = reqX.getParameter("numNCorpBussCapitalization5");

        String txtNCorpAct6 = reqX.getParameter("txtNCorpAct6");
        String numNCorpBussUnitNo6 = reqX.getParameter("numNCorpBussUnitNo6");
        String numNCorpBussAreaSqmts6 = reqX.getParameter("numNCorpBussAreaSqmts6");
        String numNCorpBussCapitalization6 = reqX.getParameter("numNCorpBussCapitalization6");

        String txtNCorpAct7 = reqX.getParameter("txtNCorpAct7");
        String numNCorpBussUnitNo7 = reqX.getParameter("numNCorpBussUnitNo7");
        String numNCorpBussAreaSqmts7 = reqX.getParameter("numNCorpBussAreaSqmts7");
        String numNCorpBussCapitalization7 = reqX.getParameter("numNCorpBussCapitalization7");

        Part fileNCorpLocSketchEst = reqX.getPart("fileNCorpLocSketchEst");
        Part fileNCorpBrgyClear = reqX.getPart("fileNCorpBrgyClear");
        Part fileNCorpSECreg = reqX.getPart("fileNCorpSECreg");
        Part fileNCorpTitleProp = reqX.getPart("fileNCorpTitleProp");
        Part fileNCorpLessorBussPermit = reqX.getPart("fileNCorpLessorBussPermit");
        Part fileNCorpAuthLetterID = reqX.getPart("fileNCorpAuthLetterID");
        // Hmmm
        // Part fileNsingOthers = reqX.getPart("fileNsingOthers");
        List<Part> fileNCorpOthers = reqX.getParts().stream().filter(part -> "fileNCorpOthers".equals(part.getName()))
                .collect(Collectors.toList());

        InputStream is = null;
        String fileName = null;
        // Part list (multi files).
        for (Part part : reqX.getParts()) {
            fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                // File data
                is = part.getInputStream();
                // Write to file
                //this.writeToDB(conn, fileName, is, description);
            }
        }
        Connection connection = null;
        com.mysql.jdbc.CallableStatement callProc = null;
        respX.setContentType("text/html;charset=UTF-8");
        PrintWriter echo = respX.getWriter();
        LGUConnect conX = new LGUConnect();
        String bu_loc = txtNCorpBussFlrNo + " " + txtNCorpBussStrtNo + " " + txtNCorpBussStrtName + " "
                + txtNCorpBussBrgyName;
        String authRep_addr = txtNCorpAuthRepStrtNo + " " + txtNCorpAuthRepStrtName + " " + txtNCorpAuthRepBrgyName + " "
                + txtNCorpAuthRepCity;


        String refNo = "";
        String divCode = "";
        String divName = "";


        // Do the insert here if you can
        try {
            connection = conX.getConnection();
            Date secDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNCorpBussSECReg);
            Date bussEstStartDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNCorpBussEstRentStart);
            java.sql.Date _dateNCorpBussSECReg = new java.sql.Date(secDate.getTime());
            java.sql.Date _dateNCorpBussEstRentStart = new java.sql.Date(bussEstStartDate.getTime());
            // Parse the request
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            PreparedStatement authRepInfo = (PreparedStatement) connection.prepareStatement("INSERT INTO `bpls_t_authorize_rep`( `AR_FNAME`, `AR_POSITION`,`AR_HOME_ADDRESS`) VALUES (?,?,?)");
            authRepInfo.setString(1, txtNCorpAuthRepName);
            authRepInfo.setString(2, txtNCorpAuthRepPos);
            authRepInfo.setString(3, authRep_addr);
            authRepInfo.executeUpdate();
            PreparedStatement rentInfo = (PreparedStatement) connection.prepareStatement("INSERT INTO `bpls_t_is_rented`(`RENT_DATE_STARTED`, `RENT_MONTHLY_RENTAL`, `RENT_LESSOR`) VALUES(?,?,?)");
            rentInfo.setDate(1, _dateNCorpBussEstRentStart);
            rentInfo.setFloat(2, Float.parseFloat(numNCorpBussEstRentMonth));
            rentInfo.setString(3, txtNCorpBussEstRentName);
            rentInfo.executeUpdate();
            PreparedStatement taxPayerInfo = (PreparedStatement) connection.prepareStatement("INSERT INTO `bpls_t_taxpayer`(`TP_FNAME`,  `TP_TIN`,`TP_SSS_NO`) VALUES(?,?,?)");
            taxPayerInfo.setString(1, txtNCorpTaxPayName);
            taxPayerInfo.setString(2, txtNCorpTaxPayTINNo);
            taxPayerInfo.setString(3, txtNCorpEmpSSSNo);
            taxPayerInfo.executeUpdate();
            PreparedStatement businessInfo = (PreparedStatement) connection.prepareStatement("INSERT INTO `bpls_t_business`(`BU_NAME`, `BU_PRESIDENT`, `BU_LOCATION`, `BU_PROPERTY_INDEX_NO`, `BU_LOT_BLOCK_NO`, `BU_FAX_NO`, `BU_CONTACT`, `SB_AREA`, `SEC_REG_NO`, `SEC_DATE`, `BU_EMP_NO`, `BU_UNIT_NO`, `BU_AREA`, `BU_CAPITALIZATION`, `BN_ID`, `TP_ID`, `OT_ID`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,(SELECT MAX(`TP_ID`) FROM `bpls_t_taxpayer`),2)");
            businessInfo.setString(1, txtNCorpBussName);
            businessInfo.setString(2, txtNCorpPresidentName);
            businessInfo.setString(3, bu_loc);
            businessInfo.setString(4, txtNCorpPropIdxNo);
            businessInfo.setString(5, txtNCorpLotBlckNo);
            businessInfo.setString(6, txtNCorpFaxNo);
            businessInfo.setString(7, txtNCorpTelNo);
            businessInfo.setFloat(8, Float.parseFloat(numNCorpBussEstSignbrdArea));
            businessInfo.setString(9, txtNCorpBussSECRegNo);
            businessInfo.setDate(10, _dateNCorpBussSECReg);
            businessInfo.setInt(11, Integer.parseInt(numNCorpEmpQTY));
            businessInfo.setInt(12, Integer.parseInt(numNCorpBussUnitNo));
            businessInfo.setFloat(13, Float.parseFloat(numNCorpBussEstSignbrdArea));
            businessInfo.setFloat(14, Float.parseFloat(numNCorpBussCapitalization));
            businessInfo.setInt(15, Integer.parseInt(txtNCBussAct));
            businessInfo.executeUpdate();
            PreparedStatement authRep2Bus = (PreparedStatement) connection
                    .prepareStatement("INSERT INTO `bpls_r_bu_ar`(`AR_ID`, `BU_ID`)\n"
                            + "VALUES((SELECT MAX(`AR_ID`) FROM `bpls_t_authorize_rep`), (SELECT MAX(`BU_ID`) FROM `bpls_t_business`)) ");
            authRep2Bus.executeLargeUpdate();
            PreparedStatement refNoInfo = (PreparedStatement) connection.prepareStatement(
                    "INSERT INTO `bpls_t_bp_application`(`AP_REFERENCE_NO`, `AP_DATE`, `AP_TYPE`, `BU_ID`) VALUES ((SELECT CONCAT((SELECT MAX(BU_ID)FROM bpls_t_business),(SELECT MAX(AR_ID) FROM bpls_t_authorize_rep),(SELECT MAX(TP_ID) FROM bpls_t_taxpayer),'-',(SELECT DATE_FORMAT(CURRENT_TIMESTAMP,'%y%m%d')))),CURRENT_TIMESTAMP(),'New',(SELECT MAX(BU_ID)FROM bpls_t_business)) ");
            refNoInfo.executeUpdate();
            PreparedStatement fileUpload = (PreparedStatement) connection.prepareStatement("INSERT INTO `bpls_t_attachments`(`AT_UNIFIED_FILE`,`AT_UNIFIED_FILE_NAME`,`AP_ID`) VALUES(?,?,(SELECT MAX(`AP_ID`) FROM `bpls_t_bp_application`))");
            fileUpload.setBlob(1, is);
            fileUpload.setString(2, fileName);
            fileUpload.executeUpdate();

            //Record
            PreparedStatement getAPno = (PreparedStatement) connection.prepareStatement("SELECT MAX(AP_REFERENCE_NO) AS REF_NO FROM bpls_t_bp_application");
            ResultSet rsAPNO = getAPno.executeQuery();
            refNo = rsAPNO.getString("REF_NO");

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1, refNo);
            ResultSet rsAP = getAPinfo.executeQuery();
            divCode = rsAP.getString("AP_DIV_CODE_TO");

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

            respX.getWriter().print(refNo);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private String extractFileName(Part part) {
        // TODO Auto-generated method stub
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
