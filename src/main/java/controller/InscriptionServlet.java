package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class InscriptionServlet
 */
@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO udao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
        super();
        udao=new UserDAO();
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
		// Définir l'encodage UTF-8 pour gérer les caractères spéciaux
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Récupération des paramètres du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String confirmerMotDePasse = request.getParameter("confirmerMotDePasse");
        

        // Variable pour stocker les erreurs
        String errorMessage = null;

        // Validation simple
        if (nom == null || nom.trim().isEmpty()) {
            errorMessage = "Le nom est requis.";
        } else if (prenom == null || prenom.trim().isEmpty()) {
            errorMessage = "Le prénom est requis.";
        } else if (email == null || email.trim().isEmpty()) {
            errorMessage = "L'e-mail est requis.";
        } else if (!email.contains("@")) {
            errorMessage = "Veuillez entrer une adresse e-mail valide.";
        } else if (motDePasse == null || motDePasse.length() < 6) {
            errorMessage = "Le mot de passe doit contenir au moins 6 caractères.";
        } else if (!motDePasse.equals(confirmerMotDePasse)) {
            errorMessage = "Les mots de passe ne correspondent pas.";
        }

        // Si erreur, renvoyer sur le formulaire avec message
        if (errorMessage != null) {
            request.setAttribute("erreur", errorMessage);
            request.getRequestDispatcher("Inscription.jsp").forward(request, response);
            return;
        }
        
        User user = new User(email,motDePasse,nom,prenom );
        udao.create(user);

        // TODO : Ici, vous pouvez insérer les données dans la base de données

        // Exemple de simulation d'insertion réussie
        System.out.println("Utilisateur inscrit : " + email);

        // Redirection vers une page de confirmation
        response.sendRedirect("confirmation.jsp");
    }

}
