using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;



public partial class Admin_manageColleges : System.Web.UI.Page
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
        txtaddress.Text = "";
        txtcity.Text = "";
        txtstate.Text = "";
        txtemail.Text = "";
        txtcontact.Text= "";
        txtwebsite.Text = "";
        txtuser.Text = "";
        txtpass.Text = "";
    }

    protected void btnsave_Click(object sender, EventArgs e)
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
            cmd.CommandText = "insert into CollegeRegistration values(" + txtid.Text + ",'" + txtname.Text + "','" + txtaddress.Text + "','" + txtcity.Text + "','" + txtstate.Text + "','" + txtemail.Text + "'," + txtcontact.Text + ",'" + txtwebsite.Text + "','" + txtuser.Text + "','" + txtpass.Text + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('College Registration Successful!!')</script>");
            clear();
            GridView1.DataBind();
        }
    }
    

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtname.Text) || string.IsNullOrEmpty(txtuser.Text) || string.IsNullOrEmpty(txtpass.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('Please fill all fields and then update!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "update CollegeRegistration set Name='"+txtname.Text+"',Address='"+txtaddress.Text+"',City='"+txtcity.Text+"',State='"+txtstate.Text+"',Email='"+txtemail.Text+"',Contact="+txtcontact.Text+",Website='"+txtwebsite.Text+"',Username='"+txtuser.Text+"',Password='"+txtpass.Text+"' where Id="+txtid.Text+"";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('College details updated!!')</script>");
            clear();
            GridView1.DataBind();
        }
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.CommandText = "delete from CollegeRegistration where Id=" + txtid.Text + "";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "delete", "<script>alert('College details deleted!!')</script>");
        clear();
        GridView1.DataBind();
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtid.Text = GridView1.SelectedRow.Cells[1].Text;
        txtname.Text = GridView1.SelectedRow.Cells[2].Text;
        txtaddress.Text = GridView1.SelectedRow.Cells[3].Text;
        txtcity.Text = GridView1.SelectedRow.Cells[4].Text;
        txtstate.Text = GridView1.SelectedRow.Cells[5].Text;
        txtemail.Text = GridView1.SelectedRow.Cells[6].Text;
        txtcontact.Text = GridView1.SelectedRow.Cells[7].Text;
        txtwebsite.Text= GridView1.SelectedRow.Cells[8].Text;
        txtuser.Text = GridView1.SelectedRow.Cells[9].Text;
        txtpass.Text = GridView1.SelectedRow.Cells[10].Text;
    }

    protected void btnaddnew_Click(object sender, EventArgs e)
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
}