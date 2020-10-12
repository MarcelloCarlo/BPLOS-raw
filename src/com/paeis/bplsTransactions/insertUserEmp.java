package com.paeis.bplsTransactions;

import com.mysql.jdbc.PreparedStatement;
import com.paeis.dbConnection.LGUConnect;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

@MultipartConfig
@WebServlet("/insertUserEmp")
public class insertUserEmp  extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LGUConnect connect = new LGUConnect();
    private int u_id=0;

    public insertUserEmp() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){


        String firstname = request.getParameter("firstname");
        String middle = request.getParameter("middle");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String bdate = request.getParameter("bdate");
        //String status = request.getParameter("status");
        String jobdesc = request.getParameter("jobdesc");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String home = request.getParameter("home");

        //String username = request.getParameter("username");
        //String password = request.getParameter("password");
        String udiv = request.getParameter("udiv");

        int epId = 0;
        if (firstname != null && middle != null && lastname != null && gender != null && bdate != null && jobdesc != null && contact != null && email != null && home != null) {
            try {
                Connection connection = connect.getConnection();
                java.util.Date Bdate = new SimpleDateFormat("dd-MM-yyyy").parse(bdate);
                Date bbDate = new java.sql.Date(Bdate.getTime());
                String data = "insert into bpls_t_employee_profile(EP_FNAME,EP_MNAME,EP_LNAME,EP_GENDER,EP_BIRTHDATE,EP_JOB_DESC,EP_CONTACT_NO,EP_EMAIL,EP_ADDRESS) values (?,?,?,?,?,?,?,?,?)";
                PreparedStatement stat = (PreparedStatement) connection.prepareStatement(data);
                stat.setString(1, firstname);
                stat.setString(2, middle);
                stat.setString(3, lastname);
                stat.setString(4, gender);
                stat.setDate(5, bbDate);
                //stat.setString(6, status);
                stat.setString(6, jobdesc);
                stat.setString(7, contact);
                stat.setString(8, email);
                stat.setString(9, home);
                stat.executeUpdate();

                PreparedStatement getEmpID = (PreparedStatement) connection.prepareStatement("SELECT MAX(EP_ID) AS EP_ID FROM bpls_t_employee_profile");
                ResultSet rsEpId = getEmpID.executeQuery();
                while (rsEpId.next()){
                    epId = rsEpId.getInt("EP_ID");
                }

                PreparedStatement setUser = (PreparedStatement) connection.prepareStatement("INSERT INTO bpls_t_user(U_USERNAME, U_PASSWORD, U_ROLE, EP_ID) VALUES (CONCAT(?,?),CONCAT(REPLACE(?,'-',''),?),?,?)");
                setUser.setString(1,udiv);
                setUser.setString(2,String.valueOf(epId));
                //setUser.setString(3,bdate);
                setUser.setString(3,bdate);
                setUser.setString(4,udiv);
                setUser.setString(5,udiv);
                setUser.setInt(6,epId);
                setUser.executeUpdate();

                PreparedStatement getMaxUsr = (PreparedStatement) connection.prepareStatement("SELECT MAX(U_ID) AS U_ID FROM bpls_t_user");
                ResultSet Uid = getMaxUsr.executeQuery();

                while (Uid.next()){
                    u_id = Uid.getInt("U_ID");
                }

                String usr ="",pass="";
                PreparedStatement getUsrPss = (PreparedStatement) connection.prepareStatement("SELECT U_USERNAME,U_PASSWORD FROM bpls_t_user WHERE U_ID = ?");
                getUsrPss.setInt(1,u_id);
                ResultSet usrPass = getUsrPss.executeQuery();
                while(usrPass.next()){
                    usr = usrPass.getString("U_USERNAME");
                    pass = usrPass.getString("U_PASSWORD");
                }


                //response.sendRedirect("PAEISSAUsrMgmt.jsp");

response.getWriter().print("Username: "+usr+" Password: "+pass);

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
