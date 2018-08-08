package com.bplos;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class uploadX extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public uploadX() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List <FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        item.write( new File("C:/upload" + File.separator + name));
                    }
                }
                //File uploaded successfully
                request.setAttribute("gurumessage", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
            }
        }else{

            request.setAttribute("gurumessage","No File found");
        }
        request.getRequestDispatcher("/res.jsp").forward(request, response);

    }


}