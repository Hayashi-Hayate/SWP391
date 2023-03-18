/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.notification;

import dao.NotificationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import model.Account;
import model.Notification;
import util.DateTimeHelper;


public class UpdateNotificationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NotificationDBContext notiDB = new NotificationDBContext();
        int noti_id = Integer.parseInt(request.getParameter("id"));
        Notification noti = notiDB.get(noti_id);
        request.getSession().setAttribute("noti", noti);
        request.getRequestDispatcher("../view/notification/updatenotification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account ac = (Account) session.getAttribute("account");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int noti_id = Integer.parseInt(request.getParameter("id"));
        boolean check = request.getParameter("button").equalsIgnoreCase("cancel");
        Date current_date = new Date();
        java.sql.Date create_date = DateTimeHelper.toDateSql(current_date);
        if (!check) {
            Notification noti = new Notification(noti_id,/*ac.getAccount_id()*/ 3, 1, title, content, create_date);
            NotificationDBContext notiDB = new NotificationDBContext();
            notiDB.update(noti);
            response.sendRedirect("view");
        } else {
            response.sendRedirect("view");
        }
    }

    
}
