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
    protected void doPost(HttpServletRequest reqX, HttpServletResponse respX) throws ServletException, IOException {

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

        // Do the insert here if you can

    }
}
