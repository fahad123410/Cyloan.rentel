[1mdiff --git a/README.md b/README.md[m
[1mdeleted file mode 100644[m
[1mindex 60231c8..0000000[m
Binary files a/README.md and /dev/null differ
[1mdiff --git a/fahad.gitignore b/fahad.gitignore[m
[1mdeleted file mode 100644[m
[1mindex 7856bb0..0000000[m
[1m--- a/fahad.gitignore[m
[1m+++ /dev/null[m
[36m@@ -1,4 +0,0 @@[m
[31m-*.db[m
[31m-*.sqlite[m
[31m-*.sqlite3[m
[31m-uploads/[m
\ No newline at end of file[m
[1mdiff --git a/index.html b/index.html[m
[1mdeleted file mode 100644[m
[1mindex 7cd5ad0..0000000[m
[1m--- a/index.html[m
[1m+++ /dev/null[m
[36m@@ -1,4254 +0,0 @@[m
[31m-<!DOCTYPE html>[m
[31m-<html lang="en">[m
[31m-<head>[m
[31m-    <meta charset="UTF-8">[m
[31m-    <meta name="viewport" content="width=device-width, initial-scale=1.0">[m
[31m-    <title>Fahad Premium Rentals - Luxury Car Rental in Sri Lanka</title>[m
[31m-    [m
[31m-    <!-- Font Awesome 6 -->[m
[31m-    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">[m
[31m-    [m
[31m-    <!-- Bootstrap 5 -->[m
[31m-    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">[m
[31m-    [m
[31m-    <!-- Google Fonts -->[m
[31m-    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">[m
[31m-[m
[31m-    <!-- SQLite in browser (sql.js) -->[m
[31m-    <script src="https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.11.0/sql-wasm.js"></script>[m
[31m-    [m
[31m-    <style>[m
[31m-        * {[m
[31m-            margin: 0;[m
[31m-            padding: 0;[m
[31m-            box-sizing: border-box;[m
[31m-            font-family: 'Poppins', sans-serif;[m
[31m-        }[m
[31m-        [m
[31m-        body {[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            min-height: 100vh;[m
[31m-            position: relative;[m
[31m-            overflow-x: hidden;[m
[31m-        }[m
[31m-        [m
[31m-        .bg-bubbles {[m
[31m-            position: fixed;[m
[31m-            top: 0;[m
[31m-            left: 0;[m
[31m-            width: 100%;[m
[31m-            height: 100%;[m
[31m-            z-index: 1;[m
[31m-            overflow: hidden;[m
[31m-            pointer-events: none;[m
[31m-        }[m
[31m-        [m
[31m-        .bg-bubbles li {[m
[31m-            position: absolute;[m
[31m-            list-style: none;[m
[31m-            display: block;[m
[31m-            width: 40px;[m
[31m-            height: 40px;[m
[31m-            background-color: rgba(255, 255, 255, 0.1);[m
[31m-            bottom: -160px;[m
[31m-            animation: square 25s infinite;[m
[31m-            transition-timing-function: linear;[m
[31m-            border-radius: 50%;[m
[31m-        }[m
[31m-        [m
[31m-        @keyframes square {[m
[31m-            0% { transform: translateY(0) rotate(0deg); opacity: 1; }[m
[31m-            100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; }[m
[31m-        }[m
[31m-        [m
[31m-        .navbar {[m
[31m-            background: rgba(255, 255, 255, 0.95);[m
[31m-            backdrop-filter: blur(10px);[m
[31m-            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);[m
[31m-            padding: 15px 0;[m
[31m-            position: relative;[m
[31m-            z-index: 1000;[m
[31m-        }[m
[31m-        [m
[31m-        .navbar-brand {[m
[31m-            font-size: 24px;[m
[31m-            font-weight: 800;[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            -webkit-background-clip: text;[m
[31m-            -webkit-text-fill-color: transparent;[m
[31m-        }[m
[31m-        [m
[31m-        .nav-link {[m
[31m-            font-weight: 500;[m
[31m-            color: #333 !important;[m
[31m-            margin: 0 10px;[m
[31m-        }[m
[31m-        [m
[31m-        .main-content {[m
[31m-            position: relative;[m
[31m-            z-index: 10;[m
[31m-            padding: 40px 0;[m
[31m-        }[m
[31m-        [m
[31m-        .glass-card {[m
[31m-            background: rgba(255, 255, 255, 0.95);[m
[31m-            backdrop-filter: blur(10px);[m
[31m-            border-radius: 20px;[m
[31m-            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);[m
[31m-            overflow: hidden;[m
[31m-            margin-bottom: 30px;[m
[31m-        }[m
[31m-        [m
[31m-        .card-header-gradient {[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            padding: 25px 30px;[m
[31m-            border: none;[m
[31m-        }[m
[31m-        [m
[31m-        .card-header-gradient h3 {[m
[31m-            color: white;[m
[31m-            font-weight: 700;[m
[31m-            margin: 0;[m
[31m-        }[m
[31m-        [m
[31m-        .btn-gradient {[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            color: white;[m
[31m-            border: none;[m
[31m-            padding: 12px 30px;[m
[31m-            font-weight: 600;[m
[31m-            border-radius: 50px;[m
[31m-            transition: all 0.3s ease;[m
[31m-            display: inline-block;[m
[31m-            text-decoration: none;[m
[31m-            cursor: pointer;[m
[31m-        }[m
[31m-        [m
[31m-        .btn-gradient:hover {[m
[31m-            transform: translateY(-2px);[m
[31m-            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);[m
[31m-            color: white;[m
[31m-        }[m
[31m-        [m
[31m-        .btn-outline-gradient {[m
[31m-            background: transparent;[m
[31m-            border: 2px solid #667eea;[m
[31m-            color: #667eea;[m
[31m-            font-weight: 600;[m
[31m-            padding: 10px 25px;[m
[31m-            border-radius: 50px;[m
[31m-            transition: all 0.3s ease;[m
[31m-            display: inline-block;[m
[31m-            text-decoration: none;[m
[31m-        }[m
[31m-        [m
[31m-        .btn-outline-gradient:hover {[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            color: white;[m
[31m-            border-color: transparent;[m
[31m-        }[m
[31m-        [m
[31m-        .status-badge {[m
[31m-            padding: 8px 16px;[m
[31m-            border-radius: 50px;[m
[31m-            font-weight: 600;[m
[31m-            font-size: 12px;[m
[31m-            text-transform: uppercase;[m
[31m-            display: inline-block;[m
[31m-        }[m
[31m-        [m
[31m-        .status-pending {[m
[31m-            background: #fff3cd;[m
[31m-            color: #856404;[m
[31m-        }[m
[31m-        [m
[31m-        .status-active {[m
[31m-            background: #cce5ff;[m
[31m-            color: #004085;[m
[31m-        }[m
[31m-        [m
[31m-        .status-completed {[m
[31m-            background: #d4edda;[m
[31m-            color: #155724;[m
[31m-        }[m
[31m-        [m
[31m-        .status-cancelled {[m
[31m-            background: #f8d7da;[m
[31m-            color: #721c24;[m
[31m-        }[m
[31m-        [m
[31m-        .form-control, .form-select {[m
[31m-            border: 2px solid #e0e0e0;[m
[31m-            border-radius: 12px;[m
[31m-            padding: 12px 15px;[m
[31m-            width: 100%;[m
[31m-            margin-bottom: 10px;[m
[31m-        }[m
[31m-        [m
[31m-        .form-control:focus, .form-select:focus {[m
[31m-            border-color: #667eea;[m
[31m-            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);[m
[31m-            outline: none;[m
[31m-        }[m
[31m-        [m
[31m-        .file-upload input[type="file"] {[m
[31m-            padding: 15px;[m
[31m-            background: #f8f9fa;[m
[31m-            border: 2px dashed #667eea;[m
[31m-            border-radius: 12px;[m
[31m-            width: 100%;[m
[31m-        }[m
[31m-        [m
[31m-        .alert {[m
[31m-            border-radius: 12px;[m
[31m-            border: none;[m
[31m-            padding: 15px 20px;[m
[31m-            margin-bottom: 20px;[m
[31m-        }[m
[31m-        [m
[31m-        .alert-success {[m
[31m-            background: #d4edda;[m
[31m-            color: #155724;[m
[31m-        }[m
[31m-        [m
[31m-        .alert-danger {[m
[31m-            background: #f8d7da;[m
[31m-            color: #721c24;[m
[31m-        }[m
[31m-        [m
[31m-        .alert-warning {[m
[31m-            background: #fff3cd;[m
[31m-            color: #856404;[m
[31m-        }[m
[31m-        [m
[31m-        .alert-info {[m
[31m-            background: #d1ecf1;[m
[31m-            color: #0c5460;[m
[31m-        }[m
[31m-        [m
[31m-        .table {[m
[31m-            background: white;[m
[31m-            border-radius: 15px;[m
[31m-            overflow: hidden;[m
[31m-            width: 100%;[m
[31m-            margin-bottom: 20px;[m
[31m-        }[m
[31m-        [m
[31m-        .table thead {[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            color: white;[m
[31m-        }[m
[31m-        [m
[31m-        .table th, .table td {[m
[31m-            padding: 12px;[m
[31m-            text-align: left;[m
[31m-        }[m
[31m-        [m
[31m-        .stats-card {[m
[31m-            background: white;[m
[31m-            border-radius: 15px;[m
[31m-            padding: 20px;[m
[31m-            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);[m
[31m-            margin-bottom: 20px;[m
[31m-        }[m
[31m-        [m
[31m-        .stats-icon {[m
[31m-            width: 60px;[m
[31m-            height: 60px;[m
[31m-            border-radius: 50%;[m
[31m-            display: flex;[m
[31m-            align-items: center;[m
[31m-            justify-content: center;[m
[31m-            font-size: 24px;[m
[31m-            color: white;[m
[31m-        }[m
[31m-        [m
[31m-        .car-card {[m
[31m-            background: white;[m
[31m-            border-radius: 15px;[m
[31m-            overflow: hidden;[m
[31m-            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);[m
[31m-            transition: all 0.3s ease;[m
[31m-            cursor: pointer;[m
[31m-            margin-bottom: 20px;[m
[31m-        }[m
[31m-        [m
[31m-        .car-card:hover {[m
[31m-            transform: translateY(-10px);[m
[31m-            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);[m
[31m-        }[m
[31m-        [m
[31m-        .car-image {[m
[31m-            height: 150px;[m
[31m-            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);[m
[31m-            display: flex;[m
[31m-            align-items: center;[m
[31m-            justify-content: center;[m
[31m-            color: white;[m
[31m-            font-size: 48px;[m
[31m-            overflow: hidden;[m
[31m-        }[m
[31m-        [m
[31m-        .car-image img {[m
[31m-            width: 100%;[m
[31m-            height: 100%;[m
[31m-            object-fit: cover;[m
[31m-        }[m
[31m-        [m
[31m-        .car-details {[m
[31m-            padding: 15px;[m
[31m-        }[m
[31m-        [m
[31m-        .car-price {[m
[31m-            color: #667eea;[m
[31m-            font-weight: 800;[m
[31m-            font-size: 24px;[m
[31m-        }[m
[31m-        [m
[31m-        .footer {[m
[31m-            position: relative;[m
[31m-            z-index: 10;[m
[31m-            background: rgba(0, 0, 0, 0.5);[m
[31m-            backdrop-filter: blur(10px);[m
[31m-            color: white;[m
[31m-            padding: 20px 0;[m
[31m-            margin-top: 50px;[m
[31m-            text-align: center;[m
[31m-        }[m
[31m-        [m
[31m-        .bg-bubbles li:nth-child(1) { left: 10%; width: 80px; height: 80px; animation-duration: 12s; }[m
[31m-        .bg-bubbles li:nth-child(2) { left: 20%; width: 40px; height: 40px; animation-duration: 10s; }[m
[31m-        .bg-bubbles li:nth-child(3) { left: 25%; width: 110px; height: 110px; }[m
[31m-        .bg-bubbles li:nth-child(4) { left: 40%; width: 60px; height: 60px; animation-duration: 18s; }[m
[31m-        .bg-bubbles li:nth-child(5) { left: 70%; width: 50px; height: 50px; }[m
[31m-        .bg-bubbles li:nth-child(6) { left: 80%; width: 120px; height: 120px; }[m
[31m-        .bg-bubbles li:nth-child(7) { left: 32%; width: 160px; height: 160px; }[m
[31m-        .bg-bubbles li:nth-child(8) { left: 55%; width: 45px; height: 45px; animation-duration: 45s; }[m
[31m-        .bg-bubbles li:nth-child(9) { left: 15%; width: 35px; height: 35px; animation-duration: 35s; }[m
[31m-        .bg-bubbles li:nth-child(10) { left: 90%; width: 150px; height: 150px; animation-duration: 11s; }[m
[31m-        [m
[31m-        .offer-banner {[m
[31m-            animation: pulse 2s infinite;[m
[31m-        }[m
[31m-        [m
[31m-        @keyframes pulse {[m
[31m-            0% { transform: scale(1); }[m
[31m-            50% { transform: scale(1.05); }[m
[31m-            100% { transform: scale(1); }[m
[31m-        }[m
[31m-        [m
[31m-        .row {[m
[31m-            display: flex;[m
[31m-            flex-wrap: wrap;[m
[31m-            margin: 0 -15px;[m
[31m-        }[m
[31m-        [m
[31m-        .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-12 {[m
[31m-            padding: 0 15px;[m
[31m-        }[m
[31m-        [m
[31m-        .col-md-3 { width: 25%; }[m
[31m-        .col-md-4 { width: 33.333%; }[m
[31m-        .col-md-5 { width: 41.666%; }[m
[31m-        .col-md-6 { width: 50%; }[m
[31m-        .col-md-7 { width: 58.333%; }[m
[31m-        .col-md-8 { width: 66.666%; }[m
[31m-        .col-md-9 { width: 75%; }[m
[31m-        .col-md-10 { width: 83.333%; }[m
[31m-        .col-md-12 { width: 100%; }[m
[31m-        [m
[31m-        @media (max-width: 768px) {[m
[31m-            .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-12 {[m
[31m-                width: 100%;[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        .d-flex { display: flex; }[m
[31m-        .justify-content-between { justify-content: space-between; }[m
[31m-        .justify-content-center { justify-content: center; }[m
[31m-        .align-items-center { align-items: center; }[m
[31m-        .text-center { text-align: center; }[m
[31m-        .text-end { text-align: right; }[m
[31m-        .mb-0 { margin-bottom: 0; }[m
[31m-        .mb-2 { margin-bottom: 10px; }[m
[31m-        .mb-3 { margin-bottom: 15px; }[m
[31m-        .mb-4 { margin-bottom: 20px; }[m
[31m-        .mb-5 { margin-bottom: 30px; }[m
[31m-        .mt-2 { margin-top: 10px; }[m
[31m-        .mt-3 { margin-top: 15px; }[m
[31m-        .mt-4 { margin-top: 20px; }[m
[31m-        .mt-5 { margin-top: 30px; }[m
[31m-        .p-3 { padding: 15px; }[m
[31m-        .p-4 { padding: 20px; }[m
[31m-        .p-5 { padding: 30px; }[m
[31m-        .ms-2 { margin-left: 10px; }[m
[31m-        .me-2 { margin-right: 10px; }[m
[31m-        .me-3 { margin-right: 15px; }[m
[31m-        .me-4 { margin-right: 20px; }[m
[31m-        [m
[31m-        .badge {[m
[31m-            padding: 5px 10px;[m
[31m-            border-radius: 5px;[m
[31m-            font-size: 12px;[m
[31m-            font-weight: 600;[m
[31m-        }[m
[31m-        [m
[31m-        .bg-success { background: #28a745; color: white; }[m
[31m-        .bg-warning { background: #ffc107; color: #000; }[m
[31m-        .bg-danger { background: #dc3545; color: white; }[m
[31m-        .bg-info { background: #17a2b8; color: white; }[m
[31m-        .bg-primary { background: #007bff; color: white; }[m
[31m-        .bg-secondary { background: #6c757d; color: white; }[m
[31m-        .bg-light { background: #f8f9fa; color: #000; }[m
[31m-        [m
[31m-        .text-success { color: #28a745; }[m
[31m-        .text-warning { color: #ffc107; }[m
[31m-        .text-danger { color: #dc3545; }[m
[31m-        .text-info { color: #17a2b8; }[m
[31m-        .text-primary { color: #007bff; }[m
[31m-        .text-muted { color: #6c757d; }[m
[31m-        .text-white { color: white; }[m
[31m-        [m
[31m-        .btn-sm {[m
[31m-            padding: 5px 10px;[m
[31m-            font-size: 12px;[m
[31m-            border-radius: 5px;[m
[31m-            margin: 2px;[m
[31m-        }[m
[31m-        [m
[31m-        .btn-group {[m
[31m-            display: flex;[m
[31m-            gap: 5px;[m
[31m-        }[m
[31m-        [m
[31m-        hr {[m
[31m-            margin: 20px 0;[m
[31m-            border: 0;[m
[31m-            border-top: 1px solid #e0e0e0;[m
[31m-        }[m
[31m-        [m
[31m-        .invalid-feedback {[m
[31m-            color: #dc3545;[m
[31m-            font-size: 12px;[m
[31m-            margin-top: 5px;[m
[31m-        }[m
[31m-        [m
[31m-        .form-check {[m
[31m-            display: flex;[m
[31m-            align-items: center;[m
[31m-            gap: 10px;[m
[31m-        }[m
[31m-        [m
[31m-        .form-check-input {[m
[31m-            width: 20px;[m
[31m-            height: 20px;[m
[31m-        }[m
[31m-        [m
[31m-        .table-responsive {[m
[31m-            overflow-x: auto;[m
[31m-        }[m
[31m-        [m
[31m-        .d-grid { display: grid; }[m
[31m-        .gap-2 { gap: 10px; }[m
[31m-    </style>[m
[31m-</head>[m
[31m-<body>[m
[31m-    <ul class="bg-bubbles">[m
[31m-        <li></li><li></li><li></li><li></li><li></li>[m
[31m-        <li></li><li></li><li></li><li></li><li></li>[m
[31m-    </ul>[m
[31m-    [m
[31m-    <nav class="navbar navbar-expand-lg">[m
[31m-        <div class="container">[m
[31m-            <a class="navbar-brand" href="#" onclick="showHome()">[m
[31m-                <i class="fas fa-car"></i> Fahad Premium Rentals[m
[31m-            </a>[m
[31m-            <button class="navbar-toggler" type="button" onclick="toggleMenu()">[m
[31m-                <span class="navbar-toggler-icon"></span>[m
[31m-            </button>[m
[31m-            <div class="collapse navbar-collapse" id="navbarNav">[m
[31m-                <ul class="navbar-nav ms-auto">[m
[31m-                    <li class="nav-item">[m
[31m-                        <a class="nav-link" href="#" onclick="showHome()"><i class="fas fa-home"></i> Home</a>[m
[31m-                    </li>[m
[31m-                    <li class="nav-item">[m
[31m-                        <a class="nav-link" href="#" onclick="showBookingStatus()"><i class="fas fa-search"></i> Track Booking</a>[m
[31m-                    </li>[m
[31m-                    <li class="nav-item">[m
[31m-                        <a class="nav-link" href="#" onclick="showAdminLogin()"><i class="fas fa-lock"></i> Admin</a>[m
[31m-                    </li>[m
[31m-                </ul>[m
[31m-            </div>[m
[31m-        </div>[m
[31m-    </nav>[m
[31m-    [m
[31m-    <div class="main-content">[m
[31m-        <div class="container" id="mainContent">[m
[31m-            <!-- Home Page -->[m
[31m-            <div id="homePage">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-lg-10">[m
[31m-                        <!-- Hero Section -->[m
[31m-                        <div class="glass-card mb-5" style="position: relative; overflow: hidden; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">[m
[31m-                            <div style="padding: 60px 30px; border-radius: 20px;">[m
[31m-                                <div class="text-center text-white">[m
[31m-                                    <h1 class="display-4 mb-4" style="text-shadow: 2px 2px 4px rgba(0,0,0,0.5);">Fahad Premium Rentals</h1>[m
[31m-                                    <p class="lead" style="text-shadow: 1px 1px 2px rgba(0,0,0,0.5);">Luxury Car Rental in Sri Lanka</p>[m
[31m-                                    [m
[31m-                                    <!-- Special Offer Banner -->[m
[31m-                                    <div class="offer-banner mb-4" style="background: linear-gradient(135deg, #ffd700 0%, #ffa500 100%); color: #000; padding: 20px; border-radius: 15px; max-width: 400px; margin: 0 auto;">[m
[31m-                                        <h2 class="mb-2">🔥 SPECIAL OFFER</h2>[m
[31m-                                        <div class="d-flex justify-content-center align-items-center">[m
[31m-                                            <div style="font-size: 24px; font-weight: bold;">300 KM</div>[m
[31m-                                            <div style="font-size: 36px; font-weight: 800; margin: 0 20px;">Rs. 15,000/=</div>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mt-4">[m
[31m-                                        <a href="#" onclick="showBookingForm()" class="btn-gradient btn-lg me-3">[m
[31m-                                            <i class="fas fa-calendar-check"></i> Book Now[m
[31m-                                        </a>[m
[31m-                                        <a href="https://wa.me/94756656862?text=Hello%20Fahad%20Premium%20Rentals%2C%20I%27m%20interested%20in%20renting%20a%20car.%20Can%20you%20help%20me%3F" target="_blank" class="btn-success btn-lg" style="background: #25D366; color: white; padding: 15px 30px; border-radius: 50px; text-decoration: none; display: inline-block; font-weight: 600;">[m
[31m-                                            <i class="fab fa-whatsapp"></i> Call Now: 0753394996 / 0756656862[m
[31m-                                        </a>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mt-3 text-white">[m
[31m-                                        <i class="fas fa-phone"></i> 0753394996 | 0756656862[m
[31m-                                    </div>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Cars Section -->[m
[31m-                        <div class="glass-card mb-5" id="cars">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-car"></i>[m
[31m-                                    Our Premium Fleet[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="row" id="carsContainer"></div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Booking Form -->[m
[31m-                        <div class="glass-card" id="booking-form">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-calendar-check"></i>[m
[31m-                                    Book Your Car[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <!-- File Upload Guidelines -->[m
[31m-                                <div class="alert alert-info mb-3">[m
[31m-                                    <i class="fas fa-info-circle"></i>[m
[31m-                                    <strong>File Upload Guidelines:</strong>[m
[31m-                                    <ul class="mb-0 mt-2">[m
[31m-                                        <li>Maximum file size: <strong>50MB per file</strong></li>[m
[31m-                                        <li>Allowed formats: JPG, PNG, PDF</li>[m
[31m-                                        <li>If your files are too large, please compress them before uploading</li>[m
[31m-                                    </ul>[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <form id="bookingForm">[m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-user"></i> Full Name[m
[31m-                                            </label>[m
[31m-                                            <input type="text" class="form-control" id="customer_name" placeholder="Enter your full name" required>[m
[31m-                                        </div>[m
[31m-                                        [m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-envelope"></i> Email Address[m
[31m-                                            </label>[m
[31m-                                            <input type="email" class="form-control" id="email" placeholder="your@email.com" required>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-phone"></i> Phone Number[m
[31m-                                            </label>[m
[31m-                                            <input type="text" class="form-control" id="phone" placeholder="0771234567" required>[m
[31m-                                            <small class="text-muted">Sri Lankan format: 0771234567 or +94771234567</small>[m
[31m-                                        </div>[m
[31m-                                        [m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-car"></i> Select Car[m
[31m-                                            </label>[m
[31m-                                            <select class="form-select" id="car_model" required>[m
[31m-                                                <option value="">Select a car</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-calendar"></i> Pickup Date[m
[31m-                                            </label>[m
[31m-                                            <input type="date" class="form-control" id="pickup_date" required>[m
[31m-                                        </div>[m
[31m-                                        [m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-clock"></i> Pickup Time[m
[31m-                                            </label>[m
[31m-                                            <select class="form-select" id="pickup_time" required>[m
[31m-                                                <option value="08:00">08:00 AM</option>[m
[31m-                                                <option value="09:00">09:00 AM</option>[m
[31m-                                                <option value="10:00" selected>10:00 AM</option>[m
[31m-                                                <option value="11:00">11:00 AM</option>[m
[31m-                                                <option value="12:00">12:00 PM</option>[m
[31m-                                                <option value="13:00">01:00 PM</option>[m
[31m-                                                <option value="14:00">02:00 PM</option>[m
[31m-                                                <option value="15:00">03:00 PM</option>[m
[31m-                                                <option value="16:00">04:00 PM</option>[m
[31m-                                                <option value="17:00">05:00 PM</option>[m
[31m-                                                <option value="18:00">06:00 PM</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-calendar-check"></i> Return Date[m
[31m-                                            </label>[m
[31m-                                            <input type="date" class="form-control" id="return_date" required>[m
[31m-                                        </div>[m
[31m-                                        [m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-clock"></i> Return Time[m
[31m-                                            </label>[m
[31m-                                            <select class="form-select" id="return_time" required>[m
[31m-                                                <option value="08:00">08:00 AM</option>[m
[31m-                                                <option value="09:00">09:00 AM</option>[m
[31m-                                                <option value="10:00">10:00 AM</option>[m
[31m-                                                <option value="11:00">11:00 AM</option>[m
[31m-                                                <option value="12:00">12:00 PM</option>[m
[31m-                                                <option value="13:00">01:00 PM</option>[m
[31m-                                                <option value="14:00">02:00 PM</option>[m
[31m-                                                <option value="15:00">03:00 PM</option>[m
[31m-                                                <option value="16:00">04:00 PM</option>[m
[31m-                                                <option value="17:00">05:00 PM</option>[m
[31m-                                                <option value="18:00" selected>06:00 PM</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-id-card"></i> ID Card (Front)[m
[31m-                                            </label>[m
[31m-                                            <div class="file-upload">[m
[31m-                                                <input type="file" class="form-control" id="id_front" accept=".jpg,.jpeg,.png,.pdf" required>[m
[31m-                                            </div>[m
[31m-                                            <small class="text-muted">JPG, PNG or PDF (Max 50MB)</small>[m
[31m-                                        </div>[m
[31m-                                        [m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-id-card"></i> ID Card (Back)[m
[31m-                                            </label>[m
[31m-                                            <div class="file-upload">[m
[31m-                                                <input type="file" class="form-control" id="id_back" accept=".jpg,.jpeg,.png,.pdf" required>[m
[31m-                                            </div>[m
[31m-                                            <small class="text-muted">JPG, PNG or PDF (Max 50MB)</small>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-12 mb-3">[m
[31m-                                            <label class="form-label">[m
[31m-                                                <i class="fas fa-id-card"></i> Driving License[m
[31m-                                            </label>[m
[31m-                                            <div class="file-upload">[m
[31m-                                                <input type="file" class="form-control" id="license_file" accept=".jpg,.jpeg,.png,.pdf" required>[m
[31m-                                            </div>[m
[31m-                                            <small class="text-muted">JPG, PNG or PDF (Max 50MB)</small>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <!-- Price Summary -->[m
[31m-                                    <div class="alert alert-info mt-4" id="price-summary" style="display: none;">[m
[31m-                                        <div class="row">[m
[31m-                                            <div class="col-md-12">[m
[31m-                                                <h5 class="mb-3"><i class="fas fa-calculator"></i> Price Summary</h5>[m
[31m-                                                <div class="row">[m
[31m-                                                    <div class="col-md-6">[m
[31m-                                                        <p class="mb-1"><strong>Car:</strong> <span id="selectedCarName"></span></p>[m
[31m-                                                        <p class="mb-1"><strong>Price per day:</strong> <span id="pricePerDay">0</span></p>[m
[31m-                                                        <p class="mb-1"><strong>Pickup:</strong> <span id="pickupDisplay"></span></p>[m
[31m-                                                        <p class="mb-1"><strong>Return:</strong> <span id="returnDisplay"></span></p>[m
[31m-                                                        <p class="mb-1"><strong>Total Days:</strong> <span id="totalDays">0</span></p>[m
[31m-                                                    </div>[m
[31m-                                                    <div class="col-md-6 text-end">[m
[31m-                                                        <h4 class="text-primary"><strong>TOTAL: <span id="totalPrice">0</span></strong></h4>[m
[31m-                                                        <small id="priceBreakdown" class="text-muted"></small>[m
[31m-                                                    </div>[m
[31m-                                                </div>[m
[31m-                                            </div>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <!-- Required Payment Notice -->[m
[31m-                                    <div class="alert alert-warning mt-3" id="payment-notice" style="display: none;">[m
[31m-                                        <i class="fas fa-info-circle"></i>[m
[31m-                                        <strong>Payment Required:</strong> After booking, you will need to pay the total amount to confirm your reservation.[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="text-center mt-4">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" id="submitBtn" onclick="submitBooking()" disabled>[m
[31m-                                            <i class="fas fa-check-circle"></i> Book Now[m
[31m-                                        </button>[m
[31m-                                        <button type="reset" class="btn-outline-gradient btn-lg ms-2" onclick="resetBookingForm()">[m
[31m-                                            <i class="fas fa-redo"></i> Reset[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Booking Status Page -->[m
[31m-            <div id="bookingStatusPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-6">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-search"></i>[m
[31m-                                    Check Booking Status[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-5">[m
[31m-                                <p class="text-muted text-center mb-4">[m
[31m-                                    <i class="fas fa-info-circle"></i>[m
[31m-                                    Enter your tracking number to check your booking status[m
[31m-                                </p>[m
[31m-                                [m
[31m-                                <form id="statusSearchForm">[m
[31m-                                    <div class="mb-4">[m
[31m-                                        <label class="form-label">[m
[31m-                                            <i class="fas fa-qrcode"></i> Tracking Number[m
[31m-                                        </label>[m
[31m-                                        <input type="text" class="form-control form-control-lg" id="tracking_number" placeholder="e.g., FR00001" required>[m
[31m-                                        <small class="text-muted">Enter your tracking number (format: FR00001)</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="d-grid gap-2">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" onclick="searchBooking()">[m
[31m-                                            <i class="fas fa-search"></i> Check Status[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                                [m
[31m-                                <hr class="my-4">[m
[31m-                                [m
[31m-                                <div class="text-center">[m
[31m-                                    <p class="text-muted mb-2">Don't have a booking yet?</p>[m
[31m-                                    <a href="#" onclick="showHome(); showBookingForm()" class="btn-outline-gradient">[m
[31m-                                        <i class="fas fa-calendar-plus"></i> Make a Booking[m
[31m-                                    </a>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Quick Tips -->[m
[31m-                        <div class="glass-card mt-4">[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <h5><i class="fas fa-lightbulb text-warning"></i> Quick Tips:</h5>[m
[31m-                                <ul class="text-muted mb-0">[m
[31m-                                    <li>Your tracking number was provided after booking (format: FR00001)</li>[m
[31m-                                    <li>Check your booking status anytime, 24/7</li>[m
[31m-                                    <li>Contact us on WhatsApp for immediate assistance</li>[m
[31m-                                    <li>Have your tracking number ready when contacting support</li>[m
[31m-                                </ul>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Booking Result Page -->[m
[31m-            <div id="bookingResultPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card" id="bookingResultContent"></div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Admin Login Page -->[m
[31m-            <div id="adminLoginPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-5">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #333 0%, #000 100%);">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-lock"></i>[m
[31m-                                    Fahad Premium Rentals Admin Access[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-5">[m
[31m-                                <form id="adminLoginForm">[m
[31m-                                    <div class="mb-4">[m
[31m-                                        <label class="form-label">[m
[31m-                                            <i class="fas fa-key"></i> Admin Password[m
[31m-                                        </label>[m
[31m-                                        <input type="password" class="form-control form-control-lg" id="admin_password" required placeholder="Enter admin password">[m
[31m-                                    </div>[m
[31m-                                    <button type="button" class="btn-gradient w-100 btn-lg" onclick="adminLogin()">[m
[31m-                                        <i class="fas fa-sign-in-alt"></i> Login[m
[31m-                                    </button>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Admin Dashboard Page -->[m
[31m-            <div id="adminDashboardPage" style="display: none;">[m
[31m-                <div class="row">[m
[31m-                    <div class="col-12">[m
[31m-                        <!-- Business Overview Header -->[m
[31m-                        <div class="glass-card mb-4">[m
[31m-                            <div class="card-header-gradient d-flex justify-content-between align-items-center">[m
[31m-                                <h3 class="mb-0">[m
[31m-                                    <i class="fas fa-chart-line"></i>[m
[31m-                                    Fahad Premium Rentals - Business Dashboard[m
[31m-                                </h3>[m
[31m-                                <div class="d-flex align-items-center gap-2">[m
[31m-                                    <button class="btn btn-sm btn-light" type="button" onclick="downloadSqliteDb()">[m
[31m-                                        <i class="fas fa-database"></i> Download DB[m
[31m-                                    </button>[m
[31m-                                    <span class="badge bg-light text-dark" id="lastUpdated"></span>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Key Business Metrics -->[m
[31m-                        <div class="row mb-4" id="statsCards"></div>[m
[31m-                        [m
[31m-                        <!-- Admin Navigation Buttons -->[m
[31m-                        <div class="row mb-4">[m
[31m-                            <div class="col-12">[m
[31m-                                <div class="glass-card">[m
[31m-                                    <div class="card-body p-3">[m
[31m-                                        <button class="btn-gradient me-2" onclick="showCarManagement()">[m
[31m-                                            <i class="fas fa-car"></i> Manage Cars[m
[31m-                                        </button>[m
[31m-                                        <button class="btn-gradient me-2" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);" onclick="showBannerManagement()">[m
[31m-                                            <i class="fas fa-images"></i> Manage Banners[m
[31m-                                        </button>[m
[31m-                                        <button class="btn-gradient me-2" style="background: linear-gradient(135deg, #36d1dc 0%, #5b86e5 100%);" onclick="showBackgroundManagement()">[m
[31m-                                            <i class="fas fa-image"></i> Website Background[m
[31m-                                        </button>[m
[31m-                                        <button class="btn-gradient me-2" style="background: linear-gradient(135deg, #f12711 0%, #f5af19 100%);" onclick="showHeroManagement()">[m
[31m-                                            <i class="fas fa-photo-video"></i> Hero Background[m
[31m-                                        </button>[m
[31m-                                        <button class="btn-gradient me-2" style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%);" onclick="showAccountManagement()">[m
[31m-                                            <i class="fas fa-wallet"></i> Account[m
[31m-                                        </button>[m
[31m-                                        <button class="btn-outline-gradient" onclick="logout()">[m
[31m-                                            <i class="fas fa-sign-out-alt"></i> Logout[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Main Dashboard Table -->[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient d-flex justify-content-between align-items-center">[m
[31m-                                <h3 class="mb-0">[m
[31m-                                    <i class="fas fa-chart-line"></i>[m
[31m-                                    Fahad Premium Rentals - Booking Management[m
[31m-                                </h3>[m
[31m-                                <div id="revenueSummary"></div>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="table-responsive">[m
[31m-                                    <table class="table table-hover" id="bookingsTable">[m
[31m-                                        <thead>[m
[31m-                                            <tr>[m
[31m-                                                <th>Tracking #</th>[m
[31m-                                                <th>Customer</th>[m
[31m-                                                <th>Car</th>[m
[31m-                                                <th>Dates</th>[m
[31m-                                                <th>Total</th>[m
[31m-                                                <th>Paid</th>[m
[31m-                                                <th>Balance</th>[m
[31m-                                                <th>Payment Status</th>[m
[31m-                                                <th>Booking Status</th>[m
[31m-                                                <th>Actions</th>[m
[31m-                                            </tr>[m
[31m-                                        </thead>[m
[31m-                                        <tbody id="bookingsTableBody"></tbody>[m
[31m-                                    </table>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Car Management Page -->[m
[31m-            <div id="carManagementPage" style="display: none;">[m
[31m-                <div class="row">[m
[31m-                    <div class="col-12">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient d-flex justify-content-between align-items-center">[m
[31m-                                <h3 class="mb-0">[m
[31m-                                    <i class="fas fa-car"></i>[m
[31m-                                    Fahad Premium Rentals - Manage Cars[m
[31m-                                </h3>[m
[31m-                                <button class="btn btn-light" onclick="showAddCarForm()">[m
[31m-                                    <i class="fas fa-plus"></i> Add New Car[m
[31m-                                </button>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="alert alert-info">[m
[31m-                                    <i class="fas fa-info-circle"></i>[m
[31m-                                    Car images are stored in the uploads/cars folder. Upload images when adding or editing cars. Max file size: 50MB[m
[31m-                                </div>[m
[31m-                                <div class="table-responsive">[m
[31m-                                    <table class="table table-hover">[m
[31m-                                        <thead>[m
[31m-                                            <tr>[m
[31m-                                                <th>ID</th>[m
[31m-                                                <th>Image</th>[m
[31m-                                                <th>Name</th>[m
[31m-                                                <th>Model</th>[m
[31m-                                                <th>Price/Day</th>[m
[31m-                                                <th>KM/Day</th>[m
[31m-                                                <th>Category</th>[m
[31m-                                                <th>Seats</th>[m
[31m-                                                <th>Transmission</th>[m
[31m-                                                <th>Available</th>[m
[31m-                                                <th>Actions</th>[m
[31m-                                            </tr>[m
[31m-                                        </thead>[m
[31m-                                        <tbody id="carsTableBody"></tbody>[m
[31m-                                    </table>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Banner Management Page -->[m
[31m-            <div id="bannerManagementPage" style="display: none;">[m
[31m-                <div class="row">[m
[31m-                    <div class="col-12">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient d-flex justify-content-between align-items-center">[m
[31m-                                <h3 class="mb-0">[m
[31m-                                    <i class="fas fa-images"></i>[m
[31m-                                    Fahad Premium Rentals - Manage Homepage Banners[m
[31m-                                </h3>[m
[31m-                                <button class="btn btn-light" onclick="showAddBannerForm()">[m
[31m-                                    <i class="fas fa-plus"></i> Add New Banner[m
[31m-                                </button>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="alert alert-info">[m
[31m-                                    <i class="fas fa-info-circle"></i>[m
[31m-                                    The active banner will automatically display on the homepage. You can create multiple banners and activate only one at a time.[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <div class="table-responsive">[m
[31m-                                    <table class="table table-hover">[m
[31m-                                        <thead>[m
[31m-                                            <tr>[m
[31m-                                                <th>ID</th>[m
[31m-                                                <th>Preview</th>[m
[31m-                                                <th>Title</th>[m
[31m-                                                <th>Offer</th>[m
[31m-                                                <th>Status</th>[m
[31m-                                                <th>Created</th>[m
[31m-                                                <th>Actions</th>[m
[31m-                                            </tr>[m
[31m-                                        </thead>[m
[31m-                                        <tbody id="bannersTableBody"></tbody>[m
[31m-                                    </table>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Background Management Page -->[m
[31m-            <div id="backgroundManagementPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #36d1dc 0%, #5b86e5 100%);">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-image"></i>[m
[31m-                                    Fahad Premium Rentals - Change Website Background[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <!-- Current Background Preview -->[m
[31m-                                <div class="text-center mb-4">[m
[31m-                                    <h5>Current Background:</h5>[m
[31m-                                    <div id="currentBackgroundPreview" style="width: 100%; height: 200px; background: #667eea; border-radius: 10px; border: 3px solid #fff; box-shadow: 0 5px 15px rgba(0,0,0,0.3);">[m
[31m-                                    </div>[m
[31m-                                    <p class="mt-2 text-muted" id="currentBackgroundName"></p>[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <form id="backgroundForm">[m
[31m-                                    <div class="mb-4">[m
[31m-                                        <label class="form-label">Website Background Image</label>[m
[31m-                                        <input type="file" class="form-control" id="background_image" accept=".jpg,.jpeg,.png,.gif">[m
[31m-                                        <small class="text-muted">Upload a new background image. Allowed: JPG, PNG, GIF. Max size: 50MB</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Background Title (Optional)</label>[m
[31m-                                        <input type="text" class="form-control" id="background_title">[m
[31m-                                        <small class="text-muted">Optional: Title for the background</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Background Description (Optional)</label>[m
[31m-                                        <input type="text" class="form-control" id="background_description">[m
[31m-                                        <small class="text-muted">Optional: Description for the background</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="alert alert-info">[m
[31m-                                        <i class="fas fa-info-circle"></i>[m
[31m-                                        <strong>Tip:</strong> For best results, use high-quality images with dark or muted tones so that white text remains readable. Recommended size: 1920x1080px or larger.[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="text-center mt-4">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" onclick="updateBackground()">[m
[31m-                                            <i class="fas fa-save"></i> Update Background[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showAdminDashboard()">[m
[31m-                                            <i class="fas fa-arrow-left"></i> Back to Dashboard[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showHome()">[m
[31m-                                            <i class="fas fa-eye"></i> Preview[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Background Gallery -->[m
[31m-                        <div class="glass-card mt-4">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #36d1dc 0%, #5b86e5 100%);">[m
[31m-                                <h4>[m
[31m-                                    <i class="fas fa-images"></i>[m
[31m-                                    Fahad Premium Rentals - Background Gallery[m
[31m-                                </h4>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="row" id="backgroundGallery"></div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Hero Management Page -->[m
[31m-            <div id="heroManagementPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #f12711 0%, #f5af19 100%);">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-photo-video"></i>[m
[31m-                                    Fahad Premium Rentals - Customize Hero Section Background[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <!-- Current Hero Preview -->[m
[31m-                                <div class="text-center mb-4">[m
[31m-                                    <h5>Current Hero Background:</h5>[m
[31m-                                    <div id="currentHeroPreview" style="width: 100%; height: 200px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 10px; border: 3px solid #fff; box-shadow: 0 5px 15px rgba(0,0,0,0.3); position: relative;">[m
[31m-                                        <div id="heroOverlay" style="background: rgba(0,0,0,0.6); width: 100%; height: 100%; border-radius: 10px; display: flex; align-items: center; justify-content: center;">[m
[31m-                                            <div style="color: white; text-shadow: 2px 2px 4px rgba(0,0,0,0.5);">[m
[31m-                                                <h3 id="heroTitle">Fahad Premium Rentals</h3>[m
[31m-                                                <p id="heroSubtitle">Luxury Car Rental in Sri Lanka</p>[m
[31m-                                            </div>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    <p class="mt-2 text-muted" id="currentHeroName"></p>[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <form id="heroForm">[m
[31m-                                    <div class="mb-4">[m
[31m-                                        <label class="form-label">Hero Background Image</label>[m
[31m-                                        <input type="file" class="form-control" id="hero_image" accept=".jpg,.jpeg,.png,.gif">[m
[31m-                                        <small class="text-muted">Upload a new hero background image. Recommended size: 1920x1080px. Max size: 50MB</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Hero Title</label>[m
[31m-                                            <input type="text" class="form-control" id="hero_title" value="Fahad Premium Rentals">[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Hero Subtitle</label>[m
[31m-                                            <input type="text" class="form-control" id="hero_subtitle" value="Luxury Car Rental in Sri Lanka">[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Overlay Opacity (0.0 - 1.0)</label>[m
[31m-                                            <input type="text" class="form-control" id="hero_opacity" value="0.6">[m
[31m-                                            <small class="text-muted">0.0 = transparent, 1.0 = solid</small>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Overlay Color (RGB)</label>[m
[31m-                                            <input type="text" class="form-control" id="hero_color" value="0,0,0">[m
[31m-                                            <small class="text-muted">RGB values (e.g., 0,0,0 for black)</small>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <div class="form-check">[m
[31m-                                            <input type="checkbox" class="form-check-input" id="hero_active" checked>[m
[31m-                                            <label class="form-check-label">Active Hero</label>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="alert alert-info">[m
[31m-                                        <i class="fas fa-info-circle"></i>[m
[31m-                                        <strong>Tip:</strong> The hero section is the first thing customers see. Use high-quality images with good contrast for text readability.[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="text-center mt-4">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" onclick="updateHero()">[m
[31m-                                            <i class="fas fa-save"></i> Update Hero[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showAdminDashboard()">[m
[31m-                                            <i class="fas fa-arrow-left"></i> Back to Dashboard[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showHome()">[m
[31m-                                            <i class="fas fa-eye"></i> Preview[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Hero Gallery -->[m
[31m-                        <div class="glass-card mt-4">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #f12711 0%, #f5af19 100%);">[m
[31m-                                <h4>[m
[31m-                                    <i class="fas fa-images"></i>[m
[31m-                                    Fahad Premium Rentals - Hero Background Gallery[m
[31m-                                </h4>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="row" id="heroGallery"></div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Account Management Page -->[m
[31m-            <div id="accountManagementPage" style="display: none;">[m
[31m-                <div class="row">[m
[31m-                    <div class="col-12">[m
[31m-                        <div class="glass-card mb-4">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3 class="mb-0">[m
[31m-                                    <i class="fas fa-wallet"></i>[m
[31m-                                    Fahad Premium Rentals - Account Management[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Balance Cards -->[m
[31m-                        <div class="row mb-4" id="balanceCards"></div>[m
[31m-                        [m
[31m-                        <!-- Action Buttons -->[m
[31m-                        <div class="row mb-4">[m
[31m-                            <div class="col-12">[m
[31m-                                <div class="glass-card">[m
[31m-                                    <div class="card-body p-3">[m
[31m-                                        <button class="btn-gradient me-2" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);" onclick="showAddExpenseForm()">[m
[31m-                                            <i class="fas fa-minus-circle"></i> Add Expense[m
[31m-                                        </button>[m
[31m-                                        <button class="btn-outline-gradient" onclick="showAdminDashboard()">[m
[31m-                                            <i class="fas fa-arrow-left"></i> Back to Dashboard[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Recent Transactions -->[m
[31m-                        <div class="glass-card mb-4">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h4 class="mb-0">[m
[31m-                                    <i class="fas fa-history"></i>[m
[31m-                                    Recent Transactions[m
[31m-                                </h4>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="table-responsive">[m
[31m-                                    <table class="table table-hover">[m
[31m-                                        <thead>[m
[31m-                                            <tr>[m
[31m-                                                <th>Date</th>[m
[31m-                                                <th>Type</th>[m
[31m-                                                <th>Category</th>[m
[31m-                                                <th>Description</th>[m
[31m-                                                <th>Amount</th>[m
[31m-                                                <th>Balance After</th>[m
[31m-                                                <th>Reference</th>[m
[31m-                                            </tr>[m
[31m-                                        </thead>[m
[31m-                                        <tbody id="transactionsTableBody"></tbody>[m
[31m-                                    </table>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Expenses List -->[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);">[m
[31m-                                <h4 class="mb-0">[m
[31m-                                    <i class="fas fa-file-invoice"></i>[m
[31m-                                    Expenses[m
[31m-                                </h4>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div class="table-responsive">[m
[31m-                                    <table class="table table-hover">[m
[31m-                                        <thead>[m
[31m-                                            <tr>[m
[31m-                                                <th>Date</th>[m
[31m-                                                <th>Category</th>[m
[31m-                                                <th>Description</th>[m
[31m-                                                <th>Amount</th>[m
[31m-                                                <th>Payment Method</th>[m
[31m-                                                <th>Actions</th>[m
[31m-                                            </tr>[m
[31m-                                        </thead>[m
[31m-                                        <tbody id="expensesTableBody"></tbody>[m
[31m-                                    </table>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Add Car Form Page -->[m
[31m-            <div id="addCarFormPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-plus-circle"></i>[m
[31m-                                    Fahad Premium Rentals - Add New Car[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <form id="addCarForm">[m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Car Name</label>[m
[31m-                                            <input type="text" class="form-control" id="car_name" required>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Model Year</label>[m
[31m-                                            <input type="text" class="form-control" id="car_model_year" required>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Price per Day (Rs.)</label>[m
[31m-                                            <input type="number" class="form-control" id="car_price" required>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">KM allowed per day</label>[m
[31m-                                            <input type="number" class="form-control" id="car_km" value="100" required>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Category</label>[m
[31m-                                            <select class="form-select" id="car_category" required>[m
[31m-                                                <option value="sedan">Sedan</option>[m
[31m-                                                <option value="suv">SUV</option>[m
[31m-                                                <option value="luxury">Luxury</option>[m
[31m-                                                <option value="sports">Sports</option>[m
[31m-                                                <option value="economy">Economy</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Transmission</label>[m
[31m-                                            <select class="form-select" id="car_transmission" required>[m
[31m-                                                <option value="automatic">Automatic</option>[m
[31m-                                                <option value="manual">Manual</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Number of Seats</label>[m
[31m-                                            <input type="number" class="form-control" id="car_seats" value="5" required>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Fuel Type</label>[m
[31m-                                            <select class="form-select" id="car_fuel" required>[m
[31m-                                                <option value="petrol">Petrol</option>[m
[31m-                                                <option value="diesel">Diesel</option>[m
[31m-                                                <option value="electric">Electric</option>[m
[31m-                                                <option value="hybrid">Hybrid</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <div class="form-check">[m
[31m-                                                <input type="checkbox" class="form-check-input" id="car_available" checked>[m
[31m-                                                <label class="form-check-label">Available for rent</label>[m
[31m-                                            </div>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Car Image</label>[m
[31m-                                            <input type="file" class="form-control" id="car_image" accept=".jpg,.jpeg,.png">[m
[31m-                                            <small class="text-muted">Recommended size: 800x600px. Allowed: JPG, PNG. Max size: 50MB</small>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="text-center mt-4">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" onclick="saveCar()">[m
[31m-                                            <i class="fas fa-save"></i> Save Car[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showCarManagement()">[m
[31m-                                            <i class="fas fa-times"></i> Cancel[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Edit Car Form Page -->[m
[31m-            <div id="editCarFormPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-edit"></i>[m
[31m-                                    Fahad Premium Rentals - Edit Car[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <div id="editCarPreview" class="text-center mb-4"></div>[m
[31m-                                <form id="editCarForm"></form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Add Banner Form Page -->[m
[31m-            <div id="addBannerFormPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-plus-circle"></i>[m
[31m-                                    Fahad Premium Rentals - Add New Banner[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <form id="addBannerForm">[m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Banner Title</label>[m
[31m-                                        <input type="text" class="form-control" id="banner_title" placeholder="e.g., Premium Car Rental in Sri Lanka" required>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Subtitle (Optional)</label>[m
[31m-                                        <input type="text" class="form-control" id="banner_subtitle" placeholder="e.g., Experience luxury with our premium fleet">[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Banner Image</label>[m
[31m-                                        <input type="file" class="form-control" id="banner_image" accept=".jpg,.jpeg,.png,.gif">[m
[31m-                                        <small class="text-muted">Leave empty to use default banner. Allowed: JPG, PNG, GIF. Max size: 50MB</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <hr>[m
[31m-                                    <h5>Offer Section (Optional)</h5>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-4 mb-3">[m
[31m-                                            <label class="form-label">Offer Text</label>[m
[31m-                                            <input type="text" class="form-control" id="banner_offer_text" placeholder="SPECIAL OFFER">[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-4 mb-3">[m
[31m-                                            <label class="form-label">KM Offer</label>[m
[31m-                                            <input type="number" class="form-control" id="banner_km_offer" placeholder="300">[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-4 mb-3">[m
[31m-                                            <label class="form-label">Price Offer</label>[m
[31m-                                            <input type="text" class="form-control" id="banner_price_offer" placeholder="Rs. 15,000/=">[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <div class="form-check">[m
[31m-                                            <input type="checkbox" class="form-check-input" id="banner_active">[m
[31m-                                            <label class="form-check-label">Active Banner</label>[m
[31m-                                            <small class="text-muted d-block">If checked, this banner will be active and all others will be deactivated.</small>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="text-center mt-4">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" onclick="saveBanner()">[m
[31m-                                            <i class="fas fa-save"></i> Save Banner[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showBannerManagement()">[m
[31m-                                            <i class="fas fa-times"></i> Cancel[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Add Expense Form Page -->[m
[31m-            <div id="addExpenseFormPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-minus-circle"></i>[m
[31m-                                    Fahad Premium Rentals - Add Expense[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-4">[m
[31m-                                <form id="addExpenseForm">[m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Date</label>[m
[31m-                                            <input type="date" class="form-control" id="expense_date" required>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Category</label>[m
[31m-                                            <select class="form-select" id="expense_category" required>[m
[31m-                                                <option value="maintenance">Maintenance/Repair</option>[m
[31m-                                                <option value="fuel">Fuel</option>[m
[31m-                                                <option value="insurance">Insurance</option>[m
[31m-                                                <option value="tax">Tax</option>[m
[31m-                                                <option value="salary">Salary</option>[m
[31m-                                                <option value="rent">Rent</option>[m
[31m-                                                <option value="electricity">Electricity</option>[m
[31m-                                                <option value="water">Water</option>[m
[31m-                                                <option value="internet">Internet</option>[m
[31m-                                                <option value="marketing">Marketing</option>[m
[31m-                                                <option value="other">Other</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Description</label>[m
[31m-                                        <input type="text" class="form-control" id="expense_description" required>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="row">[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Amount (Rs.)</label>[m
[31m-                                            <input type="number" class="form-control" id="expense_amount" required>[m
[31m-                                        </div>[m
[31m-                                        <div class="col-md-6 mb-3">[m
[31m-                                            <label class="form-label">Payment Method</label>[m
[31m-                                            <select class="form-select" id="expense_payment_method">[m
[31m-                                                <option value="cash">Cash</option>[m
[31m-                                                <option value="bank_transfer">Bank Transfer</option>[m
[31m-                                            </select>[m
[31m-                                        </div>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Receipt (Optional)</label>[m
[31m-                                        <input type="file" class="form-control" id="expense_receipt" accept=".jpg,.jpeg,.png,.pdf">[m
[31m-                                        <small class="text-muted">Upload receipt (JPG, PNG, PDF) - Max 50MB</small>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="mb-3">[m
[31m-                                        <label class="form-label">Notes</label>[m
[31m-                                        <textarea class="form-control" id="expense_notes" rows="3"></textarea>[m
[31m-                                    </div>[m
[31m-                                    [m
[31m-                                    <div class="text-center mt-4">[m
[31m-                                        <button type="button" class="btn-gradient btn-lg" onclick="saveExpense()">[m
[31m-                                            <i class="fas fa-save"></i> Add Expense[m
[31m-                                        </button>[m
[31m-                                        <button type="button" class="btn-outline-gradient btn-lg ms-2" onclick="showAccountManagement()">[m
[31m-                                            <i class="fas fa-times"></i> Cancel[m
[31m-                                        </button>[m
[31m-                                    </div>[m
[31m-                                </form>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Payment Page -->[m
[31m-            <div id="paymentPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-check-circle"></i>[m
[31m-                                    Booking Successful![m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-5" id="paymentContent"></div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- View Booking Page -->[m
[31m-            <div id="viewBookingPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-info-circle"></i>[m
[31m-                                    Fahad Premium Rentals - Booking Details[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-5" id="viewBookingContent"></div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            [m
[31m-            <!-- Edit Booking Page -->[m
[31m-            <div id="editBookingPage" style="display: none;">[m
[31m-                <div class="row justify-content-center">[m
[31m-                    <div class="col-md-8">[m
[31m-                        <div class="glass-card">[m
[31m-                            <div class="card-header-gradient" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);">[m
[31m-                                <h3>[m
[31m-                                    <i class="fas fa-edit"></i>[m
[31m-                                    Edit Booking[m
[31m-                                </h3>[m
[31m-                            </div>[m
[31m-                            <div class="card-body p-5" id="editBookingContent"></div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-        </div>[m
[31m-    </div>[m
[31m-    [m
[31m-    <footer class="footer">[m
[31m-        <div class="container">[m
[31m-            <p class="mb-0">[m
[31m-                <i class="fas fa-copyright"></i> 2024 Fahad Premium Rentals. [m
[31m-                All rights reserved. | <i class="fas fa-phone"></i> +94 0753394996 | 0756656862[m
[31m-            </p>[m
[31m-        </div>[m
[31m-    </footer>[m
[31m-    [m
[31m-    <script>[m
[31m-        // ---------------------------[m
[31m-        // SQLite (sql.js) persistence[m
[31m-        // ---------------------------[m
[31m-        let SQL = null;[m
[31m-        let sqliteDb = null;[m
[31m-[m
[31m-        // NOTE: localStorage quota is too small for image BLOB databases.[m
[31m-        // We persist the SQLite bytes into IndexedDB instead.[m
[31m-        const SQLITE_IDB_DB = 'fahad_sqlite_storage_v1';[m
[31m-        const SQLITE_IDB_STORE = 'db';[m
[31m-        const SQLITE_IDB_KEY = 'sqlite_bytes';[m
[31m-[m
[31m-        function openSqliteIdb() {[m
[31m-            return new Promise((resolve, reject) => {[m
[31m-                const req = indexedDB.open(SQLITE_IDB_DB, 1);[m
[31m-                req.onupgradeneeded = () => {[m
[31m-                    const db = req.result;[m
[31m-                    if (!db.objectStoreNames.contains(SQLITE_IDB_STORE)) {[m
[31m-                        db.createObjectStore(SQLITE_IDB_STORE);[m
[31m-                    }[m
[31m-                };[m
[31m-                req.onsuccess = () => resolve(req.result);[m
[31m-                req.onerror = () => reject(req.error);[m
[31m-            });[m
[31m-        }[m
[31m-[m
[31m-        async function idbGetSqliteBytes() {[m
[31m-            const db = await openSqliteIdb();[m
[31m-            return new Promise((resolve, reject) => {[m
[31m-                const tx = db.transaction(SQLITE_IDB_STORE, 'readonly');[m
[31m-                const store = tx.objectStore(SQLITE_IDB_STORE);[m
[31m-                const req = store.get(SQLITE_IDB_KEY);[m
[31m-                req.onsuccess = () => resolve(req.result || null);[m
[31m-                req.onerror = () => reject(req.error);[m
[31m-            });[m
[31m-        }[m
[31m-[m
[31m-        async function idbSetSqliteBytes(bytes) {[m
[31m-            const db = await openSqliteIdb();[m
[31m-            return new Promise((resolve, reject) => {[m
[31m-                const tx = db.transaction(SQLITE_IDB_STORE, 'readwrite');[m
[31m-                const store = tx.objectStore(SQLITE_IDB_STORE);[m
[31m-                store.put(bytes, SQLITE_IDB_KEY);[m
[31m-                tx.oncomplete = () => resolve(true);[m
[31m-                tx.onerror = () => reject(tx.error);[m
[31m-            });[m
[31m-        }[m
[31m-[m
[31m-        async function initSqlite() {[m
[31m-            if (sqliteDb) return sqliteDb;[m
[31m-            if (typeof initSqlJs !== 'function') throw new Error('sql.js failed to load');[m
[31m-[m
[31m-            SQL = await initSqlJs({[m
[31m-                locateFile: file => `https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.11.0/${file}`[m
[31m-            });[m
[31m-[m
[31m-            const savedBytes = await idbGetSqliteBytes();[m
[31m-            sqliteDb = savedBytes ? new SQL.Database(new Uint8Array(savedBytes)) : new SQL.Database();[m
[31m-[m
[31m-            ensureSqliteSchema();[m
[31m-            await persistSqlite();[m
[31m-            return sqliteDb;[m
[31m-        }[m
[31m-[m
[31m-        let persistTimer = null;[m
[31m-        let persistInFlight = false;[m
[31m-[m
[31m-        async function persistSqlite() {[m
[31m-            if (!sqliteDb) return;[m
[31m-            if (persistInFlight) return;[m
[31m-            persistInFlight = true;[m
[31m-            try {[m
[31m-                const bytes = sqliteDb.export(); // Uint8Array[m
[31m-                await idbSetSqliteBytes(bytes.buffer);[m
[31m-            } finally {[m
[31m-                persistInFlight = false;[m
[31m-            }[m
[31m-        }[m
[31m-[m
[31m-        function persistSqliteSoon() {[m
[31m-            if (persistTimer) return;[m
[31m-            persistTimer = setTimeout(async () => {[m
[31m-                persistTimer = null;[m
[31m-                try {[m
[31m-                    await persistSqlite();[m
[31m-                } catch (e) {[m
[31m-                    console.warn('SQLite persist failed', e);[m
[31m-                }[m
[31m-            }, 250);[m
[31m-        }[m
[31m-[m
[31m-        function ensureSqliteSchema() {[m
[31m-            if (!sqliteDb) return;[m
[31m-            sqliteDb.run(`[m
[31m-                CREATE TABLE IF NOT EXISTS bookings ([m
[31m-                    id INTEGER PRIMARY KEY AUTOINCREMENT,[m
[31m-                    tracking_number TEXT,[m
[31m-                    customer_name TEXT,[m
[31m-                    email TEXT,[m
[31m-                    phone TEXT,[m
[31m-                    car_model TEXT,[m
[31m-                    car_price_per_day REAL,[m
[31m-                    pickup_date TEXT,[m
[31m-                    pickup_time TEXT,[m
[31m-                    return_date TEXT,[m
[31m-                    return_time TEXT,[m
[31m-                    total_days INTEGER,[m
[31m-                    total_price REAL,[m
[31m-                    amount_paid REAL,[m
[31m-                    balance_due REAL,[m
[31m-                    payment_status TEXT,[m
[31m-                    status TEXT,[m
[31m-                    id_front_name TEXT,[m
[31m-                    id_front_type TEXT,[m
[31m-                    id_front_blob BLOB,[m
[31m-                    id_back_name TEXT,[m
[31m-                    id_back_type TEXT,[m
[31m-                    id_back_blob BLOB,[m
[31m-                    license_name TEXT,[m
[31m-                    license_type TEXT,[m
[31m-                    license_blob BLOB,[m
[31m-                    created_at TEXT[m
[31m-                );[m
[31m-[m
[31m-                CREATE TABLE IF NOT EXISTS cars ([m
[31m-                    id INTEGER PRIMARY KEY AUTOINCREMENT,[m
[31m-                    name TEXT,[m
[31m-                    model TEXT,[m
[31m-                    price_per_day INTEGER,[m
[31m-                    km_per_day INTEGER,[m
[31m-                    category TEXT,[m
[31m-                    transmission TEXT,[m
[31m-                    seats INTEGER,[m
[31m-                    fuel_type TEXT,[m
[31m-                    available INTEGER,[m
[31m-                    image_name TEXT,[m
[31m-                    image_type TEXT,[m
[31m-                    image_blob BLOB,[m
[31m-                    created_at TEXT[m
[31m-                );[m
[31m-[m
[31m-                CREATE TABLE IF NOT EXISTS banners ([m
[31m-                    id INTEGER PRIMARY KEY AUTOINCREMENT,[m
[31m-                    title TEXT,[m
[31m-                    subtitle TEXT,[m
[31m-                    offer_text TEXT,[m
[31m-                    km_offer INTEGER,[m
[31m-                    price_offer TEXT,[m
[31m-                    is_active INTEGER,[m
[31m-                    image_name TEXT,[m
[31m-                    image_type TEXT,[m
[31m-                    image_blob BLOB,[m
[31m-                    created_at TEXT[m
[31m-                );[m
[31m-[m
[31m-                CREATE TABLE IF NOT EXISTS expenses ([m
[31m-                    id INTEGER PRIMARY KEY AUTOINCREMENT,[m
[31m-                    date TEXT,[m
[31m-                    category TEXT,[m
[31m-                    description TEXT,[m
[31m-                    amount INTEGER,[m
[31m-                    payment_method TEXT,[m
[31m-                    notes TEXT,[m
[31m-                    receipt_name TEXT,[m
[31m-                    receipt_type TEXT,[m
[31m-                    receipt_blob BLOB,[m
[31m-                    created_at TEXT[m
[31m-                );[m
[31m-            `);[m
[31m-        }[m
[31m-[m
[31m-        async function fileToUint8Array(file) {[m
[31m-            const buf = await file.arrayBuffer();[m
[31m-            return new Uint8Array(buf);[m
[31m-        }[m
[31m-[m
[31m-        async function saveBookingToSqlite(booking, idFrontFile, idBackFile, licenseFile) {[m
[31m-            await initSqlite();[m
[31m-            const idFrontBytes = await fileToUint8Array(idFrontFile);[m
[31m-            const idBackBytes = await fileToUint8Array(idBackFile);[m
[31m-            const licBytes = await fileToUint8Array(licenseFile);[m
[31m-[m
[31m-            const stmt = sqliteDb.prepare(`[m
[31m-                INSERT INTO bookings ([m
[31m-                    tracking_number, customer_name, email, phone, car_model, car_price_per_day,[m
[31m-                    pickup_date, pickup_time, return_date, return_time, total_days, total_price,[m
[31m-                    amount_paid, balance_due, payment_status, status,[m
[31m-                    id_front_name, id_front_type, id_front_blob,[m
[31m-                    id_back_name, id_back_type, id_back_blob,[m
[31m-                    license_name, license_type, license_blob,[m
[31m-                    created_at[m
[31m-                ) VALUES ([m
[31m-                    ?,?,?,?,?,?,[m
[31m-                    ?,?,?,?, ?,?,[m
[31m-                    ?,?,?,?,[m
[31m-                    ?,?,?,[m
[31m-                    ?,?,?,[m
[31m-                    ?,?,?,[m
[31m-                    ?[m
[31m-                );[m
[31m-            `);[m
[31m-[m
[31m-            stmt.run([[m
[31m-                booking.tracking_number,[m
[31m-                booking.customer_name,[m
[31m-                booking.email,[m
[31m-                booking.phone,[m
[31m-                booking.car_model,[m
[31m-                booking.car_price_per_day,[m
[31m-                booking.pickup_date,[m
[31m-                booking.pickup_time,[m
[31m-                booking.return_date,[m
[31m-                booking.return_time,[m
[31m-                booking.total_days,[m
[31m-                booking.total_price,[m
[31m-                booking.amount_paid,[m
[31m-                booking.balance_due,[m
[31m-                booking.payment_status,[m
[31m-                booking.status,[m
[31m-                idFrontFile.name,[m
[31m-                idFrontFile.type || '',[m
[31m-                idFrontBytes,[m
[31m-                idBackFile.name,[m
[31m-                idBackFile.type || '',[m
[31m-                idBackBytes,[m
[31m-                licenseFile.name,[m
[31m-                licenseFile.type || '',[m
[31m-                licBytes,[m
[31m-                booking.created_at[m
[31m-            ]);[m
[31m-            stmt.free();[m
[31m-[m
[31m-            // Get autoincrement id[m
[31m-            const res = sqliteDb.exec('SELECT last_insert_rowid() AS id;');[m
[31m-            const id = res?.[0]?.values?.[0]?.[0];[m
[31m-            persistSqliteSoon();[m
[31m-            return id;[m
[31m-        }[m
[31m-[m
[31m-        async function saveCarToSqlite(car, imageFile) {[m
[31m-            await initSqlite();[m
[31m-            const now = car.created_at || new Date().toISOString();[m
[31m-            const imgBytes = imageFile ? await fileToUint8Array(imageFile) : null;[m
[31m-            const stmt = sqliteDb.prepare(`[m
[31m-                INSERT INTO cars ([m
[31m-                    name, model, price_per_day, km_per_day, category, transmission, seats,[m
[31m-                    fuel_type, available, image_name, image_type, image_blob, created_at[m
[31m-                ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);[m
[31m-            `);[m
[31m-            stmt.run([[m
[31m-                car.name, car.model, car.price_per_day, car.km_per_day, car.category, car.transmission, car.seats,[m
[31m-                car.fuel_type, car.available ? 1 : 0,[m
[31m-                imageFile ? imageFile.name : null,[m
[31m-                imageFile ? (imageFile.type || '') : null,[m
[31m-                imgBytes,[m
[31m-                now[m
[31m-            ]);[m
[31m-            stmt.free();[m
[31m-            const res = sqliteDb.exec('SELECT last_insert_rowid() AS id;');[m
[31m-            const id = res?.[0]?.values?.[0]?.[0];[m
[31m-            persistSqliteSoon();[m
[31m-            return id;[m
[31m-        }[m
[31m-[m
[31m-        async function saveBannerToSqlite(banner, imageFile) {[m
[31m-            await initSqlite();[m
[31m-            const now = banner.created_at || new Date().toISOString();[m
[31m-            const imgBytes = imageFile ? await fileToUint8Array(imageFile) : null;[m
[31m-            const stmt = sqliteDb.prepare(`[m
[31m-                INSERT INTO banners ([m
[31m-                    title, subtitle, offer_text, km_offer, price_offer, is_active,[m
[31m-                    image_name, image_type, image_blob, created_at[m
[31m-                ) VALUES (?,?,?,?,?,?,?,?,?,?);[m
[31m-            `);[m
[31m-            stmt.run([[m
[31m-                banner.title,[m
[31m-                banner.subtitle || null,[m
[31m-                banner.offer_text || null,[m
[31m-                Number.isFinite(banner.km_offer) ? banner.km_offer : null,[m
[31m-                banner.price_offer || null,[m
[31m-                banner.is_active ? 1 : 0,[m
[31m-                imageFile ? imageFile.name : null,[m
[31m-                imageFile ? (imageFile.type || '') : null,[m
[31m-                imgBytes,[m
[31m-                now[m
[31m-            ]);[m
[31m-            stmt.free();[m
[31m-            const res = sqliteDb.exec('SELECT last_insert_rowid() AS id;');[m
[31m-            const id = res?.[0]?.values?.[0]?.[0];[m
[31m-            persistSqliteSoon();[m
[31m-            return id;[m
[31m-        }[m
[31m-[m
[31m-        async function saveExpenseToSqlite(expense, receiptFile) {[m
[31m-            await initSqlite();[m
[31m-            const now = expense.created_at || new Date().toISOString();[m
[31m-            const receiptBytes = receiptFile ? await fileToUint8Array(receiptFile) : null;[m
[31m-            const stmt = sqliteDb.prepare(`[m
[31m-                INSERT INTO expenses ([m
[31m-                    date, category, description, amount, payment_method, notes,[m
[31m-                    receipt_name, receipt_type, receipt_blob, created_at[m
[31m-                ) VALUES (?,?,?,?,?,?,?,?,?,?);[m
[31m-            `);[m
[31m-            stmt.run([[m
[31m-                expense.date,[m
[31m-                expense.category,[m
[31m-                expense.description,[m
[31m-                expense.amount,[m
[31m-                expense.payment_method || null,[m
[31m-                expense.notes || null,[m
[31m-                receiptFile ? receiptFile.name : null,[m
[31m-                receiptFile ? (receiptFile.type || '') : null,[m
[31m-                receiptBytes,[m
[31m-                now[m
[31m-            ]);[m
[31m-            stmt.free();[m
[31m-            const res = sqliteDb.exec('SELECT last_insert_rowid() AS id;');[m
[31m-            const id = res?.[0]?.values?.[0]?.[0];[m
[31m-            persistSqliteSoon();[m
[31m-            return id;[m
[31m-        }[m
[31m-[m
[31m-        async function loadDataFromSqlite() {[m
[31m-            await initSqlite();[m
[31m-[m
[31m-            const toObjects = (execResult, columns) => {[m
[31m-                if (!execResult?.length) return [];[m
[31m-                return execResult[0].values.map(row => {[m
[31m-                    const obj = {};[m
[31m-                    for (let i = 0; i < columns.length; i++) obj[columns[i]] = row[i];[m
[31m-                    return obj;[m
[31m-                });[m
[31m-            };[m
[31m-[m
[31m-            // Bookings (do not load blobs into JS arrays; keep only filenames)[m
[31m-            const b = sqliteDb.exec(`[m
[31m-                SELECT id, tracking_number, customer_name, email, phone, car_model, car_price_per_day,[m
[31m-                       pickup_date, pickup_time, return_date, return_time, total_days, total_price,[m
[31m-                       amount_paid, balance_due, payment_status, status,[m
[31m-                       id_front_name, id_back_name, license_name, created_at[m
[31m-                FROM bookings ORDER BY id ASC;[m
[31m-            `);[m
[31m-            bookings = toObjects(b, [[m
[31m-                'id','tracking_number','customer_name','email','phone','car_model','car_price_per_day',[m
[31m-                'pickup_date','pickup_time','return_date','return_time','total_days','total_price',[m
[31m-                'amount_paid','balance_due','payment_status','status',[m
[31m-                'id_front','id_back','license_file','created_at'[m
[31m-            ]);[m
[31m-[m
[31m-            const c = sqliteDb.exec(`[m
[31m-                SELECT id, name, model, price_per_day, km_per_day, category, transmission, seats, fuel_type,[m
[31m-                       available, image_name,[m
[31m-                       CASE WHEN image_blob IS NULL THEN 0 ELSE 1 END AS has_image,[m
[31m-                       created_at[m
[31m-                FROM cars ORDER BY id ASC;[m
[31m-            `);[m
[31m-            cars = toObjects(c, [[m
[31m-                'id','name','model','price_per_day','km_per_day','category','transmission','seats','fuel_type',[m
[31m-                'available','image','has_image','created_at'[m
[31m-            ]).map(x => ({[m
[31m-                ...x,[m
[31m-                available: !!x.available,[m
[31m-                has_image: !!x.has_image,[m
[31m-                image: x.image || null[m
[31m-            }));[m
[31m-[m
[31m-            const bn = sqliteDb.exec(`[m
[31m-                SELECT id, title, subtitle, offer_text, km_offer, price_offer, is_active, image_name, created_at[m
[31m-                FROM banners ORDER BY id ASC;[m
[31m-            `);[m
[31m-            banners = toObjects(bn, [[m
[31m-                'id','title','subtitle','offer_text','km_offer','price_offer','is_active','image','created_at'[m
[31m-            ]).map(x => ({...x, is_active: !!x.is_active, image: x.image || 'default_banner.jpg'}));[m
[31m-[m
[31m-            const ex = sqliteDb.exec(`[m
[31m-                SELECT id, date, category, description, amount, payment_method, notes, receipt_name, created_at[m
[31m-                FROM expenses ORDER BY id ASC;[m
[31m-            `);[m
[31m-            expenses = toObjects(ex, [[m
[31m-                'id','date','category','description','amount','payment_method','notes','receipt','created_at'[m
[31m-            ]);[m
[31m-        }[m
[31m-[m
[31m-        async function downloadSqliteDb() {[m
[31m-            try {[m
[31m-                await initSqlite();[m
[31m-                await persistSqlite();[m
[31m-                const bytes = sqliteDb.export();[m
[31m-                const blob = new Blob([bytes], { type: 'application/x-sqlite3' });[m
[31m-                const url = URL.createObjectURL(blob);[m
[31m-                const a = document.createElement('a');[m
[31m-                a.href = url;[m
[31m-                a.download = 'fahad.db';[m
[31m-                document.body.appendChild(a);[m
[31m-                a.click();[m
[31m-                a.remove();[m
[31m-                URL.revokeObjectURL(url);[m
[31m-            } catch (e) {[m
[31m-                alert('SQLite download failed: ' + (e.message || e));[m
[31m-            }[m
[31m-        }[m
[31m-[m
[31m-        // Car image preview (SQLite BLOB -> object URL)[m
[31m-        const carImageUrlCache = new Map(); // carId -> objectURL[m
[31m-[m
[31m-        async function getCarImageObjectUrlFromSqlite(carId) {[m
[31m-            if (carImageUrlCache.has(carId)) return carImageUrlCache.get(carId);[m
[31m-            await initSqlite();[m
[31m-[m
[31m-            const stmt = sqliteDb.prepare([m
[31m-                `SELECT image_name AS name, image_type AS mime, image_blob AS blob[m
[31m-                 FROM cars WHERE id = ? LIMIT 1;`[m
[31m-            );[m
[31m-            stmt.bind([carId]);[m
[31m-            const row = stmt.step() ? stmt.getAsObject() : null;[m
[31m-            stmt.free();[m
[31m-[m
[31m-            if (!row || !row.blob) return null;[m
[31m-[m
[31m-            const bytes = row.blob instanceof Uint8Array ? row.blob : new Uint8Array(row.blob);[m
[31m-            const mime = row.mime || 'application/octet-stream';[m
[31m-            const url = URL.createObjectURL(new Blob([bytes], { type: mime }));[m
[31m-            carImageUrlCache.set(carId, url);[m
[31m-            return url;[m
[31m-        }[m
[31m-[m
[31m-        async function hydrateCarCardImage(carId) {[m
[31m-            try {[m
[31m-                const imgEl = document.getElementById(`car-img-${carId}`);[m
[31m-                const iconEl = document.getElementById(`car-icon-${carId}`);[m
[31m-                if (!imgEl) return;[m
[31m-[m
[31m-                const url = await getCarImageObjectUrlFromSqlite(carId);[m
[31m-                if (!url) return;[m
[31m-[m
[31m-                imgEl.src = url;[m
[31m-                imgEl.style.display = 'block';[m
[31m-                if (iconEl) iconEl.style.display = 'none';[m
[31m-            } catch (e) {[m
[31m-                console.warn('Car image hydrate failed', e);[m
[31m-            }[m
[31m-        }[m
[31m-[m
[31m-        async function getBookingDocumentFromSqlite(bookingId, docType) {[m
[31m-            await initSqlite();[m
[31m-            const colMap = {[m
[31m-                id_front: { name: 'id_front_name', type: 'id_front_type', blob: 'id_front_blob' },[m
[31m-                id_back: { name: 'id_back_name', type: 'id_back_type', blob: 'id_back_blob' },[m
[31m-                license: { name: 'license_name', type: 'license_type', blob: 'license_blob' }[m
[31m-            };[m
[31m-            const cols = colMap[docType];[m
[31m-            if (!cols) throw new Error('Unknown document type');[m
[31m-[m
[31m-            const stmt = sqliteDb.prepare([m
[31m-                `SELECT ${cols.name} AS name, ${cols.type} AS mime, ${cols.blob} AS blob[m
[31m-                 FROM bookings WHERE id = ? LIMIT 1;`[m
[31m-            );[m
[31m-            stmt.bind([bookingId]);[m
[31m-            const row = stmt.step() ? stmt.getAsObject() : null;[m
[31m-            stmt.free();[m
[31m-[m
[31m-            if (!row || !row.blob) throw new Error('Document not found');[m
[31m-[m
[31m-            // sql.js returns BLOB as Uint8Array[m
[31m-            const bytes = row.blob instanceof Uint8Array ? row.blob : new Uint8Array(row.blob);[m
[31m-            const mime = row.mime || 'application/octet-stream';[m
[31m-            const name = row.name || `${docType}.bin`;[m
[31m-            return { name, mime, bytes };[m
[31m-        }[m
[31m-[m
[31m-        async function previewBookingDocument(bookingId, docType) {[m
[31m-            try {[m
[31m-                const doc = await getBookingDocumentFromSqlite(bookingId, docType);[m
[31m-                const blob = new Blob([doc.bytes], { type: doc.mime });[m
[31m-                const url = URL.createObjectURL(blob);[m
[31m-[m
[31m-                // Open in new tab (images and PDFs supported)[m
[31m-                window.open(url, '_blank', 'noopener,noreferrer');[m
[31m-[m
[31m-                // Revoke later (keep some time so the tab can load)[m
[31m-                setTimeout(() => URL.revokeObjectURL(url), 60_000);[m
[31m-            } catch (e) {[m
[31m-                alert('Preview failed: ' + (e.message || e));[m
[31m-            }[m
[31m-        }[m
[31m-[m
[31m-        async function downloadBookingDocument(bookingId, docType) {[m
[31m-            try {[m
[31m-                const doc = await getBookingDocumentFromSqlite(bookingId, docType);[m
[31m-                const blob = new Blob([doc.bytes], { type: doc.mime });[m
[31m-                const url = URL.createObjectURL(blob);[m
[31m-                const a = document.createElement('a');[m
[31m-                a.href = url;[m
[31m-                a.download = doc.name;[m
[31m-                document.body.appendChild(a);[m
[31m-                a.click();[m
[31m-                a.remove();[m
[31m-                setTimeout(() => URL.revokeObjectURL(url), 5_000);[m
[31m-            } catch (e) {[m
[31m-                alert('Download failed: ' + (e.message || e));[m
[31m-            }[m
[31m-        }[m
[31m-[m
[31m-        // Data Storage[m
[31m-        let bookings = [];[m
[31m-        let cars = [];[m
[31m-        let banners = [];[m
[31m-        let background = {[m
[31m-            image: 'default_bg.jpg',[m
[31m-            title: 'Fahad Premium Rentals',[m
[31m-            description: 'Luxury Car Rental in Sri Lanka'[m
[31m-        };[m
[31m-        let hero = {[m
[31m-            image: 'default_hero.jpg',[m
[31m-            title: 'Fahad Premium Rentals',[m
[31m-            subtitle: 'Luxury Car Rental in Sri Lanka',[m
[31m-            overlay_opacity: 0.6,[m
[31m-            overlay_color: '0,0,0',[m
[31m-            is_active: true[m
[31m-        };[m
[31m-        let transactions = [];[m
[31m-        let expenses = [];[m
[31m-        let currentBalance = 0;[m
[31m-        let isAdminLoggedIn = false;[m
[31m-        [m
[31m-        // Initialize Sample Data[m
[31m-        function initializeData() {[m
[31m-            // Sample Cars[m
[31m-            cars = [[m
[31m-                {id: 1, name: 'Toyota Innova', model: '2024', price_per_day: 15000, km_per_day: 100, category: 'suv', seats: 7, transmission: 'automatic', fuel_type: 'petrol', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 2, name: 'Honda City', model: '2024', price_per_day: 10000, km_per_day: 100, category: 'sedan', seats: 5, transmission: 'automatic', fuel_type: 'petrol', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 3, name: 'Hyundai Creta', model: '2024', price_per_day: 12000, km_per_day: 100, category: 'suv', seats: 5, transmission: 'automatic', fuel_type: 'petrol', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 4, name: 'Mahindra Thar', model: '2024', price_per_day: 18000, km_per_day: 120, category: 'suv', seats: 4, transmission: 'manual', fuel_type: 'diesel', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 5, name: 'Toyota Fortuner', model: '2024', price_per_day: 25000, km_per_day: 150, category: 'luxury', seats: 7, transmission: 'automatic', fuel_type: 'diesel', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 6, name: 'Mercedes Benz', model: '2024', price_per_day: 45000, km_per_day: 200, category: 'luxury', seats: 5, transmission: 'automatic', fuel_type: 'petrol', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 7, name: 'BMW X5', model: '2024', price_per_day: 40000, km_per_day: 200, category: 'luxury', seats: 5, transmission: 'automatic', fuel_type: 'petrol', available: true, image: 'default_car.jpg'},[m
[31m-                {id: 8, name: 'Audi Q7', model: '2024', price_per_day: 42000, km_per_day: 200, category: 'luxury', seats: 7, transmission: 'automatic', fuel_type: 'petrol', available: true, image: 'default_car.jpg'}[m
[31m-            ];[m
[31m-            [m
[31m-            // Sample Banner[m
[31m-            banners = [[m
[31m-                {[m
[31m-                    id: 1,[m
[31m-                    title: 'Fahad Premium Rentals',[m
[31m-                    subtitle: 'Experience luxury with our premium fleet. Best prices, guaranteed!',[m
[31m-                    image: 'default_banner.jpg',[m
[31m-                    offer_text: 'SPECIAL OFFER',[m
[31m-                    km_offer: 300,[m
[31m-                    price_offer: 'Rs. 15,000/=',[m
[31m-                    is_active: true,[m
[31m-                    created_at: new Date().toISOString()[m
[31m-                }[m
[31m-            ];[m
[31m-            [m
[31m-            // Display Cars[m
[31m-            displayCars();[m
[31m-            updateCarSelect();[m
[31m-[m
[31m-            // If a SQLite DB exists, load data from it and refresh UI[m
[31m-            (async () => {[m
[31m-                try {[m
[31m-                    const hasDb = await idbGetSqliteBytes();[m
[31m-                    if (!hasDb) return;[m
[31m-                    await loadDataFromSqlite();[m
[31m-                    displayCars();[m
[31m-                    updateCarSelect();[m
[31m-                    if (typeof updateAdminDashboard === 'function') updateAdminDashboard();[m
[31m-                } catch (e) {[m
[31m-                    console.warn('SQLite load failed', e);[m
[31m-                }[m
[31m-            })();[m
[31m-        }[m
[31m-        [m
[31m-        // Format Currency[m
[31m-        function formatCurrency(amount) {[m
[31m-            return 'Rs. ' + amount.toLocaleString('en-US') + '/=';[m
[31m-        }[m
[31m-        [m
[31m-        function formatCurrencySimple(amount) {[m
[31m-            return 'Rs. ' + amount.toLocaleString('en-US');[m
[31m-        }[m
[31m-        [m
[31m-        // Generate Tracking Number[m
[31m-        function generateTrackingNumber() {[m
[31m-            let lastNum = 0;[m
[31m-            if (bookings.length > 0) {[m
[31m-                const lastBooking = bookings[bookings.length - 1];[m
[31m-                if (lastBooking.tracking_number) {[m
[31m-                    lastNum = parseInt(lastBooking.tracking_number.substring(2)) || 0;[m
[31m-                }[m
[31m-            }[m
[31m-            const newNum = lastNum + 1;[m
[31m-            return 'FR' + newNum.toString().padStart(5, '0');[m
[31m-        }[m
[31m-        [m
[31m-        // Page Navigation[m
[31m-        function showHome() {[m
[31m-            document.getElementById('homePage').style.display = 'block';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            // Reset to today's date[m
[31m-            const today = new Date().toISOString().split('T')[0];[m
[31m-            document.getElementById('pickup_date').min = today;[m
[31m-            document.getElementById('return_date').min = today;[m
[31m-        }[m
[31m-        [m
[31m-        function showBookingForm() {[m
[31m-            document.getElementById('booking-form').scrollIntoView({ behavior: 'smooth' });[m
[31m-        }[m
[31m-        [m
[31m-        function showBookingStatus() {[m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'block';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-        }[m
[31m-        [m
[31m-        function showAdminLogin() {[m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'block';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-        }[m
[31m-        [m
[31m-        function showAdminDashboard() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'block';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            updateAdminDashboard();[m
[31m-        }[m
[31m-        [m
[31m-        function showCarManagement() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'block';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            displayCarsTable();[m
[31m-        }[m
[31m-        [m
[31m-        function showBannerManagement() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'block';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            displayBannersTable();[m
[31m-        }[m
[31m-        [m
[31m-        function showBackgroundManagement() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'block';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            document.getElementById('background_title').value = background.title || '';[m
[31m-            document.getElementById('background_description').value = background.description || '';[m
[31m-            document.getElementById('currentBackgroundName').textContent = 'Filename: ' + background.image;[m
[31m-            displayBackgroundGallery();[m
[31m-        }[m
[31m-        [m
[31m-        function showHeroManagement() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'block';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            document.getElementById('hero_title').value = hero.title || 'Fahad Premium Rentals';[m
[31m-            document.getElementById('hero_subtitle').value = hero.subtitle || 'Luxury Car Rental in Sri Lanka';[m
[31m-            document.getElementById('hero_opacity').value = hero.overlay_opacity || 0.6;[m
[31m-            document.getElementById('hero_color').value = hero.overlay_color || '0,0,0';[m
[31m-            document.getElementById('hero_active').checked = hero.is_active;[m
[31m-            document.getElementById('currentHeroName').textContent = 'Filename: ' + hero.image;[m
[31m-            document.getElementById('heroTitle').textContent = hero.title || 'Fahad Premium Rentals';[m
[31m-            document.getElementById('heroSubtitle').textContent = hero.subtitle || 'Luxury Car Rental in Sri Lanka';[m
[31m-            document.getElementById('heroOverlay').style.background = 'rgba(' + hero.overlay_color + ', ' + hero.overlay_opacity + ')';[m
[31m-            displayHeroGallery();[m
[31m-        }[m
[31m-        [m
[31m-        function showAccountManagement() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'block';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            updateAccountManagement();[m
[31m-        }[m
[31m-        [m
[31m-        function showAddCarForm() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'block';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            // Reset form[m
[31m-            document.getElementById('addCarForm').reset();[m
[31m-            document.getElementById('car_km').value = 100;[m
[31m-            document.getElementById('car_seats').value = 5;[m
[31m-            document.getElementById('car_available').checked = true;[m
[31m-        }[m
[31m-        [m
[31m-        function showAddBannerForm() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'block';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-        }[m
[31m-        [m
[31m-        function showAddExpenseForm() {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'block';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            // Set today's date[m
[31m-            const today = new Date().toISOString().split('T')[0];[m
[31m-            document.getElementById('expense_date').value = today;[m
[31m-        }[m
[31m-        [m
[31m-        function showViewBooking(bookingId) {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            const booking = bookings.find(b => b.id == bookingId);[m
[31m-            if (!booking) return;[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'block';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            displayViewBooking(booking);[m
[31m-        }[m
[31m-        [m
[31m-        function showEditBooking(bookingId) {[m
[31m-            if (!isAdminLoggedIn) {[m
[31m-                showAdminLogin();[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            const booking = bookings.find(b => b.id == bookingId);[m
[31m-            if (!booking) return;[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'block';[m
[31m-            [m
[31m-            displayEditBooking(booking);[m
[31m-        }[m
[31m-        [m
[31m-        // Display Functions[m
[31m-        function displayCars() {[m
[31m-            const carsContainer = document.getElementById('carsContainer');[m
[31m-            if (!carsContainer) return;[m
[31m-            [m
[31m-            let html = '';[m
[31m-            cars.filter(car => car.available).forEach(car => {[m
[31m-                html += `[m
[31m-                    <div class="col-md-4 mb-4">[m
[31m-                        <div class="car-card" onclick="selectCar('${car.name} ${car.model}', ${car.price_per_day})">[m
[31m-                            <div class="car-image">[m
[31m-                                <i class="fas fa-car" id="car-icon-${car.id}"></i>[m
[31m-                                <img id="car-img-${car.id}" alt="${car.name}" style="display:none;">[m
[31m-                            </div>[m
[31m-                            <div class="car-details">[m
[31m-                                <h4>${car.name}</h4>[m
[31m-                                <p class="text-muted">${car.model} • ${car.transmission} • ${car.seats} Seats • ${car.fuel_type}</p>[m
[31m-                                <div class="car-price">${formatCurrencySimple(car.price_per_day)}/day</div>[m
[31m-                                <small class="text-info">${car.km_per_day} km/day included</small>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                `;[m
[31m-            });[m
[31m-            [m
[31m-            carsContainer.innerHTML = html;[m
[31m-[m
[31m-            // Load images from SQLite for cards that have images[m
[31m-            cars.filter(car => car.available && car.has_image).forEach(car => {[m
[31m-                hydrateCarCardImage(car.id);[m
[31m-            });[m
[31m-        }[m
[31m-        [m
[31m-        function updateCarSelect() {[m
[31m-            const carSelect = document.getElementById('car_model');[m
[31m-            if (!carSelect) return;[m
[31m-            [m
[31m-            let html = '<option value="">Select a car</option>';[m
[31m-            cars.filter(car => car.available).forEach(car => {[m
[31m-                html += `<option value="${car.name} ${car.model}" data-price="${car.price_per_day}" data-km="${car.km_per_day}">[m
[31m-                    ${car.name} ${car.model} - ${formatCurrencySimple(car.price_per_day)}/day (${car.km_per_day} km/day)[m
[31m-                </option>`;[m
[31m-            });[m
[31m-            [m
[31m-            carSelect.innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        function selectCar(carName, price) {[m
[31m-            const select = document.getElementById('car_model');[m
[31m-            for (let option of select.options) {[m
[31m-                if (option.text.includes(carName)) {[m
[31m-                    option.selected = true;[m
[31m-                    break;[m
[31m-                }[m
[31m-            }[m
[31m-            calculateTotal();[m
[31m-            [m
[31m-            // Scroll to booking form[m
[31m-            document.getElementById('booking-form').scrollIntoView({ behavior: 'smooth' });[m
[31m-        }[m
[31m-        [m
[31m-        // Price Calculator[m
[31m-        function calculateTotal() {[m
[31m-            const pickupDate = document.getElementById('pickup_date');[m
[31m-            const returnDate = document.getElementById('return_date');[m
[31m-            const carSelect = document.getElementById('car_model');[m
[31m-            [m
[31m-            const priceSummary = document.getElementById('price-summary');[m
[31m-            const paymentNotice = document.getElementById('payment-notice');[m
[31m-            const submitBtn = document.getElementById('submitBtn');[m
[31m-            [m
[31m-            const totalDaysEl = document.getElementById('totalDays');[m
[31m-            const pricePerDayEl = document.getElementById('pricePerDay');[m
[31m-            const totalPriceEl = document.getElementById('totalPrice');[m
[31m-            const priceBreakdown = document.getElementById('priceBreakdown');[m
[31m-            const selectedCarName = document.getElementById('selectedCarName');[m
[31m-            const pickupDisplay = document.getElementById('pickupDisplay');[m
[31m-            const returnDisplay = document.getElementById('returnDisplay');[m
[31m-            [m
[31m-            if (!pickupDate || !returnDate || !carSelect) return;[m
[31m-            [m
[31m-            if (pickupDate.value && returnDate.value && carSelect.value) {[m
[31m-                const pickup = new Date(pickupDate.value);[m
[31m-                const ret = new Date(returnDate.value);[m
[31m-                const diffTime = ret - pickup;[m
[31m-                const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));[m
[31m-                [m
[31m-                if (diffDays > 0) {[m
[31m-                    const selectedOption = carSelect.options[carSelect.selectedIndex];[m
[31m-                    const pricePerDay = parseFloat(selectedOption.dataset.price) || 0;[m
[31m-                    [m
[31m-                    // Calculate total[m
[31m-                    const total = diffDays * pricePerDay;[m
[31m-                    [m
[31m-                    // Update display[m
[31m-                    selectedCarName.textContent = carSelect.value;[m
[31m-                    pricePerDayEl.textContent = 'Rs. ' + pricePerDay.toLocaleString('en-US') + '/=';[m
[31m-                    totalDaysEl.textContent = diffDays;[m
[31m-                    totalPriceEl.innerHTML = '<strong>Rs. ' + total.toLocaleString('en-US') + '/=</strong>';[m
[31m-                    [m
[31m-                    // Format dates[m
[31m-                    const pickupDateObj = new Date(pickupDate.value);[m
[31m-                    const returnDateObj = new Date(returnDate.value);[m
[31m-                    pickupDisplay.textContent = pickupDateObj.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });[m
[31m-                    returnDisplay.textContent = returnDateObj.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });[m
[31m-                    [m
[31m-                    priceBreakdown.textContent = diffDays + ' days × Rs. ' + pricePerDay.toLocaleString('en-US') + '/= = Rs. ' + total.toLocaleString('en-US') + '/=';[m
[31m-                    [m
[31m-                    // Show summary and enable submit[m
[31m-                    priceSummary.style.display = 'block';[m
[31m-                    paymentNotice.style.display = 'block';[m
[31m-                    submitBtn.disabled = false;[m
[31m-                    [m
[31m-                    // Store total for submission[m
[31m-                    document.getElementById('total_price_hidden')?.remove();[m
[31m-                    const hiddenInput = document.createElement('input');[m
[31m-                    hiddenInput.type = 'hidden';[m
[31m-                    hiddenInput.name = 'total_price';[m
[31m-                    hiddenInput.id = 'total_price_hidden';[m
[31m-                    hiddenInput.value = total;[m
[31m-                    document.querySelector('form').appendChild(hiddenInput);[m
[31m-                } else if (diffDays === 0) {[m
[31m-                    alert('Return date must be after pickup date');[m
[31m-                    priceSummary.style.display = 'none';[m
[31m-                    paymentNotice.style.display = 'none';[m
[31m-                    submitBtn.disabled = true;[m
[31m-                } else {[m
[31m-                    priceSummary.style.display = 'none';[m
[31m-                    paymentNotice.style.display = 'none';[m
[31m-                    submitBtn.disabled = true;[m
[31m-                }[m
[31m-            } else {[m
[31m-                priceSummary.style.display = 'none';[m
[31m-                paymentNotice.style.display = 'none';[m
[31m-                submitBtn.disabled = true;[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        // Booking Functions[m
[31m-        async function submitBooking() {[m
[31m-            // Validate form[m
[31m-            const customerName = document.getElementById('customer_name').value;[m
[31m-            const email = document.getElementById('email').value;[m
[31m-            const phone = document.getElementById('phone').value;[m
[31m-            const carModel = document.getElementById('car_model').value;[m
[31m-            const pickupDate = document.getElementById('pickup_date').value;[m
[31m-            const returnDate = document.getElementById('return_date').value;[m
[31m-            const idFront = document.getElementById('id_front').files[0];[m
[31m-            const idBack = document.getElementById('id_back').files[0];[m
[31m-            const licenseFile = document.getElementById('license_file').files[0];[m
[31m-            [m
[31m-            if (!customerName || !email || !phone || !carModel || !pickupDate || !returnDate || !idFront || !idBack || !licenseFile) {[m
[31m-                alert('Please fill in all fields and upload all required documents');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            // Validate phone number (Sri Lankan format)[m
[31m-            const phoneRegex = /^(07[0-9]{8}|7[0-9]{8}|\+947[0-9]{8}|00947[0-9]{8})$/;[m
[31m-            const cleanPhone = phone.replace(/[\s\-\(\)]/g, '');[m
[31m-            if (!phoneRegex.test(cleanPhone)) {[m
[31m-                alert('Invalid phone number. Use Sri Lankan format (e.g., 0771234567, 771234567, or +94771234567)');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            // Validate file sizes (max 50MB)[m
[31m-            const maxSize = 50 * 1024 * 1024; // 50MB[m
[31m-            if (idFront.size > maxSize || idBack.size > maxSize || licenseFile.size > maxSize) {[m
[31m-                alert('One or more files exceed the 50MB limit. Please compress your files and try again.');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            // Get car price[m
[31m-            const carSelect = document.getElementById('car_model');[m
[31m-            const selectedOption = carSelect.options[carSelect.selectedIndex];[m
[31m-            const pricePerDay = parseFloat(selectedOption.dataset.price) || 0;[m
[31m-            [m
[31m-            // Calculate total days and price[m
[31m-            const pickup = new Date(pickupDate);[m
[31m-            const ret = new Date(returnDate);[m
[31m-            const totalDays = Math.ceil((ret - pickup) / (1000 * 60 * 60 * 24));[m
[31m-            const totalPrice = totalDays * pricePerDay;[m
[31m-            [m
[31m-            // Check if car is already booked (simple check)[m
[31m-            const pickupTime = document.getElementById('pickup_time').value;[m
[31m-            const returnTime = document.getElementById('return_time').value;[m
[31m-            [m
[31m-            const overlapping = bookings.some(b => [m
[31m-                b.car_model === carModel && [m
[31m-                b.status !== 'cancelled' &&[m
[31m-                b.pickup_date <= returnDate && [m
[31m-                b.return_date >= pickupDate[m
[31m-            );[m
[31m-            [m
[31m-            if (overlapping) {[m
[31m-                alert('This car is already booked for the selected dates. Please choose another car or different dates.');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            // Generate tracking number[m
[31m-            const trackingNumber = generateTrackingNumber();[m
[31m-            [m
[31m-            // Create booking object[m
[31m-            const booking = {[m
[31m-                id: bookings.length + 1,[m
[31m-                tracking_number: trackingNumber,[m
[31m-                customer_name: customerName,[m
[31m-                email: email,[m
[31m-                phone: phone,[m
[31m-                car_model: carModel,[m
[31m-                car_price_per_day: pricePerDay,[m
[31m-                pickup_date: pickupDate,[m
[31m-                pickup_time: pickupTime,[m
[31m-                return_date: returnDate,[m
[31m-                return_time: returnTime,[m
[31m-                total_days: totalDays,[m
[31m-                total_price: totalPrice,[m
[31m-                amount_paid: 0,[m
[31m-                balance_due: totalPrice,[m
[31m-                payment_status: 'pending',[m
[31m-                id_front: 'uploaded_front.jpg', // Simulated[m
[31m-                id_back: 'uploaded_back.jpg', // Simulated[m
[31m-                license_file: 'uploaded_license.jpg', // Simulated[m
[31m-                status: 'pending',[m
[31m-                created_at: new Date().toISOString()[m
[31m-            };[m
[31m-[m
[31m-            // Save to SQLite (including uploaded files)[m
[31m-            try {[m
[31m-                const dbId = await saveBookingToSqlite(booking, idFront, idBack, licenseFile);[m
[31m-                booking.id = dbId;[m
[31m-                booking.id_front = idFront.name;[m
[31m-                booking.id_back = idBack.name;[m
[31m-                booking.license_file = licenseFile.name;[m
[31m-            } catch (e) {[m
[31m-                alert('Could not save to SQLite DB: ' + (e.message || e));[m
[31m-                return;[m
[31m-            }[m
[31m-[m
[31m-            // Add to bookings array[m
[31m-            bookings.push(booking);[m
[31m-            [m
[31m-            // Show success message[m
[31m-            alert(`Booking successful! Your tracking number is: ${trackingNumber}. Total amount: ${formatCurrency(totalPrice)}. Please complete payment.`);[m
[31m-            [m
[31m-            // Redirect to payment page[m
[31m-            showPayment(booking.id);[m
[31m-        }[m
[31m-        [m
[31m-        function resetBookingForm() {[m
[31m-            document.getElementById('bookingForm').reset();[m
[31m-            document.getElementById('price-summary').style.display = 'none';[m
[31m-            document.getElementById('payment-notice').style.display = 'none';[m
[31m-            document.getElementById('submitBtn').disabled = true;[m
[31m-        }[m
[31m-        [m
[31m-        // Payment Functions[m
[31m-        function showPayment(bookingId) {[m
[31m-            const booking = bookings.find(b => b.id == bookingId);[m
[31m-            if (!booking) return;[m
[31m-            [m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'none';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'block';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            const now = new Date().toLocaleString();[m
[31m-            [m
[31m-            let html = `[m
[31m-                <div class="text-center mb-4">[m
[31m-                    <i class="fas fa-check-circle text-success" style="font-size: 80px;"></i>[m
[31m-                </div>[m
[31m-                [m
[31m-                <h2 class="text-center mb-4">Thank You, ${booking.customer_name}!</h2>[m
[31m-                [m
[31m-                <!-- Tracking Number Highlight -->[m
[31m-                <div class="alert alert-info text-center p-4 mb-4">[m
[31m-                    <h4 class="mb-2"><i class="fas fa-qrcode"></i> Your Tracking Number:</h4>[m
[31m-                    <div style="font-size: 48px; font-weight: 800; letter-spacing: 5px; background: #f8f9fa; padding: 20px; border-radius: 15px; border: 3px dashed #667eea;">[m
[31m-                        ${booking.tracking_number}[m
[31m-                    </div>[m
[31m-                    <p class="mt-3 mb-0"><i class="fas fa-save"></i> Save this number to check your booking status</p>[m
[31m-                </div>[m
[31m-                [m
[31m-                <!-- Price Summary Card -->[m
[31m-                <div class="card border-0 shadow mb-4">[m
[31m-                    <div class="card-header bg-primary text-white">[m
[31m-                        <h5 class="mb-0"><i class="fas fa-money-bill-wave"></i> Price Summary</h5>[m
[31m-                    </div>[m
[31m-                    <div class="card-body">[m
[31m-                        <div class="row">[m
[31m-                            <div class="col-md-6">[m
[31m-                                <p><strong>Car:</strong> ${booking.car_model}</p>[m
[31m-                                <p><strong>Price per day:</strong> ${formatCurrency(booking.car_price_per_day)}</p>[m
[31m-                                <p><strong>Duration:</strong> ${booking.total_days} days</p>[m
[31m-                            </div>[m
[31m-                            <div class="col-md-6">[m
[31m-                                <h3 class="text-primary">Total: ${formatCurrency(booking.total_price)}</h3>[m
[31m-                                <hr>[m
[31m-                                <p><strong>Amount Paid:</strong> ${formatCurrency(booking.amount_paid)}</p>[m
[31m-                                <p><strong>Balance Due:</strong> ${formatCurrency(booking.balance_due)}</p>[m
[31m-                                <p><strong>Payment Status:</strong> [m
[31m-                                    <span class="badge ${booking.payment_status === 'paid' ? 'bg-success' : booking.payment_status === 'partial' ? 'bg-warning' : 'bg-danger'}">[m
[31m-                                        ${booking.payment_status.toUpperCase()}[m
[31m-                                    </span>[m
[31m-                                </p>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            `;[m
[31m-            [m
[31m-            if (booking.balance_due > 0) {[m
[31m-                html += `[m
[31m-                    <!-- Payment Form -->[m
[31m-                    <div class="card border-0 shadow mb-4">[m
[31m-                        <div class="card-header bg-warning">[m
[31m-                            <h5 class="mb-0"><i class="fas fa-credit-card"></i> Make Payment</h5>[m
[31m-                        </div>[m
[31m-                        <div class="card-body">[m
[31m-                            <form id="paymentForm" onsubmit="event.preventDefault(); processPayment(${booking.id})">[m
[31m-                                <div class="mb-3">[m
[31m-                                    <label class="form-label">Amount to Pay (Rs.)</label>[m
[31m-                                    <input type="number" class="form-control" id="payment_amount" value="${booking.balance_due}" min="1" max="${booking.balance_due}" required>[m
[31m-                                    <small class="text-muted">Balance due: ${formatCurrency(booking.balance_due)}</small>[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <div class="mb-3">[m
[31m-                                    <label class="form-label">Payment Method</label>[m
[31m-                                    <select class="form-select" id="payment_method" required>[m
[31m-                                        <option value="bank_transfer">Bank Transfer</option>[m
[31m-                                        <option value="cash">Cash</option>[m
[31m-                                    </select>[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <div class="mb-3">[m
[31m-                                    <label class="form-label">Reference Number (Optional)</label>[m
[31m-                                    <input type="text" class="form-control" id="payment_reference" placeholder="Enter reference number">[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <div class="mb-3">[m
[31m-                                    <label class="form-label">Payment Screenshot (Optional)</label>[m
[31m-                                    <input type="file" class="form-control" id="payment_screenshot" accept=".jpg,.jpeg,.png">[m
[31m-                                    <small class="text-muted">Max file size: 50MB</small>[m
[31m-                                </div>[m
[31m-                                [m
[31m-                                <button type="submit" class="btn-gradient">[m
[31m-                                    <i class="fas fa-check"></i> Submit Payment[m
[31m-                                </button>[m
[31m-                            </form>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                `;[m
[31m-            }[m
[31m-            [m
[31m-            // Bank Details[m
[31m-            html += `[m
[31m-                <!-- Bank Details -->[m
[31m-                <div class="card border-0 shadow mb-4">[m
[31m-                    <div class="card-header bg-info text-white">[m
[31m-                        <h5 class="mb-0"><i class="fas fa-university"></i> Bank Transfer Details</h5>[m
[31m-                    </div>[m
[31m-                    <div class="card-body">[m
[31m-                        <div class="alert alert-info">[m
[31m-                            <strong>Bank Name:</strong> Bank of Ceylon<br>[m
[31m-                            <strong>Account Name:</strong> Fahad Rental Service<br>[m
[31m-                            <strong>Account Number:</strong> 123456789012<br>[m
[31m-                            <strong>Branch Code:</strong> 123<br>[m
[31m-                            <strong>Account Type:</strong> Savings<br>[m
[31m-                            <strong>Amount to Pay:</strong> ${formatCurrency(booking.balance_due)}[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <!-- WhatsApp Contact -->[m
[31m-                <div class="text-center mt-4">[m
[31m-                    <a href="https://wa.me/94756656862?text=Hello%20Fahad%20Premium%20Rentals%2C%0A%0AI%20just%20made%20a%20booking%20with%20tracking%20number%3A%20*${booking.tracking_number}*%0A%0ABooking%20Details%3A%0A•%20Customer%3A%20${encodeURIComponent(booking.customer_name)}%0A•%20Car%3A%20${encodeURIComponent(booking.car_model)}%0A•%20Total%3A%20${encodeURIComponent(formatCurrency(booking.total_price))}%0A•%20Paid%3A%20${encodeURIComponent(formatCurrency(booking.amount_paid))}%0A•%20Balance%3A%20${encodeURIComponent(formatCurrency(booking.balance_due))}%0A•%20Pickup%3A%20${booking.pickup_date}%20at%20${booking.pickup_time}%0A•%20Return%3A%20${booking.return_date}%20at%20${booking.return_time}%0A•%20Booked%20at%3A%20${encodeURIComponent(now)}%0A%0APlease%20confirm%20my%20booking.%20Thank%20you!" target="_blank" class="btn-success btn-lg" style="background: #25D366; color: white; padding: 15px 40px; border-radius: 50px; text-decoration: none; display: inline-block; font-weight: 600;">[m
[31m-                        <i class="fab fa-whatsapp" style="font-size: 24px; margin-right: 10px;"></i>[m
[31m-                        Share on WhatsApp[m
[31m-                    </a>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="text-center mt-4">[m
[31m-                    <button class="btn-gradient" onclick="showHome()">[m
[31m-                        <i class="fas fa-home"></i> Back to Home[m
[31m-                    </button>[m
[31m-                    <button class="btn-outline-gradient" onclick="searchBookingByNumber('${booking.tracking_number}')">[m
[31m-                        <i class="fas fa-search"></i> Check Status[m
[31m-                    </button>[m
[31m-                </div>[m
[31m-            `;[m
[31m-            [m
[31m-            document.getElementById('paymentContent').innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        function processPayment(bookingId) {[m
[31m-            const booking = bookings.find(b => b.id == bookingId);[m
[31m-            if (!booking) return;[m
[31m-            [m
[31m-            const amount = parseInt(document.getElementById('payment_amount').value);[m
[31m-            const method = document.getElementById('payment_method').value;[m
[31m-            const reference = document.getElementById('payment_reference').value;[m
[31m-            [m
[31m-            if (!amount || amount <= 0) {[m
[31m-                alert('Please enter a valid amount');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            if (amount > booking.balance_due) {[m
[31m-                alert('Amount cannot exceed balance due');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            // Update booking[m
[31m-            booking.amount_paid += amount;[m
[31m-            booking.balance_due = booking.total_price - booking.amount_paid;[m
[31m-            booking.payment_method = method;[m
[31m-            booking.payment_reference = reference;[m
[31m-            [m
[31m-            if (booking.balance_due <= 0) {[m
[31m-                booking.payment_status = 'paid';[m
[31m-                booking.balance_due = 0;[m
[31m-            } else if (booking.amount_paid > 0) {[m
[31m-                booking.payment_status = 'partial';[m
[31m-            }[m
[31m-            [m
[31m-            // Add transaction[m
[31m-            const transaction = {[m
[31m-                id: transactions.length + 1,[m
[31m-                date: new Date().toISOString(),[m
[31m-                type: 'income',[m
[31m-                category: 'booking_payment',[m
[31m-                description: `Payment for booking ${booking.tracking_number}`,[m
[31m-                amount: amount,[m
[31m-                balance_after: currentBalance + amount,[m
[31m-                reference_id: booking.tracking_number,[m
[31m-                payment_method: method,[m
[31m-                notes: `Payment received from ${booking.customer_name}`[m
[31m-            };[m
[31m-            transactions.push(transaction);[m
[31m-            currentBalance += amount;[m
[31m-            [m
[31m-            alert(`Payment of ${formatCurrency(amount)} recorded! Balance due: ${formatCurrency(booking.balance_due)}`);[m
[31m-            [m
[31m-            // Refresh payment page[m
[31m-            showPayment(bookingId);[m
[31m-        }[m
[31m-        [m
[31m-        // Booking Status Functions[m
[31m-        function searchBooking() {[m
[31m-            const trackingNumber = document.getElementById('tracking_number').value.trim().toUpperCase();[m
[31m-            [m
[31m-            if (!trackingNumber) {[m
[31m-                alert('Please enter a tracking number');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            const booking = bookings.find(b => b.tracking_number === trackingNumber);[m
[31m-            [m
[31m-            if (booking) {[m
[31m-                displayBookingResult(booking);[m
[31m-            } else {[m
[31m-                alert(`No booking found with tracking number: ${trackingNumber}`);[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function searchBookingByNumber(trackingNumber) {[m
[31m-            const booking = bookings.find(b => b.tracking_number === trackingNumber);[m
[31m-            if (booking) {[m
[31m-                displayBookingResult(booking);[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function displayBookingResult(booking) {[m
[31m-            document.getElementById('homePage').style.display = 'none';[m
[31m-            document.getElementById('bookingStatusPage').style.display = 'none';[m
[31m-            document.getElementById('bookingResultPage').style.display = 'block';[m
[31m-            document.getElementById('adminLoginPage').style.display = 'none';[m
[31m-            document.getElementById('adminDashboardPage').style.display = 'none';[m
[31m-            document.getElementById('carManagementPage').style.display = 'none';[m
[31m-            document.getElementById('bannerManagementPage').style.display = 'none';[m
[31m-            document.getElementById('backgroundManagementPage').style.display = 'none';[m
[31m-            document.getElementById('heroManagementPage').style.display = 'none';[m
[31m-            document.getElementById('accountManagementPage').style.display = 'none';[m
[31m-            document.getElementById('addCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('editCarFormPage').style.display = 'none';[m
[31m-            document.getElementById('addBannerFormPage').style.display = 'none';[m
[31m-            document.getElementById('addExpenseFormPage').style.display = 'none';[m
[31m-            document.getElementById('paymentPage').style.display = 'none';[m
[31m-            document.getElementById('viewBookingPage').style.display = 'none';[m
[31m-            document.getElementById('editBookingPage').style.display = 'none';[m
[31m-            [m
[31m-            const now = new Date().toLocaleString();[m
[31m-            [m
[31m-            let statusColor = '';[m
[31m-            let statusIcon = '';[m
[31m-            let statusMessage = '';[m
[31m-            [m
[31m-            if (booking.status === 'pending') {[m
[31m-                statusColor = 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)';[m
[31m-                statusIcon = 'fa-clock';[m
[31m-                statusMessage = `Your booking is pending payment confirmation. Balance due: ${formatCurrency(booking.balance_due)}. Please complete the payment and contact us on WhatsApp.`;[m
[31m-            } else if (booking.status === 'active') {[m
[31m-                statusColor = 'linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%)';[m
[31m-                statusIcon = 'fa-play';[m
[31m-                statusMessage = `Your rental is currently ACTIVE! Enjoy your ride. Please return the car on ${booking.return_date} at ${booking.return_time}.`;[m
[31m-            } else if (booking.status === 'completed') {[m
[31m-                statusColor = 'linear-gradient(135deg, #11998e 0%, #38ef7d 100%)';[m
[31m-                statusIcon = 'fa-check-circle';[m
[31m-                statusMessage = `Your rental has been COMPLETED. Thank you for choosing Fahad Premium Rentals! We hope to see you again.`;[m
[31m-            } else {[m
[31m-                statusColor = 'linear-gradient(135deg, #ff416c 0%, #ff4b2b 100%)';[m
[31m-                statusIcon = 'fa-times-circle';[m
[31m-                statusMessage = `This booking has been CANCELLED. Please contact support for more information.`;[m
[31m-            }[m
[31m-            [m
[31m-            const html = `[m
[31m-                <div class="glass-card">[m
[31m-                    <div class="card-header-gradient" style="background: ${statusColor};">[m
[31m-                        <h3 class="mb-0">[m
[31m-                            <i class="fas fa-info-circle"></i>[m
[31m-                            Booking Details - ${booking.tracking_number}[m
[31m-                        </h3>[m
[31m-                    </div>[m
[31m-                    <div class="card-body p-5">[m
[31m-                        <!-- Status Banner -->[m
[31m-                        <div class="text-center mb-4">[m
[31m-                            <span class="status-badge status-${booking.status}" style="font-size: 18px; padding: 12px 30px;">[m
[31m-                                <i class="fas ${statusIcon}"></i>[m
[31m-                                ${booking.status.toUpperCase()}[m
[31m-                            </span>[m
[31m-                            <br><small class="text-muted">Last checked: ${now}</small>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Tracking Number Display -->[m
[31m-                        <div class="alert alert-info text-center p-4 mb-4">[m
[31m-                            <h5><i class="fas fa-qrcode"></i> Tracking Number</h5>[m
[31m-                            <div style="font-size: 32px; font-weight: 700; letter-spacing: 3px;">${booking.tracking_number}</div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Customer Info Card -->[m
[31m-                        <div class="card border-0 shadow-sm mb-4">[m
[31m-                            <div class="card-body">[m
[31m-                                <h5 class="card-title text-primary mb-3">[m
[31m-                                    <i class="fas fa-user-circle"></i> Customer Information[m
[31m-                                </h5>[m
[31m-                                <div class="row">[m
[31m-                                    <div class="col-md-6">[m
[31m-                                        <p><strong>Name:</strong> ${booking.customer_name}</p>[m
[31m-                                        <p><strong>Phone:</strong> ${booking.phone}</p>[m
[31m-                                    </div>[m
[31m-                                    <div class="col-md-6">[m
[31m-                                        <p><strong>Email:</strong> ${booking.email}</p>[m
[31m-                                        <p><strong>Booking Date:</strong> ${new Date(booking.created_at).toLocaleString()}</p>[m
[31m-                                    </div>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Rental Details Card -->[m
[31m-                        <div class="card border-0 shadow-sm mb-4">[m
[31m-                            <div class="card-body">[m
[31m-                                <h5 class="card-title text-primary mb-3">[m
[31m-                                    <i class="fas fa-car"></i> Rental Details[m
[31m-                                </h5>[m
[31m-                                <div class="row">[m
[31m-                                    <div class="col-md-6">[m
[31m-                                        <p><strong>Car Model:</strong> ${booking.car_model}</p>[m
[31m-                                        <p><strong>Price per day:</strong> ${formatCurrency(booking.car_price_per_day)}</p>[m
[31m-                                        <p><strong>Duration:</strong> ${booking.total_days} days</p>[m
[31m-                                        <p><strong>Pickup:</strong> ${booking.pickup_date} at ${booking.pickup_time}</p>[m
[31m-                                    </div>[m
[31m-                                    <div class="col-md-6">[m
[31m-                                        <p><strong>Return:</strong> ${booking.return_date} at ${booking.return_time}</p>[m
[31m-                                    </div>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Price Summary Card -->[m
[31m-                        <div class="card border-0 shadow-sm mb-4">[m
[31m-                            <div class="card-body">[m
[31m-                                <h5 class="card-title text-primary mb-3">[m
[31m-                                    <i class="fas fa-money-bill-wave"></i> Payment Summary[m
[31m-                                </h5>[m
[31m-                                <div class="row">[m
[31m-                                    <div class="col-md-6">[m
[31m-                                        <p><strong>Total Price:</strong> ${formatCurrency(booking.total_price)}</p>[m
[31m-                                        <p><strong>Amount Paid:</strong> ${formatCurrency(booking.amount_paid)}</p>[m
[31m-                                        <p><strong>Balance Due:</strong> ${formatCurrency(booking.balance_due)}</p>[m
[31m-                                    </div>[m
[31m-                                    <div class="col-md-6">[m
[31m-                                        <p><strong>Payment Status:</strong> [m
[31m-                                            <span class="badge ${booking.payment_status === 'paid' ? 'bg-success' : booking.payment_status === 'partial' ? 'bg-warning' : 'bg-danger'}">[m
[31m-                                                ${booking.payment_status.toUpperCase()}[m
[31m-                                            </span>[m
[31m-                                        </p>[m
[31m-                                        ${booking.payment_method ? `<p><strong>Payment Method:</strong> ${booking.payment_method}</p>` : ''}[m
[31m-                                        ${booking.payment_reference ? `<p><strong>Reference:</strong> ${booking.payment_reference}</p>` : ''}[m
[31m-                                    </div>[m
[31m-                                </div>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Status Message -->[m
[31m-                        <div class="alert ${booking.status === 'pending' ? 'alert-warning' : booking.status === 'active' ? 'alert-success' : booking.status === 'completed' ? 'alert-info' : 'alert-danger'} mt-4">[m
[31m-                            <i class="fas ${statusIcon}"></i>[m
[31m-                            ${statusMessage}[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <!-- Action Buttons -->[m
[31m-                        <div class="text-center mt-4">[m
[31m-                            ${booking.balance_due > 0 ? `[m
[31m-                                <button class="btn-gradient btn-lg me-2" onclick="showPayment(${booking.id})">[m
[31m-                                    <i class="fas fa-credit-card"></i> Pay Now (${formatCurrency(booking.balance_due)})[m
[31m-                                </button>[m
[31m-                            ` : ''}[m
[31m-                            [m
[31m-                            <a href="https://wa.me/94756656862?text=Hi%2C%20I%20have%20a%20question%20about%20booking%20${booking.tracking_number}" target="_blank" class="btn-outline-gradient btn-lg">[m
[31m-                                <i class="fab fa-whatsapp"></i> Contact Support[m
[31m-                            </a>[m
[31m-                            [m
[31m-                            <button class="btn-gradient btn-lg" onclick="showHome()">[m
[31m-                                <i class="fas fa-home"></i> Back to Home[m
[31m-                            </button>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            `;[m
[31m-            [m
[31m-            document.getElementById('bookingResultContent').innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        // Admin Functions[m
[31m-        function adminLogin() {[m
[31m-            const password = document.getElementById('admin_password').value;[m
[31m-            [m
[31m-            if (password === 'admin123') {[m
[31m-                isAdminLoggedIn = true;[m
[31m-                alert('Welcome to Fahad Premium Rentals Admin!');[m
[31m-                showAdminDashboard();[m
[31m-            } else {[m
[31m-                alert('Invalid password');[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function logout() {[m
[31m-            isAdminLoggedIn = false;[m
[31m-            showHome();[m
[31m-        }[m
[31m-        [m
[31m-        function toggleMenu() {[m
[31m-            const navbar = document.getElementById('navbarNav');[m
[31m-            navbar.classList.toggle('show');[m
[31m-        }[m
[31m-        [m
[31m-        function updateAdminDashboard() {[m
[31m-            document.getElementById('lastUpdated').textContent = `Last Updated: ${new Date().toLocaleString()}`;[m
[31m-            [m
[31m-            // Calculate stats[m
[31m-            const totalBookings = bookings.length;[m
[31m-            const pendingCount = bookings.filter(b => b.status === 'pending').length;[m
[31m-            const activeCount = bookings.filter(b => b.status === 'active').length;[m
[31m-            const completedCount = bookings.filter(b => b.status === 'completed').length;[m
[31m-            const totalCars = cars.length;[m
[31m-            [m
[31m-            const totalRevenue = bookings.reduce((sum, b) => sum + b.amount_paid, 0);[m
[31m-            const totalExpected = bookings.reduce((sum, b) => sum + b.total_price, 0);[m
[31m-            const totalPendingPayments = bookings.reduce((sum, b) => sum + b.balance_due, 0);[m
[31m-            [m
[31m-            const paidCount = bookings.filter(b => b.payment_status === 'paid').length;[m
[31m-            const partialCount = bookings.filter(b => b.payment_status === 'partial').length;[m
[31m-            const pendingPaymentCount = bookings.filter(b => b.payment_status === 'pending').length;[m
[31m-            [m
[31m-            const pendingBalance = bookings.filter(b => b.status === 'pending').reduce((sum, b) => sum + b.balance_due, 0);[m
[31m-            const activeBalance = bookings.filter(b => b.status === 'active').reduce((sum, b) => sum + b.balance_due, 0);[m
[31m-            const completedBalance = bookings.filter(b => b.status === 'completed').reduce((sum, b) => sum + b.balance_due, 0);[m
[31m-            [m
[31m-            const collectionRate = totalExpected > 0 ? (totalRevenue / totalExpected * 100) : 0;[m
[31m-            [m
[31m-            // Stats Cards[m
[31m-            const statsCards = `[m
[31m-                <div class="col-md-3">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #28a745;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Current Balance</h6>[m
[31m-                                <h2 class="mb-0 text-success">${formatCurrency(currentBalance)}</h2>[m
[31m-                                <small class="text-muted">In account</small>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%);">[m
[31m-                                <i class="fas fa-rupee-sign"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="col-md-3">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #ffc107;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Pending Payments</h6>[m
[31m-                                <h2 class="mb-0 text-warning">${formatCurrency(totalPendingPayments)}</h2>[m
[31m-                                <small class="text-muted">Balance due</small>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #ffc107 0%, #fd7e14 100%);">[m
[31m-                                <i class="fas fa-clock"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="col-md-3">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #17a2b8;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Total Expected</h6>[m
[31m-                                <h2 class="mb-0 text-info">${formatCurrency(totalExpected)}</h2>[m
[31m-                                <small class="text-muted">All bookings</small>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #17a2b8 0%, #6f42c1 100%);">[m
[31m-                                <i class="fas fa-chart-line"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="col-md-3">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #007bff;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Collection Rate</h6>[m
[31m-                                <h2 class="mb-0 text-primary">${collectionRate.toFixed(1)}%</h2>[m
[31m-                                <small class="text-muted">Revenue / Expected</small>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #007bff 0%, #6610f2 100%);">[m
[31m-                                <i class="fas fa-percent"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            `;[m
[31m-            [m
[31m-            document.getElementById('statsCards').innerHTML = statsCards;[m
[31m-            document.getElementById('revenueSummary').innerHTML = `[m
[31m-                <span class="badge bg-light text-dark me-2">Total: ${formatCurrency(totalExpected)}</span>[m
[31m-                <span class="badge bg-success me-2">Paid: ${formatCurrency(totalRevenue)}</span>[m
[31m-                <span class="badge bg-warning">Pending: ${formatCurrency(totalPendingPayments)}</span>[m
[31m-            `;[m
[31m-            [m
[31m-            // Bookings Table[m
[31m-            let tableHtml = '';[m
[31m-            bookings.forEach(booking => {[m
[31m-                tableHtml += `[m
[31m-                    <tr>[m
[31m-                        <td><span class="badge bg-secondary">${booking.tracking_number}</span></td>[m
[31m-                        <td>[m
[31m-                            <strong>${booking.customer_name}</strong><br>[m
[31m-                            <small>${booking.phone}</small>[m
[31m-                        </td>[m
[31m-                        <td>${booking.car_model}</td>[m
[31m-                        <td>[m
[31m-                            <small>P: ${booking.pickup_date}</small><br>[m
[31m-                            <small>R: ${booking.return_date}</small>[m
[31m-                        </td>[m
[31m-                        <td><strong>${formatCurrency(booking.total_price)}</strong></td>[m
[31m-                        <td class="text-success">${formatCurrency(booking.amount_paid)}</td>[m
[31m-                        <td class="${booking.balance_due > 0 ? 'text-warning' : 'text-success'}">[m
[31m-                            ${formatCurrency(booking.balance_due)}[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            <span class="badge ${booking.payment_status === 'paid' ? 'bg-success' : booking.payment_status === 'partial' ? 'bg-warning' : 'bg-danger'}">[m
[31m-                                ${booking.payment_status.toUpperCase()}[m
[31m-                            </span>[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            <span class="status-badge status-${booking.status}">${booking.status.toUpperCase()}</span>[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            <div class="btn-group" role="group">[m
[31m-                                <button class="btn btn-sm btn-info" title="View" onclick="showViewBooking(${booking.id})">[m
[31m-                                    <i class="fas fa-eye"></i>[m
[31m-                                </button>[m
[31m-                                [m
[31m-                                <button class="btn btn-sm btn-warning" title="Edit Payment" onclick="showEditBooking(${booking.id})">[m
[31m-                                    <i class="fas fa-edit"></i>[m
[31m-                                </button>[m
[31m-                                [m
[31m-                                ${booking.status === 'pending' ? `[m
[31m-                                    <button class="btn btn-sm btn-success" title="Activate" onclick="updateBookingStatus(${booking.id}, 'active')">[m
[31m-                                        <i class="fas fa-check"></i>[m
[31m-                                    </button>[m
[31m-                                ` : ''}[m
[31m-                                [m
[31m-                                ${booking.status === 'active' ? `[m
[31m-                                    <button class="btn btn-sm btn-primary" title="Complete" onclick="updateBookingStatus(${booking.id}, 'completed')">[m
[31m-                                        <i class="fas fa-flag-checkered"></i>[m
[31m-                                    </button>[m
[31m-                                ` : ''}[m
[31m-                                [m
[31m-                                <button class="btn btn-sm btn-danger" title="Cancel" onclick="updateBookingStatus(${booking.id}, 'cancelled')">[m
[31m-                                    <i class="fas fa-times"></i>[m
[31m-                                </button>[m
[31m-                            </div>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            });[m
[31m-            [m
[31m-            if (tableHtml === '') {[m
[31m-                tableHtml = `[m
[31m-                    <tr>[m
[31m-                        <td colspan="10" class="text-center py-4">[m
[31m-                            <i class="fas fa-inbox fa-3x text-muted mb-3"></i>[m
[31m-                            <h5>No bookings found</h5>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('bookingsTableBody').innerHTML = tableHtml;[m
[31m-        }[m
[31m-        [m
[31m-        function updateBookingStatus(bookingId, status) {[m
[31m-            const booking = bookings.find(b => b.id == bookingId);[m
[31m-            if (!booking) return;[m
[31m-            [m
[31m-            const oldStatus = booking.status;[m
[31m-            [m
[31m-            if (status === 'cancelled' && booking.amount_paid > 0) {[m
[31m-                // Handle refund[m
[31m-                const transaction = {[m
[31m-                    id: transactions.length + 1,[m
[31m-                    date: new Date().toISOString(),[m
[31m-                    type: 'expense',[m
[31m-                    category: 'booking_refund',[m
[31m-                    description: `Refund for cancelled booking ${booking.tracking_number}`,[m
[31m-                    amount: booking.amount_paid,[m
[31m-                    balance_after: currentBalance - booking.amount_paid,[m
[31m-                    reference_id: booking.tracking_number,[m
[31m-                    payment_method: booking.payment_method,[m
[31m-                    notes: 'Auto refund on cancel'[m
[31m-                };[m
[31m-                transactions.push(transaction);[m
[31m-                currentBalance -= booking.amount_paid;[m
[31m-                [m
[31m-                booking.amount_paid = 0;[m
[31m-                booking.balance_due = 0;[m
[31m-                booking.payment_status = 'cancelled';[m
[31m-            }[m
[31m-            [m
[31m-            booking.status = status;[m
[31m-            [m
[31m-            alert(`Booking ${booking.tracking_number} status updated from ${oldStatus} to ${status}`);[m
[31m-            updateAdminDashboard();[m
[31m-        }[m
[31m-        [m
[31m-        function displayCarsTable() {[m
[31m-            let html = '';[m
[31m-            cars.forEach(car => {[m
[31m-                html += `[m
[31m-                    <tr>[m
[31m-                        <td>${car.id}</td>[m
[31m-                        <td>[m
[31m-                            <i class="fas fa-car fa-2x text-muted"></i>[m
[31m-                        </td>[m
[31m-                        <td>${car.name}</td>[m
[31m-                        <td>${car.model}</td>[m
[31m-                        <td>${formatCurrencySimple(car.price_per_day)}</td>[m
[31m-                        <td>${car.km_per_day} km</td>[m
[31m-                        <td>${car.category}</td>[m
[31m-                        <td>${car.seats}</td>[m
[31m-                        <td>${car.transmission}</td>[m
[31m-                        <td>[m
[31m-                            ${car.available ? '<span class="badge bg-success">Yes</span>' : '<span class="badge bg-danger">No</span>'}[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            <button class="btn btn-sm btn-warning" onclick="editCar(${car.id})">[m
[31m-                                <i class="fas fa-edit"></i>[m
[31m-                            </button>[m
[31m-                            <button class="btn btn-sm btn-danger" onclick="deleteCar(${car.id})">[m
[31m-                                <i class="fas fa-trash"></i>[m
[31m-                            </button>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            });[m
[31m-            [m
[31m-            if (html === '') {[m
[31m-                html = `[m
[31m-                    <tr>[m
[31m-                        <td colspan="11" class="text-center py-4">[m
[31m-                            <i class="fas fa-car-side fa-3x text-muted mb-3"></i>[m
[31m-                            <h5>No cars found. Add your first car!</h5>[m
[31m-                            <button class="btn-gradient mt-3" onclick="showAddCarForm()">[m
[31m-                                <i class="fas fa-plus"></i> Add Car[m
[31m-                            </button>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('carsTableBody').innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        async function saveCar() {[m
[31m-            const name = document.getElementById('car_name').value;[m
[31m-            const model = document.getElementById('car_model_year').value;[m
[31m-            const price = parseInt(document.getElementById('car_price').value);[m
[31m-            const km = parseInt(document.getElementById('car_km').value);[m
[31m-            const category = document.getElementById('car_category').value;[m
[31m-            const transmission = document.getElementById('car_transmission').value;[m
[31m-            const seats = parseInt(document.getElementById('car_seats').value);[m
[31m-            const fuel = document.getElementById('car_fuel').value;[m
[31m-            const available = document.getElementById('car_available').checked;[m
[31m-            const carImage = document.getElementById('car_image')?.files?.[0] || null;[m
[31m-            [m
[31m-            if (!name || !model || !price || !km || !seats) {[m
[31m-                alert('Please fill in all required fields');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            const car = {[m
[31m-                id: cars.length + 1,[m
[31m-                name: name,[m
[31m-                model: model,[m
[31m-                price_per_day: price,[m
[31m-                km_per_day: km,[m
[31m-                category: category,[m
[31m-                transmission: transmission,[m
[31m-                seats: seats,[m
[31m-                fuel_type: fuel,[m
[31m-                available: available,[m
[31m-                image: null,[m
[31m-                has_image: false[m
[31m-            };[m
[31m-[m
[31m-            try {[m
[31m-                const dbId = await saveCarToSqlite(car, carImage);[m
[31m-                car.id = dbId;[m
[31m-                if (carImage) {[m
[31m-                    car.image = carImage.name;[m
[31m-                    car.has_image = true;[m
[31m-                    // Instant preview without re-reading from SQLite[m
[31m-                    const url = URL.createObjectURL(carImage);[m
[31m-                    carImageUrlCache.set(car.id, url);[m
[31m-                }[m
[31m-            } catch (e) {[m
[31m-                alert('Could not save car to SQLite DB: ' + (e.message || e));[m
[31m-                return;[m
[31m-            }[m
[31m-[m
[31m-            cars.push(car);[m
[31m-            alert('Car added successfully!');[m
[31m-            showCarManagement();[m
[31m-            displayCars();[m
[31m-            updateCarSelect();[m
[31m-        }[m
[31m-        [m
[31m-        function editCar(carId) {[m
[31m-            const car = cars.find(c => c.id == carId);[m
[31m-            if (!car) return;[m
[31m-            [m
[31m-            // Implement edit car form[m
[31m-            alert('Edit car feature - ID: ' + carId);[m
[31m-        }[m
[31m-        [m
[31m-        function deleteCar(carId) {[m
[31m-            if (confirm('Are you sure you want to delete this car?')) {[m
[31m-                cars = cars.filter(c => c.id != carId);[m
[31m-                alert('Car deleted successfully!');[m
[31m-                displayCarsTable();[m
[31m-                displayCars();[m
[31m-                updateCarSelect();[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function displayBannersTable() {[m
[31m-            let html = '';[m
[31m-            banners.forEach(banner => {[m
[31m-                html += `[m
[31m-                    <tr>[m
[31m-                        <td>${banner.id}</td>[m
[31m-                        <td>[m
[31m-                            <i class="fas fa-image fa-2x text-muted"></i>[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            <strong>${banner.title}</strong><br>[m
[31m-                            <small>${banner.subtitle || ''}</small>[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            ${banner.offer_text ? `[m
[31m-                                <span class="badge bg-warning">${banner.offer_text}</span><br>[m
[31m-                                <small>${banner.km_offer} KM for ${banner.price_offer}</small>[m
[31m-                            ` : '<span class="badge bg-secondary">No Offer</span>'}[m
[31m-                        </td>[m
[31m-                        <td>[m
[31m-                            ${banner.is_active ? '<span class="status-badge status-active">ACTIVE</span>' : '<span class="status-badge status-cancelled">INACTIVE</span>'}[m
[31m-                        </td>[m
[31m-                        <td>${new Date(banner.created_at).toLocaleDateString()}</td>[m
[31m-                        <td>[m
[31m-                            <div class="btn-group" role="group">[m
[31m-                                <button class="btn btn-sm btn-warning" onclick="editBanner(${banner.id})">[m
[31m-                                    <i class="fas fa-edit"></i>[m
[31m-                                </button>[m
[31m-                                <button class="btn btn-sm btn-info" onclick="toggleBanner(${banner.id})">[m
[31m-                                    <i class="fas fa-sync-alt"></i>[m
[31m-                                </button>[m
[31m-                                <button class="btn btn-sm btn-danger" onclick="deleteBanner(${banner.id})">[m
[31m-                                    <i class="fas fa-trash"></i>[m
[31m-                                </button>[m
[31m-                            </div>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            });[m
[31m-            [m
[31m-            if (html === '') {[m
[31m-                html = `[m
[31m-                    <tr>[m
[31m-                        <td colspan="7" class="text-center py-4">[m
[31m-                            <i class="fas fa-images fa-3x text-muted mb-3"></i>[m
[31m-                            <h5>No banners found. Add your first banner!</h5>[m
[31m-                            <button class="btn-gradient mt-3" onclick="showAddBannerForm()">[m
[31m-                                <i class="fas fa-plus"></i> Add Banner[m
[31m-                            </button>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('bannersTableBody').innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        async function saveBanner() {[m
[31m-            const title = document.getElementById('banner_title').value;[m
[31m-            const subtitle = document.getElementById('banner_subtitle').value;[m
[31m-            const offerText = document.getElementById('banner_offer_text').value;[m
[31m-            const kmOffer = parseInt(document.getElementById('banner_km_offer').value);[m
[31m-            const priceOffer = document.getElementById('banner_price_offer').value;[m
[31m-            const isActive = document.getElementById('banner_active').checked;[m
[31m-            const bannerImage = document.getElementById('banner_image')?.files?.[0] || null;[m
[31m-            [m
[31m-            if (!title) {[m
[31m-                alert('Please enter a banner title');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            // If this banner is active, deactivate all others[m
[31m-            if (isActive) {[m
[31m-                banners.forEach(b => b.is_active = false);[m
[31m-            }[m
[31m-            [m
[31m-            const banner = {[m
[31m-                id: banners.length + 1,[m
[31m-                title: title,[m
[31m-                subtitle: subtitle,[m
[31m-                image: 'default_banner.jpg',[m
[31m-                offer_text: offerText,[m
[31m-                km_offer: kmOffer,[m
[31m-                price_offer: priceOffer,[m
[31m-                is_active: isActive,[m
[31m-                created_at: new Date().toISOString()[m
[31m-            };[m
[31m-[m
[31m-            try {[m
[31m-                const dbId = await saveBannerToSqlite(banner, bannerImage);[m
[31m-                banner.id = dbId;[m
[31m-                if (bannerImage) banner.image = bannerImage.name;[m
[31m-            } catch (e) {[m
[31m-                alert('Could not save banner to SQLite DB: ' + (e.message || e));[m
[31m-                return;[m
[31m-            }[m
[31m-[m
[31m-            banners.push(banner);[m
[31m-            alert('Banner added successfully!');[m
[31m-            showBannerManagement();[m
[31m-        }[m
[31m-        [m
[31m-        function editBanner(bannerId) {[m
[31m-            alert('Edit banner feature - ID: ' + bannerId);[m
[31m-        }[m
[31m-        [m
[31m-        function toggleBanner(bannerId) {[m
[31m-            const banner = banners.find(b => b.id == bannerId);[m
[31m-            if (!banner) return;[m
[31m-            [m
[31m-            if (!banner.is_active) {[m
[31m-                // Activate this banner - deactivate all others[m
[31m-                banners.forEach(b => b.is_active = false);[m
[31m-                banner.is_active = true;[m
[31m-                alert(`Banner "${banner.title}" is now active!`);[m
[31m-            } else {[m
[31m-                // Deactivate this banner[m
[31m-                banner.is_active = false;[m
[31m-                alert(`Banner "${banner.title}" deactivated.`);[m
[31m-            }[m
[31m-            [m
[31m-            displayBannersTable();[m
[31m-        }[m
[31m-        [m
[31m-        function deleteBanner(bannerId) {[m
[31m-            if (confirm('Are you sure you want to delete this banner?')) {[m
[31m-                banners = banners.filter(b => b.id != bannerId);[m
[31m-                alert('Banner deleted successfully!');[m
[31m-                displayBannersTable();[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function updateBackground() {[m
[31m-            const title = document.getElementById('background_title').value;[m
[31m-            const description = document.getElementById('background_description').value;[m
[31m-            [m
[31m-            background.title = title;[m
[31m-            background.description = description;[m
[31m-            [m
[31m-            alert('Background settings saved!');[m
[31m-        }[m
[31m-        [m
[31m-        function displayBackgroundGallery() {[m
[31m-            const gallery = document.getElementById('backgroundGallery');[m
[31m-            gallery.innerHTML = `[m
[31m-                <div class="col-md-3 mb-3">[m
[31m-                    <div style="height: 100px; background: #667eea; border-radius: 5px; cursor: pointer; border: 2px solid #fff;" [m
[31m-                         onclick="setBackground('default_bg.jpg')"[m
[31m-                         title="Click to use this background">[m
[31m-                    </div>[m
[31m-                    <p class="small text-center mt-1">Default Background</p>[m
[31m-                </div>[m
[31m-            `;[m
[31m-        }[m
[31m-        [m
[31m-        function setBackground(filename) {[m
[31m-            if (confirm('Set this as the website background?')) {[m
[31m-                background.image = filename;[m
[31m-                document.getElementById('currentBackgroundName').textContent = 'Filename: ' + filename;[m
[31m-                alert('Background set to ' + filename);[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function updateHero() {[m
[31m-            const title = document.getElementById('hero_title').value;[m
[31m-            const subtitle = document.getElementById('hero_subtitle').value;[m
[31m-            const opacity = parseFloat(document.getElementById('hero_opacity').value);[m
[31m-            const color = document.getElementById('hero_color').value;[m
[31m-            const isActive = document.getElementById('hero_active').checked;[m
[31m-            [m
[31m-            hero.title = title;[m
[31m-            hero.subtitle = subtitle;[m
[31m-            hero.overlay_opacity = opacity || 0.6;[m
[31m-            hero.overlay_color = color || '0,0,0';[m
[31m-            hero.is_active = isActive;[m
[31m-            [m
[31m-            document.getElementById('heroTitle').textContent = title;[m
[31m-            document.getElementById('heroSubtitle').textContent = subtitle;[m
[31m-            document.getElementById('heroOverlay').style.background = 'rgba(' + hero.overlay_color + ', ' + hero.overlay_opacity + ')';[m
[31m-            [m
[31m-            alert('Hero section settings saved!');[m
[31m-        }[m
[31m-        [m
[31m-        function displayHeroGallery() {[m
[31m-            const gallery = document.getElementById('heroGallery');[m
[31m-            gallery.innerHTML = `[m
[31m-                <div class="col-md-3 mb-3">[m
[31m-                    <div style="height: 100px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 5px; cursor: pointer; border: 2px solid #fff;" [m
[31m-                         onclick="setHero('default_hero.jpg')"[m
[31m-                         title="Click to use this background">[m
[31m-                    </div>[m
[31m-                    <p class="small text-center mt-1">Default Hero</p>[m
[31m-                </div>[m
[31m-            `;[m
[31m-        }[m
[31m-        [m
[31m-        function setHero(filename) {[m
[31m-            if (confirm('Set this as the hero background?')) {[m
[31m-                hero.image = filename;[m
[31m-                document.getElementById('currentHeroName').textContent = 'Filename: ' + filename;[m
[31m-                alert('Hero background set to ' + filename);[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function updateAccountManagement() {[m
[31m-            // Calculate totals[m
[31m-            const totalIncome = transactions.filter(t => t.type === 'income').reduce((sum, t) => sum + t.amount, 0);[m
[31m-            const totalExpenses = transactions.filter(t => t.type === 'expense').reduce((sum, t) => sum + t.amount, 0);[m
[31m-            [m
[31m-            // Balance Cards[m
[31m-            const balanceCards = `[m
[31m-                <div class="col-md-4">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #28a745;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Current Balance</h6>[m
[31m-                                <h2 class="mb-0 text-success">${formatCurrency(currentBalance)}</h2>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%);">[m
[31m-                                <i class="fas fa-rupee-sign"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="col-md-4">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #007bff;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Total Income</h6>[m
[31m-                                <h2 class="mb-0 text-primary">${formatCurrency(totalIncome)}</h2>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #007bff 0%, #6610f2 100%);">[m
[31m-                                <i class="fas fa-arrow-up"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="col-md-4">[m
[31m-                    <div class="stats-card" style="border-left: 5px solid #dc3545;">[m
[31m-                        <div class="d-flex justify-content-between align-items-center">[m
[31m-                            <div>[m
[31m-                                <h6 class="text-muted">Total Expenses</h6>[m
[31m-                                <h2 class="mb-0 text-danger">${formatCurrency(totalExpenses)}</h2>[m
[31m-                            </div>[m
[31m-                            <div class="stats-icon" style="background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);">[m
[31m-                                <i class="fas fa-arrow-down"></i>[m
[31m-                            </div>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            `;[m
[31m-            [m
[31m-            document.getElementById('balanceCards').innerHTML = balanceCards;[m
[31m-            [m
[31m-            // Transactions Table[m
[31m-            let transactionsHtml = '';[m
[31m-            transactions.slice(0, 10).forEach(t => {[m
[31m-                transactionsHtml += `[m
[31m-                    <tr>[m
[31m-                        <td>${new Date(t.date).toLocaleString()}</td>[m
[31m-                        <td>[m
[31m-                            <span class="badge ${t.type === 'income' ? 'bg-success' : 'bg-danger'}">[m
[31m-                                ${t.type.toUpperCase()}[m
[31m-                            </span>[m
[31m-                        </td>[m
[31m-                        <td>${t.category}</td>[m
[31m-                        <td>${t.description}</td>[m
[31m-                        <td class="${t.type === 'income' ? 'text-success' : 'text-danger'}">[m
[31m-                            ${formatCurrency(t.amount)}[m
[31m-                        </td>[m
[31m-                        <td>${formatCurrency(t.balance_after)}</td>[m
[31m-                        <td>${t.reference_id || '-'}</td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            });[m
[31m-            [m
[31m-            if (transactionsHtml === '') {[m
[31m-                transactionsHtml = `[m
[31m-                    <tr>[m
[31m-                        <td colspan="7" class="text-center py-4">[m
[31m-                            <i class="fas fa-exchange-alt fa-3x text-muted mb-3"></i>[m
[31m-                            <h5>No transactions yet</h5>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('transactionsTableBody').innerHTML = transactionsHtml;[m
[31m-            [m
[31m-            // Expenses Table[m
[31m-            let expensesHtml = '';[m
[31m-            expenses.forEach(e => {[m
[31m-                expensesHtml += `[m
[31m-                    <tr>[m
[31m-                        <td>${new Date(e.date).toLocaleDateString()}</td>[m
[31m-                        <td>${e.category}</td>[m
[31m-                        <td>${e.description}</td>[m
[31m-                        <td class="text-danger">${formatCurrency(e.amount)}</td>[m
[31m-                        <td>${e.payment_method || '-'}</td>[m
[31m-                        <td>[m
[31m-                            <button class="btn btn-sm btn-danger" onclick="deleteExpense(${e.id})">[m
[31m-                                <i class="fas fa-trash"></i>[m
[31m-                            </button>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            });[m
[31m-            [m
[31m-            if (expensesHtml === '') {[m
[31m-                expensesHtml = `[m
[31m-                    <tr>[m
[31m-                        <td colspan="6" class="text-center py-4">[m
[31m-                            <i class="fas fa-receipt fa-3x text-muted mb-3"></i>[m
[31m-                            <h5>No expenses recorded</h5>[m
[31m-                        </td>[m
[31m-                    </tr>[m
[31m-                `;[m
[31m-            }[m
[31m-            [m
[31m-            document.getElementById('expensesTableBody').innerHTML = expensesHtml;[m
[31m-        }[m
[31m-        [m
[31m-        async function saveExpense() {[m
[31m-            const date = document.getElementById('expense_date').value;[m
[31m-            const category = document.getElementById('expense_category').value;[m
[31m-            const description = document.getElementById('expense_description').value;[m
[31m-            const amount = parseInt(document.getElementById('expense_amount').value);[m
[31m-            const paymentMethod = document.getElementById('expense_payment_method').value;[m
[31m-            const notes = document.getElementById('expense_notes').value;[m
[31m-            const receipt = document.getElementById('expense_receipt')?.files?.[0] || null;[m
[31m-            [m
[31m-            if (!date || !category || !description || !amount) {[m
[31m-                alert('Please fill in all required fields');[m
[31m-                return;[m
[31m-            }[m
[31m-            [m
[31m-            const expense = {[m
[31m-                id: expenses.length + 1,[m
[31m-                date: date,[m
[31m-                category: category,[m
[31m-                description: description,[m
[31m-                amount: amount,[m
[31m-                payment_method: paymentMethod,[m
[31m-                notes: notes[m
[31m-            };[m
[31m-[m
[31m-            try {[m
[31m-                const dbId = await saveExpenseToSqlite(expense, receipt);[m
[31m-                expense.id = dbId;[m
[31m-                if (receipt) expense.receipt = receipt.name;[m
[31m-            } catch (e) {[m
[31m-                alert('Could not save expense to SQLite DB: ' + (e.message || e));[m
[31m-                return;[m
[31m-            }[m
[31m-[m
[31m-            expenses.push(expense);[m
[31m-            [m
[31m-            // Add transaction[m
[31m-            const transaction = {[m
[31m-                id: transactions.length + 1,[m
[31m-                date: new Date().toISOString(),[m
[31m-                type: 'expense',[m
[31m-                category: category,[m
[31m-                description: description,[m
[31m-                amount: amount,[m
[31m-                balance_after: currentBalance - amount,[m
[31m-                payment_method: paymentMethod,[m
[31m-                notes: notes[m
[31m-            };[m
[31m-            transactions.push(transaction);[m
[31m-            currentBalance -= amount;[m
[31m-            [m
[31m-            alert(`Expense of ${formatCurrency(amount)} added successfully!`);[m
[31m-            showAccountManagement();[m
[31m-        }[m
[31m-        [m
[31m-        function deleteExpense(expenseId) {[m
[31m-            if (confirm('Delete this expense?')) {[m
[31m-                expenses = expenses.filter(e => e.id != expenseId);[m
[31m-                alert('Expense deleted');[m
[31m-                updateAccountManagement();[m
[31m-            }[m
[31m-        }[m
[31m-        [m
[31m-        function displayViewBooking(booking) {[m
[31m-            let html = `[m
[31m-                <div class="text-center mb-4">[m
[31m-                    <span class="status-badge status-${booking.status}">${booking.status.toUpperCase()}</span>[m
[31m-                    <span class="badge ${booking.payment_status === 'paid' ? 'bg-success' : booking.payment_status === 'partial' ? 'bg-warning' : 'bg-danger'} ms-2">[m
[31m-                        ${booking.payment_status.toUpperCase()}[m
[31m-                    </span>[m
[31m-                </div>[m
[31m-                [m
[31m-                <!-- Tracking Number Display -->[m
[31m-                <div class="alert alert-info text-center p-4 mb-4">[m
[31m-                    <h5><i class="fas fa-qrcode"></i> Tracking Number</h5>[m
[31m-                    <div style="font-size: 32px; font-weight: 700; letter-spacing: 3px;">${booking.tracking_number}</div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="row">[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Customer Name:</strong> ${booking.customer_name}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Email:</strong> ${booking.email}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Phone:</strong> ${booking.phone}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Car Model:</strong> ${booking.car_model}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Pickup:</strong> ${booking.pickup_date} at ${booking.pickup_time}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Return:</strong> ${booking.return_date} at ${booking.return_time}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Duration:</strong> ${booking.total_days} days[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Price per day:</strong> ${formatCurrency(booking.car_price_per_day)}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Total Price:</strong> ${formatCurrency(booking.total_price)}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Amount Paid:</strong> ${formatCurrency(booking.amount_paid)}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Balance Due:</strong> ${formatCurrency(booking.balance_due)}[m
[31m-                    </div>[m
[31m-                    <div class="col-md-6 mb-3">[m
[31m-                        <strong>Booking Date:</strong> ${new Date(booking.created_at).toLocaleString()}[m
[31m-                    </div>[m
[31m-                    ${booking.payment_method ? `[m
[31m-                        <div class="col-md-6 mb-3">[m
[31m-                            <strong>Payment Method:</strong> ${booking.payment_method}[m
[31m-                        </div>[m
[31m-                    ` : ''}[m
[31m-                    ${booking.payment_reference ? `[m
[31m-                        <div class="col-md-6 mb-3">[m
[31m-                            <strong>Payment Reference:</strong> ${booking.payment_reference}[m
[31m-                        </div>[m
[31m-                    ` : ''}[m
[31m-                    ${booking.notes ? `[m
[31m-                        <div class="col-12 mb-3">[m
[31m-                            <strong>Notes:</strong> ${booking.notes}[m
[31m-                        </div>[m
[31m-                    ` : ''}[m
[31m-                </div>[m
[31m-                [m
[31m-                <hr>[m
[31m-                [m
[31m-                <h5 class="mb-3">Documents:</h5>[m
[31m-                <div class="row">[m
[31m-                    <div class="col-md-3 mb-2">[m
[31m-                        <div class="small mb-1 text-muted">${booking.id_front || 'ID Front'}</div>[m
[31m-                        <div class="d-grid gap-2">[m
[31m-                            <button class="btn btn-outline-primary w-100" type="button" onclick="previewBookingDocument(${booking.id}, 'id_front')">[m
[31m-                                <i class="fas fa-eye"></i> Preview ID Front[m
[31m-                            </button>[m
[31m-                            <button class="btn btn-outline-secondary w-100" type="button" onclick="downloadBookingDocument(${booking.id}, 'id_front')">[m
[31m-                                <i class="fas fa-download"></i> Download[m
[31m-                            </button>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                    <div class="col-md-3 mb-2">[m
[31m-                        <div class="small mb-1 text-muted">${booking.id_back || 'ID Back'}</div>[m
[31m-                        <div class="d-grid gap-2">[m
[31m-                            <button class="btn btn-outline-primary w-100" type="button" onclick="previewBookingDocument(${booking.id}, 'id_back')">[m
[31m-                                <i class="fas fa-eye"></i> Preview ID Back[m
[31m-                            </button>[m
[31m-                            <button class="btn btn-outline-secondary w-100" type="button" onclick="downloadBookingDocument(${booking.id}, 'id_back')">[m
[31m-                                <i class="fas fa-download"></i> Download[m
[31m-                            </button>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                    <div class="col-md-3 mb-2">[m
[31m-                        <div class="small mb-1 text-muted">${booking.license_file || 'License'}</div>[m
[31m-                        <div class="d-grid gap-2">[m
[31m-                            <button class="btn btn-outline-primary w-100" type="button" onclick="previewBookingDocument(${booking.id}, 'license')">[m
[31m-                                <i class="fas fa-eye"></i> Preview License[m
[31m-                            </button>[m
[31m-                            <button class="btn btn-outline-secondary w-100" type="button" onclick="downloadBookingDocument(${booking.id}, 'license')">[m
[31m-                                <i class="fas fa-download"></i> Download[m
[31m-                            </button>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <div class="text-center mt-4">[m
[31m-                    <button class="btn-warning btn-lg me-2" style="background: #ffc107; color: #000; padding: 12px 30px; border-radius: 50px; text-decoration: none; display: inline-block; font-weight: 600;" onclick="showEditBooking(${booking.id})">[m
[31m-                        <i class="fas fa-edit"></i> Edit Payment[m
[31m-                    </button>[m
[31m-                    <button class="btn-gradient" onclick="showAdminDashboard()">[m
[31m-                        <i class="fas fa-arrow-left"></i> Back to Dashboard[m
[31m-                    </button>[m
[31m-                </div>[m
[31m-            `;[m
[31m-            [m
[31m-            document.getElementById('viewBookingContent').innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        function displayEditBooking(booking) {[m
[31m-            let html = `[m
[31m-                <!-- Current Booking Info -->[m
[31m-                <div class="alert alert-info mb-4">[m
[31m-                    <div class="row">[m
[31m-                        <div class="col-md-6">[m
[31m-                            <p><strong>Customer:</strong> ${booking.customer_name}</p>[m
[31m-                            <p><strong>Car:</strong> ${booking.car_model}</p>[m
[31m-                            <p><strong>Total Price:</strong> ${formatCurrency(booking.total_price)}</p>[m
[31m-                        </div>[m
[31m-                        <div class="col-md-6">[m
[31m-                            <p><strong>Current Paid:</strong> ${formatCurrency(booking.amount_paid)}</p>[m
[31m-                            <p><strong>Current Balance:</strong> ${formatCurrency(booking.balance_due)}</p>[m
[31m-                            <p><strong>Current Payment Status:</strong> [m
[31m-                                <span class="badge ${booking.payment_status === 'paid' ? 'bg-success' : booking.payment_status === 'partial' ? 'bg-warning' : 'bg-danger'}">[m
[31m-                                    ${booking.payment_status.toUpperCase()}[m
[31m-                                </span>[m
[31m-                            </p>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-                [m
[31m-                <form id="editBookingForm" onsubmit="event.preventDefault(); updateBooking(${booking.id})">[m
[31m-                    <div class="row">[m
[31m-                        <div class="col-md-6 mb-3">[m
[31m-                            <label class="form-label">Amount Paid (Rs.)</label>[m
[31m-                            <input type="number" class="form-control" id="edit_amount_paid" value="${booking.amount_paid}">[m
[31m-                            <small class="text-muted">Update the amount paid by customer</small>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <div class="col-md-6 mb-3">[m
[31m-                            <label class="form-label">Payment Status</label>[m
[31m-                            <select class="form-select" id="edit_payment_status">[m
[31m-                                <option value="pending" ${booking.payment_status === 'pending' ? 'selected' : ''}>Pending</option>[m
[31m-                                <option value="partial" ${booking.payment_status === 'partial' ? 'selected' : ''}>Partial</option>[m
[31m-                                <option value="paid" ${booking.payment_status === 'paid' ? 'selected' : ''}>Paid</option>[m
[31m-                            </select>[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                    [m
[31m-                    <div class="row">[m
[31m-                        <div class="col-md-6 mb-3">[m
[31m-                            <label class="form-label">Booking Status</label>[m
[31m-                            <select class="form-select" id="edit_status">[m
[31m-                                <option value="pending" ${booking.status === 'pending' ? 'selected' : ''}>Pending</option>[m
[31m-                                <option value="active" ${booking.status === 'active' ? 'selected' : ''}>Active</option>[m
[31m-                                <option value="completed" ${booking.status === 'completed' ? 'selected' : ''}>Completed</option>[m
[31m-                                <option value="cancelled" ${booking.status === 'cancelled' ? 'selected' : ''}>Cancelled</option>[m
[31m-                            </select>[m
[31m-                        </div>[m
[31m-                        [m
[31m-                        <div class="col-md-6 mb-3">[m
[31m-                            <label class="form-label">Payment Method</label>[m
[31m-                            <input type="text" class="form-control" id="edit_payment_method" value="${booking.payment_method || ''}">[m
[31m-                        </div>[m
[31m-                    </div>[m
[31m-                    [m
[31m-                    <div class="mb-3">[m
[31m-                        <label class="form-label">Reference Number</label>[m
[31m-                        <input type="text" class="form-control" id="edit_payment_reference" value="${booking.payment_reference || ''}">[m
[31m-                    </div>[m
[31m-                    [m
[31m-                    <div class="mb-3">[m
[31m-                        <label class="form-label">Admin Notes</label>[m
[31m-                        <textarea class="form-control" id="edit_notes" rows="3">${booking.notes || ''}</textarea>[m
[31m-                    </div>[m
[31m-                    [m
[31m-                    <div class="alert alert-warning">[m
[31m-                        <i class="fas fa-info-circle"></i>[m
[31m-                        <strong>Note:</strong> Balance due will be automatically recalculated when you update the amount paid.[m
[31m-                    </div>[m
[31m-                    [m
[31m-                    <div class="text-center mt-4">[m
[31m-                        <button type="submit" class="btn-gradient btn-lg">[m
[31m-                            <i class="fas fa-save"></i> Update Booking[m
[31m-                        </button>[m
[31m-                        <button class="btn-outline-gradient btn-lg ms-2" onclick="showAdminDashboard()">[m
[31m-                            <i class="fas fa-times"></i> Cancel[m
[31m-                        </button>[m
[31m-                    </div>[m
[31m-                </form>[m
[31m-            `;[m
[31m-            [m
[31m-            document.getElementById('editBookingContent').innerHTML = html;[m
[31m-        }[m
[31m-        [m
[31m-        function updateBooking(bookingId) {[m
[31m-            const booking = bookings.find(b => b.id == bookingId);[m
[31m-            if (!booking) return;[m
[31m-            [m
[31m-            const amountPaid = parseInt(document.getElementById('edit_amount_paid').value) || 0;[m
[31m-            const paymentStatus = document.getElementById('edit_payment_status').value;[m
[31m-            const status = document.getElementById('edit_status').value;[m
[31m-            const paymentMethod = document.getElementById('edit_payment_method').value;[m
[31m-            const paymentReference = document.getElementById('edit_payment_reference').value;[m
[31m-            const notes = document.getElementById('edit_notes').value;[m
[31m-            [m
[31m-            const oldAmountPaid = booking.amount_paid;[m
[31m-            [m
[31m-            // Update amount paid[m
[31m-            booking.amount_paid = amountPaid;[m
[31m-            booking.balance_due = booking.total_price - booking.amount_paid;[m
[31m-            [m
[31m-            // Update payment status based on balance[m
[31m-            if (booking.balance_due <= 0) {[m
[31m-                booking.payment_status = 'paid';[m
[31m-                booking.balance_due = 0;[m
[31m-            } else if (booking.amount_paid > 0) {[m
[31m-                booking.payment_status = 'partial';[m
[31m-            } else {[m
[31m-                booking.payment_status = 'pending';[m
[31m-            }[m
[31m-            [m
[31m-            // Update other fields[m
[31m-            if (paymentStatus) booking.payment_status = paymentStatus;[m
[31m-            if (status) booking.status = status;[m
[31m-            if (paymentMethod) booking.payment_method = paymentMethod;[m
[31m-            if (paymentReference) booking.payment_reference = paymentReference;[m
[31m-            if (notes) booking.notes = notes;[m
[31m-            [m
[31m-            // If amount paid changed, add transaction[m
[31m-            if (amountPaid !== oldAmountPaid) {[m
[31m-                const transaction = {[m
[31m-                    id: transactions.length + 1,[m
[31m-                    date: new Date().toISOString(),[m
[31m-                    type: 'income',[m
[31m-                    category: 'booking_payment',[m
[31m-                    description: `Payment adjustment for booking ${booking.tracking_number}`,[m
[31m-                    amount: amountPaid - oldAmountPaid,[m
[31m-                    balance_after: currentBalance + (amountPaid - oldAmountPaid),[m
[31m-                    reference_id: booking.tracking_number,[m
[31m-                    payment_method: paymentMethod,[m
[31m-                    notes: notes[m
[31m-                };[m
[31m-                transactions.push(transaction);[m
[31m-                currentBalance += (amountPaid - oldAmountPaid);[m
[31m-            }[m
[31m-            [m
[31m-            alert(`Booking ${booking.tracking_number} updated successfully!`);[m
[31m-            showAdminDashboard();[m
[31m-        }[m
[31m-        [m
[31m-        // Event Listeners[m
[31m-        document.addEventListener('DOMContentLoaded', function() {[m
[31m-            initializeData();[m
[31m-            [m
[31m-            const pickupDate = document.getElementById('pickup_date');[m
[31m-            const returnDate = document.getElementById('return_date');[m
[31m-            const carSelect = document.getElementById('car_model');[m
[31m-            const pickupTime = document.getElementById('pickup_time');[m
[31m-            const returnTime = document.getElementById('return_time');[m
[31m-            [m
[31m-            // Set min dates[m
[31m-            const today = new Date().toISOString().split('T')[0];[m
[31m-            if (pickupDate) pickupDate.min = today;[m
[31m-            if (returnDate) returnDate.min = today;[m
[31m-            [m
[31m-            // Add event listeners[m
[31m-            if (pickupDate) pickupDate.addEventListener('change', calculateTotal);[m
[31m-            if (returnDate) returnDate.addEventListener('change', calculateTotal);[m
[31m-            if (carSelect) carSelect.addEventListener('change', calculateTotal);[m
[31m-            if (pickupTime) pickupTime.addEventListener('change', calculateTotal);[m
[31m-            if (returnTime) returnTime.addEventListener('change', calculateTotal);[m
[31m-            [m
[31m-            // Update return date min when pickup changes[m
[31m-            if (pickupDate) {[m
[31m-                pickupDate.addEventListener('change', function() {[m
[31m-                    if (returnDate) {[m
[31m-                        returnDate.min = this.value;[m
[31m-                        if (returnDate.value && new Date(returnDate.value) <= new Date(this.value)) {[m
[31m-                            returnDate.value = '';[m
[31m-                        }[m
[31m-                    }[m
[31m-                    calculateTotal();[m
[31m-                });[m
[31m-            }[m
[31m-        });[m
[31m-    </script>[m
[31m-</body>[m
[31m-</html>[m
\ No newline at end of file[m
