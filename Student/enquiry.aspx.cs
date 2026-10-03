using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Student_enquiry : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();

    protected void clear()
    {
        txtName.Text = "";
        txtEmail.Text = "";
        txtcontact.Text = "";
        txtSubject.Text = "";
        txtMessage.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtName.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please enter name!!')</script>");
        }
        else if (string.IsNullOrEmpty(txtEmail.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please enter email!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "insert into Enquiry values('" + txtName.Text + "','" + txtEmail.Text + "'," + txtcontact.Text + ",'" + txtSubject.Text + "','" + txtMessage.Text + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Enquiry submitted successfully!!')</script>");
            clear();

        }
    }
}