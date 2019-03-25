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

                String selectedPage = pageSelect(divcode);

                if(!selectedPage.equalsIgnoreCase("none")) {
                  //RequestDispatcher dispatcher = request.getRequestDispatcher(selectedPage);
                  //dispatcher.forward(request, response);
                    response.sendRedirect(selectedPage);
                    recSession(divcode, empId);
                } else {
                    session.invalidate();
                    request.setAttribute("errMsg", "<font color=red>Login Error. Username/Password is incorrect.</font>");
                    //RequestDispatcher requestDispatcher = request.getRequestDispatcher("PAEISLogin.jsp");
                    //requestDispatcher.forward(request, response);
                    response.sendRedirect("PAEISLogin.jsp");
                }

                connection.close();
                login.close();



            } else {
                session.invalidate();
                request.setAttribute("errMsg", "<font color=red>Login Error. Please ensure that the Username/Password is correct.</font>");
               //RequestDispatcher requestDispatcher = request.getRequestDispatcher("PAEISLogin.jsp");
               //requestDispatcher.forward(request, response);
                response.sendRedirect("PAEISLogin.jsp");
            }
        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    private String pageSelect(String divcode) {
        String selectedPage = "";
        switch (divcode){
            case "DIV-SYSAD":
                selectedPage = "PAEISSAUsrMgmt.jsp";
                break;
            case "DIV-EV":
                selectedPage = "BPLSEIndex.jsp";
                break;
            case "DIV-INS":
                selectedPage = "BPLSIPIndex.jsp";
                break;
            case "DIV-INV":
                selectedPage = "BPLSIVIndex.jsp";
                break;
            case "DIV-TRE":
                selectedPage = "BPLSTIndex.jsp";
                break;
            case "DIV-REL":
                selectedPage = "BPLSRSIndex.jsp";
                break;
            case "DIV-AS":
                selectedPage = "BPLSAIndex.jsp";
                break;
            case "DIV-MEV":
                selectedPage = "MTOPSEIndex.jsp";
                break;
            case "DIV-MRE":
                selectedPage = "MTOPSRSIndex.jsp";
                break;
            case "DIV-MFA":
                selectedPage = "MTOPSAment.jsp";
                break;
            case "DIV-MIP":
                selectedPage = "MTOPSIPIndex.jsp";
                break;
            case "DIV-RVNU":
                selectedPage = "REVDashboard.jsp";
                break;
            case "DIV-RPT":
                selectedPage = "RPTPrprty.jsp";
                break;
            default: selectedPage = "none"; break;
        }

        return selectedPage;
    }

    private void recSession(String divcode, String empId) {
        LGUConnect connect = new LGUConnect();
        try {
            Connection connection = connect.getConnection();
            PreparedStatement recAudt = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_audit_trail(AUDT_EP_ID, AUDT_DIV_CODE, AUDT_LOG_IN) VALUES (?,?,NOW())");
            recAudt.setInt(1, Integer.parseInt(empId));
            recAudt.setString(2, divcode);
            recAudt.executeUpdate();

            connection.close();
            recAudt.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
