
package controller.notification;

import dao.NotificationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Notification;

public class DeleteNotificationController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int notification_id = Integer.parseInt(request.getParameter("id"));
        //response.getWriter().print(notification_id);
        Notification noti = new Notification(notification_id,2,2,"","",null);
        NotificationDBContext notiDB = new NotificationDBContext();
        notiDB.delete(noti);
        response.sendRedirect("view");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
