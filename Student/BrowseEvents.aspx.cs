using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Student_BrowseEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadEvents();
        }
    }
    private void LoadEvents()
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            // Upcoming events (StartDate >= today)
            SqlDataAdapter daUpcoming = new SqlDataAdapter(
                "SELECT * FROM ManageEvent WHERE StartDate >= GETDATE() ORDER BY StartDate ASC", con);
            DataTable dtUpcoming = new DataTable();
            daUpcoming.Fill(dtUpcoming);
            dlUpcoming.DataSource = dtUpcoming;
            dlUpcoming.DataBind();

            // Closed events (StartDate < today)
            SqlDataAdapter daClosed = new SqlDataAdapter(
                "SELECT * FROM ManageEvent WHERE StartDate < GETDATE() ORDER BY StartDate DESC", con);
            DataTable dtClosed = new DataTable();
            daClosed.Fill(dtClosed);
            dlClosed.DataSource = dtClosed;
            dlClosed.DataBind();
        }
    }
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        Session["EId"] = btn.CommandArgument;
        Response.Redirect("~/Student/EventDetails.aspx");
    }
}