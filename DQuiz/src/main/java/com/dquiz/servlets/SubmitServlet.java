package com.dquiz.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dquiz.dao.ResponseDao;
import com.dquiz.entities.QuestionEntity;
import com.dquiz.entities.ResponseEntity;

/**
 * Servlet implementation class SubmitServlet
 */
public class SubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<QuestionEntity> questionList = (List<QuestionEntity>)request.getSession().getAttribute("questionList");
		String[] responses = request.getParameterValues("responses");
		String answers = responses[0].replace("[", "");
		answers = answers.replace("]", "");
		String[] answersSeperated = answers.split(",");
		String[] answersProper = new String[questionList.size()];
		for(int i=0;i<answersSeperated.length;i++ ) {
			if(i%2==1) {
				int n=i/2;
				answersProper[n] = answersSeperated[i].substring(10, 17);
				
			}
		}
		
		int score = 0;
		for(int i=0;i<questionList.size();i++) {
						if(answersProper[i].equalsIgnoreCase(questionList.get(i).getAnswer())) {
				score++;
			}
		}
		
		
		
		String name = request.getParameter("name");
		int totalQuestions = questionList.size();
		double percentage = (score*100)/totalQuestions;
		
		ResponseEntity userResponse = new ResponseEntity();
		
		userResponse.setName(name);
		userResponse.setTotal(totalQuestions);
		userResponse.setCorrect(score);
		userResponse.setPercentage(percentage);
		
		ResponseDao responseDBOperation = new ResponseDao();
		
		responseDBOperation.saveResponse(userResponse);
		
		request.getSession().setAttribute("summary", userResponse);
		
		request.getRequestDispatcher("/summary.jsp").forward(request, response);
		
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
