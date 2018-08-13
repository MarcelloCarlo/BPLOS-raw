package com.qcapaeis;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@MultipartConfig
public class t_uploadCorpAppForm extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest reqX, HttpServletResponse respX) throws ServletException,
            IOException {

        String txtNSingBussName = reqX.getParameter("txtNSingBussName");
        String txtNSingTaxPayLName = reqX.getParameter("txtNSingTaxPayLName");
        String txtNSingTaxPayFName = reqX.getParameter("txtNSingTaxPayFName");
        String txtNSingTaxPayMName = reqX.getParameter("txtNSingTaxPayMName");
        String txtNSingBussOwnHsNum = reqX.getParameter("txtNSingBussOwnHsNum");
        String txtNSingBussOwnStrt = reqX.getParameter("txtNSingBussOwnStrt");
        String txtNSingBussOwnBrgy = reqX.getParameter("txtNSingBussOwnBrgy");
        String txtNSingBussOwnCity = reqX.getParameter("txtNSingBussOwnCity");
        String txtNSingBussFlrNo = reqX.getParameter("txtNSingBussFlrNo");
        String txtNSingBussStrtNo = reqX.getParameter("txtNSingBussStrtNo");
        String txtNSingBussStrtName = reqX.getParameter("txtNSingBussStrtName");
        String txtNSingBussBrgyName = reqX.getParameter("txtNSingBussBrgyName");
        String txtNSingPropIdxNo = reqX.getParameter("txtNSingPropIdxNo");
        String txtNSingLotBlckNo = reqX.getParameter("txtNSingLotBlckNo");
        String txtNSingTaxPayTINNo = reqX.getParameter("txtNSingTaxPayTINNo");
        String txtNSingBussDTIRegNo = reqX.getParameter("txtNSingBussDTIRegNo");
        String dateNSingBussDTIReg = reqX.getParameter("dateNSingBussDTIReg");
        String txtNSingBussTelNo = reqX.getParameter("txtNSingBussTelNo");
        String txtNSingBussFaxNo = reqX.getParameter("txtNSingBussFaxNo");
        String txtNSingEmpSSSNo = reqX.getParameter("txtNSingEmpSSSNo");
        String numNSingBussEmpQTY = reqX.getParameter("numNSingBussEmpQTY");
        String txtNSingBussRepLName = reqX.getParameter("txtNSingBussRepLName");
        String txtNSingBussRepFName = reqX.getParameter("txtNSingBussRepFName");
        String txtNSingBussRepMName = reqX.getParameter("txtNSingBussRepMName");
        String txtNSingBussRepAddr = reqX.getParameter("txtNSingBussRepAddr");
        String dateNSingBussEstRentStart = reqX.getParameter("dateNSingBussEstRentStart");
        String numNSingBussEstRentMonth = reqX.getParameter("numNSingBussEstRentMonth");
        String txtNSingBussEstRentName = reqX.getParameter("txtNSingBussEstRentName");
        String numNSingBussEstSignbrdArea = reqX.getParameter("numNSingBussEstSignbrdArea");
        String txtNSingExBuss = reqX.getParameter("txtNSingExBuss");
        String txtNSingExBussNo = reqX.getParameter("txtNSingExBussNo");
        String txtNSingExBussLoc = reqX.getParameter("txtNSingExBussLoc");
        String txtNSingExBuss1 = reqX.getParameter("txtNSingExBuss1");
        String txtNSingExBussNo1 = reqX.getParameter("txtNSingExBussNo1");
        String txtNSingExBussLoc1 = reqX.getParameter("txtNSingExBussLoc1");
        String txtNSingExBuss2 = reqX.getParameter("txtNSingExBuss2");
        String txtNSingExBussNo2 = reqX.getParameter("txtNSingExBussNo2");
        String txtNSingExBussLoc2 = reqX.getParameter("txtNSingExBussLoc2");
        String txtNSingExBuss3 = reqX.getParameter("txtNSingExBuss3");
        String txtNSingExBussNo3 = reqX.getParameter("txtNSingExBussNo3");
        String txtNSingExBussLoc3 = reqX.getParameter("txtNSingExBussLoc3");
        String txtNSBussAct = reqX.getParameter("txtNSBussAct");
        String numNSingBussUnitNo = reqX.getParameter("numNSingBussUnitNo");
        String numNSingBussAreaSqmts = reqX.getParameter("numNSingBussAreaSqmts");
        String numNSingBussCapitalization = reqX.getParameter("numNSingBussCapitalization");
        String txtNSBussAct1 = reqX.getParameter("txtNSBussAct1");
        String numNSingBussUnitNo1 = reqX.getParameter("numNSingBussUnitNo1");
        String numNSingBussAreaSqmts1 = reqX.getParameter("numNSingBussAreaSqmts1");
        String numNSingBussCapitalization1 = reqX.getParameter("numNSingBussCapitalization1");
        String txtNSBussAct2 = reqX.getParameter("txtNSBussAct2");
        String numNSingBussUnitNo2 = reqX.getParameter("numNSingBussUnitNo2");
        String numNSingBussAreaSqmts2 = reqX.getParameter("numNSingBussAreaSqmts2");
        String numNSingBussCapitalization2 = reqX.getParameter("numNSingBussCapitalization2");
        String txtNSBussAct3 = reqX.getParameter("txtNSBussAct3");
        String numNSingBussUnitNo3 = reqX.getParameter("numNSingBussUnitNo3");
        String numNSingBussAreaSqmts3 = reqX.getParameter("numNSingBussAreaSqmts3");
        String numNSingBussCapitalization3 = reqX.getParameter("numNSingBussCapitalization3");
        String txtNSBussAct4 = reqX.getParameter("txtNSBussAct4");
        String numNSingBussUnitNo4 = reqX.getParameter("numNSingBussUnitNo4");
        String numNSingBussAreaSqmts4 = reqX.getParameter("numNSingBussAreaSqmts4");
        String numNSingBussCapitalization4 = reqX.getParameter("numNSingBussCapitalization4");
        String txtNSBussAct5 = reqX.getParameter("txtNSBussAct5");
        String numNSingBussUnitNo5 = reqX.getParameter("numNSingBussUnitNo5");
        String numNSingBussAreaSqmts5 = reqX.getParameter("numNSingBussAreaSqmts5");
        String numNSingBussCapitalization5 = reqX.getParameter("numNSingBussCapitalization5");
        String txtNSBussAct6 = reqX.getParameter("txtNSBussAct6");
        String numNSingBussUnitNo6 = reqX.getParameter("numNSingBussUnitNo6");
        String numNSingBussAreaSqmts6 = reqX.getParameter("numNSingBussAreaSqmts6");
        String numNSingBussCapitalization6 = reqX.getParameter("numNSingBussCapitalization6");
        String txtNSBussAct7 = reqX.getParameter("txtNSBussAct7");
        String numNSingBussUnitNo7 = reqX.getParameter("numNSingBussUnitNo7");
        String numNSingBussAreaSqmts7 = reqX.getParameter("numNSingBussAreaSqmts7");
        String numNSingBussCapitalization7 = reqX.getParameter("numNSingBussCapitalization7");

        Part fileNSingLocSketchEst = reqX.getPart("fileNSingLocSketchEst");
        Part fileNSingBrgyClear = reqX.getPart("fileNSingBrgyClear");
        Part fileNSingDTIreg = reqX.getPart("fileNSingDTIreg");
        Part fileNSingTitleProp = reqX.getPart("fileNSingTitleProp");
        Part fileNSingLessorBussPermit = reqX.getPart("fileNSingLessorBussPermit");
        Part fileNSingAuthLetterID = reqX.getPart("fileNSingAuthLetterID");
        //Hmmm
        //Part fileNsingOthers = reqX.getPart("fileNsingOthers");
        List<Part> fileNSingOthers = reqX.getParts().stream().filter(part -> "fileNSingOthers".equals(part.getName())).collect(Collectors.toList());

        //Do the insert here if you can
        
    }
}
