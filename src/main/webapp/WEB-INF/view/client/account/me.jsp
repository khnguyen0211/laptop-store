<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Laptop-Store Website Template</title>
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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            console.log(imgURL)
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid pt-4">
                                <div class="container pt-5 mt-5" modelAttribute="user">
                                    <div class="row pt-5">
                                        <div class="col-lg-4">
                                            <div class="card mb-4">
                                                <div class="card-body text-center">
                                                    <img src="http://localhost:8080/images/avatar/${user.getAvatar()}"
                                                        alt="avatar" class="rounded-circle img-fluid"
                                                        style="width: 150px;">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview" />
                                                    <h5 class="my-3">${user.getFullName()}</h5>
                                                    <p class="text-muted mb-1">Full Stack Developer</p>
                                                    <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                                                    <div class="d-flex justify-content-center mb-2">
                                                        <button type="button" data-mdb-button-init data-mdb-ripple-init
                                                            class="btn btn-primary form-contro">Follow</button>
                                                        <button type="button" data-mdb-button-init data-mdb-ripple-init
                                                            class="btn btn-outline-primary ms-1">Message</button>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            accept=".png, .jpg, .jpeg" name="imageFile" />
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="card mb-4 mb-lg-0">
                                                <div class="card-body p-0">
                                                    <ul class="list-group list-group-flush rounded-3">
                                                        <li
                                                            class="list-group-item d-flex justify-content-between align-items-center p-3">
                                                            <i class="fas fa-globe fa-lg text-warning"></i>
                                                            <p class="mb-0">https://mdbootstrap.com</p>
                                                        </li>
                                                        <li
                                                            class="list-group-item d-flex justify-content-between align-items-center p-3">
                                                            <i class="fab fa-github fa-lg text-body"></i>
                                                            <p class="mb-0">mdbootstrap</p>
                                                        </li>
                                                        <li
                                                            class="list-group-item d-flex justify-content-between align-items-center p-3">
                                                            <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                                            <p class="mb-0">@mdbootstrap</p>
                                                        </li>
                                                        <li
                                                            class="list-group-item d-flex justify-content-between align-items-center p-3">
                                                            <i class="fab fa-instagram fa-lg"
                                                                style="color: #ac2bac;"></i>
                                                            <p class="mb-0">mdbootstrap</p>
                                                        </li>
                                                        <li
                                                            class="list-group-item d-flex justify-content-between align-items-center p-3">
                                                            <i class="fab fa-facebook-f fa-lg"
                                                                style="color: #3b5998;"></i>
                                                            <p class="mb-0">mdbootstrap</p>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Full Name</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${user.getFullName()}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Email</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${user.getEmail()}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Phone</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0" id="phoneNumber">
                                                                ${user.getPhone()}</p>
                                                        </div>

                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Address</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${user.getAddress()}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">ROLE</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">
                                                                <b>${user.getRole().getName()}</b>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="card mb-4 mb-md-0">
                                                        <div class="card-body">
                                                            <p class="mb-4"><span
                                                                    class="text-primary font-italic me-1">assigment</span>
                                                                Project
                                                                Status
                                                            </p>
                                                            <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 80%" aria-valuenow="80"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Website
                                                                Markup</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 72%" aria-valuenow="72"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 89%" aria-valuenow="89"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile
                                                                Template</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 55%" aria-valuenow="55"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API
                                                            </p>
                                                            <div class="progress rounded mb-2" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 66%" aria-valuenow="66"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="card mb-4 mb-md-0">
                                                        <div class="card-body">
                                                            <p class="mb-4"><span
                                                                    class="text-primary font-italic me-1">assigment</span>
                                                                Project
                                                                Status
                                                            </p>
                                                            <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 80%" aria-valuenow="80"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Website
                                                                Markup</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 72%" aria-valuenow="72"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 89%" aria-valuenow="89"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile
                                                                Template</p>
                                                            <div class="progress rounded" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 55%" aria-valuenow="55"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API
                                                            </p>
                                                            <div class="progress rounded mb-2" style="height: 5px;">
                                                                <div class="progress-bar" role="progressbar"
                                                                    style="width: 66%" aria-valuenow="66"
                                                                    aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </section>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
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