using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Student_Feedback : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Session["student"].ToString();
        cn.Open();
        cmd.CommandText = "select Sname from AdminStudents where username='" + username + "'";
        cmd.Connection = cn;
        txtname.Text = cmd.ExecuteScalar().ToString();
        cn.Close();
    }

    protected void clear()
    {
        txtemail.Text = "";
        txtmsg.Text = "";
        lblrating.Text = "";
        ImageButton1.ImageUrl = "~/Images/Star.gif";
        ImageButton2.ImageUrl = "~/Images/Star.gif";
        ImageButton3.ImageUrl = "~/Images/Star.gif";
        ImageButton4.ImageUrl = "~/Images/Star.gif";
        ImageButton5.ImageUrl = "~/Images/Star.gif";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton1.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton2.ImageUrl = "~/Images/Star.gif";
        ImageButton3.ImageUrl = "~/Images/Star.gif";
        ImageButton4.ImageUrl = "~/Images/Star.gif";
        ImageButton5.ImageUrl = "~/Images/Star.gif";
        lblrating.Text = "1 Star";
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton1.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton2.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton3.ImageUrl = "~/Images/Star.gif";
        ImageButton4.ImageUrl = "~/Images/Star.gif";
        ImageButton5.ImageUrl = "~/Images/Star.gif";
        lblrating.Text = "2 Star";
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton1.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton2.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton3.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton4.ImageUrl = "~/Images/Star.gif";
        ImageButton5.ImageUrl = "~/Images/Star.gif";
        lblrating.Text = "3 Star";
    }

    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton1.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton2.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton3.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton4.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton5.ImageUrl = "~/Images/FilledStar.gif";
        lblrating.Text = "5 Star";
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton1.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton2.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton3.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton4.ImageUrl = "~/Images/FilledStar.gif";
        ImageButton5.ImageUrl = "~/Images/Star.gif";
        lblrating.Text = "4 Star";
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtname.Text) || string.IsNullOrEmpty(txtmsg.Text) || string.IsNullOrEmpty(txtphone.Text) || string.IsNullOrEmpty(lblrating.Text) || string.IsNullOrEmpty(txtemail.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please fill the form and then submit!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "insert into Feedback values('" + txtname.Text + "','" + txtemail.Text + "',"+txtphone.Text+",'" + lblrating.Text + "','" + txtmsg.Text + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            clear();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Feedback Submitted...!!')</script>");
        }
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();

    }
}