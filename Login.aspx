<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PortfolyoKeremBasakoglu.App_Start.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş Yap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-size: 400% 400%;
            animation: gradientAnimation 20s ease infinite;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .input-glow:focus {
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.6);
        }

        .button-glow:hover {
            box-shadow: 0 0 20px rgba(34, 197, 94, 0.8);
            animation: pulse 1s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.03); }
        }

        .form-border-animate {
            position: relative;
            z-index: 1;
            overflow: hidden;
        }

        .form-border-animate::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, #8e44ad, #3498db, #2ecc71, #e74c3c);
            background-size: 400% 400%;
            animation: borderGradient 10s ease infinite;
            z-index: -1;
            border-radius: 26px;
        }

        @keyframes borderGradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
    </style>
</head>
<body class="bg-gradient-to-r from-purple-900 via-indigo-800 via-blue-700 via-cyan-600 to-green-500 min-h-screen flex items-center justify-center text-white">
    <form id="form1" runat="server" class="w-full max-w-md p-10 bg-gray-900 rounded-2xl shadow-2xl shadow-indigo-500/50 transform transition-all duration-500 ease-in-out hover:scale-102 flex flex-col items-center border border-indigo-700 form-border-animate">
        <div class="w-full">
            <h2 class="text-6xl font-extrabold text-center mb-10 text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-purple-400 drop-shadow-lg">Giriş Yap</h2>
            
            <asp:Label ID="lblBilgi" runat="server" CssClass="text-red-400 font-semibold text-center mb-6 block text-lg"></asp:Label>
            
            <asp:TextBox 
                ID="txtKullaniciAdi" 
                runat="server" 
                Placeholder="Kullanıcı Adı" 
                CssClass="w-full px-6 py-4 mb-5 bg-gray-800 border border-gray-700 rounded-xl text-white placeholder-gray-500 focus:outline-none focus:ring-3 focus:ring-indigo-600 transition duration-300 ease-in-out input-glow text-lg"
            ></asp:TextBox>
            
            <asp:TextBox 
                ID="txtSifre" 
                runat="server" 
                TextMode="Password" 
                Placeholder="Şifre" 
                CssClass="w-full px-6 py-4 mb-8 bg-gray-800 border border-gray-700 rounded-xl text-white placeholder-gray-500 focus:outline-none focus:ring-3 focus:ring-indigo-600 transition duration-300 ease-in-out input-glow text-lg"
            ></asp:TextBox>
            
            <asp:Button 
                ID="btnGiris" 
                runat="server" 
                Text="Giriş Yap" 
                OnClick="btnGiris_Click" 
                CssClass="w-full py-4 bg-gradient-to-r from-green-500 to-teal-500 hover:from-green-600 hover:to-teal-600 text-white font-extrabold rounded-xl shadow-xl transform transition duration-300 ease-in-out hover:scale-105 focus:outline-none focus:ring-4 focus:ring-green-500 focus:ring-opacity-75 button-glow text-xl tracking-wide"
            />
        </div>
    </form>
</body>
</html>
