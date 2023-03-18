<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HomeSharing</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="http://localhost:9999/HomeSharing/css/post/styles1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">HomeSharing</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Chúng tôi</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                        </li>
                    </ul>                  
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Home Sharing</h1>
                </div>
            </div>
        </header>
        <!-- Section-->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Title</th>
                    <th scope="col">Text</th>
                    <th scope="col">Account_id</th>
                    <th scope="col">Chức năng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.lists}" var="x">
                    <tr>              
                        <td>${x.post_id}</td>
                        <td>${x.post_title}</td>
                        <td>${x.post_text}</td>
                        <td>${x.account_id}</td>
                        <td><a href="deletepost?p_id=${x.post_id}">Xóa bài</a></td>
                        <td><a href="#">Chỉnh sửa</a></td>                     
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><h1 class="m-0 text-center text-white">@Home Sharing</h1></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
