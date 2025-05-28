package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class ConnexionController
 */
@WebServlet("/ConnexionController")
public class ConnexionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnexionController() {
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
		String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        HttpSession session = request.getSession();

        // Vérification Admin
        if ("admin@gmail.com".equals(email) && "1234567".equals(motDePasse)) {
            session.setAttribute("role", "admin");
            session.setAttribute("email", email);
            System.out.print("Admin");
            response.sendRedirect("admin_trajets.jsp"); // Page d'admin
            return;
        }

        // Vérification utilisateur dans la base
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findByEmailAndPassword(email, motDePasse);

        if (user != null) {
            session.setAttribute("role", "user");
            session.setAttribute("email", email);
            session.setAttribute("user", user); // Optionnel : stocker l'utilisateur
            System.out.print("User");
            response.sendRedirect("TrajetView.jsp"); // Page utilisateur
        } else {
            session.setAttribute("error", "Email ou mot de passe incorrect.");
            System.out.print("error");
            response.sendRedirect("Inscription.jsp"); // Retour à la page de connexion
        }
    }
}