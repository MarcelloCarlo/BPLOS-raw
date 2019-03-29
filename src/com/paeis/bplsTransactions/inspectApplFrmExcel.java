package com.paeis.bplsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;
import org.apache.poi.xssf.usermodel.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/inspectApplFrmExcel")
@MultipartConfig
public class inspectApplFrmExcel extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;
    private String divCode = "", divName = "";
    private int BU_ID;
    private String AP_REFERENCE_NO = "", ZONING_INS = "", FIRE_INS = "", HS_INS = "", BLDG_INS = "", LABOR_INS = "", MISC_INS = "", MISC_REMARKS = "", busType = "", empID = "";

    public inspectApplFrmExcel(){
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        LGUConnect connect = new LGUConnect();
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(is);
            XSSFSheet worksheet = workbook.getSheet("INSPECTION SHEET");
            XSSFRow row = worksheet.getRow(1);
            XSSFCell cell = row.getCell((short) 1);
            AP_REFERENCE_NO = cell.getStringCellValue();
            XSSFRow row1 = worksheet.getRow(2);
            XSSFCell cell1 = row1.getCell((short) 1);
            empID = cell1.getStringCellValue();
            XSSFRow row2 = worksheet.getRow(4);
            XSSFCell cell2 = row2.getCell((short) 1);
            ZONING_INS = getCheckboxtatus(cell2.getStringCellValue());
            XSSFRow row3 = worksheet.getRow(5);
            XSSFCell cell3 = row3.getCell((short) 1);
            FIRE_INS = getCheckboxtatus(cell3.getStringCellValue());
            XSSFRow row4 = worksheet.getRow(6);
            XSSFCell cell4 = row4.getCell((short) 1);
            HS_INS = getCheckboxtatus(cell4.getStringCellValue());
            XSSFRow row5 = worksheet.getRow(7);
            XSSFCell cell5 = row5.getCell((short) 1);
            BLDG_INS = getCheckboxtatus(cell5.getStringCellValue());
            XSSFRow row6 = worksheet.getRow(8);
            XSSFCell cell6 = row6.getCell((short) 1);
            LABOR_INS = getCheckboxtatus(cell6.getStringCellValue());
            XSSFRow row7 = worksheet.getRow(9);
            XSSFCell cell7 = row7.getCell((short) 1);
            MISC_INS = getCheckboxtatus(cell7.getStringCellValue());
            XSSFRow row8 = worksheet.getRow(11);
            XSSFCell cell8 = row8.getCell((short) 1);
            busType = getCheckboxtatus(cell8.getStringCellValue());
            XSSFRow row9 = worksheet.getRow(12);
            XSSFCell cell9 = row9.getCell((short) 1);
            MISC_REMARKS = getCheckboxtatus(cell9.getStringCellValue());

            if (ZONING_INS.equalsIgnoreCase("Pass") && FIRE_INS.equalsIgnoreCase("Pass") && HS_INS.equalsIgnoreCase("Pass") && BLDG_INS.equalsIgnoreCase("Pass") && LABOR_INS.equalsIgnoreCase("Pass") && MISC_INS.equalsIgnoreCase("Pass") && !AP_REFERENCE_NO.isEmpty() && !busType.isEmpty()) {
                passedInspection(AP_REFERENCE_NO, ZONING_INS, FIRE_INS, HS_INS, BLDG_INS, LABOR_INS, MISC_INS, MISC_REMARKS, busType,empID);
            } else {
                failedInspection(AP_REFERENCE_NO, ZONING_INS, FIRE_INS, HS_INS, BLDG_INS, LABOR_INS, MISC_INS, MISC_REMARKS, busType,empID);
            }

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

    private String getCheckboxtatus(String chkbox) {

        if (chkbox.equalsIgnoreCase("Pass")) {
            return "Pass";
        } else if (chkbox.isEmpty() || chkbox.equalsIgnoreCase("Fail") || chkbox.equalsIgnoreCase("null")) {
            return "Fail";
        }

        return null;
    }


    private void passedInspection(String AP_REFERENCE_NO, String ZONING_INS, String FIRE_INS, String HS_INS, String BLDG_INS, String LABOR_INS, String MISC_INS, String MISC_REMARKS, String busType, String empID) {
        if (!busType.equals("L") && !busType.equals("S")) {
            busType = "S";
        }
        try {
            PreparedStatement getBU_ID = (PreparedStatement) connection.prepareStatement("SELECT BU_ID FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getBU_ID.setString(1, AP_REFERENCE_NO);
            ResultSet rsBU_ID = getBU_ID.executeQuery();
            while (rsBU_ID.next()) {
                BU_ID = rsBU_ID.getInt("BU_ID");
            }

            PreparedStatement setBussClass = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_business SET BU_CLASSIFICATION = ? WHERE BU_ID = ?");
            setBussClass.setString(1, busType);
            setBussClass.setInt(2, BU_ID);
            setBussClass.executeUpdate();

            PreparedStatement passIns = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_inspections (INS_AP_REFERENCE_NO, ZONING_INS, FIRE_INS, HEALTH_SANITATION_INS, BUILDING_INS, LABOR_INS, MISC_INS, INS_REMARKS) VALUES (?,?,?,?,?,?,?,?) ");
            passIns.setString(1, AP_REFERENCE_NO);
            passIns.setString(2, ZONING_INS);
            passIns.setString(3, FIRE_INS);
            passIns.setString(4, HS_INS);
            passIns.setString(5, BLDG_INS);
            passIns.setString(6, LABOR_INS);
            passIns.setString(7, MISC_INS);
            passIns.setString(8, MISC_REMARKS);
            passIns.executeUpdate();

            PreparedStatement evalIns = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-EV', AP_DIV_CODE_FROM = 'DIV-INS', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_REMARKS = ?, U_INS_ID = ? WHERE AP_REFERENCE_NO = ?");
            evalIns.setString(1, MISC_REMARKS);
            evalIns.setInt(2, Integer.parseInt(empID));
            evalIns.setString(3, AP_REFERENCE_NO);
            evalIns.executeUpdate();

            //Record

            PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
            getAPinfo.setString(1, AP_REFERENCE_NO);
            ResultSet rsAP = getAPinfo.executeQuery();
            while (rsAP.next()) {
                divCode = rsAP.getString("AP_DIV_CODE_TO");
            }

            PreparedStatement getDivName = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_division WHERE DIV_CODE = ?");
            getDivName.setString(1, divCode);
            ResultSet rsDivName = getDivName.executeQuery();
            while (rsDivName.next()) {
                divName = rsDivName.getString("DIV_NAME");
            }

            PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME,TL_REMARKS) VALUES (?,?,?,?)");
            recHist.setString(1, AP_REFERENCE_NO);
            recHist.setString(2, divCode);
            recHist.setString(3, divName);
            recHist.setString(4, MISC_REMARKS);
            recHist.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void failedInspection(String AP_REFERENCE_NO, String ZONING_INS, String FIRE_INS, String HS_INS, String BLDG_INS, String LABOR_INS, String MISC_INS, String MISC_REMARKS, String busType, String empID) {
        LGUConnect connect = new LGUConnect();
        if (!busType.equals("L") && !busType.equals("S")) {
            busType = "S";
            try {
                Connection connection = connect.getConnection();

                PreparedStatement getBU_ID = (PreparedStatement) connection.prepareStatement("SELECT BU_ID FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
                getBU_ID.setString(1, AP_REFERENCE_NO);
                ResultSet rsBU_ID = getBU_ID.executeQuery();
                while (rsBU_ID.next()) {
                    BU_ID = rsBU_ID.getInt("BU_ID");
                }

                PreparedStatement setBussClass = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_business SET BU_CLASSIFICATION = ? WHERE BU_ID = ?");
                setBussClass.setString(1, busType);
                setBussClass.setInt(2, BU_ID);
                setBussClass.executeUpdate();

                PreparedStatement failIns = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_inspections (INS_AP_REFERENCE_NO, ZONING_INS, FIRE_INS, HEALTH_SANITATION_INS, BUILDING_INS, LABOR_INS, MISC_INS, INS_REMARKS) VALUES (?,?,?,?,?,?,?,?) ");
                failIns.setString(1, AP_REFERENCE_NO);
                failIns.setString(2, ZONING_INS);
                failIns.setString(3, FIRE_INS);
                failIns.setString(4, HS_INS);
                failIns.setString(5, BLDG_INS);
                failIns.setString(6, LABOR_INS);
                failIns.setString(7, MISC_INS);
                failIns.setString(8, MISC_REMARKS);
                failIns.executeUpdate();
                PreparedStatement updateIns = (PreparedStatement) connection.prepareStatement("UPDATE bpls_t_bp_application SET AP_DIV_CODE_TO = 'DIV-INV', AP_DIV_CODE_FROM = 'DIV-INS', AP_DATE_ACCESSED = CURRENT_TIMESTAMP(), AP_REMARKS = ?, U_INS_ID = ? WHERE AP_REFERENCE_NO = ?");
                updateIns.setString(1, MISC_REMARKS);
                updateIns.setInt(2, Integer.parseInt(empID));
                updateIns.setString(3, AP_REFERENCE_NO);
                updateIns.executeUpdate();

                //Record

                PreparedStatement getAPinfo = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_bp_application WHERE AP_REFERENCE_NO = ?");
                getAPinfo.setString(1, AP_REFERENCE_NO);
                ResultSet rsAP = getAPinfo.executeQuery();
                while (rsAP.next()) {
                    divCode = rsAP.getString("AP_DIV_CODE_TO");
                }

                PreparedStatement getDivName = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_r_division WHERE DIV_CODE = ?");
                getDivName.setString(1, divCode);
                ResultSet rsDivName = getDivName.executeQuery();
                while (rsDivName.next()) {
                    divName = rsDivName.getString("DIV_NAME");
                }

                PreparedStatement recHist = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_ap_history(TL_AP_NO, TL_DIV_CODE, TL_DIV_NAME,TL_REMARKS) VALUES (?,?,?,?)");
                recHist.setString(1, AP_REFERENCE_NO);
                recHist.setString(2, divCode);
                recHist.setString(3, divName);
                recHist.setString(4, MISC_REMARKS);
                recHist.executeUpdate();

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

}

