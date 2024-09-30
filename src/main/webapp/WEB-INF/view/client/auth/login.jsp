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
                <link rel="stylesheet" href="client/css/login.css">

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
                                    <form:form method="POST" action="/login" class="login-form"
                                        modelAttribute="loginUser">
                                        <div class="form-group">
                                            <c:set var="errorEmail">
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-user"></span></div>

                                            <form:input type="email"
                                                class="form-control rounded-left ${not empty errorEmail ? 'is-invalid' : ''}"
                                                placeholder="Username" path="email" />
                                            ${errorEmail}
                                        </div>
                                        <div class="form-group">
                                            <c:set var="errorPassword">
                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="icon d-flex align-items-center justify-content-center"><span
                                                    class="fa fa-lock">
                                                </span>
                                            </div>
                                            <form:input type="password"
                                                class="form-control rounded-left ${not empty errorPassword ? 'is-invalid' : ''}"
                                                placeholder="Password" path="password" />
                                            ${errorPassword}
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
                                        <div class="form-group mt-4">
                                            <div class="w-100 text-center">
                                                <p class="mb-1">Don't have an account? <a href="/register">Sign Up</a>
                                                </p>
                                                <p><a href="#">Forgot Password</a></p>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </body>

            </html>