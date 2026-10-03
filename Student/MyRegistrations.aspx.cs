using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Student_MyRegistrations : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["student"] == null)
            {
                Response.Redirect("~User/StudentLogin.aspx");
                return;
            }

            string username = Session["student"].ToString();
            string email = "";

            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Email FROM AdminStudents WHERE Username=@Username", cn);
            cmd.Parameters.AddWithValue("@Username", username);
            email = Convert.ToString(cmd.ExecuteScalar());
            cn.Close();

            if (!string.IsNullOrEmpty(email))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT DISTINCT [Event], [Name], [Contact], [Email], [College], [Paymentmethod], [Status] FROM [EventReg] WHERE [Email]=@Email", cn);
                da.SelectCommand.Parameters.AddWithValue("@Email", email);

                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}