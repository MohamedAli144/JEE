package controller;

import dao.ReservationDAO;
import dao.UserDAO;
import dao.VoyageDAO;
import model.Reservation;
import model.User;
import model.Voyage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("/ReservationController")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        // Vérifier si l'utilisateur est connecté
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("user") == null) {
	            response.sendRedirect("connexion.jsp");
	            return;
	        }

	        // Récupérer les paramètres depuis le formulaire
	        long idVoyage = Long.parseLong(request.getParameter("idVoyage"));
	        long nbClass1 = Long.parseLong(request.getParameter("nb_class1"));
	        long nbClass2 = Long.parseLong(request.getParameter("nb_class2"));
	        long nbClass3 = Long.parseLong(request.getParameter("nb_class3"));
	        Long total = Long.parseLong(request.getParameter("total"));

	        // Récupérer le voyage depuis la base de données
	        VoyageDAO voyageDAO = new VoyageDAO();
	        Voyage voyage = voyageDAO.findById(idVoyage);

	        if (voyage == null) {
	            request.setAttribute("error", "Voyage introuvable");
	            request.getRequestDispatcher("/error.jsp").forward(request, response);
	            return;
	        }

	        User user = (User) session.getAttribute("user");

	        // Créer la réservation
	        Reservation reservation = new Reservation();
	        reservation.setVoyageId(idVoyage);
	        reservation.setNbp_resv_c1(nbClass1);
	        reservation.setNbp_resv_c2(nbClass2);
	        reservation.setNbp_resv_c3(nbClass3);
	        reservation.setSomme(total);
	        reservation.setUserId(user.getId());

	        // Sauvegarder la réservation
	        ReservationDAO reservationDAO = new ReservationDAO();
	        reservationDAO.create(reservation);

	        // Passer les données à la JSP
	        request.setAttribute("reservation", reservation);
	        request.setAttribute("voyage", voyage);
	        request.getRequestDispatcher("/TrajetView.jsp").forward(request, response);

	    } catch (Exception e) {
	        // En cas d'erreur, rediriger vers la page de connexion
	        response.sendRedirect("connexion.jsp");
	    }
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Pas utilisé ici
		response.sendRedirect("reservationView.jsp");
	}
}
