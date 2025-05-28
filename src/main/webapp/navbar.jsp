
<%
    String activePage = request.getParameter("page") != null ? request.getParameter("page") : "dashboard";
%>

<!-- Font Awesome CDN pour les icônes -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css ">

<style>
    :root {
        --primary-color: #3498db;
        --secondary-color: #2c3e50;
        --bg-color: #ffffff;
        --hover-bg: #f1f1f1;
        --text-color: #2c3e50;
        --accent-color: #27ae60;
        --radius: 10px;
        --transition: all 0.3s ease;
    }

    .navbar {
        background-color: var(--bg-color);
        padding: 15px 30px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        position: sticky;
        top: 0;
        z-index: 1000;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: 'Segoe UI', sans-serif;
    }

    .logo {
        font-size: 1.6rem;
        font-weight: bold;
        color: var(--primary-color);
        letter-spacing: 1px;
    }

    .nav-links {
        display: flex;
        gap: 25px;
    }

    .nav-link {
        text-decoration: none;
        color: var(--text-color);
        font-weight: 500;
        padding: 10px 15px;
        border-radius: var(--radius);
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 6px;
        position: relative;
    }

    .nav-link:hover,
    .nav-link.active {
        background-color: var(--hover-bg);
        color: var(--primary-color);
    }

    .nav-link.active::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -5px;
        width: 100%;
        height: 3px;
        background-color: var(--primary-color);
    }

    .user-profile {
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 0.95rem;
        color: var(--secondary-color);
        font-weight: 500;
    }

    .user-icon {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background-color: var(--primary-color);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1rem;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
    }

    .menu-toggle {
        display: none;
        font-size: 1.5rem;
        color: var(--primary-color);
        cursor: pointer;
    }

    @media (max-width: 768px) {
        .nav-links {
            position: absolute;
            top: 60px;
            right: 30px;
            background-color: var(--bg-color);
            flex-direction: column;
            align-items: stretch;
            border-radius: var(--radius);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 10px 0;
            min-width: 150px;
            display: none;
        }

        .nav-links.active {
            display: flex;
        }

        .nav-link {
            padding: 12px 20px;
            justify-content: flex-start;
        }

        .menu-toggle {
            display: block;
        }
    }
</style>

<nav class="navbar">
    <div class="logo">MyTrainSeat</div>

    <div class="nav-links" id="navLinks">
        <a href="admin_trajets.jsp" class="nav-link <%= "trajets".equals(activePage) ? "active" : "" %>">
            <i class="fas fa-route"></i> Trajets
        </a>
        <a href="admin_Voyages.jsp" class="nav-link <%= "voyages".equals(activePage) ? "active" : "" %>">
            <i class="fas fa-bus"></i> Voyages
        </a>
        <a href="admin_Users.jsp" class="nav-link <%= "users".equals(activePage) ? "active" : "" %>">
            <i class="fas fa-users"></i> Utilisateurs
        </a>
        <a href="admin_Reservation.jsp" class="nav-link <%= "reservations".equals(activePage) ? "active" : "" %>">
            <i class="fas fa-ticket-alt"></i> Reservations
        </a>
        <a href="Logout.jsp" class="nav-link">
            <i class="fas fa-sign-out-alt"></i> Deconnexion
        </a>
    </div>

    <div class="user-profile">
        <div class="user-icon">A</div>
        <span>Administrateur</span>
    </div>

    <div class="menu-toggle" onclick="toggleMenu()">
        <i class="fas fa-bars"></i>
    </div>
</nav>

<script>
    function toggleMenu() {
        const navLinks = document.getElementById('navLinks');
        navLinks.classList.toggle('active');
    }
</script>