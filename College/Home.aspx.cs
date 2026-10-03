using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class College_Home : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMyEvents();

            // Ensure the session exists
            if (Session["college"] != null)
            {
                string collegeUsername = Session["college"].ToString();
                string collegeId = "";

                // Fetch the CollegeId from the database using the college's username
                using (SqlConnection cn = new SqlConnection(
                    @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True"))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Id FROM CollegeRegistration WHERE Username=@u", cn);
                    cmd.Parameters.AddWithValue("@u", collegeUsername);
                    cn.Open();

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                        collegeId = result.ToString();
                }

                // ✅ Assign the college ID to the SqlDataSource parameter
                if (SqlDataSource2.SelectParameters["CollegeId"] != null)
                {
                    SqlDataSource2.SelectParameters["CollegeId"].DefaultValue = collegeId;
                }
            }
            else
            {
                // Redirect if the session expired or user not logged in
                Response.Redirect("~/User/CollegeLogin.aspx");
            }
        }
    Label2.Text = Session["college"].ToString();
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