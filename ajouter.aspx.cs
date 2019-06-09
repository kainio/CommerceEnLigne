using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CommerceEnligne
{
    public partial class Ajouter : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                string id_produit = Request.QueryString["id_p"];
                if (id_produit != null)
                {
                    if (cn.State == ConnectionState.Closed)
                        cn.Open();

                    SqlCommand cmd = new SqlCommand("Insert into Commander(UserName,IDProduit, Qte) Values(@un, @idp, 1)", cn);
                    cmd.Parameters.AddWithValue("un", User.Identity.Name);
                    cmd.Parameters.AddWithValue("idp", Int32.Parse(id_produit));
                    cmd.ExecuteNonQuery();

                    cn.Close();
                }
            }
            else
            {
                Response.StatusCode = 401;
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}