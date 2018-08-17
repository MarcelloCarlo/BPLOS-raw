package com.qcapaeis;

import org.apache.commons.fileupload.FileItem;
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
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@MultipartConfig
public class t_uploadSingleAppForm extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "C:/Users/John Carlo Villar/Desktop/";
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        CallableStatement callProc = null;
        response.setContentType("text/plain");
        PrintWriter echo = response.getWriter();
        try {
            //Class.forName("com.mysql.jdbc.Driver").newInstance();
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            int updateQuery = 0;
            Date dtiDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussDTIReg);
            Date bussEstStartDate = new SimpleDateFormat("dd-MM-yyyy").parse(dateNSingBussEstRentStart);
            java.sql.Date _dateNSingBussDTIReg = new java.sql.Date(dtiDate.getTime());
            java.sql.Date _dateNSingBussEstRentStart = new java.sql.Date(bussEstStartDate.getTime());
            /*java.sql.Date _dateNSingBussDTIReg = (Date) defaultDateF.parse(dateNSingBussDTIReg);
            java.sql.Date _dateNSingBussEstRentStart = (Date) defaultDateF.parse(dateNSingBussEstRentStart);*/
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lgu_qcpa_eis_db","root","");
            callProc = connection.prepareCall("{? = call lgu_bp_application(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            callProc.registerOutParameter(1,java.sql.Types.VARCHAR);
            callProc.setString(2,txtNSingBussName);
            callProc.setString(3,txtNSingTaxPayLName);
            callProc.setString(4,txtNSingTaxPayFName);
            callProc.setString(5,txtNSingTaxPayMName);
            callProc.setString(6,txtNSingBussOwnHsNum);
            callProc.setString(7,txtNSingBussOwnStrt);
            callProc.setString(8,txtNSingBussOwnBrgy);
            callProc.setString(9,txtNSingBussOwnCity);
            callProc.setString(10,txtNSingBussFlrNo);
            callProc.setString(11,txtNSingBussStrtNo);
            callProc.setString(12,txtNSingBussStrtName);
            callProc.setString(13,txtNSingBussBrgyName);
            callProc.setString(14,txtNSingPropIdxNo);
            callProc.setString(15,txtNSingLotBlckNo);
            callProc.setString(16,txtNSingTaxPayTINNo);
            callProc.setString(17,txtNSingBussDTIRegNo);
            callProc.setDate(18,_dateNSingBussDTIReg);
            callProc.setString(19,txtNSingBussTelNo);
            callProc.setString(20,txtNSingBussFaxNo);
            callProc.setString(21,txtNSingEmpSSSNo);
            callProc.setInt(22,Integer.parseInt(numNSingBussEmpQTY));
            callProc.setString(23,txtNSingBussRepLName);
            callProc.setString(24,txtNSingBussRepFName );
            callProc.setString(25,txtNSingBussRepMName);
            callProc.setString(26,txtNSingBussRepAddr);
            callProc.setDate(27,_dateNSingBussEstRentStart);
            callProc.setDouble(28,Double.parseDouble(numNSingBussEstRentMonth));
            callProc.setString(29,txtNSingBussEstRentName);
            callProc.setDouble(30,Double.parseDouble(numNSingBussEstSignbrdArea));
            callProc.setString(31,txtNSBussAct);
            callProc.setInt(32,Integer.parseInt(numNSingBussUnitNo));
            callProc.setDouble(33,Double.parseDouble(numNSingBussAreaSqmts));
            callProc.setDouble(33,Double.parseDouble(numNSingBussCapitalization));
            callProc.execute();
            String txtApplicationRefNo = callProc.getString(33);
            echo.write(txtApplicationRefNo);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // process only if its multipart content
      /*  if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        String currPath = getServletContext().getRealPath("/uploads");
                        item.write(new File(currPath + File.separator + name));

                    }
                }

                // File uploaded successfully
                request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }

        } else {
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }

        request.getRequestDispatcher("/res.jsp").forward(request, response);*/

    }

}