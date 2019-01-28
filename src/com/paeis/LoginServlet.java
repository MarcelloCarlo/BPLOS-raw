package com.paeis;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    private static final DateTimeFormatter stf = DateTimeFormatter.ofPattern("HH:mm:ss");
    private String divcode = "", empId = "";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LGUConnect conn = new LGUConnect();


        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String error = request.getParameter("error");

        request.setAttribute("error", error);

        try {
            Connection connection = conn.getConnection();
            PreparedStatement login = (PreparedStatement) connection.prepareStatement("SELECT * FROM bpls_t_employee_profile EP JOIN bpls_t_user U ON EP.EP_ID = U.EP_ID WHERE U.U_USERNAME = ? AND U.U_PASSWORD = ? AND U.U_STATUS = 'Active'");
            login.setString(1, username);
            login.setString(2, password);
            ResultSet resultSet = login.executeQuery();
            if (resultSet.next()) {

                empId = String.valueOf(resultSet.getInt("EP_ID"));
                String empfnameDB = resultSet.getString("EP_FNAME");
                String emplnameDB = resultSet.getString("EP_LNAME");
                String emppositionDB = resultSet.getString("EP_JOB_DESC");
                divcode = resultSet.getString("U.U_ROLE");
                String empname = "Welcome " + empfnameDB + " " + emplnameDB + " - " + emppositionDB;

                session.setAttribute("empid", empId);
                session.setAttribute("empname", empname);
                session.setAttribute("emppositionDB", emppositionDB);
                session.setAttribute("empDiv", divcode);
                session.setMaxInactiveInterval(30 * 60);
                recSession(divcode, empId);
                if (divcode.equals("DIV-SYSAD")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("PAEISSAUsrMgmt.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-EV")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSEIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-INS")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSIPIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-INV")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSIVIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-TRE")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSTIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-REL")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSRSIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-AS")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSAIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-MEV")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("MTOPSEIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-MRE")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("MTOPSRSIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (divcode.equals("DIV-MFA")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("MTOPSAment.jsp");
                    dispatcher.forward(request, response);
                }else if (divcode.equals("DIV-MIP")) {

                    RequestDispatcher dispatcher = request.getRequestDispatcher("MTOPSIPIndex.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                session.invalidate();
                request.setAttribute("errMsg", "<font color=red>Login Error. Please ensure that the Username/Password is correct.</font>");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("PAEISLogin.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    private void recSession(String divcode, String empId) {
        LGUConnect connect = new LGUConnect();
        try {
            Connection connection = connect.getConnection();
            PreparedStatement recAudt = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_audit_trail(AUDT_EP_ID, AUDT_DIV_CODE, AUDT_LOG_IN) VALUES (?,?,NOW())");
            recAudt.setInt(1, Integer.parseInt(empId));
            recAudt.setString(2, divcode);
            recAudt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
