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

import com.mysql.jdbc.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    private static final DateTimeFormatter stf = DateTimeFormatter.ofPattern("HH:mm:ss");

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

                String empidDB = resultSet.getString("EP_ID");
                String empfnameDB = resultSet.getString("EP_FNAME");
                String emplnameDB = resultSet.getString("EP_LNAME");
                String emppositionDB = resultSet.getString("EP_JOB_DESC");
                String empDIV = resultSet.getString("U_ROLE");
                String empname = emppositionDB + " : " + empfnameDB + " " + emplnameDB;

                session.setAttribute("empidDB", empidDB);
                session.setAttribute("empname", empname);
                session.setAttribute("emppositionDB", emppositionDB);

                if (empDIV.equals("DIV-SYSAD")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("PAEISSAUsrMgmt.jsp");
                    dispatcher.forward(request, response);
                } else if (empDIV.equals("DIV-EV")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSEIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (empDIV.equals("DIV-INS")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSIPIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (empDIV.equals("DIV-INV")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSIVIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (empDIV.equals("DIV-TRE")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSTIndex.jsp");
                    dispatcher.forward(request, response);
                } else if (empDIV.equals("DIV-REL")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("BPLSRSIndex.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("PAEISPortal.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

}
