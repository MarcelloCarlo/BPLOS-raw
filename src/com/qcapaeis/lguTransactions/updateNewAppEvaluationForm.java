package com.qcapaeis.lguTransactions;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.qcapaeis.dbConnection.LGUConnect;

@WebServlet("/updateNewAppEvaluationForm")
public class updateNewAppEvaluationForm extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public updateNewAppEvaluationForm() {
		super();
	}

	protected void doPost(HttpServletRequest resq, HttpServletResponse resp) throws ServletException,IOException {
		
		String AT_BRGY_CLEARANCE = resq.getParameter("AT_BRGY_CLEARANCE");
		String AT_DTI_REGISTRATION = resq.getParameter("AT_DTI_REGISTRATION");
		String AT_SEC_REGISTRATION = resq.getParameter("AT_SEC_REGISTRATION");
		String AT_TITLE_TO_PROPERTY = resq.getParameter("AT_TITLE_TO_PROPERTY");
		String AT_CONTRACT_OF_LEASE = resq.getParameter("AT_CONTRACT_OF_LEASE");
		String AT_AUTHORIZATION = resq.getParameter("AT_AUTHORIZATION");
		String AT_MISC_DOCUMENTS = resq.getParameter("AT_MISC_DOCUMENTS");
		System.out.println(AT_MISC_DOCUMENTS);
		String AP_Remarks = resq.getParameter("AP_Remarks");
		System.out.println(AP_Remarks);
		int attachId = Integer.parseInt(resq.getParameter("_AT_ID"));
		int applId = Integer.parseInt(resq.getParameter("_AP_ID"));
		LGUConnect conX = new LGUConnect();
		
		try {
			Connection connection = conX.getConnection();
			PreparedStatement updateRequirements = (PreparedStatement) connection.prepareStatement("UPDATE lgu_r_attachments SET AT_BRGY_CLEARANCE = ?, AT_DTI_REGISTRATION = ?, AT_SEC_REGISTRATION = ?,AT_TITLE_TO_PROPERTY = ?, AT_CONTRACT_OF_LEASE = ?, AT_AUTHORIZATION = ?, AT_MISC_DOCUMENTS = ?, AP_Remarks = ? WHERE AT_ID = ? AND AP_ID = ? ");
			updateRequirements.setString(1, getCheckboxtatus(AT_BRGY_CLEARANCE));
			updateRequirements.setString(2, getCheckboxtatus(AT_DTI_REGISTRATION));
			updateRequirements.setString(3, getCheckboxtatus(AT_SEC_REGISTRATION));
			updateRequirements.setString(4, getCheckboxtatus(AT_TITLE_TO_PROPERTY));
			updateRequirements.setString(5, getCheckboxtatus(AT_CONTRACT_OF_LEASE));
			updateRequirements.setString(6, getCheckboxtatus(AT_AUTHORIZATION));
			updateRequirements.setString(7, getCheckboxtatus(AT_MISC_DOCUMENTS));
			updateRequirements.setString(8, getCheckboxtatus(AP_Remarks));
			updateRequirements.setInt(9,attachId);
			updateRequirements.setInt(10, applId);
			updateRequirements.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	private String getCheckboxtatus(String chkbox) {
		
		if (chkbox.equals("Pass")) {
			String chkboxResPass = "Pass";
			return chkboxResPass;
		}else if (chkbox.isEmpty() || chkbox.equals("Fail")) {
			String chkboxResFail = "Fail";
			return chkboxResFail;
		}
		
		return null;
	}
}
