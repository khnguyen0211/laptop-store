<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!doctype html>
            <html lang="en">

            <head>
                <title>Login</title>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="/client/css/login.css">
                <!-- jQuery -->
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <!-- Bootstrap JS -->
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

            </head>

            <body>
                <section class="ftco-section">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-7 col-lg-5">
                                <div class="login-wrap p-4 p-md-5">
                                    <div class="d-flex">
                                        <div class="w-100">
                                            <h3 class="mb-4">Sign In</h3>
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
                                    <c:if test="${param.error != null}">
                                        <div class="my-2" style="color: red;">Invalid email or password.</div>
                                    </c:if>
                                    <c:if test="${param.logout != null}">
                                        <script type="text/javascript">
                                            $(document).ready(function () {
                                                $('#logoutModal').modal('show');
                                            });
                                        </script>
                                    </c:if>
                                    <form method="POST" action="/login" class="login-form">
                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-user"></span></div>

                                            <input type="email" class="form-control rounded-left "
                                                placeholder="Username" name="username"
                                                value="pnknguyen0211@gmail.com" />
                                        </div>
                                        <div class="form-group">
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-lock">
                                                </span>
                                            </div>
                                            <input value="123456" type="password" class="form-control rounded-left "
                                                placeholder="Password" name="password" />
                                        </div>
                                        <div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </div>
                                        <div class="form-group d-flex align-items-center">
                                            <div class="w-100">
                                                <label class="checkbox-wrap checkbox-primary mb-0">Save Password
                                                    <input type="checkbox" checked>
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="w-100 d-flex justify-content-end">
                                                <button type="submit"
                                                    class="btn btn-primary rounded submit">Login</button>
                                            </div>
                                        </div>

                                    </form>
                                    <div class="mt-4">
                                        <div class="w-100 text-center">
                                            <p class="mb-1">Don't have an account? <a href="/register">Sign Up</a>
                                            </p>
                                            <p><a href="#">Forgot Password</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="border-radius: 10px;">
                            <div class="modal-header" style="background-color: #a0c334; color: white;">
                                <h5 class="modal-title" id="logoutModalLabel" style="font-weight: bold;">Logout
                                    Successful</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                    style="color: white;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="padding: 20px;">
                                You have successfully logged out. Thank you for visiting!
                            </div>
                            <div class="modal-footer" style="border-top: none;">
                                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>