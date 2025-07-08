using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PortfolyoKeremBasakoglu
{
    public partial class Yonetim : System.Web.UI.Page
    {
        // Proje ve iş geçmişi için edit id'ler
        private int? EditProjeId
        {
            get { return ViewState["EditProjeId"] as int?; }
            set { ViewState["EditProjeId"] = value; }
        }
        private int? EditIsId
        {
            get { return ViewState["EditIsId"] as int?; }
            set { ViewState["EditIsId"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciAdi"] == null || Session["KullaniciId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                ProjeleriListele();
                IsGecmisiListele();
            }
        }

        // PROJELER
        private void ProjeleriListele()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                int kullaniciId = Convert.ToInt32(Session["KullaniciId"]);
                SqlCommand cmd = new SqlCommand("SELECT Id, Baslik, Aciklama, ResimUrl, Kategori FROM Projeler WHERE KullaniciId = @kid", conn);
                cmd.Parameters.AddWithValue("@kid", kullaniciId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                var dt = new DataTable();
                da.Fill(dt);

                dt.Columns.Add("IsEdit", typeof(bool));
                foreach (DataRow row in dt.Rows)
                    row["IsEdit"] = (EditProjeId.HasValue && Convert.ToInt32(row["Id"]) == EditProjeId.Value);

                rptProjeler.DataSource = dt;
                rptProjeler.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                int kullaniciId = Convert.ToInt32(Session["KullaniciId"]);
                SqlCommand cmd = new SqlCommand("INSERT INTO Projeler (Baslik, Aciklama, ResimUrl, Kategori, KullaniciId) VALUES (@baslik, @aciklama, @resimUrl, @kategori, @kid)", conn);
                cmd.Parameters.AddWithValue("@baslik", txtBaslik.Text);
                cmd.Parameters.AddWithValue("@aciklama", txtAciklama.Text);
                cmd.Parameters.AddWithValue("@resimUrl", txtResimUrl.Text);
                cmd.Parameters.AddWithValue("@kategori", ddlKategori.SelectedValue);
                cmd.Parameters.AddWithValue("@kid", kullaniciId);
                cmd.ExecuteNonQuery();
                lblMessage.Text = "<div class='alert alert-success'>Proje başarıyla eklendi!</div>";
                txtBaslik.Text = txtAciklama.Text = txtResimUrl.Text = "";
                ProjeleriListele();
            }
        }

        protected void rptProjeler_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {
                EditProjeId = id;
                lblMessage.Text = "";
                ProjeleriListele();
            }
            else if (e.CommandName == "Cancel")
            {
                EditProjeId = null;
                lblMessage.Text = "";
                ProjeleriListele();
            }
            else if (e.CommandName == "Update")
            {
                string baslik = ((TextBox)e.Item.FindControl("txtEditBaslik")).Text;
                string aciklama = ((TextBox)e.Item.FindControl("txtEditAciklama")).Text;
                string resimUrl = ((TextBox)e.Item.FindControl("txtEditResimUrl")).Text;
                string kategori = ((DropDownList)e.Item.FindControl("ddlEditKategori")).SelectedValue;

                string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Projeler SET Baslik=@baslik, Aciklama=@aciklama, ResimUrl=@resimUrl, Kategori=@kategori WHERE Id=@id", conn);
                    cmd.Parameters.AddWithValue("@baslik", baslik);
                    cmd.Parameters.AddWithValue("@aciklama", aciklama);
                    cmd.Parameters.AddWithValue("@resimUrl", resimUrl);
                    cmd.Parameters.AddWithValue("@kategori", kategori);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "<div class='alert alert-success'>Proje güncellendi!</div>";
                }
                EditProjeId = null;
                ProjeleriListele();
            }
            else if (e.CommandName == "Delete")
            {
                string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Projeler WHERE Id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "<div class='alert alert-success'>Proje silindi!</div>";
                }
                EditProjeId = null;
                ProjeleriListele();
            }
        }

        // İŞ GEÇMİŞİ
        private void IsGecmisiListele()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                int kullaniciId = Convert.ToInt32(Session["KullaniciId"]);
                SqlCommand cmd = new SqlCommand("SELECT Id, SirketAdi, Pozisyon, Bilgi, Tarih FROM IsGecmisi WHERE KullaniciId = @kid", conn);
                cmd.Parameters.AddWithValue("@kid", kullaniciId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                var dt = new DataTable();
                da.Fill(dt);

                dt.Columns.Add("IsEdit", typeof(bool));
                foreach (DataRow row in dt.Rows)
                    row["IsEdit"] = (EditIsId.HasValue && Convert.ToInt32(row["Id"]) == EditIsId.Value);

                rptIsGecmisi.DataSource = dt;
                rptIsGecmisi.DataBind();
            }
        }

        protected void btnIsEkle_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                int kullaniciId = Convert.ToInt32(Session["KullaniciId"]);
                SqlCommand cmd = new SqlCommand("INSERT INTO IsGecmisi (KullaniciId, SirketAdi, Pozisyon, Bilgi, Tarih) VALUES (@kid, @sirket, @pozisyon, @bilgi, @tarih)", conn);
                cmd.Parameters.AddWithValue("@kid", kullaniciId);
                cmd.Parameters.AddWithValue("@sirket", txtSirketAdi.Text);
                cmd.Parameters.AddWithValue("@pozisyon", txtPozisyon.Text);
                cmd.Parameters.AddWithValue("@bilgi", txtIsBilgi.Text);
                cmd.Parameters.AddWithValue("@tarih", txtIsTarih.Text);
                cmd.ExecuteNonQuery();
                lblMessage.Text = "<div class='alert alert-success'>İş geçmişi eklendi!</div>";
                txtSirketAdi.Text = txtPozisyon.Text = txtIsBilgi.Text = txtIsTarih.Text = "";
                IsGecmisiListele();
            }
        }

        protected void rptIsGecmisi_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {
                EditIsId = id;
                lblMessage.Text = "";
                IsGecmisiListele();
            }
            else if (e.CommandName == "Cancel")
            {
                EditIsId = null;
                lblMessage.Text = "";
                IsGecmisiListele();
            }
            else if (e.CommandName == "Update")
            {
                string sirket = ((TextBox)e.Item.FindControl("txtEditSirketAdi")).Text;
                string pozisyon = ((TextBox)e.Item.FindControl("txtEditPozisyon")).Text;
                string bilgi = ((TextBox)e.Item.FindControl("txtEditIsBilgi")).Text;
                string tarih = ((TextBox)e.Item.FindControl("txtEditIsTarih")).Text;

                string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE IsGecmisi SET SirketAdi=@sirket, Pozisyon=@pozisyon, Bilgi=@bilgi, Tarih=@tarih WHERE Id=@id", conn);
                    cmd.Parameters.AddWithValue("@sirket", sirket);
                    cmd.Parameters.AddWithValue("@pozisyon", pozisyon);
                    cmd.Parameters.AddWithValue("@bilgi", bilgi);
                    cmd.Parameters.AddWithValue("@tarih", tarih);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "<div class='alert alert-success'>İş geçmişi güncellendi!</div>";
                }
                EditIsId = null;
                IsGecmisiListele();
            }
            else if (e.CommandName == "Delete")
            {
                string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM IsGecmisi WHERE Id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "<div class='alert alert-success'>İş geçmişi silindi!</div>";
                }
                EditIsId = null;
                IsGecmisiListele();
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
