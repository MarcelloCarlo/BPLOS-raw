package com.paeis.lguTransactions;

import com.paeis.dbConnection.LGUConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/generateDivisions")
public class generateDivisions extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        LGUConnect conX = new LGUConnect();
        String oki = String.valueOf(request.getParameter("ok"));
        try{
            Connection conn = conX.getConnection();

                Statement ss3 = conn.createStatement();
                ResultSet res = ss3.executeQuery("select * from bpls_r_division");
                String a = "<option value=";
                while (res.next()){
                    out.print("<option value="+res.getString("DIV_CODE")+">"+res.getString("DIV_NAME")+"</option>");
                }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
