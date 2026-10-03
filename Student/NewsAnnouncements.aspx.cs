using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Student_NewsAnnouncements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindNews();
        }

    }
    private void BindNews()
    {
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM NewsAnnouncements ORDER BY PostedDate DESC", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            RepeaterNews.DataSource = dr;
            RepeaterNews.DataBind();
            con.Close();
        }
    }

}


