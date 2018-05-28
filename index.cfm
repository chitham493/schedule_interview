<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Hr Login</title>
     <cfinclude template="parts/header_include.cfm"> 
   </head>
   <body class="dev_login">
      <div class="login-page">
         <form class="form_dev" action="" method="post">
            <img alt="crm"  src="Assets/images/developers.png" class="users_imlogo">
            <label class="error_disp error_disp_username"></label>
            <input type="text" placeholder="username" id="username" name="username" required>
            <label class="error_disp error_disp_password"></label>
            <input type="password" placeholder="password"  name="passwords"  id="passwords" required>
            <input type="submit" id="login_button" value="Login">
            <p class="message">Forget Password? <a href="#">Click Here</a></p>
         </form>
      </div>
      <cfinclude template="parts/footer_include.cfm">
   </body>
</html>