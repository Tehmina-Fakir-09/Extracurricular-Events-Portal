using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_ManageAdmin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
       
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
            cmd.CommandText = "insert into Admin values('" + txtuser.Text + "','" + txtpass.Text + "')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Admin details saved successfully!!')</script>");
            GridView1.DataBind();
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtuser.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('Please enter username!!')</script>");
        }
        else if (string.IsNullOrEmpty(txtpass.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('Please enter password!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "update Admin set Username='" + txtuser.Text + "',Password='" + txtpass.Text + "' where Username='" + txtuser.Text + "'";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('Admin details updated!!')</script>");
            GridView1.DataBind();
        }
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.CommandText = "delete from Admin where Username='" + txtuser.Text + "'";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "delete", "<script>alert('Details deleted!!')</script>");
        clear();
        GridView1.DataBind();
    }
    protected void clear()
    {
        txtuser.Text = "";
        txtpass.Text = "";
        txtconfirm.Text = "";
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtuser.Text = GridView1.SelectedRow.Cells[1].Text;
        txtpass.Text = GridView1.SelectedRow.Cells[2].Text;
    }
}