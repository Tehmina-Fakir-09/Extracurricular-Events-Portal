using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class College_ManageEvents : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Session["college"].ToString();
        cn.Open();
        cmd.CommandText = "select id from CollegeRegistration where username='" + username + "'";
        cmd.Connection = cn;
        txtcid.Text = cmd.ExecuteScalar().ToString();
        cn.Close();

        if (!IsPostBack)
        {
            int collegeId = 0;
            cn.Open();
            SqlCommand cmnd = new SqlCommand("SELECT Id FROM CollegeRegistration WHERE Username=@Username", cn);
            cmnd.Parameters.AddWithValue("@Username", username);
            collegeId = Convert.ToInt32(cmnd.ExecuteScalar());
            cn.Close();

            SqlDataSource1.SelectParameters["CollegeID"].DefaultValue = collegeId.ToString();
            CloseExpiredEvents();
            GridView1.DataBind();
        }
    }

    private void CloseExpiredEvents()
    {
        try
        {
            string username = Session["college"].ToString();
            cn.Open();
            // Get college ID for this session
            cmd.CommandText = "select id from CollegeRegistration where username='" + username + "'";
            cmd.Connection = cn;
            int collegeId = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();

            // Update all expired events for this college
            cn.Open();
            string query = "UPDATE ManageEvent SET Status='Closed' WHERE Enddate < GETDATE() AND Status <> 'Closed' AND CollegeId=@CollegeId";
            SqlCommand cmd2 = new SqlCommand(query, cn);
            cmd2.Parameters.AddWithValue("@CollegeId", collegeId);
            cmd2.ExecuteNonQuery();
            cn.Close();
        }
        catch (Exception)
        {
            cn.Close();
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
        if (string.IsNullOrEmpty(txteventname.Text) || string.IsNullOrEmpty(txtorganizedby.Text) || string.IsNullOrEmpty(Image1.ImageUrl) || string.IsNullOrEmpty(txteventtype.Text) || string.IsNullOrEmpty(txtstartdate.Text) || string.IsNullOrEmpty(txtenddate.Text) || string.IsNullOrEmpty(txtvenue.Text) || string.IsNullOrEmpty(txtdescription.Text) || string.IsNullOrEmpty(txtregister.Text) || string.IsNullOrEmpty(txtmax.Text) || string.IsNullOrEmpty(ddlStatus.Text) || string.IsNullOrEmpty(txtfee.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Please fill all fields and then submit!!')</script>");
        }
        else
        {
            cn.Open();
            cmd.CommandText = "insert into ManageEvent values(" + txtid.Text + ",'" + txteventname.Text + "','" + txtorganizedby.Text + "','" + Image1.ImageUrl + "','" + txteventtype.Text + "','" + txtstartdate.Text + "','" + txtenddate.Text + "','" + txtvenue.Text + "','" + txtdescription.Text + "','" + txtregister.Text + "','" + txtmax.Text + "'," + txtcid.Text + ",'" + ddlStatus.Text + "','"+txtfee.Text+"')";
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
            cmd.CommandText = "update ManageEvent set Eventname='" + txteventname.Text + "',Organizedby='" + txtorganizedby.Text + "',Image='" + Image1.ImageUrl + "',Eventtype='" + txteventtype.Text + "',Startdate='" + txtstartdate.Text + "',Enddate='" + txtenddate.Text + "',Venue='" + txtvenue.Text + "',Description='" + txtdescription.Text + "',Registrationdeadline='" + txtregister.Text + "',Maxparticipant='" + txtmax.Text + "',CollegeId=" + txtcid.Text + ",Status='" + ddlStatus.Text + "',Fee='"+ txtfee.Text +"' where EventId=" + txtid.Text + "";
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
        cmd.CommandText = "delete from ManageEvent where Eventid=" + txtid.Text + "";
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
        txtcid.Text = "";
        txtfee.Text = "";
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtcid.Text = GridView1.SelectedRow.Cells[1].Text;
        txtid.Text = GridView1.SelectedRow.Cells[2].Text;
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