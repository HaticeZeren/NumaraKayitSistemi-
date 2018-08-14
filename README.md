# NumaraKayitSistemi-

Numara Kayıt Sistemi adlı Java web uygulaması Eclipse IDE üzerinde geliştirilmiştir.
Sunucu olarak Tomcat7 kullanılmıştır.
İlişkisel veritabanı olarak MySQL  kullanılmıştır. Uygulamaya ait myDB.sql dosyası proje içerisindedir. 

Uygulamada DAO,Facade,Singleton tasarım şablonları uygulanmış, HTML5,CSS3,Bootstrapt,Javascript kullanılmıştır.

Tomcat Realm bağlantısı için Server/context.xml içerisinde  bağlantı bilgilerinizi kendinize göre ayarlayınız.

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
factory="org.apache.tomcat.jdbc.pool.DataSourceFactory" >

Server/server.xml içerisinde yetkilendirme& kimliklendirme ayarlarını yapınız.
<Realm className="org.apache.catalina.realm.JDBCRealm" connectionName="realm_access" connectionPassword="realmpass" connectionURL="jdbc:mysql://localhost:3306/mydb" driverName="com.mysql.jdbc.Driver" name="login" roleNameCol="role_name" userCredCol="password" userNameCol="user_name" userRoleTable="tomcat_users_roles" userTable="tomcat_users"/>


