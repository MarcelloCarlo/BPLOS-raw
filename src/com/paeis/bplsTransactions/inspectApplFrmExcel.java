package com.paeis.bplsTransactions;

import com.paeis.dbConnection.LGUConnect;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class inspectApplFrmExcel extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LGUConnect connect = new LGUConnect();
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            /*// Read excel file and store email ids in mailIdsArray
            InputStream input = new BufferedInputStream(new FileInputStream(filename));
            POIFSFileSystem fs = new POIFSFileSystem(input);
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            Iterator rows = sheet.rowIterator();
            while (rows.hasNext()) {
                RegistrationUser user= new RegistrationUser();
                HSSFRow row = (HSSFRow) rows.next();



                if(row.getCell(0) != null && !row.getCell(0).equals("First Name")){
                    user.setFirstName(row.getCell(0).toString());
                    user.setLastName(row.getCell(1).toString());
                    user.setAddress(row.getCell(2).toString());
                    user.setDateOfBirth(row.getCell(3).toString());
                    user.setPhoneNumber(row.getCell(4).hashCode());
                    user.setEmailId(row.getCell(5).toString());
                    user.setGender(row.getCell(6).toString());
                    user.setMaritalStatus(row.getCell(7).toString());
                    user.setHighestDegree(row.getCell(8).toString());
                    user.setAggregate(row.getCell(9).hashCode());
                    user.setYearOfPassing(row.getCell(10).hashCode());
                    user.setCollegeName(row.getCell(11).toString());
                    user.setUniversityName(row.getCell(12).toString());
                    user.setTotalExperiences(row.getCell(13).hashCode());
                    user.setCurrentCompany(row.getCell(14).toString());
                    user.setDesignation(row.getCell(15).toString());
                    user.setReferredBy(row.getCell(16).toString());

                }


                usersList.add(user);
            }*/
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

