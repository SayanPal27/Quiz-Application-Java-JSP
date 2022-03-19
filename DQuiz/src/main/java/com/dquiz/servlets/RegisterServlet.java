package com.dquiz.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dquiz.dao.UserDao;
import com.dquiz.entities.UserEntity;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
UserEntity browserInputValues = new UserEntity();
		
		browserInputValues.setUserName(request.getParameter("userName"));
		browserInputValues.setUserEmail(request.getParameter("emailId"));
		browserInputValues.setUserPassword(request.getParameter("password"));
		browserInputValues.setUserPhone(Long.parseLong(request.getParameter("phone")));
		browserInputValues.setUserAddress(request.getParameter("address"));
		browserInputValues.setUserRole("ADMIN");
			
		UserDao userDBOperation = new UserDao();
		
		
		boolean isDuplicateEmail = userDBOperation.isDuplicateEmail(request.getParameter("emailId"));
		
		
		if(isDuplicateEmail) {
			
			request.setAttribute("authenticationFail", "This Email Already Exists");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
		
		else {
			boolean userSaved = userDBOperation.saveUser(browserInputValues);
			
			if(userSaved) {
				
				request.setAttribute("userSuccess",request.getParameter("userName") );
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			}
			
			
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
