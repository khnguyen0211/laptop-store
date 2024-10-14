<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Laptop-Store" />
                    <meta name="author" content="" />
                    <title>Dashboard</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Orders</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Orders</li>
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Table Orders</h3>
                                                </div>
                                                <hr />
                                                <table class=" table table-bordered table-hover text-center">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Customer</th>
                                                            <th>Price</th>
                                                            <th>Status</th>
                                                            <th>CreatedAt</th>
                                                            <th>UpdatedAt</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="order" items="${orderList}">
                                                            <tr>
                                                                <th>${order.id}</th>
                                                                <td>${order.user.fullName}</td>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${order.totalPrice}" /> VND
                                                                </td>
                                                                <td>${order.status}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.getCreatedAt()}"
                                                                        pattern="dd-MM-yyyy HH:mm:ss" />
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${order.getUpdatedAt()}"
                                                                        pattern="dd-MM-yyyy HH:mm:ss" />
                                                                </td>
                                                                <td>
                                                                    <a href="#" class="btn btn-success">View</a>
                                                                    <button class="btn btn-warning dropdown-toggle mx-2"
                                                                        type="button" id="dropdownMenuButton"
                                                                        data-bs-toggle="dropdown" aria-expanded="false">
                                                                        Status
                                                                    </button>
                                                                    <ul class="dropdown-menu"
                                                                        aria-labelledby="dropdownMenuButton">
                                                                        <li><a class="dropdown-item" href="#"
                                                                                onclick="showModalUpdate('PROCESSING', '${order.id}', '${order.user.fullName}', '${order.status}')">PROCESSING</a>
                                                                        </li>
                                                                        <li><a class="dropdown-item" href="#"
                                                                                onclick="showModalUpdate('SHIPPING', '${order.id}', '${order.user.fullName}', '${order.status}')">SHIPPING</a>
                                                                        </li>
                                                                        <li><a class="dropdown-item" href="#"
                                                                                onclick="showModalUpdate('COMPLETED', '${order.id}', '${order.user.fullName}', '${order.status}')">COMPLETED</a>
                                                                        </li>
                                                                        <li><a class="dropdown-item" href="#"
                                                                                onclick="showModalUpdate('CANCELED', '${order.id}', '${order.user.fullName}', '${order.status}')">CANCELED</a>
                                                                        </li>
                                                                    </ul>
                                                                    <a href="#" class="btn btn-danger"
                                                                        onclick="showModalDelete('DELETE', '${order.id}', '${order.user.fullName}', '${order.status}')">Del</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                                <div class="modal fade" id="confirmationModal" tabindex="-1"
                                                    aria-labelledby="confirmationModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="confirmationModalLabel">
                                                                </h5>
                                                                <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <h6 id="confirmOrderId"></h6>
                                                                <h6 id="confirmCustomer"></h6>
                                                                <h6 id="confirmStatus"></h6>
                                                                <h6 id="modalBody"></h6>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Cancel</button>
                                                                <form:form id="modalForm" method="post"
                                                                    action="/admin/orders/status">
                                                                    <input style="display: none;" type="" name="status"
                                                                        id="status">
                                                                    <input style="display: none;" type="" name="orderId"
                                                                        id="orderId">
                                                                    <button type="submit" class="btn btn-primary"
                                                                        id="confirmButton">Ok</button>
                                                                </form:form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <script>
                                                    function showModalUpdate(option, orderId, customer, status) {
                                                        document.getElementById('confirmationModalLabel').textContent = 'Change Confirmation'
                                                        document.getElementById('confirmOrderId').textContent = 'Order ID: ' + orderId
                                                        document.getElementById('confirmCustomer').textContent = 'Customer: ' + customer
                                                        document.getElementById('confirmStatus').textContent = 'Status: ' + status
                                                        document.getElementById('modalBody').textContent = `Change status for order ` + orderId + ` into: ` + option + " ?";
                                                        document.getElementById('status').value = option
                                                        document.getElementById('orderId').value = orderId
                                                        var confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
                                                        confirmationModal.show();
                                                    }

                                                    function showModalDelete(option, orderId, customer, status) {
                                                        document.getElementById('confirmationModalLabel').textContent = 'Delete Confirmation'
                                                        document.getElementById('confirmOrderId').textContent = 'Order ID: ' + orderId
                                                        document.getElementById('confirmCustomer').textContent = 'Customer: ' + customer
                                                        document.getElementById('confirmStatus').textContent = 'Status: ' + status
                                                        document.getElementById('modalBody').textContent = `Do you really want to DELETE this order ?`;
                                                        document.getElementById('status').value = option
                                                        document.getElementById('orderId').value = orderId

                                                        var form = document.getElementById('modalForm');
                                                        form.action = "/admin/orders/delete";

                                                        var confirmButton = document.getElementById('confirmButton');
                                                        confirmButton.textContent = "Delete"
                                                        confirmButton.classList.remove('btn-primary');
                                                        confirmButton.classList.add('btn-danger');
                                                        var confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
                                                        confirmationModal.show();
                                                    }
                                                </script>

                                                <nav aria-label="Page navigation example ">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item">
                                                            <a class="${currentPage eq 1 ? 'page-link disabled' : 'page-link'}"
                                                                href="/admin/orders?page=${(currentPage - 1)}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach var="i" begin="1" end="${totalPage}">
                                                            <li class="page-item">
                                                                <a class="${i eq currentPage ? 'page-link active' : 'page-link'}"
                                                                    href="/admin/orders?page=${i}">${i}
                                                                </a>
                                                            </li>
                                                        </c:forEach>
                                                        <li class="page-item">
                                                            <a class="${currentPage eq totalPage ? 'page-link disabled' : 'page-link '}"
                                                                href="/admin/orders?page=${(currentPage + 1)}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>