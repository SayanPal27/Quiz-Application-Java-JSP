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
 * Servlet implementation class AddQuestionServlet
 */
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		QuestionEntity newQuestion = new QuestionEntity();
		
		newQuestion.setQuestion(request.getParameter("question"));
		newQuestion.setOption1(request.getParameter("option1"));
		newQuestion.setOption2(request.getParameter("option2"));
		newQuestion.setOption3(request.getParameter("option3"));
		newQuestion.setOption4(request.getParameter("option4"));
		newQuestion.setAnswer(request.getParameter("answer"));
		
		QuestionDao questionDBOperation = new QuestionDao();
		
		boolean status = questionDBOperation.saveQuestion(newQuestion);
		
		if(status) {
			
			request.setAttribute("Upload Status","success");
			
		}
		else {
			
			request.setAttribute("Upload Status","failure");
			
		}
		
		
		
		List<QuestionEntity> questionList= questionDBOperation.getQuestionList();
		
		request.getSession().setAttribute("questionList", questionList);
		
		request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
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
