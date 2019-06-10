using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CommerceEnligne
{
    public partial class Panier : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        protected string user_name = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated)
            {
                user_name = User.Identity.Name;

                if (!IsPostBack)
                {
                    SqlDataSource1.SelectParameters.Add("UserName", user_name);
                    SqlDataSource1.DeleteParameters.Add("UserName", user_name);

                }

                CalculerTotal();
            }
            else
            {
                Response.StatusCode = 401;
                Response.Redirect("~/Account/Login.aspx");
            }

        }

        private void CalculerTotal()
        {
            if (cn.State == ConnectionState.Closed)
                cn.Open();

            SqlCommand cmdTotal = new SqlCommand("", cn);
            cmdTotal.CommandText = "Select SUM(Qte * Prix) from Commander c inner join Produit p on p.IDProduit = c.IDProduit where UserName =@UserName";
            cmdTotal.Parameters.AddWithValue("UserName", user_name);
            object total = cmdTotal.ExecuteScalar();
            if (total == DBNull.Value)
                return;
            cn.Close();
            (GridView1.FooterRow.FindControl("Lbl_footer_total") as Label).Text = total.ToString();
                  
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlDataSource1.UpdateParameters.Add("UserName", user_name);
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            HiddenField hf_p = (HiddenField)(GridView1.Rows[e.RowIndex].FindControl("HF_ID_produit"));


            SqlDataSource1.DeleteParameters.Add("IDProduit", hf_p.Value);
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
           
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
         
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            CalculerTotal();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                SqlDataSource1.DeleteParameters.Add("UserName", user_name);
            }
        }
    }
}