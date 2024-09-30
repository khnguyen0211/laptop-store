<!-- /WEB-INF/views/client/auth/registerSuccess.jsp -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <script>
        // Automatically redirect after 3 seconds
        setTimeout(function () {
            window.location.href = '/login';
        }, 3000);
    </script>
</head>

<body>
    <div>
        <!-- Success pop-up (can be styled as a modal) -->
        <div class="popup">
            <h2>${successMessage}</h2>
            <p>You will be redirected to the login page shortly.</p>
        </div>
    </div>
</body>

</html>