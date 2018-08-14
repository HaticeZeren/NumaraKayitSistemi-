<%@page import="FACADE.ServiceFacade"%>
<%@page import="com.j32bit.training.bean.TelefonBilgisi"%>
<%@page import="java.util.List"%>

  <%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
          <link rel="stylesheet" type="text/css" href="Dizayn.css" /> 
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("ISO-8859-9");
if(request.getParameter("action")!=null){
	
	if(request.getParameter("action").equals("secim")){
		/*
		UygulamaKontrol kontrol=new UygulamaKontrol(new VeritabanIslem());
		int ID=Integer.parseInt(request.getParameter("id"));
		List<TelefonBilgisi> telefonlar=kontrol.getKisiTelefonlar(ID);
		*/
		//int ID=Integer.parseInt(request.getParameter("id"));
		//List<TelefonBilgisi> telefonlar=SingletonDAO.getDAO().getKisiTelefonlar(ID);
		List<TelefonBilgisi> telefonlar=ServiceFacade.getFacade().getKisiTelefonlar(request.getParameter("id"));
	%>
		    <table class="table table-bordered">  
                          <tr> 
                               <th width="25%">TC</th> 
                               <th width="25%">TELEFON NUMARASI</th>  
                               <th width="25%">SIL</th>  
                               <th width="25%">GUNCELLE</th> 
                          </tr>  
		   <%for(int i=0;i<telefonlar.size();i++){%>
		   
		      <tr>  
                  <td><input type="text"  value="<%=telefonlar.get(i).getID() %>" style="display:none;"><%=telefonlar.get(i).getID() %></td>  
                  <td><input  type="text" class="text" id="<%=telefonlar.get(i).getTelefon() %>" value="<%=telefonlar.get(i).getTelefon()%>"></td>
          <td><button type="button" name="delete" id="<%=telefonlar.get(i).getTelefon() %>" class="delete btn btn-danger btn-xs">Delete</button></td>
          <td><button type="button" name="info" id="<%=telefonlar.get(i).getTelefon()%>" class="info btn btn-info btn-xs">GUNCELLE</button></td>  
               
               </tr>  
		   
	          <% }%>
	          </table>
	          <%
	          
	          
	          %>
	         
	          
<%}}%>
</body>
</html>