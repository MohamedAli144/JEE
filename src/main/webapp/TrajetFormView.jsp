<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un trajet</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter :wght@400;700&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #e6f7fd;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 60px;
            padding: 40px;
            max-width: 1200px;
        }

        /* Formulaire */
        .card {
            background: #fff;
            border-radius: 20px;
            padding: 30px;
            width: 340px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .card input,
        .card select {
            width: 100%;
            border: none;
            border-bottom: 1px solid #ccc;
            padding: 12px;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .card .promo {
            font-size: 20px;
            font-weight: bold;
            color: #003B4E;
            margin-top: 10px;
        }

        .card .promo span {
            color: #00b2ff;
        }

        .card button {
            margin-top: 20px;
            width: 100%;
            padding: 14px;
            background-color: #00b2ff;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s;
        }

        .card button:hover {
            background-color: #007fc1;
        }

        /* Train illustration */
        .illustration {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .train {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .train-body {
            width: 220px;
            height: 100px;
            background-color: #009dff;
            border-radius: 10px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .window {
            width: 30px;
            height: 30px;
            background-color: white;
            border-radius: 5px;
        }

        .wheels {
            display: flex;
            justify-content: space-between;
            width: 100px;
            margin-top: 10px;
        }

        .wheel {
            width: 20px;
            height: 20px;
            background-color: #004d73;
            border-radius: 50%;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                gap: 30px;
            }

            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="container">

    <!-- Formulaire -->
    <div class="card">
        <form method="post" action="TrajetController">

            <input type="text" name="depart" placeholder="Paris" required>
            <input type="text" name="destination" placeholder="Toulouse" required>
            <input type="date" name="date" required>

            <div class="promo">Économisez jusqu'à <span>72 €</span><br> sur votre premier trajet</div>
            <button type="submit">Publier un trajet</button>

        </form>
    </div>

    <!-- Illustration train -->
    <div class="illustration">
        <div class="train">
            <div class="train-body">
                <div class="window"></div>
                <div class="window"></div>
                <div class="window"></div>
            </div>
            <div class="wheels">
                <div class="wheel"></div>
                <div class="wheel"></div>
            </div>
        </div>
    </div>

</div>

</body>
</html>