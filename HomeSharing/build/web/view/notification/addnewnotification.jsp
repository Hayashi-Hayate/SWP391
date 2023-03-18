<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add New Notification Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src=""></script>
        <link href="../css/notification/addnewnotification.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <form action="addnotification" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <span class="logo-font">Home</span>Sharing
                        </div>
                    </div>
                </div>
            </div>
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tạo thông báo mới</li>
                </ol>
            </nav>
            <div class="row">
                <form action="add" method="post">
                    <div class="col-xl-8 offset-xl-2 py-5">

                        <h1>Tạo thông báo mới
                        </h1>
                        <div class="messages"></div>

                        <div class="controls">

                            <div class="row">
                                <div class="col-md-5">
                                    <label><strong>Chọn địa chỉ nhà : </strong></label>
                                    <select name="option" class="form-control">
                                        <c:forEach items="${sessionScope.list}" var="l">
                                            <option name="option" value="${l.house_id}">${l.address}</option>
                                        </c:forEach>
                                    </select> 
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_title">Tiêu đề *</label>
                                        <input id="form_title" type="text" name="title" class="form-control" placeholder="Nhập tiêu đề *" data-error="Bắt buộc nhập tiêu đề.">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="form_message">Nội dung thông báo *</label>
                                        <textarea id="form_message" name="content" class="form-control" placeholder="Nhập nội dung *" rows="4" data-error="Please, leave us a message."></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <button name="button" class="btn" style="background-color: #CCC" value="cancel">Quay lại</button>
                                    <button name="button" class="btn" style="background-color: #e9daac" value="Add">Tạo mới</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="text-muted">
                                        <strong>*</strong> Bắt buộc phải điền thông tin </p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.8 -->
                </form>
            </div>
        </form>
        <jsp:include page="../../home/footer.jsp"/>
        <!--footer area end-->
        <!-- JS
        ============================================ -->
        <!-- Plugins JS -->
        <script src="../../assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="../../assets/js/main.js"></script>
    </body>
</html>
