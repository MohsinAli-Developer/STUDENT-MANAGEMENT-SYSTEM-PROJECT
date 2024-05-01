using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS_WEB_APPLICATION
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCompany"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LOGINButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "SELECT * FROM LoginDetails where username = @user and password = @pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", UsernameTextBox.Text);
            cmd.Parameters.AddWithValue("@pass", PasswordTextBox.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["user"] = UsernameTextBox.Text;
                Response.Redirect("DashBoard.aspx?User :" + UsernameTextBox.Text);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed !!')</script>");
            }
            con.Close();
        }
    }
}