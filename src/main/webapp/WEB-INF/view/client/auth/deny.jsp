<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <style>
                @import url(https://fonts.googleapis.com/css?family=Raleway:700);

                *,
                *:before,
                *:after {
                    box-sizing: border-box;
                }

                html {
                    height: 100%;
                }

                body {
                    font-family: 'Raleway', sans-serif;
                    background-color: #81c408;
                    /* Đổi màu nền thành #81c408 */
                    height: 100%;
                    padding: 10px;
                }

                a {
                    color: #FFFFFF !important;
                    /* Đổi màu chữ thành trắng */
                    text-decoration: none;
                }

                a:hover {
                    color: #000000 !important;
                    /* Đổi màu hover thành đen */
                    text-decoration: none;
                }

                .text-wrapper {
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                }

                .title {
                    font-size: 5em;
                    font-weight: 700;
                    color: #FFFFFF;
                    /* Đổi màu tiêu đề thành trắng */
                }

                .subtitle {
                    font-size: 40px;
                    font-weight: 700;
                    color: #FFFFFF;
                    /* Đổi màu phụ đề thành trắng */
                }

                .isi {
                    font-size: 18px;
                    text-align: center;
                    margin: 30px;
                    padding: 20px;
                    color: #000000;
                    /* Đổi màu nội dung thành đen */
                }

                .buttons {
                    margin: 30px;
                    font-weight: 700;
                    border: 2px solid #FFFFFF;
                    /* Đổi viền thành trắng */
                    text-decoration: none;
                    padding: 15px;
                    text-transform: uppercase;
                    color: #FFFFFF;
                    /* Đổi màu chữ thành trắng */
                    border-radius: 26px;
                    transition: all 0.2s ease-in-out;
                    display: inline-block;
                }

                .buttons:hover {
                    background-color: #FFFFFF;
                    /* Đổi màu nền nút khi hover thành trắng */
                    color: #000000;
                    /* Đổi màu chữ khi hover thành đen */
                    transition: all 0.2s ease-in-out;
                }
            </style>

            <div class="text-wrapper">
                <div class="title" data-content="404">
                    403 - ACCESS DENIED
                </div>

                <div class="subtitle">
                    Oops, You don't have permission to access this page.
                </div>
                <div class="isi">
                    A web server may return a 403 Forbidden HTTP status code in response to a request from a client for
                    a web page or resource to indicate that the server can be reached and understood the request, but
                    refuses to
                    take any further action. Status code 403 responses are the result of the web server being configured
                    to deny
                    access, for some reason, to the requested resource by the client.
                </div>

                <div class="buttons">
                    <a class="button" href="/">Go to homepage</a>
                </div>
            </div>