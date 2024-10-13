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
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Products</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Handle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty cartDetails}">
                                                <c:forEach items="${cartDetails}" var="cartDetail" varStatus="status">
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="d-flex align-items-center">
                                                                <img src="${cartDetail.product.image}"
                                                                    class="img-fluid me-5 rounded-circle"
                                                                    style="width: 80px; height: 80px;" alt="">
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <a href="/products/${cartDetail.product.id}"
                                                                style="color: #666666; font-weight: bold;">
                                                                <p class="mb-0 mt-4">${cartDetail.product.name}</p>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4">
                                                                <fmt:formatNumber type="number"
                                                                    value="${cartDetail.product.price}" /> VND
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <div class="input-group quantity mt-4"
                                                                style="width: 100px;">
                                                                <div class="input-group-btn">
                                                                    <button
                                                                        class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                        <i class="fa fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <input type="text"
                                                                    class="form-control form-control-sm text-center border-0"
                                                                    value="${cartDetail.quantity}"
                                                                    data-cart-detail-id="${cartDetail.id}"
                                                                    data-cart-detail-price="${cartDetail.product.price}"
                                                                    data-cart-detail-index="${status.index}">
                                                                <div class="input-group-btn">
                                                                    <button
                                                                        class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                                <fmt:formatNumber type="number"
                                                                    value="${cartDetail.price_total}" />
                                                                VND
                                                            </p>
                                                        </td>
                                                        <form:form action="/cart-detail/${cartDetail.id}" method="post">
                                                            <td>
                                                                <button type="submit"
                                                                    class="btn btn-md rounded-circle bg-light border mt-4">
                                                                    <i class="fa fa-times text-danger"></i>
                                                                </button>
                                                            </td>
                                                        </form:form>
                                                    </tr>
                                                </c:forEach>
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

                                            </c:otherwise>
                                        </c:choose>
                                        <tr>
                                            <th></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <b class="mb-0" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> VND
                                                </b>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="mt-3 d-flex justify-content-between">
                                <div>
                                    <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4"
                                        placeholder="Coupon Code">
                                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary"
                                        type="button">Apply
                                        Coupon</button>
                                </div>

                                <c:choose>
                                    <c:when test="${not empty cart}">
                                        <div style="text-align: center;">
                                            <form:form action="/proceed-checkout" method="post" modelAttribute="cart">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div style="display: none;">
                                                    <c:forEach var="cartDetail" items="${cart.getCartDetails()}"
                                                        varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.id}"
                                                                    path="cartDetails[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.quantity}"
                                                                    path="cartDetails[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button class="btn border-secondary rounded-pill 
                                            px-4 py-3 text-primary text-uppercase mb-4 ms-4">Proceed Checkout
                                                </button>
                                            </form:form>
                                        </div>
                                    </c:when>
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