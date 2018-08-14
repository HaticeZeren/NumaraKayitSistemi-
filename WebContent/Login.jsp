<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
          <link rel="stylesheet" type="text/css" href="LoginDesign.css" />  
</head>
<body>


        <form  class="container" id="kutu" action="j_security_check">
             <center><h2>GİRİŞ</h2></center>
               <br />  
               <br />
                <label>KULLANICI ADI</label>  
                <input type="text" name="j_username"  class="form-control" />  
                <br />  
                <label>SIFRE</label>  
                <input type="password" name="j_password" class="form-control" />  
                <br />
                <center>
                <input type="submit" value="Submit"/>
                <input type="reset" value="Reset"/>
                </center>
        </form>      



</body>
</html>