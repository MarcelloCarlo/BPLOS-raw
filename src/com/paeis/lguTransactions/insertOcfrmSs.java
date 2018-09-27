package com.paeis.lguTransactions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import com.paeis.dbConnection.LGUConnect;

/**
 * Servlet implementation class insert
 */
@WebServlet("/insertOcfrmSs")
public class insertOcfrmSs extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertOcfrmSs() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();


        String S_fname = request.getParameter("S_fname");
        String S_mname = request.getParameter("S_mname");
        String S_lname = request.getParameter("S_lname");

        String S_addre = request.getParameter("S_addre");
        String S_bdate = request.getParameter("S_bdate");
        String S_cstat = request.getParameter("S_cstat");
        String S_cnum = request.getParameter("S_cnum");
        String S_sex = request.getParameter("S_sex");

        String S_comp = request.getParameter("S_comp");
        String S_jdesc = request.getParameter("S_jdesc");
        String S_work = request.getParameter("S_work");
        String S_cedula = request.getParameter("S_cedula");
        String S_nbi = request.getParameter("S_nbi");
        String S_health = request.getParameter("S_health");
        String S_req = request.getParameter("S_req");


        LGUConnect databases = new LGUConnect();


        try {
            Connection conn = databases.getConnection();
            PreparedStatement aidetails = (PreparedStatement) conn.prepareStatement("INSERT INTO `lgu_oc_application_frm` (`OAF_FNAME`, `OAF_MNAME`, `OAF_LNAME`, `OAF_ADDRESS`, `OAF_BIRTHDATE`, `OAF_SEX`, `OAF_CIVIL_STATUS`, `OAF_COMPANY`, `OAF_PLC_ASSIGNED`, `OAF_CEDULA_NO`, `OAF_NBI_POLICE_CLR`, `OAF_HEALTH_RCPT_NO`, `OAF_CONTACT_NO`, `OAF_DATE`, `JD_ID) VALUES ('" + S_fname + "','" + S_mname + "','" + S_lname + "','" + S_addre + "','" + S_bdate + "','" + S_sex + "','" + S_cstat + "','" + S_comp + "','" + S_work + "','" + S_cedula + "','" + S_nbi + "','" + S_health + "','" + S_cnum + "','" + S_mname + "','" + S_lname + "')", Statement.RETURN_GENERATED_KEYS);
            aidetails.executeUpdate();


        } catch (Exception e) {
            out.print(e);
        }

    }

}
