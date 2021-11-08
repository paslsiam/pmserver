<!DOCTYPE html>
<html>
<head>
    <title>Php Ajax Form Validation Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>


<div class="container">
    <h1>Php Ajax Form Validation Example</h1>
    <form role="form" id="contactForm" class="contact-form" data-toggle="validator" class="shake">
        <div class="alert alert-danger display-error" style="display: none">
        </div>
        <div class="form-group">
            <div class="controls">
                <input type="text" id="username" class="form-control" placeholder="username">
            </div>
        </div>
        <div class="form-group">
            <div class="controls">
                <input type="password" class="email form-control" id="password" placeholder="password" >
            </div>
        </div>
        <button type="submit" id="submit" class="btn btn-success"><i class="fa fa-check"></i> Send Message</button>
    </form>
</div>


</body>


<script type="text/javascript">
    $(document).ready(function() {


        $('#submit').click(function(e){
            e.preventDefault();


            var username = $("#username").val();
            var password = $("#password").val();


            $.ajax({
                type: "POST",
                url: "http://pascerthai.online/getUsers.php",
                dataType: "JSON",

                data: {users:username, pass:password},
                success : function(data){
                    alert(data['statu']);
                }
            });


        });
    });
</script>
</html>
