package controller.notification;

import dao.HouseDBContext;
import dao.NotificationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.House;
import model.Notification;
import util.DateTimeHelper;

public class CreateNotificationController extends HttpServlet {

    @Override //display create new notification page 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = "owner";
        HouseDBContext hDB = new HouseDBContext();
        ArrayList<House> list = hDB.getListHouse(username);
        request.getSession().setAttribute("list", list);
        request.getRequestDispatcher("../view/notification/addnewnotification.jsp").forward(request, response);
    }

    @Override // Add new notification
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account ac = (Account) session.getAttribute("account");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int house_id = Integer.parseInt(request.getParameter("option"));

        boolean check = request.getParameter("button").equalsIgnoreCase("cancel");
        Date current_date = new Date();
        java.sql.Date create_date = DateTimeHelper.toDateSql(current_date);
        if (!check) {
            Notification noti = new Notification(1,/*ac.getAccount_id()*/ 3, house_id, title, content, create_date);
            NotificationDBContext notiDB = new NotificationDBContext();
            notiDB.insert(noti);
            response.sendRedirect("view");
        } else {
            response.sendRedirect("view");
        }
    }
}
