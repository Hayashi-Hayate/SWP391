
package controller.bill;

import dao.BillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.AccountView;
import model.Bill;

public class ViewBillController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountView currentAccount = (AccountView) request.getSession().getAttribute("account");
        BillDBContext db = new BillDBContext();
        ArrayList<Bill> billList = db.getBillList(currentAccount);
        request.getSession().setAttribute("billList", billList);
        request.getRequestDispatcher("./view/bill/viewbill.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    }
}
