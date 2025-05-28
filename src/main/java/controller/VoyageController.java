package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Trajet;
import model.Voyage;

import java.io.IOException;

import dao.PersonneDAO;
import dao.TrajetDAO;
import dao.VoyageDAO;

/**
 * Servlet implementation class VoyageController
 */
@WebServlet("/VoyageController")
public class VoyageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VoyageDAO vdao;
	private TrajetDAO tdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoyageController() {
        super();
        vdao=new VoyageDAO();
        tdao=new TrajetDAO();
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
	
	private long parseLongSafe(HttpServletRequest request, String paramName) {
	    String value = request.getParameter(paramName);
	    if (value == null || value.trim().isEmpty()) {
	        throw new IllegalArgumentException("Le paramètre '" + paramName + "' est requis.");
	    }
	    return Long.parseLong(value);
	}

	private int parseIntSafe(HttpServletRequest request, String paramName) {
	    String value = request.getParameter(paramName);
	    if (value == null || value.trim().isEmpty()) {
	        throw new IllegalArgumentException("Le paramètre '" + paramName + "' est requis.");
	    }
	    return Integer.parseInt(value);
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	        request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");

	        long nbp_class1 = parseLongSafe(request, "nbp_class1");
	        long prix_class1 = parseLongSafe(request, "prix_class1");

	        long nbp_class2 = parseLongSafe(request, "nbp_class2");
	        long prix_class2 = parseLongSafe(request, "prix_class2");

	        long nbp_class3 = parseLongSafe(request, "nbp_class3");
	        long prix_class3 = parseLongSafe(request, "prix_class3");

	        int trajetId = parseIntSafe(request, "trajet_id");

	        Trajet trajet = tdao.findById(trajetId);
	        Voyage voyage = new Voyage(nbp_class1, nbp_class2, nbp_class3, prix_class1, prix_class2, prix_class3, trajet);
	        vdao.create(voyage);

	        response.sendRedirect("admin_trajets.jsp");

	   
	}}
