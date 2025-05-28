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
 * Servlet implementation class editVoyageController
 */
@WebServlet("/editVoyageController")
public class editVoyageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrajetDAO tdao;
	private VoyageDAO vdao;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editVoyageController() {
        super();
        tdao=new TrajetDAO();
        vdao=new VoyageDAO();
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
		 request.setCharacterEncoding("UTF-8");

	        try {
	        	long id = Long.parseLong(request.getParameter("id"));
	        	long trajetId = Long.parseLong(request.getParameter("trajet_id"));
	        	long nbp1 = Long.parseLong(request.getParameter("nbp_class1"));
	        	long prix1 = Long.parseLong(request.getParameter("prix_class1"));
	        	long nbp2 = Long.parseLong(request.getParameter("nbp_class2"));
	        	long prix2 = Long.parseLong(request.getParameter("prix_class2"));
	        	long nbp3 = Long.parseLong(request.getParameter("nbp_class3"));
	        	long prix3 = Long.parseLong(request.getParameter("prix_class3"));

	            Trajet trajet= tdao.findById(trajetId);

	            vdao.update(id,nbp1,nbp2,nbp3,prix1,prix2,prix3,trajet);

	            response.sendRedirect("admin_Voyages.jsp");

	        } catch (NumberFormatException e) {
	            request.setAttribute("error", "Erreur dans les données saisies.");
	            request.getRequestDispatcher("voyages.jsp").forward(request, response);
	        }
	    }
	}
