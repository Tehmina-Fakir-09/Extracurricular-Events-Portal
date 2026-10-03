using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_Admin_Announcement : System.Web.UI.Page
{
    string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO NewsAnnouncements (Title, Description, PostedDate) VALUES (@Title, @Description, GETDATE())", con);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        txtTitle.Text = "";
        txtDescription.Text = "";

        BindGrid(); // refresh grid
    }

    private void BindGrid()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM NewsAnnouncements ORDER BY PostedDate DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewNews.DataSource = dt;
            GridViewNews.DataBind();
        }
    }

    protected void GridViewNews_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int newsID = Convert.ToInt32(GridViewNews.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM NewsAnnouncements WHERE NewsID = @id", con);
            cmd.Parameters.AddWithValue("@id", newsID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        BindGrid();
    }
}


