package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Personne;

import java.io.IOException;
import java.util.List;

import dao.PersonneDAO;

/**
 * Servlet implementation class Personne2Controller
 */
@WebServlet("/Personne2Controller")
public class Personne2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private PersonneDAO pdao;
	 public Personne2Controller() {
	 super();
	 pdao=new PersonneDAO();
	 }
       
    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    		 String message="";
    		 if(request.getParameter("id")!=null) {
    		 message="suppression impossible";
    		 long id=Long.parseLong(request.getParameter("id"));
    		 if(pdao.delete(id))
    		 message="suppression de la personne "+id+" avec succes";
    		 }
    		 
    		 if(request.getParameter("idUpdate")!=null) {
        		 long id = Long.parseLong(request.getParameter("idUpdate"));
        		 Personne p = pdao.findById(id);
        		 
        		 request.setAttribute("personne",p);
        		 RequestDispatcher rd=getServletContext().getRequestDispatcher("/PersonneUpdate.jsp");
        		 rd.forward(request, response);
        		 }
    		 
    		 else {
    		 List<Personne> results = pdao.findAll();
    		 request.setAttribute("listPersonne",results);
    		 request.setAttribute("message",message);
    		 RequestDispatcher rd=getServletContext().getRequestDispatcher("/PersonneView");
    		 rd.forward(request, response);}
    		 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    		 String message="";
    		 if(request.getParameter("create")!=null) {
    		 message="creation impossible";
    		 String cin=request.getParameter("cin");
    		 String prenom=request.getParameter("prenom");
    		 String nom=request.getParameter("nom");
    		 Personne p=new Personne(cin,nom,prenom);
    		 if(pdao.create(p))
    		 message="personne "+cin+" cree avec succes";
    		 }
    		 else if(request.getParameter("update")!=null) {
    			 message="mise a jour impossible";
    			 Long id=Long.parseLong(request.getParameter("id"));
    			 String cin=request.getParameter("cin");
    			 String prenom=request.getParameter("prenom");
    			 String nom=request.getParameter("nom");
    			 if(pdao.update(id,cin,nom,prenom))
    			 message="personne "+cin+" mis a jour avec succes";
    			 }
    			 List<Personne> results = pdao.findAll();
    			 request.setAttribute("listPersonne",results);
    			 request.setAttribute("message",message);
    			 RequestDispatcher rd=getServletContext().getRequestDispatcher("/PersonneView");
    			 rd.forward(request, response);
    			 }

}
