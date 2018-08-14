# NumaraKayitSistemi-

Numara Kayıt Sistemi adlı Java web uygulaması Eclipse IDE üzerinde geliştirilmiştir.
Sunucu olarak Tomcat7 kullanılmıştır.
İlişkisel veritabanı olarak MySQL  kullanılmıştır. Uygulamaya ait myDB.sql dosyası proje içerisindedir. 

Uygulamada DAO,Facade,Singleton tasarım şablonları uygulanmış, HTML5,CSS3,Bootstrapt,Javascript kullanılmıştır.

Tomcat Realm bağlantısı için Server/context.xml içerisinde 
<Resource 
name="jdbc/myDB" 
auth="Container"
type="javax.sql.DataSource"
maxActive="100"
maxIdle="30"
maxWait="10000"
username="root" 
password="veritabani şifresi" 
driverClassName="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/mydb"
factory="org.apache.tomcat.jdbc.pool.DataSourceFactory"/>

kendinize göre ayarlayınız.
