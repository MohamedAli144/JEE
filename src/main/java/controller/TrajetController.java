package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Trajet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import dao.TrajetDAO;

/**
 * Servlet implementation class TrajetController
 */
@WebServlet("/TrajetController")
public class TrajetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrajetController() {
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
		// Encodage UTF-8 pour gérer les caractères spéciaux
        request.setCharacterEncoding("UTF-8");

        // Récupération des paramètres du formulaire
        String depart = request.getParameter("depart");
        String destination = request.getParameter("destination");
        String dateStr = request.getParameter("date");

        // Validation simple
        if (depart == null || destination == null || dateStr == null ||
            depart.trim().isEmpty() || destination.trim().isEmpty() || dateStr.trim().isEmpty()) {

            HttpSession session = request.getSession();
            session.setAttribute("error", "Veuillez remplir tous les champs.");
            response.sendRedirect("TrajetFormView.jsp");
            return;
        }

        // Conversion de la date
        java.util.Date parsedDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            parsedDate = sdf.parse(dateStr);
        } catch (ParseException e) {
            HttpSession session = request.getSession();
            session.setAttribute("error", "Format de date invalide.");
            response.sendRedirect("TrajetFormView.jsp");
            return;
        }

        // Création de l'objet Trajet
        Trajet trajet = new Trajet();
        trajet.setVille_Depart(depart);
        trajet.setDestination(destination);
        trajet.setDate(new java.sql.Date(parsedDate.getTime())); // Si votre modèle attend java.sql.Date

        // Insertion via TrajetDAO
        TrajetDAO trajetDAO = new TrajetDAO();
        boolean success = false;
        try {
            success = trajetDAO.create(trajet);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Gestion des résultats
        HttpSession session = request.getSession();
        if (success) {
            session.setAttribute("success", "Trajet publié avec succès !");
        } else {
            session.setAttribute("error", "Erreur lors de l'enregistrement du trajet.");
        }

        // Redirection
        request.setAttribute("trajet", trajet);
        request.getRequestDispatcher("createVoyage.jsp").forward(request, response); // ou une autre page de résultats
    }
}