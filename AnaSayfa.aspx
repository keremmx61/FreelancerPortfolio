```html
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnaSayfa.aspx.cs" Inherits="PortfolyoKeremBasakoglu.AnaSayfa" %>

<!DOCTYPE html>
<html lang="tr">
<head runat="server">
    <meta charset="utf-8" />
    <title>Kerem Başakoğlu | Portföy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --main-purple: #6d28d9;
            --main-pink: #c026d3;
            --main-yellow: #facc15;
            --main-bg: #f8fafc;
            --main-blue: #6366f1;
            --main-dark: #18181b;
            --main-white: #fff;
            --main-gray: #f3f4f6;
            --main-shadow: 0 10px 32px rgba(76,29,149,0.13);
        }
        html { scroll-behavior: smooth; }
        body {
            font-family: 'Montserrat', sans-serif;
            background: var(--main-white);
            color: #1f2937;
            overflow-x: hidden;
            padding-top: 72px;
        }
        .dark {
            background: var(--main-dark);
            color: var(--main-white);
        }
        .dark .navbar, .dark .card, .dark .skill-item, .dark .about-card, .dark .contact-form, .dark .service-card {
            background: #23232a !important;
            color: var(--main-white) !important;
        }
        .dark #iletisim {
            background: linear-gradient(135deg, #6b21a8, #4c1d95);
        }
        .transition-all { transition: all 0.3s cubic-bezier(.4,0,.2,1); }
        .navbar {
            background: linear-gradient(90deg, var(--main-purple), var(--main-pink) 80%);
            padding: 18px 0;
            box-shadow: 0 6px 24px rgba(0,0,0,0.18);
            animation: gradientShift 12s ease infinite;
            background-size: 200% 200%;
        }
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .navbar-brand {
            font-size: 2rem;
            font-weight: 800;
            color: var(--main-white) !important;
            letter-spacing: 1px;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.25);
            transition: color 0.3s, transform 0.3s;
        }
        .navbar-brand:hover {
            color: var(--main-yellow) !important;
            transform: scale(1.09) rotate(-2deg);
        }
        .navbar-nav .nav-link {
            color: var(--main-white) !important;
            font-weight: 600;
            margin: 0 18px;
            position: relative;
            font-size: 1.08rem;
            letter-spacing: 0.5px;
            transition: color 0.3s, transform 0.3s;
        }
        .navbar-nav .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 3px;
            bottom: -6px;
            left: 0;
            background: linear-gradient(90deg, var(--main-yellow), var(--main-pink));
            border-radius: 2px;
            transition: width 0.3s;
        }
        .navbar-nav .nav-link:hover::after, .navbar-nav .nav-link.active::after { width: 100%; }
        .navbar-nav .nav-link:hover, .navbar-nav .nav-link.active {
            color: var(--main-yellow) !important;
            transform: translateY(-2px) scale(1.08);
        }
        .form-select {
            min-width: 120px;
            border-radius: 20px;
            background: var(--main-white);
            color: var(--main-purple);
            border: 2px solid var(--main-purple);
            font-weight: 600;
        }
        .form-select:focus {
            border-color: var(--main-pink);
            box-shadow: 0 0 0 2px var(--main-yellow);
        }
        .section {
            padding: 90px 0 70px 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }
        #hakkimda {
            background-image: url('images/IMG_4611.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: 90% 80%;
            position: relative;
            color: var(--main-white);
        }
        #hakkimda::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(44, 29, 149, 0.45);
            z-index: 1;
        }
        #hakkimda .container {
            position: relative;
            z-index: 2;
            animation: slideIn 1.2s ease-out;
        }
        #hakkimda h2 {
            font-size: 2.8rem;
            font-weight: 900;
            margin-bottom: 28px;
            text-shadow: 3px 3px 8px rgba(0,0,0,0.5);
            letter-spacing: 1px;
        }
        .about-card {
            background: rgba(255,255,255,0.97);
            color: #1f2937;
            padding: 32px;
            border-radius: 18px;
            box-shadow: var(--main-shadow);
            max-width: 820px;
            margin: 0 auto;
            border: 2px solid var(--main-yellow);
            transition: box-shadow 0.3s, transform 0.3s, border-color 0.3s;
        }
        .about-card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 18px 48px var(--main-pink), 0 0 0 4px var(--main-yellow);
            border-color: var(--main-pink);
        }
        .about-card p {
            font-size: 1.13rem;
            line-height: 1.85;
            margin-bottom: 12px;
        }
        .about-card i {
            color: var(--main-purple);
            margin-right: 10px;
        }
        .cv-button {
            background: linear-gradient(90deg, var(--main-yellow), var(--main-pink) 80%);
            color: #1f2937;
            font-weight: 700;
            padding: 12px 32px;
            border-radius: 50px;
            text-decoration: none;
            border: none;
            box-shadow: 0 2px 12px rgba(76,29,149,0.08);
            font-size: 1.08rem;
            transition: background 0.3s, color 0.3s, transform 0.3s, box-shadow 0.3s;
        }
        .cv-button:hover {
            background: linear-gradient(90deg, var(--main-pink), var(--main-yellow) 80%);
            color: var(--main-white);
            transform: scale(1.12) rotate(-2deg);
            box-shadow: 0 6px 24px var(--main-pink);
        }
        #yetenekler {
            background: var(--main-gray);
            position: relative;
        }
        #yetenekler h2 {
            font-size: 2.5rem;
            font-weight: 900;
            color: var(--main-purple);
            margin-bottom: 38px;
            text-shadow: 2px 2px 8px rgba(76,29,149,0.08);
        }
        .skill-item {
            background: var(--main-white);
            padding: 28px 18px;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            margin-bottom: 24px;
            border: 2px solid var(--main-purple);
            transition: box-shadow 0.3s, transform 0.3s, border-color 0.3s;
        }
        .skill-item:hover {
            transform: translateY(-8px) scale(1.06);
            box-shadow: 0 10px 32px var(--main-yellow);
            border-color: var(--main-yellow);
        }
        .skill-item i {
            color: var(--main-purple);
            transition: color 0.3s;
        }
        .skill-item:hover i {
            color: var(--main-pink);
        }
        #hizmetler {
            background: linear-gradient(135deg, var(--main-white) 60%, var(--main-gray));
            position: relative;
        }
        #hizmetler h2 {
            font-size: 2.5rem;
            font-weight: 900;
            color: var(--main-pink);
            margin-bottom: 38px;
            text-shadow: 2px 2px 8px rgba(192,38,211,0.08);
        }
        .services-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 32px;
        }
        .service-card {
            background: var(--main-white);
            border-radius: 18px;
            box-shadow: 0 6px 24px rgba(76,29,149,0.10);
            padding: 32px 24px;
            width: 270px;
            min-height: 220px;
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 2px solid var(--main-purple);
            transition: box-shadow 0.3s, transform 0.3s, border-color 0.3s, background 0.3s;
            position: relative;
        }
        .service-card:hover {
            background: linear-gradient(120deg, var(--main-yellow) 0%, var(--main-pink) 100%);
            color: var(--main-white);
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 18px 48px var(--main-pink), 0 0 0 4px var(--main-yellow);
            border-color: var(--main-pink);
        }
        .service-card i {
            font-size: 2.5rem;
            color: var(--main-purple);
            margin-bottom: 18px;
            transition: color 0.3s;
        }
        .service-card:hover i {
            color: var(--main-white);
        }
        .service-title {
            font-size: 1.18rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--main-purple);
            transition: color 0.3s;
            text-align: center;
        }
        .service-card:hover .service-title {
            color: var(--main-white);
        }
        .service-desc {
            font-size: 1rem;
            color: #374151;
            text-align: center;
            transition: color 0.3s;
        }
        .service-card:hover .service-desc {
            color: var(--main-white);
        }
        #projeler {
            background: var(--main-white);
            position: relative;
            overflow: hidden;
        }
        #projeler::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(76,29,149,0.10), transparent);
            z-index: 0;
        }
        #projeler h2 {
            font-size: 2.5rem;
            font-weight: 900;
            color: var(--main-purple);
            margin-bottom: 38px;
            text-shadow: 2px 2px 8px rgba(76,29,149,0.08);
        }
        .filter-buttons {
            margin-bottom: 28px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            position: relative;
            z-index: 10;
            gap: 8px;
        }
        .filter-button {
            background: linear-gradient(90deg, var(--main-purple), var(--main-pink) 80%);
            color: var(--main-white);
            border: none;
            padding: 13px 28px;
            border-radius: 25px;
            font-weight: 700;
            cursor: pointer;
            font-size: 1rem;
            box-shadow: 0 2px 8px rgba(76,29,149,0.08);
            transition: background 0.3s, color 0.3s, transform 0.3s, box-shadow 0.3s;
        }
        .filter-button:hover, .filter-button.active {
            background: linear-gradient(90deg, var(--main-yellow), var(--main-pink) 80%);
            color: #1f2937;
            transform: scale(1.12) rotate(-2deg);
            box-shadow: 0 6px 18px var(--main-yellow);
        }
        .project-card {
            border: 2px solid var(--main-purple);
            border-radius: 22px;
            overflow: hidden;
            background: var(--main-white);
            box-shadow: var(--main-shadow);
            position: relative;
            z-index: 1;
            transition: box-shadow 0.3s, transform 0.3s, border-color 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .project-card:hover {
            transform: translateY(-12px) scale(1.04);
            box-shadow: 0 18px 48px var(--main-pink), 0 0 0 4px var(--main-yellow);
            border-color: var(--main-yellow);
        }
        .project-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(250,204,21,0.18));
            opacity: 0;
            transition: opacity 0.4s;
            z-index: 2;
        }
        .project-card:hover::before { opacity: 1; }
        .project-card img {
            height: 220px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.4s;
        }
        .project-card:hover img { transform: scale(1.08); }
        .project-card .card-body {
            padding: 22px;
            position: relative;
            z-index: 3;
        }
        .project-card .card-title {
            font-size: 1.35rem;
            font-weight: 700;
            color: var(--main-purple);
        }
        .project-card .card-text {
            font-size: 1rem;
            color: #374151;
            line-height: 1.7;
        }
        .project-label {
            position: absolute;
            right: 16px;
            bottom: 16px;
            left: auto;
            top: auto;
            background: var(--main-yellow);
            color: #1f2937;
            padding: 7px 14px;
            border-radius: 12px;
            font-size: 0.9rem;
            font-weight: 700;
            box-shadow: 0 2px 8px var(--main-pink);
            z-index: 10;
        }
        .tech-tag {
            display: inline-block;
            background: #e0e7ff;
            color: var(--main-purple);
            padding: 5px 12px;
            margin: 2px;
            border-radius: 10px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: background 0.3s, color 0.3s;
        }
        .tech-tag:hover {
            background: var(--main-yellow);
            color: var(--main-pink);
        }
        #is-gecmisi {
            background: linear-gradient(135deg, var(--main-white) 60%, var(--main-gray));
            position: relative;
            padding: 90px 0 50px 0;
            overflow: hidden;
        }
        .is-gecmisi-card {
            background: var(--main-white);
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(76,29,149,0.10);
            border: 1.5px solid var(--main-purple);
            transition: box-shadow 0.3s, transform 0.3s, border-color 0.3s, background 0.3s;
            position: relative;
            overflow: hidden;
            z-index: 1;
            min-width: 0;
            width: 100%;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .is-gecmisi-card:hover {
            transform: translateY(-4px) scale(1.02) rotate(-1deg);
            box-shadow: 0 6px 18px var(--main-pink), 0 0 0 2px var(--main-yellow);
            border-color: var(--main-pink);
            background: linear-gradient(120deg, #fff 80%, #f3f4f6 100%);
        }
        .is-gecmisi-card .card-body {
            padding: 12px 10px 10px 10px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .is-gecmisi-card .card-title {
            color: var(--main-purple);
            font-weight: 700;
            font-size: 1rem;
            margin-bottom: 2px;
            line-height: 1.2;
        }
        .is-gecmisi-card .card-subtitle {
            color: var(--main-pink) !important;
            font-weight: 600;
            font-size: 0.92rem;
            margin-bottom: 4px;
            line-height: 1.1;
        }
        .is-gecmisi-card .card-text {
            color: #374151;
            font-size: 0.88rem;
            margin-bottom: 6px;
            line-height: 1.4;
        }
        .is-gecmisi-card .badge {
            background: linear-gradient(90deg, var(--main-yellow), var(--main-pink) 80%);
            color: #1f2937;
            font-weight: 600;
            font-size: 0.8rem;
            border-radius: 10px;
            box-shadow: 0 1px 5px var(--main-pink);
            padding: 4px 10px;
        }
        #is-gecmisi .row {
            --bs-gutter-x: 1rem;
            --bs-gutter-y: 1rem;
        }
        @media (min-width: 992px) {
            #is-gecmisi .col-lg-3 {
                flex: 0 0 auto;
                width: 25%;
            }
        }
        @media (max-width: 991.98px) {
            #is-gecmisi .col-md-4 {
                flex: 0 0 auto;
                width: 33.33333333%;
            }
        }
        @media (max-width: 767.98px) {
            #is-gecmisi .col-sm-6 {
                flex: 0 0 auto;
                width: 50%;
            }
            .is-gecmisi-card .card-body {
                padding: 10px 6px 8px 6px;
            }
        }
        @media (max-width: 575.98px) {
            #is-gecmisi .col-12 {
                flex: 0 0 auto;
                width: 100%;
            }
            .is-gecmisi-card .card-body {
                padding: 8px 4px 6px 4px;
            }
        }
        #iletisim {
            background: linear-gradient(135deg, var(--main-pink), var(--main-yellow));
            color: var(--main-white);
            position: relative;
            animation: waveBackground 15s ease infinite;
            background-size: 200% 200%;
            padding: 90px 0 100px 0;
            height: auto;
        }
        @keyframes waveBackground {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        #iletisim h2 {
            font-size: 2.5rem;
            font-weight: 900;
            margin-bottom: 28px;
            text-shadow: 3px 3px 8px rgba(0,0,0,0.18);
        }
        #iletisim p {
            font-size: 1.13rem;
            margin-bottom: 16px;
        }
        #iletisim a {
            color: var(--main-white);
            text-decoration: underline;
            font-weight: 700;
            transition: color 0.3s;
        }
        #iletisim a:hover {
            color: var(--main-yellow);
        }
        .social-icons a {
            font-size: 2.1rem;
            margin: 0 16px;
            transition: color 0.2s, transform 0.2s, text-shadow 0.2s;
            color: var(--main-white);
            text-shadow: 0 2px 8px var(--main-pink);
        }
        .social-icons a:hover {
            transform: scale(1.22) rotate(-8deg);
            color: var(--main-yellow);
            text-shadow: 0 4px 16px var(--main-pink);
        }
        .contact-form {
            max-width: 540px;
            margin: 0 auto;
            background: rgba(255,255,255,0.98);
            padding: 32px;
            border-radius: 18px;
            box-shadow: var(--main-shadow);
            border: 2px solid var(--main-pink);
            transition: box-shadow 0.3s, border-color 0.3s, transform 0.3s;
        }
        .contact-form:hover {
            transform: translateY(-8px) scale(1.01);
            box-shadow: 0 10px 32px var(--main-yellow);
            border-color: var(--main-yellow);
        }
        .contact-form .form-control {
            border-radius: 14px;
            margin-bottom: 14px;
            border: 2px solid var(--main-purple);
            padding: 10px;
            font-size: 1rem;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .contact-form .form-control:focus {
            border-color: var(--main-pink);
            box-shadow: 0 0 0 2px var(--main-yellow);
        }
        .contact-form button, .contact-form input[type="submit"] {
            background: linear-gradient(90deg, var(--main-purple), var(--main-pink) 80%);
            color: var(--main-white);
            border: none;
            padding: 12px 28px;
            border-radius: 50px;
            font-weight: 700;
            transition: background 0.3s, color 0.3s, transform 0.3s, box-shadow 0.3s;
        }
        .contact-form button:hover, .contact-form input[type="submit"]:hover {
            background: linear-gradient(90deg, var(--main-yellow), var(--main-pink) 80%);
            color: #1f2937;
            transform: scale(1.08) rotate(-2deg);
            box-shadow: 0 4px 18px var(--main-yellow);
        }
        .scroll-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--main-purple);
            color: var(--main-white);
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s, transform 0.3s;
            z-index: 1000;
        }
        .scroll-top:hover {
            background: var(--main-pink);
            transform: scale(1.1);
        }
        .scroll-top.show {
            opacity: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Kerem Başakoğlu</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="#hakkimda">Hakkımda</a></li>
                        <li class="nav-item"><a class="nav-link" href="#yetenekler">Yetenekler</a></li>
                        <li class="nav-item"><a class="nav-link" href="#hizmetler">Sizin için neler yapabilirim?</a></li>
                        <li class="nav-item"><a class="nav-link" href="#projeler">Projelerim</a></li>
                        <li class="nav-item"><a class="nav-link" href="#is-gecmisi">İş Geçmişi</a></li>
                        <li class="nav-item"><a class="nav-link" href="#iletisim">İletişim</a></li>
                        <li class="nav-item"><a class="nav-link" href="Yonetim.aspx">Yönetim</a></li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lnkLogout" runat="server" CssClass="nav-link" OnClick="lnkLogout_Click">Çıkış</asp:LinkButton></li>
                    </ul>
                    <select id="themeSelect" class="form-select ms-3" style="width: auto;">
                        <option value="light">Açık Tema</option>
                        <option value="dark">Koyu Tema</option>
                    </select>
                </div>
            </div>
        </nav>
        <section id="hakkimda" class="section fade-in">
            <div class="container text-center">
                <h2>Hakkımda</h2>
                <div class="about-card mt-4 transition-all">
                    <p><i class="fas fa-user"></i>Merhaba, ben Kerem Başakoğlu. 21 yaşındayım, Trabzonluyum ve Avrasya Üniversitesi’nde Bilgisayar Programcılığı okuyorum.</p>
                    <p><i class="fas fa-code"></i>Yazılım geliştirmeye tutkuluyum, özellikle kullanıcı dostu arayüzler ve işlevsel projeler üretmeye odaklanıyorum.</p>
                    <p><i class="fas fa-rocket"></i>Hedefim, yenilikçi ve etkili çözümler sunan bir yazılım geliştiricisi olmak. Bu portföyde projelerimi inceleyebilirsiniz!</p>
                    <a href="/cv/kerem_basakoglu_cv.pdf" class="cv-button mt-3 transition-all" target="_blank">CV’mi İndir</a>
                </div>
            </div>
        </section>
        <section id="yetenekler" class="section fade-in">
            <div class="container">
                <h2 class="text-center mb-5">Yeteneklerim</h2>
                <div class="row">
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fas fa-code fa-2x mb-3"></i>
                            <h4>C#</h4>
                            <p>ASP.NET ve masaüstü uygulamaları geliştirme.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fab fa-html5 fa-2x mb-3"></i>
                            <h4>HTML & CSS</h4>
                            <p>Modern ve duyarlı web tasarımları.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fab fa-js fa-2x mb-3"></i>
                            <h4>JavaScript</h4>
                            <p>İnteraktif web özellikleri geliştirme.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fas fa-database fa-2x mb-3"></i>
                            <h4>SQL</h4>
                            <p>Veritabanı tasarımı ve sorgulama.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fab fa-java fa-2x mb-3"></i>
                            <h4>Java</h4>
                            <p>Çapraz platform uygulama geliştirme.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fab fa-react fa-2x mb-3"></i>
                            <h4>React</h4>
                            <p>Modern ve dinamik arayüzler.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fab fa-angular fa-2x mb-3"></i>
                            <h4>Angular</h4>
                            <p>Kurumsal SPA uygulamaları.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div class="skill-item text-center transition-all">
                            <i class="fab fa-python fa-2x mb-3"></i>
                            <h4>Python</h4>
                            <p>Veri analizi ve otomasyon çözümleri.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="hizmetler" class="section fade-in">
            <div class="container">
                <h2 class="text-center mb-5">Sizin için neler yapabilirim?</h2>
                <div class="services-list">
                    <div class="service-card transition-all">
                        <i class="fas fa-laptop-code"></i>
                        <div class="service-title">Web Uygulama Geliştirme</div>
                        <div class="service-desc">Modern, hızlı ve güvenli web siteleri ve uygulamaları geliştiriyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-mobile-alt"></i>
                        <div class="service-title">Mobil Uygulama Geliştirme</div>
                        <div class="service-desc">iOS ve Android için kullanıcı dostu mobil uygulamalar sunuyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-database"></i>
                        <div class="service-title">Veritabanı Tasarımı</div>
                        <div class="service-desc">Güvenli ve ölçeklenebilir veritabanı çözümleri oluşturuyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-cloud"></i>
                        <div class="service-title">Bulut Entegrasyonu</div>
                        <div class="service-desc">Projelerinizi bulut altyapılarına entegre ediyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-shield-alt"></i>
                        <div class="service-title">Siber Güvenlik</div>
                        <div class="service-desc">Uygulamalarınız için güvenlik analizleri ve önlemler sağlıyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-cogs"></i>
                        <div class="service-title">Otomasyon & Script</div>
                        <div class="service-desc">İş süreçlerinizi hızlandıracak otomasyon çözümleri geliştiriyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-chart-line"></i>
                        <div class="service-title">Veri Analizi & Raporlama</div>
                        <div class="service-desc">Verilerinizden anlamlı sonuçlar çıkarıp raporluyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-paint-brush"></i>
                        <div class="service-title">UI/UX Tasarımı</div>
                        <div class="service-desc">Kullanıcı odaklı ve estetik arayüzler tasarlıyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-sync-alt"></i>
                        <div class="service-title">API Entegrasyonu</div>
                        <div class="service-desc">Farklı sistemlerle veri alışverişi için API entegrasyonları yapıyorum.</div>
                    </div>
                    <div class="service-card transition-all">
                        <i class="fas fa-bug"></i>
                        <div class="service-title">Test & Hata Ayıklama</div>
                        <div class="service-desc">Projelerinizdeki hataları tespit edip çözüyorum.</div>
                    </div>
                </div>
            </div>
        </section>
        <section id="projeler" class="section bg-white fade-in">
            <div class="container">
                <h2 class="text-center mb-5">Projelerim</h2>
                <div class="filter-buttons text-center mb-3">
                    <button type="button" class="filter-button active" id="filter-all">Tümü</button>
                    <button type="button" class="filter-button" id="filter-web">Web</button>
                    <button type="button" class="filter-button" id="filter-mobil">Mobil</button>
                    <button type="button" class="filter-button" id="filter-masaustu">Masaüstü</button>
                </div>
                <asp:Label ID="lblProjectError" runat="server" CssClass="text-danger text-center d-block mb-3"></asp:Label>
                <div class="row" id="projectList" runat="server">
                    <%-- 
                        Proje kartlarınız burada dinamik olarak oluşturuluyor.
                        Her bir kartta kategori etiketi (project-label) sağ alta alınmalı.
                        Örnek kart yapısı aşağıdaki gibi olmalı:
                        <div class="col-md-4">
                            <div class="project-card">
                                <img src="..." alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title">Proje Başlığı</h5>
                                    <p class="card-text">Açıklama...</p>
                                    <span class="project-label">Web</span>
                                </div>
                            </div>
                        </div>
                        Eğer project-label kartın dışında ise, kartın içine ve card-body'nin en sonuna alınmalı.
                    --%>
                </div>
            </div>
        </section>
        <section id="is-gecmisi" class="mb-5">
            <h2 class="text-center mb-4"><i class="fas fa-briefcase me-2"></i>İş Geçmişi</h2>
            <asp:Repeater ID="rptIsGecmisi" runat="server">
                <HeaderTemplate>
                    <div class="row justify-content-center">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12 d-flex">
                        <div class="is-gecmisi-card transition-all w-100">
                            <div class="card-body">
                                <h5 class="card-title mb-1"><i class="fas fa-building me-2"></i><%# Eval("SirketAdi") %></h5>
                                <h6 class="card-subtitle mb-2"><i class="fas fa-user-tie me-1"></i><%# Eval("Pozisyon") %></h6>
                                <p class="card-text mb-1"><%# Eval("Bilgi") %></p>
                                <span class="badge"><i class="fas fa-calendar-alt me-1"></i><%# Eval("Tarih") %></span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </section>
        <section id="iletisim" class="section fade-in">
            <div class="container text-center">
                <h2>İletişim</h2>
                <asp:Label ID="lblContactMessage" runat="server" CssClass="d-block mb-3"></asp:Label>
                <p class="mt-4">
                    Bana ulaşmak için: <a href="mailto:kerem.basakoglu@example.com">kerem.basakoglu@example.com</a>
                </p>
                <p>
                    Instagram: <a href="https://instagram.com/kerembsk_" target="_blank">@kerembsk_</a>
                </p>
                <p>
                    Twitter: <a href="https://twitter.com/doncarlo61" target="_blank">@doncarlo61</a>
                </p>
                <div class="social-icons mt-4 transition-all">
                    <a href="https://instagram.com/kerembsk_" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://twitter.com/doncarlo61" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="https://linkedin.com/in/kerembasakoglu" target="_blank"><i class="fab fa-linkedin"></i></a>
                </div>
                <div class="contact-form mt-5 transition-all">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Adınız" Required="true"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Type="email" placeholder="E-posta" Required="true"></asp:TextBox>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Mesajınız" Required="true"></asp:TextBox>
                    <asp:Button ID="btnSubmit" runat="server" Text="Gönder" CssClass="btn transition-all" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </section>
        <button id="scrollTop" class="scroll-top transition-all"><i class="fas fa-arrow-up"></i></button>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.addEventListener('scroll', function () {
            const scrollTopBtn = document.getElementById('scrollTop');
            if (window.pageYOffset > 200) {
                scrollTopBtn.classList.add('show');
            } else {
                scrollTopBtn.classList.remove('show');
            }
        });
        function filterProjects(category) {
            try {
                const projects = document.querySelectorAll('#projectList .col-md-4');
                const buttons = document.querySelectorAll('.filter-button');
                buttons.forEach(btn => btn.classList.remove('active'));
                document.getElementById(`filter-${category}`).classList.add('active');
                projects.forEach(project => {
                    const projectCategory = project.getAttribute('data-category') || 'web';
                    if (category === 'all' || projectCategory === category) {
                        project.style.display = 'block';
                        project.style.opacity = '0';
                        setTimeout(() => { project.style.opacity = '1'; project.style.transition = 'opacity 0.5s'; }, 50);
                    } else {
                        project.style.opacity = '0';
                        project.style.transition = 'opacity 0.5s';
                        setTimeout(() => { project.style.display = 'none'; }, 500);
                    }
                });
            } catch (error) {
                alert('Projeler yüklenirken hata oluştu.');
                console.error('Filtreleme hatası: ' + error.message);
            }
        }
        document.addEventListener('DOMContentLoaded', function () {
            try {
                const filterAll = document.getElementById('filter-all');
                const filterWeb = document.getElementById('filter-web');
                const filterMobil = document.getElementById('filter-mobil');
                const filterMasaustu = document.getElementById('filter-masaustu');
                if (!filterAll || !filterWeb || !filterMobil || !filterMasaustu) {
                    alert('Filtre butonları yüklenemedi!');
                    return;
                }
                filterAll.addEventListener('click', e => { e.preventDefault(); filterProjects('all'); });
                filterWeb.addEventListener('click', e => { e.preventDefault(); filterProjects('web'); });
                filterMobil.addEventListener('click', e => { e.preventDefault(); filterProjects('mobil'); });
                filterMasaustu.addEventListener('click', e => { e.preventDefault(); filterProjects('masaustu'); });
                [filterAll, filterWeb, filterMobil, filterMasaustu].forEach(button => {
                    button.addEventListener('touchstart', e => {
                        e.preventDefault();
                        filterProjects(button.id.split('-')[1]);
                    });
                });
                document.querySelectorAll('.nav-link').forEach(link => {
                    if (link.getAttribute('href') === window.location.hash || (!window.location.hash && link.getAttribute('href') === '#hakkimda')) {
                        link.classList.add('active');
                    }
                });
                document.getElementById('scrollTop').addEventListener('click', (e) => {
                    e.preventDefault();
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
                });
                document.getElementById('themeSelect').addEventListener('change', function () {
                    document.body.className = this.value;
                });
                filterProjects('all');
            } catch (error) {
                alert('Sayfa yüklenirken hata oluştu.');
                console.error('Sayfa yükleme hatası:');
                console.error(error);
            }
        });
    </script>
</body>
</html>