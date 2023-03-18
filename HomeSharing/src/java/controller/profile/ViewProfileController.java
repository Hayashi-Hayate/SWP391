package controller.profile;

import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.AccountInformation;

public class ViewProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = "renter";//request.getParameter("username");
        AccountInformationDBContext accountInfo = new AccountInformationDBContext();
        AccountInformation accInfo = accountInfo.viewProfile(username);
        request.getSession().setAttribute("accInfo", accInfo);
        request.getRequestDispatcher("../view/profile/viewprofile.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
