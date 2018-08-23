package com.qcapaeis.lguTransactions;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@MultipartConfig
public class t_uploadCorpAppForm extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    private final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doPost(HttpServletRequest reqX, HttpServletResponse respX) throws ServletException, IOException {

        boolean isMultipart = ServletFileUpload.isMultipartContent(reqX);

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
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);


        String txtNCorpBussName = reqX.getParameter("txtNCorpBussName");
        String txtNCorpTaxPayName = reqX.getParameter("txtNCorpTaxPayName");
        String txtNCorpPresidentName = reqX.getParameter("txtNCorpPresidentName");
        String txtNCorpBussFlrNo = reqX.getParameter("txtNCorpBussFlrNo");
        String txtNCorpBussStrtNo = reqX.getParameter("txtNCorpBussStrtNo");
        String txtNCorpBussStrtName = reqX.getParameter("txtNCorpBussStrtName");
        String txtNCorpBussBrgyName = reqX.getParameter("txtNCorpBussBrgyName");
        String txtNCorpLotBlckNo = reqX.getParameter("txtNCorpLotBlckNo");
        String txtNCorpAuthRepName = reqX.getParameter("txtNCorpAuthRepName");
        String txtNCorpAuthRepPos = reqX.getParameter("txtNCorpAuthRepPos");
        String txtNCorpRepStrtNo = reqX.getParameter("txtNCorpRepStrtNo");
        String txtNCorpRepStrtName = reqX.getParameter("txtNCorpRepStrtName");
        String txtNCorpRepBrgyName = reqX.getParameter("txtNCorpRepBrgyName");
        String txtNCorpRepCity = reqX.getParameter("txtNCorpRepCity");
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

        String txtNCorpAct = reqX.getParameter("txtNCorpAct");
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

        DateFormat defaultDateF = new SimpleDateFormat("dd-MM-yyyy");
        Connection connection = null;
        PreparedStatement pStmt = null;
        CallableStatement callProc = null;
        // Do the insert here if you can
        try {
            // Parse the request
            List items = upload.parseRequest(reqX);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    System.out.println(filePath);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }
            //Class.forName("com.mysql.jdbc.Driver").newInstance();
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            int updateQuery = 0;
          /*  Date dtiDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussDTIReg);
            Date bussEstStartDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussEstRentStart);
            java.sql.Date _dateNSingBussDTIReg = new java.sql.Date(dtiDate.getTime());
            java.sql.Date _dateNSingBussEstRentStart = new java.sql.Date(bussEstStartDate.getTime());*/

            /*java.sql.Date _dateNSingBussDTIReg = (Date) defaultDateF.parse(dateNSingBussDTIReg);
            java.sql.Date _dateNSingBussEstRentStart = (Date) defaultDateF.parse(dateNSingBussEstRentStart);*/
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lgu_qcpa_eis_db","root","");
            callProc = connection.prepareCall("{? = call lgu_bp_application(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            //For Reference Number
            callProc.registerOutParameter(1,java.sql.Types.VARCHAR);
            //Inputs for DB
            callProc.setString(2,txtNCorpBussName);
            callProc.setString(3,txtNCorpTaxPayName);
            callProc.setString(4,txtNCorpPresidentName);
            callProc.setString(5,txtNCorpBussFlrNo);
            callProc.setString(6,txtNCorpBussStrtNo);
            callProc.setString(7,txtNCorpBussStrtName);
            callProc.setString(8,txtNCorpBussBrgyName);
            callProc.setString(9,txtNCorpLotBlckNo);
            callProc.setString(10,txtNCorpAuthRepName);
            callProc.setString(11,txtNCorpAuthRepPos);
            callProc.setString(12,txtNCorpRepStrtNo);
            callProc.setString(13,txtNCorpRepStrtName);
            callProc.setString(14,txtNCorpRepBrgyName);
            callProc.setString(15,txtNCorpRepCity);
            callProc.setString(16,txtNCorpBussSECRegNo);
            callProc.setString(17,dateNCorpBussSECReg);
            //callProc.setDate(18,txtNCorpTaxPayTINNo);
            callProc.setString(19,txtNCorpTelNo);
            callProc.setString(20,txtNCorpFaxNo);
            callProc.setString(21,txtNCorpEmpSSSNo);
            callProc.setInt(22,Integer.parseInt(numNCorpEmpQTY));
            callProc.setString(23,dateNCorpBussEstRentStart);
            callProc.setString(24,numNCorpBussEstRentMonth);
            callProc.setString(25,txtNCorpBussEstRentName);
            callProc.setString(26,numNCorpBussEstSignbrdArea);
            //callProc.setDate(27,txtNCorpAct);
            callProc.setDouble(28,Double.parseDouble(numNCorpBussUnitNo));
            callProc.setString(29,numNCorpBussAreaSqmts);
            callProc.setDouble(30,Double.parseDouble(numNCorpBussCapitalization));
            callProc.execute();
            String txtApplicationRefNo = callProc.getString(33);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
