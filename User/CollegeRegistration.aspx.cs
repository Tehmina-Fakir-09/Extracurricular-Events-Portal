using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class User_CollegeRegistration : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        cmd.CommandText = "select count(Id) from CollegeRegistration";
        cmd.Connection = cn;
        int n = Convert.ToInt32(cmd.ExecuteScalar());
        if (n == 0)
        {
            n++;
            txtid.Text = n.ToString();
            cn.Close();
        }
        else
        {
            cn.Close();
            cn.Open();
            cmd.CommandText = "select max(Id) from CollegeRegistration";
            cmd.Connection = cn;
            int y = Convert.ToInt32(cmd.ExecuteScalar());
            y++;
            txtid.Text = y.ToString();
            cn.Close();
        }
        cn.Close();
    }
    protected void clear()
    {
        txtid.Text = "";
        txtname.Text = "";
        txtaddress.Text = "";
        txtcity.Text = "";
        txtstate.Text = "";
        txtemail.Text = "";
        txtcontact.Text = "";
        txtwebsite.Text = "";
        txtuser.Text = "";
        txtpass.Text = "";
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtuser.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please enter username!!')</script>");
        }
        else if (string.IsNullOrEmpty(txtpass.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please enter password!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "insert into CollegeRegistration values(" + txtid.Text + ",'" + txtname.Text + "','" + txtaddress.Text + "','" + txtcity.Text + "','" + txtstate.Text + "','" + txtemail.Text + "'," + txtcontact.Text + ",'"+txtwebsite.Text+"','" + txtuser.Text + "','" + txtpass.Text + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('College Registration Successful!!')</script>");
            clear();
        }
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
    }
}