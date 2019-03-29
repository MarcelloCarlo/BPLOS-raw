package com.paeis.bplsTransactions;

import com.paeis.dbConnection.LGUConnect;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;



@WebServlet("/inspectApplFrmExcel")
@MultipartConfig
public class inspectApplFrmExcel extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;
    private String AP_REFERENCE_NO = "", ZONING_INS = "", FIRE_INS = "", HS_INS = "", BLDG_INS = "", LABOR_INS = "", MISC_INS = "", MISC_REMARKS = "", busType = "", empID = "";

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
            HSSFWorkbook workbook = new HSSFWorkbook(is);
            HSSFSheet worksheet = workbook.getSheet("INSPECTION SHEET");
            /*HSSFRow row1 = worksheet.getRow(2);
            HSSFCell cellA1 = row1.getCell((short) 0);
            String a1Val = cellA1.getStringCellValue();
            HSSFCell cellB1 = row1.getCell((short) 1);
            String b1Val = cellB1.getStringCellValue();
            HSSFCell cellC1 = row1.getCell((short) 2);
            boolean c1Val = cellC1.getBooleanCellValue();
            HSSFCell cellD1 = row1.getCell((short) 3);
            Date d1Val = cellD1.getDateCellValue();*/
            HSSFRow row = worksheet.getRow(1);
            HSSFCell cell = row.getCell((short) 1);
            AP_REFERENCE_NO = cell.getStringCellValue();
            HSSFRow row1 = worksheet.getRow(2);
            HSSFCell cell1 = row1.getCell((short) 1);
            empID = cell1.getStringCellValue();
            HSSFRow row2 = worksheet.getRow(2);
            HSSFCell cell2 = row2.getCell((short) 1);

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

