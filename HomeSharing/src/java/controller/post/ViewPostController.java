
package controller.post;
import dao.PostDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Post;

public class ViewPostController extends HttpServlet {

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        PostDBContext postDBContext = new PostDBContext();
//        int count = postDBContext.getTotalPost();
//        int endPage = count/5;
//        if(count % 5 != 0){
//            endPage ++;
//        }
//        request.setAttribute("endP", endPage);
//         request.getRequestDispatcher("./view/post/blog.jsp").forward(request, response);
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDBContext dao = new PostDBContext();
        List<Post> lists = dao.getPost();
        request.setAttribute("lists", lists);
        request.getRequestDispatcher("./view/post/blog.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
