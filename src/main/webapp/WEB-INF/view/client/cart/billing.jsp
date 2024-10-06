<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Fruitables - Vegetable Website Template</title>
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
                    <!-- Checkout Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <h1 class="mb-4">Billing details</h1>
                            <form action="#">
                                <div class="row g-5 mt-3">
                                    <div class="col-md-12 col-lg-6 col-xl-7">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-6">
                                                <div class="form-item w-100">
                                                    <label class="form-label my-3">First Name<sup>*</sup></label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-6">
                                                <div class="form-item w-100">
                                                    <label class="form-label my-3">Last Name<sup>*</sup></label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-item">
                                            <label class="form-label my-3">Address <sup>*</sup></label>
                                            <input type="text" class="form-control"
                                                placeholder="House Number Street Name">
                                        </div>
                                        <div class="form-item">
                                            <label class="form-label my-3">Town/City<sup>*</sup></label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="form-item">
                                            <label class="form-label my-3">Country<sup>*</sup></label>
                                            <input type="text" class="form-control">
                                        </div>
                                        <div class="form-item">
                                            <label class="form-label my-3">Phone Number<sup>*</sup></label>
                                            <input type="tel" class="form-control">
                                        </div>
                                        <div class="form-item">
                                            <label class="form-label my-3">Email Address<sup>*</sup></label>
                                            <input type="email" class="form-control">
                                        </div>
                                        <div class="form-check my-3">
                                            <input type="checkbox" class="form-check-input" id="Account-1"
                                                name="Accounts" value="Accounts">
                                            <label class="form-check-label" for="Account-1">Create an account?</label>
                                        </div>
                                        <hr>
                                        <div class="form-check my-3">
                                            <input class="form-check-input" type="checkbox" id="Address-1"
                                                name="Address" value="Address">
                                            <label class="form-check-label" for="Address-1">Ship to a different
                                                address?</label>
                                        </div>
                                        <div class="form-item">
                                            <textarea name="text" class="form-control" spellcheck="false" cols="30"
                                                rows="11" placeholder="Oreder Notes (Optional)"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-xl-5">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Products</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Quantity</th>
                                                        <th scope="col">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="cartDetail" items="${realCartDetails}">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="d-flex align-items-center mt-2">
                                                                    <img src="${cartDetail.product.image}"
                                                                        class="img-fluid rounded-circle"
                                                                        style="width: 90px; height: 90px;" alt="">
                                                                </div>
                                                            </th>
                                                            <td class="py-5">${cartDetail.getProduct().getName()}</td>
                                                            <td class="py-5">
                                                                <fmt:formatNumber type="number"
                                                                    value="${cartDetail.product.price}" /> VND
                                                            </td>
                                                            <td class="py-5">${cartDetail.quantity}</td>
                                                            <td class="py-5">
                                                                <fmt:formatNumber type="number"
                                                                    value="${cartDetail.quantity * cartDetail.product.price} " />
                                                                VND
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div
                                            class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                            <div class="col-12">
                                                <div class="form-check text-start my-3">
                                                    <input type="checkbox" class="form-check-input bg-primary border-0"
                                                        id="Transfer-1" name="Transfer" value="Transfer">
                                                    <label class="form-check-label" for="Transfer-1">Direct Bank
                                                        Transfer</label>
                                                </div>
                                                <p class="text-start text-dark">Make your payment directly into our bank
                                                    account. Please
                                                    use your Order ID as the payment reference. Your order will not be
                                                    shipped until the
                                                    funds have cleared in our account.</p>
                                            </div>
                                        </div>
                                        <div
                                            class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                            <div class="col-12">
                                                <div class="form-check text-start my-3">
                                                    <input type="checkbox" class="form-check-input bg-primary border-0"
                                                        id="Payments-1" name="Payments" value="Payments">
                                                    <label class="form-check-label" for="Payments-1">Check
                                                        Payments</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div
                                            class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                            <div class="col-12">
                                                <div class="form-check text-start my-3">
                                                    <input type="checkbox" class="form-check-input bg-primary border-0"
                                                        id="Delivery-1" name="Delivery" value="Delivery">
                                                    <label class="form-check-label" for="Delivery-1">Cash On
                                                        Delivery</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div
                                            class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                            <div class="col-12">
                                                <div class="form-check text-start my-3">
                                                    <input type="checkbox" class="form-check-input bg-primary border-0"
                                                        id="Paypal-1" name="Paypal" value="Paypal">
                                                    <label class="form-check-label" for="Paypal-1">Paypal</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                            <button type="button"
                                                class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Place
                                                Order</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Checkout Page End -->
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