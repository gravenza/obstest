<!DOCTYPE html>
<html>
<head>
    <title>OBS Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container mt-4">
    <div class="row mt-4">
        <div class="col-lg-4 offset-lg-4">
            <h3>Welcome to OBS Test</h3>
            <div class="card">
                <div class="card-header">Login Here</div>
                <div class="card-body">
                    <form id="loginForm" action="" method="POST">
                        <div class="row mb-3">
                            <div class="col-12">
                                <label for="userID" class="col-form-label">User ID:</label>
                                <input type="text" id="userID" name="userID" class="form-control">
                                <span id="userIDError" style="font-style: italic; font-size: 10px; color: red" class="error-message"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12">
                                <label for="password" class="col-form-label">Password:</label>
                                <input type="password" id="password" class="form-control" name="password">
                                <span id="passwordError" style="font-style: italic; font-size: 10px; color: red" class="error-message"></span>
                            </div>
                        </div>
                        <div class="text-end">
                            <input type="submit" class="btn btn-sm btn-primary" value="Login">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#loginForm').submit(function(event) {
            event.preventDefault(); // Prevent form submission

            // Clear previous error messages
            $('.error-message').text('');

            // Retrieve input values
            var userID = $('#userID').val();
            var password = $('#password').val();

            // Validate user ID field
            if (userID.length < 8) {
                $('#userIDError').text('User ID must be at least 8 characters.');
            }

            // Validate password field
            if (password.length < 8) {
                $("#passwordError").text("Password must be at least 8 characters long.");
                valid = false;
            } else if (!/[a-z]/.test(password) || !/[A-Z]/.test(password)) {
                $("#passwordError").text("Password must contain both upper and lower case letters.");
                valid = false;
            } else if (!/[!@#$%^&*]/.test(password)) {
                $("#passwordError").text("Password must contain special characters (!@#$%^&*).");
                valid = false;
            } else {
                $("#passwordError").text("");
            }

            // If there are no error messages, submit the form
            if ($('.error-message').text() === '') {

                fetch("/doLogin", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({ username: userID, password: password })
                })
                    .then(response => response.json())
                    .then(data => {

                        if(data.status === 'Success'){
                            window.location.reload();
                        }else {
                            $("#passwordError").text(data.message);
                        }
                    })
                    .catch(error => {
                        console.error(error);
                    });
            }
        });
    });
</script>
</body>
</html>