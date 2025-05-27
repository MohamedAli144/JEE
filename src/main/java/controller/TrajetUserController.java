package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Trajet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import dao.TrajetDAO;

/**
 * Servlet implementation class TrajetUserController
 */
@WebServlet("/TrajetUserController")
public class TrajetUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrajetUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String depart = request.getParameter("depart");
        String destination = request.getParameter("destination");
        java.sql.Date date =java.sql.Date.valueOf(request.getParameter("date"));
        		;

        TrajetDAO dao = new TrajetDAO();
        List<Trajet> trajets = dao.findByCriteria(depart, destination, date);

        request.setAttribute("trajets", trajets);
        request.setAttribute("resultats", trajets);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}