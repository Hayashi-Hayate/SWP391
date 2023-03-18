<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang quản trị</title>
        <!-- Đường dẫn tới các file CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Đường dẫn tới các file JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <!-- Nội dung trang -->
        <div class="container-fluid mt-3">
            <!-- Bảng danh sách tài khoản -->
            <h2>Danh sách tài khoản</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Họ và tên</th>
                        <th>Vai trò</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="accountview" items="${accountViews}">
                        <tr>
                            <td>${accountview.account_id}</td>
                            <td>${accountview.username}</td>
                            <td>${accountview.fullname}</td>
                            <td>
                                <c:if test="${accountview.role == 1}">Admin</c:if>
                                <c:if test="${accountview.role == 2}">Manager</c:if>
                                <c:if test="${accountview.role == 3}">Tenant</c:if>
                                </td>
                                <td>${accountview.email}</td>
                            <td>${accountview.phone}</td>
                            <td>${accountview.status == 1?"Hoạt động":"Không hoạt động"}</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editUserModal" 
                                        data-account_id="${accountview.account_id}"
                                        data-username="${accountview.username}"
                                        data-password="${accountview.password}"
                                        data-fullname="${accountview.fullname}"
                                        data-role="${accountview.role}"
                                        data-email="${accountview.email}"
                                        data-phone="${accountview.phone}"
                                        data-address="${accountview.address}"
                                        data-status="${accountview.status}">
                                    Sửa
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>    
        </div>
        <%@ include file="editusermodal.jsp" %>
        <%--<%@ include file="deleteusermodal.jsp" %>--%>
    </body>
    <script>
        function confirmDelete(accountId) {
            if (confirm("Bạn có muốn xóa tài khoản này?")) {
                $.ajax({
                    type: "POST",
                    url: "/deleteuser",
                    data: {account_id: accountId},
                    success: function (response) {
                        // Reload the page after successful delete
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            }
        }
    </script>
</html>
