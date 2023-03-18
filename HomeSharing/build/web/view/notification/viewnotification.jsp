<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notification Page</title>
        <link href="../css/notification/viewnotification.css" rel="stylesheet" type="text/css"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src=""></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #a6f7cd">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <span class="logo-font">Home</span>Sharing
                    </div>
                </div>
            </div>
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Thông báo</li>
                </ol>
            </nav>
            <div class="row">
                <div class="col-lg-3 left">
                    <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center">
                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="img-fluid" alt="Responsive image" />
                        <div class="p-3 border-bottom">
                            <h6 class="font-weight-bold text-dark">Thông báo</h6>
                        </div>
                        <form action="add" method="get">
                            <div class="p-3">
                                <button class="btn btn-outline-success btn-sm pl-4 pr-4">Thêm thông báo mới</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-9 right">
                    <div class="box shadow-sm rounded bg-white mb-3">
                        <div class="box-title border-bottom p-3">
                            <h6 class="m-0">Gần đây</h6>
                        </div>
                        <div class="box-body p-0">
                            <c:forEach items="${sessionScope.notiList}" var="noti">
                                <div class="p-3 d-flex align-items-center bg-light border-bottom osahan-post-header">
                                    <div class="font-weight-bold mr-3">
                                        <div class="text-truncate" style="color: blue">${noti.title}</div>
                                        <div class="small">${noti.content}</div>
                                    </div>
                                    <span class="ml-auto mb-auto">
                                        <center>
                                            <div class="btn-group" "">
                                                <button type="button" class="btn btn-light btn-sm rounded" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="mdi mdi-dots-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <form action="delete" method="get">
                                                        <button name="btn" class="dropdown-item" ><i class="mdi mdi-delete"></i><input type="hidden" name="id" value="${noti.notification_id}"/> Xoá</button>
                                                    </form>
                                                    <form action="update" method="get">
                                                        <button name="btn" class="dropdown-item" ><i class="mdi mdi-close"></i><input type="hidden" name="id" value="${noti.notification_id}"/> Chỉnh sửa</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </center>
                                        <br />
                                        <div class="text-right text-muted pt-1">${noti.create_date}</div>
                                    </span>
                                </div>
                            </c:forEach>        
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </body>
</html>
