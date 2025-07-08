using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PortfolyoKeremBasakoglu.App_Start
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = txtKullaniciAdi.Text.Trim();
            string sifre = txtSifre.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["PortfoyDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT Id, KullaniciAdi FROM Kullanicilar WHERE KullaniciAdi = @kadi AND Sifre = @sifre";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@kadi", kullaniciAdi);
                    cmd.Parameters.AddWithValue("@sifre", sifre);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["KullaniciAdi"] = reader["KullaniciAdi"].ToString();
                        Session["KullaniciId"] = reader["Id"].ToString(); // 🔥 Bu kritik

                        Response.Redirect("~/AnaSayfa.aspx");
                    }
                    else
                    {
                        lblBilgi.Text = "Kullanıcı adı veya şifre hatalı!";
                    }
                }
            }
        }
    }
}
