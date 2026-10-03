using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
public partial class Reports_FeedbackReport : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    ReportDocument crpt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("Select * from Feedback", cn);
        da.Fill(ds, "Feedback");
        da.Fill(ds);
        crpt.Load(Server.MapPath("~/Reports/FeedbackReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Feedback");
        crpt.Refresh();
        cn.Close();
    }
}