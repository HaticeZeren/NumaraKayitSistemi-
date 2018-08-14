 <%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>  
           <title>Sistemde Kayıtlı Kisiler</title>  
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
          <link rel="stylesheet" type="text/css" href="Dizayn.css" />  
            
           
           
           <script src="http://code.jquery.com/jquery-latest.min.js"></script>
           <script>
           
           $(document).ready(function(){  
        	      fetchUser();  
        	      function fetchUser()  
        	      {  
        	           var action = "select";  
        	           $.ajax({  
        	                url : "Kisiler.jsp",  
        	                method:"POST",  
        	                data:{action:action},  
        	                success:function(data){
        	                	 $('#telephone_num').val('');
        	                	 $('#tc').val(''); 
        	                     $('#first_name').val('');  
        	                     $('#last_name').val('');  
        	                     $('#action').text("Add");  
        	                     $('#result').html(data);  
        	                }  
        	           });  
        	      }
        	      
        	      $('#action').click(function(){
        	    	   var tC = $('#tc').val(); 
        	           var firstName = $('#first_name').val();  
        	           var lastName = $('#last_name').val();  
        	           var telephone_num=$('#telephone_num').val();
        	          // var id = $('#user_id').val();  
        	           var action = $('#action').text(); 
        	           
        	           if(tC!='' && firstName != '' && lastName != '')  
        	           {  
        	                $.ajax({  
        	                     url : "DatabaseFunc",  
        	                     method:"POST",  
        	                     data:{firstName:firstName, lastName:lastName, id:tC, action:action,telephone:telephone_num},  
        	                     success:function(data){  
        	                         alert("kisi eklendi");  
        	           	           //else alert("kisi eklendi"); 
        	                          fetchUser();  
        	                     }  
        	                });  
        	           }  
        	           else  alert("Alanlar Bos");  

        	           
        	           
        	      }); 
        	      $(document).on('click', '.delete', function(){  
        	           var id = $(this).attr("id");
        	           
        	           
        	        	   if(confirm("Kisinin tüm kayıtları silenecektir!"))  
            	           {  
            	                var action = "Delete";  
            	                $.ajax({  
            	                     url:"DatabaseFunc",  
            	                     method:"POST",  
            	                     data:{id:id, action:action},  
            	                     success:function(data)  
            	                     {  
            	                          fetchUser();  
            	                          alert("Kişinin Kaydı Silinmiştir");  
            	                     }  
            	                })  
            	           }   
        	           
        	     
        	          
        	      });
        	      
        	      $(document).on('click', '.update', function(){  
        	           var id = $(this).attr("id"); 
        	           var action = "Update";  
        	           $.ajax({  
        	                //url:"http://localhost:8080/NumaraKayitSistemi/Listele",  
        	                method:"GET",  
        	                data:{action:action,id:id}, 
        	                success:function(data){ 
                                //alert(id);
                                // document.getElementsByTagName("p")[0].setAttribute("TC",id); 
        	                	window.location.href="http://localhost:8080/NumaraKayitSistemi/Listele?id="+id+"&&action="+action;
        	                	//window.location.href="http://localhost:8080/NumaraKayitSistemi/Listele";
        	                }  
        	           }) 
        	        
        	      
        	      });   
           });
          </script>
      </head>  
</head>
<body>
<div class="container box">

                  
                <h3 align="center">Sistemde Kayıtlı Kisiler</h3>  
                
                <br /><br />  
                <br /><br />  
                <label>TC</label>  
                <input type="text" name="tc" id="tc" class="form-control" />  
                <br />  
                <label>ISIM</label>  
                <input type="text" name="first_name" id="first_name" class="form-control" />  
                <br />  
                <label>SOYISIM</label>  
                <input type="text" name="last_name" id="last_name" class="form-control" />  
                <br />
                <label>TELEFON</label>  
                <input type="text" name="telephone_num" id="telephone_num" class="form-control" />  
                <br />  
                <br />  
                <div align="center">  
                     <input type="hidden" name="id" id="user_id" />  
                     <button type="button" name="action" id="action" class="btn btn-warning">Add</button>  
                </div>  
                <br />  
                <br />  
                <div id="result" class="table-responsive">  
                </div>  
           </div>  
      </body>  
</body>
</html>