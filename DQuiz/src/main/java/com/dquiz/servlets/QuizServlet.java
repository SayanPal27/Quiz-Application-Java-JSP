package com.dquiz.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dquiz.dao.QuestionDao;
import com.dquiz.entities.QuestionEntity;

/**
 * Servlet implementation class QuizServlet
 */
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		QuestionDao questionDBOperation = new QuestionDao();
		
		List<QuestionEntity> questionList = questionDBOperation.getQuestionList();
		
		String name = request.getParameter("userName");
		
		request.getSession().setAttribute("name", name);
		
		request.getSession().setAttribute("questionList", questionList);
		
		request.getRequestDispatcher("/quiz.jsp?qno=1").forward(request, response);
		
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
