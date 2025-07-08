using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace PortfolyoKeremBasakoglu
{
    public partial class AnaSayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciAdi"] == null || Session["KullaniciId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                ProjeleriYukle();
                IsGecmisiYukle();
            }
        }

        private void ProjeleriYukle()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    int kullaniciId;
                    if (!int.TryParse(Session["KullaniciId"]?.ToString(), out kullaniciId))
                    {
                        lblProjectError.Text = "Oturum hatası, lütfen tekrar giriş yapın.";
                        return;
                    }
                    SqlCommand cmd = new SqlCommand("SELECT Id, Baslik, Aciklama, ResimUrl, Kategori FROM Projeler WHERE KullaniciId = @kid", conn);
                    cmd.Parameters.AddWithValue("@kid", kullaniciId);
                    SqlDataReader dr = cmd.ExecuteReader();
                    int projeSayisi = 0;
                    while (dr.Read())
                    {
                        projeSayisi++;
                        string category = dr["Kategori"]?.ToString()?.ToLower() ?? "web";
                        string categoryDisplay = dr["Kategori"]?.ToString() ?? "Web";
                        if (category != "web" && category != "mobil" && category != "masaustu")
                        {
                            category = "web";
                            categoryDisplay = "Web";
                        }
                        string techTags = category == "web" ? "<span class='tech-tag'>HTML</span><span class='tech-tag'>CSS</span><span class='tech-tag'>JavaScript</span>" :
                                          category == "mobil" ? "<span class='tech-tag'>Java</span><span class='tech-tag'>Android</span>" :
                                          "<span class='tech-tag'>C#</span><span class='tech-tag'>SQL</span>";
                        LiteralControl card = new LiteralControl($@"
                            <div class='col-md-4 col-12 mb-4' data-category='{category}'>
                                <div class='project-card'>
                                    <img src='{dr["ResimUrl"]?.ToString() ?? ""}' onerror='this.src=""https://via.placeholder.com/150""' class='card-img-top' alt='Proje Görseli'>
                                    <div class='card-body'>
                                        <h5 class='card-title'>{dr["Baslik"]?.ToString() ?? ""}</h5>
                                        <p class='card-text'>{dr["Aciklama"]?.ToString() ?? ""}</p>
                                        <span class='project-label'>{categoryDisplay}</span>
                                        <div class='tech-tags'>{techTags}</div>
                                    </div>
                                </div>
                            </div>
                        ");
                        projectList.Controls.Add(card);
                    }
                    if (projeSayisi == 0)
                    {
                        lblProjectError.Text = "Henüz proje eklenmedi.";
                    }
                }
                catch (Exception ex)
                {
                    lblProjectError.Text = $"Hata: {ex.Message}";
                    System.Diagnostics.Debug.WriteLine($"Hata: {ex.Message}");
                }
            }
        }

        private void IsGecmisiYukle()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    int kullaniciId;
                    if (!int.TryParse(Session["KullaniciId"]?.ToString(), out kullaniciId))
                    {
                        // Eğer oturum yoksa, iş geçmişi gösterilmesin
                        rptIsGecmisi.DataSource = null;
                        rptIsGecmisi.DataBind();
                        return;
                    }
                    SqlCommand cmd = new SqlCommand("SELECT SirketAdi, Pozisyon, Bilgi, Tarih FROM IsGecmisi WHERE KullaniciId = @kid", conn);
                    cmd.Parameters.AddWithValue("@kid", kullaniciId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptIsGecmisi.DataSource = dt;
                    rptIsGecmisi.DataBind();
                }
                catch (Exception ex)
                {
                    // Hata durumunda iş geçmişi gösterilmesin
                    rptIsGecmisi.DataSource = null;
                    rptIsGecmisi.DataBind();
                    System.Diagnostics.Debug.WriteLine($"İş geçmişi hatası: {ex.Message}");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Mesajlar (Ad, Eposta, Mesaj) VALUES (@ad, @eposta, @mesaj)", conn);
                    cmd.Parameters.AddWithValue("@ad", txtName.Text);
                    cmd.Parameters.AddWithValue("@eposta", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@mesaj", txtMessage.Text);
                    cmd.ExecuteNonQuery();
                    lblContactMessage.Text = "<div class='alert alert-success'>Mesajınız gönderildi!</div>";
                    txtName.Text = txtEmail.Text = txtMessage.Text = "";
                }
                catch (Exception ex)
                {
                    lblContactMessage.Text = "<div class='alert alert-danger'>Hata: " + ex.Message + "</div>";
                    System.Diagnostics.Debug.WriteLine($"Mesaj hatası: {ex.Message}");
                }
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
