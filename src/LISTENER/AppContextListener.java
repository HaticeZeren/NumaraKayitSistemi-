package LISTENER;

import java.util.ResourceBundle;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import FACADE.ServiceFacade;

public class AppContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent ServletContext) {
		/*
		ServletContext context= ServletContext.getServletContext();
		final String JDBC_DRIVER=context.getInitParameter("JDBC_DRIVER");
		final String DB_URL=context.getInitParameter("DB_URL");
		final String USER=context.getInitParameter("USER");
		final String PASS=context.getInitParameter("PASS");
		*/
		//ServletContext context= ServletContext.getServletContext();
	//	DAO dao=FacadeClass.getFacade().getDAO();
		//context.setAttribute("dao",dao);
	    ResourceBundle bundle = ResourceBundle.getBundle( "propertiesfiles/datasource" );

		ServiceFacade.getFacade().start(bundle.getString("datasource"));
		
	}

}
