using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class College_ViewEventRegistrations : System.Web.UI.Page
{
    
        protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Ensure the session exists
            if (Session["college"] != null)
            {
                string collegeUsername = Session["college"].ToString();
                string collegeId = "";

                // Fetch the CollegeId from the database using the college's username
                using (SqlConnection cn = new SqlConnection(
                    @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True"))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Id FROM CollegeRegistration WHERE Username=@u", cn);
                    cmd.Parameters.AddWithValue("@u", collegeUsername);
                    cn.Open();

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                        collegeId = result.ToString();
                }

                // ✅ Assign the college ID to the SqlDataSource parameter
                if (SqlDataSource1.SelectParameters["CollegeId"] != null)
                {
                    SqlDataSource1.SelectParameters["CollegeId"].DefaultValue = collegeId;
                }
            }
            else
            {
                // Redirect if the session expired or user not logged in
                Response.Redirect("~/User/CollegeLogin.aspx");
            }
        }
    }
}