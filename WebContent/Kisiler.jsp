<%@page import="com.j32bit.training.bean.KisiBilgisi"%>
<%@page import="FACADE.ServiceFacade"%>
<%@page import="java.util.List"%>

    <%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Insert title here</title>
          <link rel="stylesheet" type="text/css" href="Dizayn.css" />  

</head>
<body>
<%
if(request.getParameter("action")!=null) {
	request.setCharacterEncoding("ISO-8859-9");
if(request.getParameter("action").equals("select")){
	/*
    UygulamaKontrol kontrol=new UygulamaKontrol(new VeritabanIslem());
   List<KisiBilgisi> kisiler=kontrol.getKisiListesi();
   */
  // List<KisiBilgisi> kisiler=SingletonDAO.getDAO().getKisiListesi();
  List<KisiBilgisi> kisiler=ServiceFacade.getFacade().getKisiListesi();
   %>
             <table class="table table-bordered">  
                          <tr> 
                               <th width="10%">TC</th> 
                               <th width="35%">ISIM</th>  
                               <th width="35%">SOYISIM</th>  
                               <th width="10%">GUNCELLE</th>  
                               <th width="10%">SIL</th>  
                          </tr>  
              <% for(int i=0;i<kisiler.size();i++){
                 KisiBilgisi kisi=kisiler.get(i);
                 System.out.println(kisi.getID());
                 System.out.println(kisi.getIsim());
                 System.out.println(kisi.getSoyisim());

              %>
                 <tr>  
                  <td><%=kisi.getID()%></td>  
                  <td><%=kisi.getIsim()%></td>
                  <td><%=kisi.getSoyisim() %></td>  
   <td><button type="button" name="update" id="<%=kisi.getID() %>" class="update btn btn-success btn-xs">Update</button></td>  
   <td><button type="button" name="delete" id="<%=kisi.getID()%>" class="delete btn btn-danger btn-xs">Delete</button></td>  
               </tr>  
   
                 <%}%>
                 </table>
<%}
}
else {
	System.out.println("action:null");
}

%>
</body>
</html>