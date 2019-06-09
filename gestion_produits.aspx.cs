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
    public partial class gestion_produits : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection(@"Data Source=SI-PC\FMPS;Initial Catalog=CommerceEnligne;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.Identity.Name != "admin")
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (cn.State == ConnectionState.Closed)
                cn.Open();

            SqlCommand cmd = new SqlCommand("Insert into Produit(Nom,Prix,StockActuel,StockMinimum,Photo) Values(@n,@p,@sa,@sm,@photo)", cn);
            cmd.Parameters.AddWithValue("n", N_Produit.Text);
            cmd.Parameters.AddWithValue("p", Prix.Text);
            cmd.Parameters.AddWithValue("sa", StockA.Text);
            cmd.Parameters.AddWithValue("sm", StockM.Text);
            cmd.Parameters.AddWithValue("photo", Photo.Text);

            cmd.ExecuteNonQuery();

            cn.Close();

        }
    }

}