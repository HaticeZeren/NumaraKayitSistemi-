<%@page import="FACADE.ServiceFacade"%>
<%@page import="com.j32bit.training.bean.KisiBilgisi"%>
<%@page import="java.util.List"%>

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
     	      fetchTelephone();  
     	      function fetchTelephone()  
     	      {  
     	           var action = "secim"; 
     	          // var id=$('#id').val();
     	          var id=<%=request.getAttribute("TC")%>
     	           $.ajax({  
     	                url : "Telefonlar.jsp",  
     	                method:"POST",  
     	                data:{action:action,id:id},  
     	                success:function(data){
     	                    $('#action').text("TelEkle");  
     	                     $('#telefonlar').html(data);  
     	                }  
     	           });  
     	      }
     	      
     	     $('#action').click(function(){
  	    	   var telefon = $('#tel').val(); 
  	    	   //var id=$('#id').val();
  	    	   var id=<%=request.getAttribute("TC")%>
	           var action = $('#action').text();  
  	           if(telefon!='')  
  	           {  
  	                $.ajax({  
  	                     url : "DatabaseFunc",  
  	                     method:"POST",  
  	                     data:{id:id,telefon:telefon,action:action},  
  	                     success:function(data){  
  	                          alert("Telefon kayıt edilmiştir.");
  	                        $('#tel').val(''); 
  	                        fetchTelephone();  
  	                     }  
  	                });  
  	           }  
  	           else  
  	           {  
  	                alert("Alanlar Bos");  
  	           }  
  	      }); 
     	      
     	    $(document).on('click', '.delete', function(){  
 	           var id = $(this).attr("id");  
 	           if(confirm("Telefon Numarsı Kayıtlatdan Silinecektir!"))  
 	           {  
 	                var action = "TelDelete";  
 	                $.ajax({  
 	                     url:"DatabaseFunc",  
 	                     method:"POST",  
 	                     data:{telefonNum:id, action:action},  
 	                     success:function(data)  
 	                     {  
 	                    	fetchTelephone(); 
 	                          alert("Silme İşlemi Gerçekleştirildi");  
 	                     }  
 	                })  
 	           }  
 	           else  
 	           {  
 	                return false;  
 	           }  
 	      }); 
     	    
     	    
     	   $(document).on('click', '.update', function(){  
 	               var idKisi = $(this).attr("id");  
 	                //var yeni_id=$('#id').val();
 	                var yeni_id=<%=request.getAttribute("TC")%>
 	                var isim=$('#isim').val();
 	                var soyisim=$('#soyisim').val();
 	                var action = "KisiGuncelle";  
 	                if(id!='' && isim!='' && soyisim!=''){
 	                	var action = "KisiGuncelle"; 
 	                $.ajax({  
 	                     url:"DatabaseFunc",  
 	                     method:"POST",  
 	                     //data:{id:id, action:action,isim:isim,soyisim:soyisim,idKisi:idKisi},
 	                     data:{id:idKisi,yeniID:yeni_id,action:action,isim:isim,soyisim:soyisim},
 	                     success:function(data)  
 	                     {  
 	                    	fetchTelephone(); 
 	                          alert("kisi guncellendi!");  
 	                     }  
 	                })  
 	                }
 	                else  alert("Alanları Boş Bırakmayınız!"); 
 	      }); 
     	   
     	  $(document).on('click', '.info', function(){ 
               var eski_tel = $(this).attr("id");  
                //var id=$('#id').val();
                var id=<%=request.getAttribute("TC")%>
               var yeni_tel=$('#'+eski_tel).val();
                //$('#'+eski_tel).val(); ifade de text ile buton aynı id değerine sahip böylelikle hangi
                //text değiştirileceği biliniyor
                var action = "TelGuncelle";  
             	
                if(yeni_tel!=''){
                $.ajax({  
                     url:"DatabaseFunc",  
                     method:"POST",  
                     //data:{id:id, action:action,isim:isim,soyisim:soyisim,idKisi:idKisi},
                     data:{eskitel:eski_tel,yenitel:yeni_tel,action:action},
                     success:function(data)  
                     {  
                    	fetchTelephone(); 
                          alert("telefon guncellendi");  
                     }  
                })  
                }
                else if(yeni_tel=='') alert("Alanı Boş Bırakmayınız");
      }); 
           
           });
           </script>
<body> 
<div class="container box">
<label>Telefon Numarası</label>  
<input type="text" name="tel" id="tel" class="form-control" />  
                
 <div align="center">  
 <br>
<button type="button" name="action" id="action" class="btn btn-warning">Ekle</button>  
</div>  
</div>
<br><br>
<table class="table table-bordered">
<tr>
<th width="25%">TC</th> 
<th width="25%">ISIM</th>
<th width="25%">SOYISIM</th>
<th width="25%">DEGISTIR</th>
</tr>
<tr>
<%

//int ID=Integer.parseInt(request.getParameter("id"));
/*
UygulamaKontrol kontrol=new UygulamaKontrol(new VeritabanIslem());
KisiBilgisi kisi=kontrol.getKisiBilgi(ID);
*/

//KisiBilgisi kisi=SingletonDAO.getDAO().getKisiBilgi(ID);
String TC=request.getAttribute("TC").toString();
KisiBilgisi kisi=ServiceFacade.getFacade().getKisiBilgisi(TC);
%>
            
             <td><input type="text"  id="id" name="id" value="<%=kisi.getID()%>" style="display:none;"><%=kisi.getID()%></td>
             <td><input  type="text" id="isim" name="isim"  value="<%=kisi.getIsim()%>"></td>
             <td><input  type="text"  id="soyisim" name="soyisim" value="<%=kisi.getSoyisim()%>"></td>
            <td><button type="button" name="update" id="<%=kisi.getID()%>" class="update btn btn-success btn-xs">GUNCELLE</button></td>
             
            
</tr>
</table>
<br><br>
<div  id="telefonlar"  class="table-responsive"></div>


</body>
</html>