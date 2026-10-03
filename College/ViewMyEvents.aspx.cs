using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class College_ViewMyEvents : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMyEvents();
        }
    }

    private void BindMyEvents()
    {
        if (Session["college"] == null)
        {
            Response.Redirect("~/User/CollegeLogin.aspx");
            return;
        }

        string username = Session["college"].ToString();
        string collegeId = "";

        // Step 1: Get CollegeID from username
        SqlCommand cmd1 = new SqlCommand("SELECT Id FROM CollegeRegistration WHERE Username = @username", cn);
        cmd1.Parameters.AddWithValue("@username", username);

        cn.Open();
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.Read())
        {
            collegeId = dr["Id"].ToString();
        }
        cn.Close();

        if (string.IsNullOrEmpty(collegeId))
        {
            // No college found
            return;
        }

        // Step 2: Fetch only that college’s events
        string query = "SELECT * FROM ManageEvent WHERE CollegeID = @CollegeID";
        SqlCommand cmd2 = new SqlCommand(query, cn);
        cmd2.Parameters.AddWithValue("@CollegeID", collegeId);

        cn.Open();
        SqlDataReader dr2 = cmd2.ExecuteReader();
        GridView1.DataSource = dr2;
        GridView1.DataBind();
        cn.Close();
    }
}