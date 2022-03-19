package com.dquiz.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dquiz.dao.QuestionDao;
import com.dquiz.dao.UserDao;
import com.dquiz.entities.QuestionEntity;
import com.dquiz.entities.UserEntity;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		UserDao userDBOperation = new UserDao();
		UserEntity validUser = userDBOperation.isUserValid(request.getParameter("email"), request.getParameter("password"));
		
		
		
		if(null == validUser) {
			
			request.getSession().setAttribute("email", "failure");
			
			request.setAttribute("authenticationFail", "User Does Not Exist");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		else {
						
			String userRole = validUser.getUserRole();
			
			if(userRole.equalsIgnoreCase("ADMIN")) {
//				
				request.getSession().setAttribute("userObj", validUser);
				
				QuestionDao questionDBOperation = new QuestionDao();
				
				List<QuestionEntity> questionList= questionDBOperation.getQuestionList();
				
				request.getSession().setAttribute("questionList", questionList);
				
				request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
				
			}
			else {
				
				
//			request.getSession().setAttribute("email", "success");
			request.getSession().setAttribute("userObj", validUser);
			
			request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
