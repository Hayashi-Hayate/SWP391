<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Admin Page</title>
        <style>

        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Danh sách người dùng</h1>
            <c:set var="accounts" value="${requestScope['accounts']}"/>
            <c:if test="${not empty accounts}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Account_id</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Created Date</th>
                            <th>Expired Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${accounts}" var="account">
                            <tr>
                                <td class="account-id">${account.account_id}</td>
                                <td>${account.username}</td>
                                <td>${account.password}</td>
                                <td>${account.create_date}</td>
                                <td>${account.expired_date}</td>
                                <td>
                                    <button type="button" class="btn btn-status ${account.status == 1 ? 'btn-active' : 'btn-inactive'}" data-status="${account.status}">
                                        ${account.status == 1 ? 'Active' : 'Inactive'}
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-info btn-edit">Edit</button>
                                    <button type="button" class="btn btn-danger btn-delete">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if> 
        </div>
        <!-- Bootstrap JS -->
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script>
            document.querySelectorAll('.btn-status').forEach(function (button) {
                button.addEventListener('click', function () {
                    if (confirm('Bạn có chắc chắn muốn thay đổi trạng thái tài khoản?')) {
                        var account_id = this.parentNode.parentNode.querySelector('.account-id').textContent;
                        var status = this.getAttribute('data-status');
                        var xhr = new XMLHttpRequest();
                        xhr.open('POST', '${pageContext.request.contextPath}/updateadmin', true);
                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                console.log('Updated successfully!');
                                alert('Cập nhật trạng thái tài khoản thành công!');
                                
                            } else if (xhr.readyState === 4 && xhr.status !== 200) {
                                console.error('Update failed!');
                                alert('Cập nhật trạng thái tài khoản thất bại!');
                            }
                        };
                        xhr.send('account_id=' + account_id + '&status=' + (status == 1 ? 0 : 1));
                    }
                });
            });
        </script>


    </body>
</html>