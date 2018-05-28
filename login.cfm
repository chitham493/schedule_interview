<!DOCTYPE html> 
<html lang="en">
   <head>
      <title>Developers Login</title>
      <cfinclude template="../parts/header_include.cfm"> 
   </head>
   <body class="dev_login">
      <div class="login-page">         
         <cfif structKeyExists(session, "error_login")>
         <span id="error_login">Invalid login!!!</span>
         <cfset StructDelete(session,"error_login")>
         </cfif>        
         <form class="form_dev" action="<cfoutput> #application.domain_name#</cfoutput>login/cfc/logindb.cfc?method=logindb" name="login1" method="post">
            <div class="login_usert">
               <p>Login as <span id="user_typks">User</span> </p> 
            </div>
            <div class="login_image_hand"><img alt="crm"  src="Assets/images/developers.png" class="users_imlogo" id="img_lgsk"> <input type="radio" name="check_logger" value="admin"></div>
           <div class="login_image_hand"> <img alt="crm"  src="Assets/images/ic_user_color.png" class="users_imlogo" id="img_lgs"> <input type="radio"  name="check_logger"  value="users" checked ></div>
            <label class="error_disp error_disp_username"></label> 
            <input type="text" placeholder="username" name="username" id="username">
            <label class="error_disp error_disp_password"></label> 
            <input type="password" placeholder="password" name="password" id="passwords">
            <input type="submit" id="login_button" name="login_button" value="Login"> 
            <p class="message" id="forget_pass_link">Forget Password? <a href="#">Click Here</a></p>
         </form>
      </div>
      <cfinclude template="../parts/footer.cfm">
   </body>
</html>