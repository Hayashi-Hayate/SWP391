
package controller.notification;

import dao.NotificationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Notification;

public class ViewNotificationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = "owner";//request.getParameter("username");
        NotificationDBContext noticDB = new NotificationDBContext();
        ArrayList<Notification> notiList = noticDB.list(username);
        request.getSession().setAttribute("notiList", notiList);
        //response.getWriter().print(notiList);
        request.getRequestDispatcher("../view/notification/viewnotification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }
}
