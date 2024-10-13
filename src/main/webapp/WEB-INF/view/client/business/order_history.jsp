<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Website Template</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />

                    <div class="container-fluid py-5">
                        <div class="container py-5 mt-5">
                            <div class="table-responsive mt-5">
                                <c:choose>
                                    <c:when test="${not empty orders}">
                                        <table class="table">
                                            <thead class="text-center">
                                                <tr>
                                                    <th scope="col">Order</th>
                                                    <th scope="col">Created At</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Total Price</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach items="${orders}" var="order" varStatus="status">
                                                    <c:set var="index" value="${status.index + 1}" />
                                                    <tr class="text-center">
                                                        <th scope="row">
                                                            ${index}
                                                        </th>
                                                        <td>
                                                            <fmt:formatDate value="${order.getCreatedAt()}"
                                                                pattern="dd-MM-yyyy HH:mm:ss" />

                                                        </td>
                                                        <td>
                                                            <b>${order.getProductTotal()}</b> product(s)
                                                        </td>
                                                        <td style="font-weight: bold;">
                                                            <fmt:formatNumber type="number"
                                                                value="${order.getTotalPrice()}" />
                                                            VND
                                                        </td>
                                                        <td>
                                                            <button type="button"
                                                                class="btn btn-outline-warning">${order.getStatus()}</button>
                                                        </td>
                                                        <td>
                                                            <a href="/orders/detail/${order.id}" type="button"
                                                                class="btn btn-outline-primary">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="#" type="button" class="btn btn-outline-warning">
                                                                <i class="far fa-edit"></i>
                                                            </a>
                                                            <a href="/orders/delete/${order.id}" type="button"
                                                                class="btn btn-outline-danger">
                                                                <i class="fas fa-trash"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <script>
                                            function showModal() {
                                                const modal = document.getElementById('emptyCartModal');
                                                modal.style.display = 'block';
                                                modal.style.visibility = 'visible';

                                                setTimeout(() => {
                                                    modal.style.top = '150px';
                                                    modal.style.opacity = '1';
                                                }, 10);

                                                setTimeout(hideModal, 10000);

                                                setTimeout(() => {
                                                    modal.style.display = 'none';
                                                }, 10000);
                                            }
                                            function hideModal() {
                                                const modal = document.getElementById('emptyCartModal');
                                                modal.style.top = '10px';
                                                setTimeout(() => {
                                                    modal.style.display = 'none';
                                                }, 1000);
                                            }
                                            window.onload = function () {
                                                showModal();
                                                hideModal()
                                            };
                                        </script>
                                        <div class="container-fluid">
                                            <div class="container text-center">
                                                <div class="row justify-content-center">
                                                    <div class="col-lg-6">
                                                        <i style="color: #b2f634;"
                                                            class="bi bi-exclamation-triangle display-1 text-success"></i>
                                                        <h1 class="display-1">204</h1>
                                                        <h1 class="mb-4">You have no orders yet.</h1>
                                                        <p class="mb-4">We’re sorry, the page you have looked for does
                                                            not exist in our
                                                            website! Maybe go to our home page or try to use a search?
                                                        </p>
                                                        <a class="btn border-secondary rounded-pill py-3 px-5"
                                                            href="/">Go Back To
                                                            Home</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <div id="emptyCartModal"
                        style="position: fixed; z-index: 9999; left: 50%; top: -100px; transform: translateX(-50%); width: 300px; transition: top 0.5s ease-out, opacity 0.5s ease-out; opacity: 0; visibility: hidden;">
                        <div class="modal-content"
                            style="background-color: #ffffff; padding: 20px; border-radius: 12px; text-align: center; position: relative; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); border: none;">
                            <div
                                style="background-color: #b2f634; width: 60px; height: 60px; border-radius: 50%; margin: 0 auto 15px; display: flex; align-items: center; justify-content: center;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24"
                                    fill="none" stroke="#4caf50" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round">
                                    <path d="M20 6L9 17l-5-5"></path>
                                </svg>
                            </div>
                            <p style="font-size: 18px; font-weight: 600; color: #333333; margin: 0 0 10px;">Your Cart is
                                Empty!</p>
                            <p style="font-size: 14px; color: #666666; margin: 0 0 20px;">Looks like you haven't added
                                any items to your cart yet.</p>
                        </div>
                    </div>


                    <jsp:include page="../layout/footer.jsp" />
                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>

                </body>

                </html>