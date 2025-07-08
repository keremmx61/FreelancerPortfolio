<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yonetim.aspx.cs" Inherits="PortfolyoKeremBasakoglu.Yonetim" %>
<!DOCTYPE html>
<html lang="tr">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Yönetim Paneli | Kerem Başakoğlu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, var(--main-bg), #e0e7ff 60%, #a5b4fc);
            color: #1f2937;
            padding-top: 80px;
        }
        .navbar-custom {
            background: linear-gradient(90deg, var(--main-purple), var(--main-pink) 80%);
            box-shadow: 0 6px 24px rgba(0,0,0,0.18);
            background-size: 200% 200%;
            animation: gradientShift 12s ease infinite;
        }
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .navbar-brand {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--main-white) !important;
            letter-spacing: 1px;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.25);
        }
        .navbar-nav .nav-link, .navbar-nav .btn {
            color: var(--main-white) !important;
            font-weight: 600;
            margin-left: 10px;
            border-radius: 50px;
            transition: background 0.3s, color 0.3s;
        }
        .navbar-nav .btn-primary {
            background: var(--main-yellow);
            color: #1f2937 !important;
            border: none;
        }
        .navbar-nav .btn-primary:hover {
            background: var(--main-pink);
            color: #fff !important;
        }
        .navbar-nav .btn-danger {
            background: #dc3545;
            color: #fff !important;
            border: none;
        }
        .navbar-nav .btn-danger:hover {
            background: #b91c1c;
            color: #fff !important;
        }
        .management-card {
            background: rgba(255,255,255,0.97);
            border-radius: 18px;
            box-shadow: var(--main-shadow);
            padding: 32px 24px;
            margin: 40px auto 30px auto;
            border: 2px solid var(--main-yellow);
            max-width: 950px;
        }
        .form-control, .form-select {
            border-radius: 12px;
            border: 2px solid #d1d5db;
            padding: 10px;
            font-size: 0.95rem;
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--main-pink);
            box-shadow: 0 0 5px rgba(192,38,211,0.2);
        }
        .btn-primary {
            background: linear-gradient(90deg, var(--main-purple), var(--main-pink) 80%);
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            font-weight: 600;
            color: var(--main-white);
            transition: background 0.3s, color 0.3s, transform 0.3s, box-shadow 0.3s;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, var(--main-yellow), var(--main-pink) 80%);
            color: #1f2937;
            transform: scale(1.1);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }
        .btn-warning {
            background: var(--main-yellow);
            color: #1f2937;
            border-radius: 50px;
            font-weight: 600;
        }
        .btn-warning:hover {
            background: var(--main-pink);
            color: #fff;
        }
        .btn-danger {
            background: #dc3545;
            color: #fff;
            border-radius: 50px;
            font-weight: 600;
        }
        .btn-danger:hover {
            background: #b91c1c;
            color: #fff;
        }
        .btn-success {
            background: var(--main-blue);
            color: #fff;
            border-radius: 50px;
            font-weight: 600;
        }
        .btn-success:hover {
            background: var(--main-purple);
            color: #fff;
        }
        .btn-secondary {
            background: #6b7280;
            border-radius: 50px;
            font-weight: 600;
            color: var(--main-white);
        }
        .btn-secondary:hover {
            background: var(--main-yellow);
            color: #1f2937;
        }
        .table {
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        .table thead {
            background: linear-gradient(90deg, var(--main-purple), var(--main-pink));
            color: #fff;
        }
        .table th, .table td { vertical-align: middle; padding: 15px; }
        .table tbody tr:hover { background: #f9fafb; transform: scale(1.01); transition: all 0.2s ease; }
        .alert { border-radius: 12px; padding: 15px; margin-bottom: 20px; animation: fadeIn 0.5s ease; }
        @keyframes fadeIn { 0% { opacity: 0; } 100% { opacity: 1; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container-fluid">
                <span class="navbar-brand"><i class="fas fa-cogs me-2"></i>Yönetim Paneli</span>
                <div class="d-flex ms-auto">
                    <a href="AnaSayfa.aspx" class="btn btn-primary me-2"><i class="fas fa-home me-1"></i>Ana Sayfaya Dön</a>
                    <asp:LinkButton ID="lnkLogout" runat="server" CssClass="btn btn-danger" OnClick="lnkLogout_Click"><i class="fas fa-sign-out-alt me-1"></i>Çıkış</asp:LinkButton>
                </div>
            </div>
        </nav>
        <div class="management-card">
            <asp:Label ID="lblMessage" runat="server" CssClass="d-block mb-3"></asp:Label>
            <!-- Proje Ekleme Formu -->
            <div class="row g-2 mb-4">
                <div class="col-md-3">
                    <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control" placeholder="Proje Başlığı"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtAciklama" runat="server" CssClass="form-control" placeholder="Açıklama"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtResimUrl" runat="server" CssClass="form-control" placeholder="Resim URL"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="ddlKategori" runat="server" CssClass="form-select">
                        <asp:ListItem Value="web">Web</asp:ListItem>
                        <asp:ListItem Value="mobil">Mobil</asp:ListItem>
                        <asp:ListItem Value="masaustu">Masaüstü</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-1 d-grid">
                    <asp:Button ID="btnAdd" runat="server" Text="Ekle" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
            <!-- Proje Listesi -->
            <asp:Repeater ID="rptProjeler" runat="server" OnItemCommand="rptProjeler_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Başlık</th>
                                <th>Açıklama</th>
                                <th>Resim URL</th>
                                <th>Kategori</th>
                                <th style="width:160px;">İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <asp:Panel runat="server" Visible='<%# !(bool)Eval("IsEdit") %>'>
                            <td><%# Eval("Baslik") %></td>
                            <td><%# Eval("Aciklama") %></td>
                            <td>
                                <%# !string.IsNullOrEmpty(Eval("ResimUrl") as string) ? "<a href='" + Eval("ResimUrl") + "' target='_blank'>Resim</a>" : "-" %>
                            </td>
                            <td><span class="badge bg-secondary"><%# Eval("Kategori") %></span></td>
                            <td>
                                <asp:LinkButton runat="server" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-warning me-1"><i class="fas fa-edit"></i> Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Silinsin mi?');"><i class="fas fa-trash"></i> Sil</asp:LinkButton>
                            </td>
                        </asp:Panel>
                        <asp:Panel runat="server" Visible='<%# (bool)Eval("IsEdit") %>'>
                            <td><asp:TextBox runat="server" ID="txtEditBaslik" CssClass="form-control" Text='<%# Eval("Baslik") %>' /></td>
                            <td><asp:TextBox runat="server" ID="txtEditAciklama" CssClass="form-control" Text='<%# Eval("Aciklama") %>' /></td>
                            <td><asp:TextBox runat="server" ID="txtEditResimUrl" CssClass="form-control" Text='<%# Eval("ResimUrl") %>' /></td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlEditKategori" CssClass="form-select">
                                    <asp:ListItem Value="web">Web</asp:ListItem>
                                    <asp:ListItem Value="mobil">Mobil</asp:ListItem>
                                    <asp:ListItem Value="masaustu">Masaüstü</asp:ListItem>
                                </asp:DropDownList>
                                <asp:HiddenField runat="server" ID="hdnEditKategori" Value='<%# Eval("Kategori") %>' />
                            </td>
                            <td>
                                <asp:LinkButton runat="server" CommandName="Update" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success me-1"><i class="fas fa-check"></i> Kaydet</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Cancel" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-secondary"><i class="fas fa-times"></i> İptal</asp:LinkButton>
                            </td>
                        </asp:Panel>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <!-- İş Geçmişi Bölümü -->
            <hr class="my-4" />
            <h4 class="mb-3"><i class="fas fa-briefcase me-2"></i>İş Geçmişi</h4>
            <div class="row g-2 mb-4">
                <div class="col-md-3">
                    <asp:TextBox ID="txtSirketAdi" runat="server" CssClass="form-control" placeholder="Şirket Adı"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPozisyon" runat="server" CssClass="form-control" placeholder="Pozisyon"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtIsBilgi" runat="server" CssClass="form-control" placeholder="Bilgi"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="txtIsTarih" runat="server" CssClass="form-control" placeholder="Tarih"></asp:TextBox>
                </div>
                <div class="col-md-1 d-grid">
                    <asp:Button ID="btnIsEkle" runat="server" Text="Ekle" CssClass="btn btn-primary" OnClick="btnIsEkle_Click" />
                </div>
            </div>
            <asp:Repeater ID="rptIsGecmisi" runat="server" OnItemCommand="rptIsGecmisi_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Şirket</th>
                                <th>Pozisyon</th>
                                <th>Bilgi</th>
                                <th>Tarih</th>
                                <th style="width:120px;">İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <asp:Panel runat="server" Visible='<%# !(bool)Eval("IsEdit") %>'>
                            <td><%# Eval("SirketAdi") %></td>
                            <td><%# Eval("Pozisyon") %></td>
                            <td><%# Eval("Bilgi") %></td>
                            <td><%# Eval("Tarih") %></td>
                            <td>
                                <asp:LinkButton runat="server" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-warning me-1">Düzenle</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Silinsin mi?');">Sil</asp:LinkButton>
                            </td>
                        </asp:Panel>
                        <asp:Panel runat="server" Visible='<%# (bool)Eval("IsEdit") %>'>
                            <td><asp:TextBox runat="server" ID="txtEditSirketAdi" CssClass="form-control" Text='<%# Eval("SirketAdi") %>' /></td>
                            <td><asp:TextBox runat="server" ID="txtEditPozisyon" CssClass="form-control" Text='<%# Eval("Pozisyon") %>' /></td>
                            <td><asp:TextBox runat="server" ID="txtEditIsBilgi" CssClass="form-control" Text='<%# Eval("Bilgi") %>' /></td>
                            <td><asp:TextBox runat="server" ID="txtEditIsTarih" CssClass="form-control" Text='<%# Eval("Tarih") %>' /></td>
                            <td>
                                <asp:LinkButton runat="server" CommandName="Update" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success me-1">Kaydet</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Cancel" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-secondary">İptal</asp:LinkButton>
                            </td>
                        </asp:Panel>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.querySelectorAll('select[id$=ddlEditKategori]').forEach(function (ddl) {
                var hdn = ddl.parentElement.querySelector('input[type=hidden]');
                if (hdn) ddl.value = hdn.value;
            });
        });
    </script>
</body>
</html>
