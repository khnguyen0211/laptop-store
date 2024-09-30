<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!doctype html>
            <html lang="en">

            <head>
                <title>Register Form</title>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="/client/css/login.css">

            </head>

            <body>
                <section class="ftco-section p-3 md:p-2">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-7 col-lg-5">
                                <div class="login-wrap p-4 p-md-5">
                                    <div class="d-flex">
                                        <div class="w-100">
                                            <h3 class="mb-4">Sign Up</h3>
                                        </div>
                                        <div class="w-100">
                                            <p class="social-media d-flex justify-content-end">
                                                <a href="#"
                                                    class="social-icon d-flex align-items-center justify-content-center"><span
                                                        class="fa fa-facebook"></span></a>
                                                <a href="#"
                                                    class="social-icon d-flex align-items-center justify-content-center"><span
                                                        class="fa fa-twitter"></span></a>
                                            </p>
                                        </div>
                                    </div>
                                    <form:form method="POST" action="/register" class="login-form"
                                        modelAttribute="registerDto">
                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-user"></span></div>
                                            <c:set var="errorFullName">
                                                <form:errors path="fullName" cssClass="invalid-feedback" />
                                            </c:set>
                                            <form:input type="text"
                                                class="form-control rounded-left ${not empty errorFullName ? 'is-invalid' : ''}"
                                                placeholder="Full Name" path="fullName" />
                                            ${errorFullName}
                                        </div>
                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa">
                                                    <i class="fa fa-envelope"></i>
                                                </span>
                                            </div>
                                            <c:set var="errorEmail">
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </c:set>
                                            <form:input type="email"
                                                class="form-control rounded-left ${not empty errorEmail ? 'is-invalid' : ''}"
                                                placeholder="Email" path="email" />
                                            ${errorEmail}
                                        </div>

                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-lock"></span></div>
                                            <c:set var="errorPassword">
                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </c:set>
                                            <form:input type="password"
                                                class="form-control rounded-left ${not empty errorPassword ? 'is-invalid' : ''}"
                                                placeholder="Password" path="password" />
                                            ${errorPassword}
                                        </div>

                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-lock"></span></div>
                                            <c:set var="errorConfirmPassword">
                                                <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                            </c:set>
                                            <form:input type="password"
                                                class="form-control rounded-left ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                                placeholder="Confirm Password" path="confirmPassword" />
                                            ${errorConfirmPassword}
                                        </div>

                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa">
                                                    <i class="fa fa-phone"></i>
                                                </span>
                                            </div>
                                            <c:set var="errorPhone">
                                                <form:errors path="phone" cssClass="invalid-feedback" />
                                            </c:set>
                                            <form:input type="text"
                                                class="form-control rounded-left ${not empty errorPhone ? 'is-invalid' : ''}"
                                                placeholder="Phone Number" path="phone" />
                                            ${errorPhone}
                                        </div>

                                        <div class=" form-group">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa">
                                                    <i class="fa fa-address-book"></i>
                                                </span>
                                            </div>
                                            <form:input type="text" class="form-control rounded-left"
                                                placeholder="Address" path="address" />
                                        </div>


                                        <div class=" form-group d-flex align-items-center">
                                            <div class="w-100">
                                                <label class="checkbox-wrap checkbox-primary mt-2">Save Password
                                                    <input type="checkbox" checked>
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="w-100 d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary rounded submit">Sign
                                                    Up</button>
                                            </div>
                                        </div>
                                        <div class="form-group mt-4">
                                            <div class="w-100 text-center">
                                                <p class="mb-1">Have an account? <a href="/login">Sign In</a></p>
                                                <p><a type="submit">Forgot Password</a></p>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>



                <style>
                    /* Tùy chỉnh modal */
                    .modal-header {
                        background-color: #a0c334;
                        color: white;
                        border-bottom: none;
                    }

                    .modal-title {
                        font-weight: bold;
                    }

                    .modal-body {
                        font-size: 16px;
                        padding: 20px;
                    }

                    .modal-content {
                        border-radius: 10px;
                        border: none;
                    }

                    .modal-footer {
                        border-top: none;
                    }

                    /* Nút đóng */
                    .close {
                        color: white;
                        opacity: 1;
                    }

                    .close:hover {
                        color: #333;
                    }

                    /* Điều chỉnh nút đóng */
                    .close span {
                        font-size: 24px;
                    }
                </style>
                </head>

                <body>

                    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content" style="border-radius: 10px; border: none;">
                                <div class="modal-header"
                                    style="background-color: #a0c334; color: white; border-bottom: none;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">Success
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                        style="color: white; opacity: 1;">
                                        <span aria-hidden="true" style="font-size: 24px;">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="font-size: 16px; padding: 20px;">
                                    Your registration was successful! You will be redirected to the login page in a few
                                    seconds.
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bootstrap và jQuery -->
                    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                    <script
                        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

                    <!-- Hiển thị modal nếu success = true -->
                    <script type="text/javascript">
                        $(document).ready(function () {
                            // Kiểm tra giá trị success từ EL
                            var isSuccess = "${ success ?'true': 'false'}";

                            if (isSuccess === 'true') {
                                // Hiển thị modal
                                $('#successModal').modal('show');
                                // Sau 3 giây, chuyển sang trang đăng nhập
                                setTimeout(function () {
                                    window.location.href = '/login';
                                }, 3000);
                            }
                        });
                    </script>
                </body>

            </html>