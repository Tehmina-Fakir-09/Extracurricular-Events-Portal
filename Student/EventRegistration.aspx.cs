using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Student_EventRegistration : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void clear()
    {
        
        ddlPayment.Text = "";
        txtCollege.Text = "";
        txtContact.Text = "";
        txtEmail.Text = "";
        txtName.Text = "";
        txtRemarks.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string status = "Pending";
        string eventName = ddlEvent.SelectedValue;
        string studentName = txtName.Text;
        string email = txtEmail.Text;
        string contact = txtContact.Text;
        string college = txtCollege.Text;
        string paymentMethod = ddlPayment.SelectedValue;
        string remarks = txtRemarks.Text;

       


        cn.Open();
        cmd.CommandText = "insert into EventReg values('" + eventName+ "','" + studentName + "','" + email + "'," + contact + ",'" + college + "','" + paymentMethod + "','" + remarks + "','"+status+"') ";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Event registration Successful!!')</script>");
        clear();

        Response.Redirect("Payment.aspx?EventName=" + eventName
                         + "&PaymentMethod=" + paymentMethod
                         + "&StudentEmail=" + txtEmail.Text);


    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        clear();
    }
}