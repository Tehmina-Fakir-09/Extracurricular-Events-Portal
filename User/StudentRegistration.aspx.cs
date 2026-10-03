using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class User_StudentRegistration : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void clear()
    {
        txtid.Text = "";
        txtname.Text = "";
        txtclg.Text = "";
        txtyear.Text = "";
        txtdept.Text = "";
        txtemail.Text = "";
        txtcontact.Text = "";
        txtuser.Text = "";
        txtpass.Text = "";
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
       
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
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
            cmd.CommandText = "insert into AdminStudents values(" + txtid.Text + ",'" + txtname.Text + "','" + txtclg.Text + "','" + txtdept.Text + "','" + txtyear.Text + "','" + txtemail.Text + "'," + txtcontact.Text + ",'" + txtuser.Text + "','" + txtpass.Text + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Student details saved successfully!!')</script>");
            clear();

        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        clear();
    }
}