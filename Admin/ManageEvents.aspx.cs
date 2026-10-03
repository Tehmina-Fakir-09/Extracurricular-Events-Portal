using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_ManageEvents : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 1️⃣ Automatically close expired events for this college
            AutoCloseExpiredEvents();
            GridView1.DataBind();
        }

    }

    private void AutoCloseExpiredEvents()
    {
        try
        {
            using (SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True"))
            {
                cn.Open();

                // Update status to 'Closed' for events where EndDate has passed and Status is still 'Upcoming'
                string query = "UPDATE ManageEvent SET Status = 'Closed' WHERE EndDate < @Today AND Status = 'Upcoming'";
                SqlCommand cmd = new SqlCommand(query, cn);
                cmd.Parameters.AddWithValue("@Today", DateTime.Today);

                int rowsAffected = cmd.ExecuteNonQuery();

                cn.Close();
            }
        }
        catch (Exception ex)
        {
            // Optional: log or display error
            
        }

    }


    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            FileUpload1.SaveAs(Server.MapPath("~\\Images\\" + FileUpload1.FileName));
            Image1.ImageUrl = "~\\Images\\" + FileUpload1.FileName;
        }
    }

    protected void btnaddnew_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.CommandText = "select count(EventId) from ManageEvent";
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
            cmd.CommandText = "select max(EventId) from ManageEvent";
            cmd.Connection = cn;
            int y = Convert.ToInt32(cmd.ExecuteScalar());
            y++;
            txtid.Text = y.ToString();
            cn.Close();
        }
        cn.Close();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txteventname.Text) || string.IsNullOrEmpty(txtorganizedby.Text) || string.IsNullOrEmpty(Image1.ImageUrl) || string.IsNullOrEmpty(txteventtype.Text) || string.IsNullOrEmpty(txtstartdate.Text) || string.IsNullOrEmpty(txtenddate.Text) || string.IsNullOrEmpty(txtvenue.Text) || string.IsNullOrEmpty(txtdescription.Text) || string.IsNullOrEmpty(txtregister.Text) || string.IsNullOrEmpty(txtmax.Text) ||  string.IsNullOrEmpty(ddlStatus.Text) || string.IsNullOrEmpty(txtfee.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please fill all fields and then submit!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "insert into ManageEvent values(" + txtid.Text + ",'" + txteventname.Text + "','" + txtorganizedby.Text + "','" + Image1.ImageUrl + "','" + txteventtype.Text + "','" + txtstartdate.Text + "','" + txtenddate.Text + "','" + txtvenue.Text + "','" + txtdescription.Text + "','" + txtregister.Text + "','" + txtmax.Text + "',"+ddlCollege.Text+",'"+ddlStatus.Text+"','"+txtfee.Text+"')";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Event Details saved successfully!!')</script>");
            GridView1.DataBind();
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txteventname.Text) || string.IsNullOrEmpty(txtorganizedby.Text) || string.IsNullOrEmpty(Image1.ImageUrl) || string.IsNullOrEmpty(txteventtype.Text) || string.IsNullOrEmpty(txtstartdate.Text) || string.IsNullOrEmpty(txtenddate.Text) || string.IsNullOrEmpty(txtvenue.Text) || string.IsNullOrEmpty(txtdescription.Text) || string.IsNullOrEmpty(txtregister.Text) || string.IsNullOrEmpty(txtmax.Text) || string.IsNullOrEmpty(ddlStatus.Text) || string.IsNullOrEmpty(txtfee.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('Please fill all fields and then update!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "update ManageEvent set Eventname='" + txteventname.Text + "',Organizedby='" + txtorganizedby.Text + "',Image='" + Image1.ImageUrl + "',Eventtype='" + txteventtype.Text + "',Startdate='" + txtstartdate.Text + "',Enddate='" + txtenddate.Text + "',Venue='" + txtvenue.Text + "',Description='" + txtdescription.Text + "',Registrationdeadline='" + txtregister.Text + "',Maxparticipant='" + txtmax.Text + "',CollegeId="+ddlCollege.Text+",Status='"+ddlStatus.Text+"',Fee='"+txtfee.Text+"' where EventId=" + txtid.Text + "";
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "update", "<script>alert('Event details updated!!')</script>");
            GridView1.DataBind();
        }
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.CommandText = "delete from ManageEvent where EventId=" + txtid.Text + "";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "delete", "<script>alert('Event details deleted!!')</script>");
        GridView1.DataBind();
    }

    protected void clear()
    {
        txtid.Text = "";
        txteventname.Text = "";
        txtmax.Text = "";
        txtenddate.Text = "";
        txtstartdate.Text = "";
        txteventtype.Text = "";
        txtorganizedby.Text = "";
        txtregister.Text = "";
        txtvenue.Text = "";
        txtdescription.Text = "";
        Image1.ImageUrl = "";
        ddlStatus.Text = "";
        ddlCollege.Text = "";
        txtfee.Text = "";
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
    }
    private string GetCollegeIdByName(string collegeName)
    {
        string collegeId = "";
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            string query = "SELECT Id FROM CollegeRegistration WHERE Name = @Name";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", collegeName);
            con.Open();
            object result = cmd.ExecuteScalar();
            if (result != null)
            {
                collegeId = result.ToString();
            }
        }
        return collegeId;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtid.Text = GridView1.SelectedRow.Cells[1].Text;

        // Get stored CollegeId from the ManageEvent table
        string eventId = txtid.Text;
        string collegeId = "";

        cn.Open();
        SqlCommand cmd = new SqlCommand("SELECT CollegeId FROM ManageEvent WHERE EventId = @EventId", cn);
        cmd.Parameters.AddWithValue("@EventId", eventId);
        object result = cmd.ExecuteScalar();
        if (result != null)
        {
            collegeId = result.ToString();
        }
        cn.Close();

        // Set dropdown selected value using CollegeId
        if (ddlCollege.Items.FindByValue(collegeId) != null)
        {
            ddlCollege.SelectedValue = collegeId;
        }

        // Populate other fields
        txteventname.Text = GridView1.SelectedRow.Cells[3].Text;
        txtorganizedby.Text = GridView1.SelectedRow.Cells[4].Text;
        Image1.ImageUrl = GridView1.SelectedRow.Cells[5].Text;
        txteventtype.Text = GridView1.SelectedRow.Cells[6].Text;
        txtstartdate.Text = GridView1.SelectedRow.Cells[7].Text;
        txtenddate.Text = GridView1.SelectedRow.Cells[8].Text;
        txtvenue.Text = GridView1.SelectedRow.Cells[9].Text;
        txtdescription.Text = GridView1.SelectedRow.Cells[10].Text;
        txtregister.Text = GridView1.SelectedRow.Cells[11].Text;
        txtmax.Text = GridView1.SelectedRow.Cells[12].Text;
        ddlStatus.Text = GridView1.SelectedRow.Cells[13].Text;
        txtfee.Text= GridView1.SelectedRow.Cells[14].Text;
    }
}