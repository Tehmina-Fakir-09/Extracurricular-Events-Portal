using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_AdminLogin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtuser.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "login", "<script>alert('Username is required!!')</script>");
        }
        else if (string.IsNullOrEmpty(txtpass.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "login", "<script>alert('Please enter password!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "select Username,Password from Admin where Username='" + txtuser.Text + "' and Password='" + txtpass.Text + "'";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            da.SelectCommand = cmd;
            da.Fill(dt);
            string a = txtuser.Text;
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "login", "<script>alert('Logged in Successfully!!')</script>");
                Response.Redirect("~/Admin/Home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "error", "<script>alert('Invalid username,password!!')</script>");
            }
            cn.Close();
        }
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtuser.Text = "";
        txtpass.Text = "";
    }
}